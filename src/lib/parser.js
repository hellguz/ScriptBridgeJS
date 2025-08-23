/**
 * JSDoc Parser for Grasshopper.js Sandbox
 * Extracts function metadata, parameters, and return information from JSDoc-annotated JavaScript code
 */

import { isValidColor, isValidRenderStyle, isValidLineStyle } from './constants.js';

/**
 * Parses JSDoc-annotated JavaScript code and extracts function metadata
 * @param {string} code - The JavaScript code to parse
 * @returns {Object} Parsed script object with inputs, outputs, and function details
 */
export function parseScript(code) {
  console.log('=== PARSING SCRIPT ===');
  console.log('Code:', code);
  try {
    // Extract function declaration and JSDoc comments
    const functionMatch = extractFunctionWithJSDoc(code);
    if (!functionMatch) {
      throw new Error('No function declaration with a preceding JSDoc comment was found.');
    }

    const { jsDoc, functionDeclaration, functionName, parameters } = functionMatch;
    // Parse JSDoc comments
    const inputs = parseInputParameters(jsDoc);
    const outputs = parseOutputParameters(jsDoc);
    // Extract function body
    const functionBody = extractFunctionBody(functionDeclaration);

    return {
      inputs,
      outputs,
      functionBody,
      argNames: parameters,
      functionName,
      error: null
    };
  } catch (error) {
    return {
      inputs: [],
      outputs: [],
      functionBody: '',
      argNames: [],
      functionName: '',
      error: error.message
    };
  }
}

/**
 * Extracts function declaration with its JSDoc comment
 * @param {string} code - The JavaScript code
 * @returns {Object|null} Function match object or null if not found
 */
function extractFunctionWithJSDoc(code) {
  // Match JSDoc comment followed by function declaration
  const functionRegex = /\/\*\*([\s\S]*?)\*\/\s*((?:async\s+)?(?:export\s+)?(?:function\s+(\w+)\s*\(([^)]*)\)|const\s+(\w+)\s*=\s*(?:async\s*)?(?:function\s*)?\(([^)]*)\)\s*=>|const\s+(\w+)\s*=\s*function\s*\(([^)]*)\)))/;
  const match = code.match(functionRegex);
  if (!match) {
    return null;
  }

  const jsDoc = match[1];
  const functionSignature = match[2];
  const functionName = match[3] || match[5] || match[7];
  const parameters = (match[4] || match[6] || match[8] || '').split(',').map(p => p.trim().split(/\s+/)[0]).filter(p => p);

  // Find where the function signature starts in the original code to get the body
  const functionSignatureStart = code.indexOf(functionSignature);
  const functionBodyBlock = extractCompleteFunction(code, functionSignatureStart + functionSignature.length);
  
  return {
    jsDoc,
    functionDeclaration: functionSignature + functionBodyBlock,
    functionName,
    parameters
  };
}

/**
 * Extracts the complete function body including nested braces, ignoring comments.
 * @param {string} code - Code string to parse
 * @param {number} startIndex - Index to start searching from, typically after the function signature `)`.
 * @returns {string} Complete function body, including the outer braces.
 */
function extractCompleteFunction(code, startIndex) {
    let braceCount = 0;
    let inString = false;
    let stringChar = '';
    let inBlockComment = false;
    let inLineComment = false;

    // Find the first opening brace
    const firstBraceIndex = code.indexOf('{', startIndex);
    if (firstBraceIndex === -1) return '';

    let functionBody = '';
    for (let i = firstBraceIndex; i < code.length; i++) {
        const char = code[i];
        const nextChar = code[i + 1] || '';
        functionBody += char;

        if (inString) {
            if (char === '\\') { // Skip escaped characters
                i++; 
                functionBody += nextChar; 
                continue;
            }
            if (char === stringChar) inString = false;
            continue;
        }

        if (inBlockComment) {
            if (char === '*' && nextChar === '/') { inBlockComment = false; i++; functionBody += nextChar; }
            continue;
        }

        if (inLineComment) {
            if (char === '\n') inLineComment = false;
            continue;
        }

        if (char === '/' && nextChar === '*') { inBlockComment = true; i++; functionBody += nextChar; continue; }
        if (char === '/' && nextChar === '/') { inLineComment = true; i++; functionBody += nextChar; continue; }
        
        if (char === '"' || char === "'" || char === '`') { inString = true; stringChar = char; continue; }

        if (char === '{') {
            braceCount++;
        } else if (char === '}') {
            braceCount--;
            if (braceCount === 0) {
                break;
            }
        }
    }
    return functionBody;
}


/**
 * Extracts function body content (without the outer braces)
 * @param {string} functionDeclaration - Complete function declaration
 * @returns {string} Function body content
 */
function extractFunctionBody(functionDeclaration) {
  const bodyStart = functionDeclaration.indexOf('{');
  const bodyEnd = functionDeclaration.lastIndexOf('}');
  
  if (bodyStart === -1 || bodyEnd === -1) {
    throw new Error('Invalid function syntax: missing braces');
  }
  
  return functionDeclaration.slice(bodyStart + 1, bodyEnd).trim();
}

/**
 * Parses input parameters from JSDoc comments
 * @param {string} jsDoc - JSDoc comment content
 * @returns {Array} Array of input parameter objects
 */
function parseInputParameters(jsDoc) {
  const inputs = [];
  let currentFolder = null;
  
  // Split JSDoc into lines and process each
  const lines = jsDoc.split('\n').map(line => line.trim().replace(/^\*\s?/, ''));
  for (const line of lines) {
    // Check for @folder tag
    const folderMatch = line.match(/@folder\s+(.+)/);
    if (folderMatch) {
      currentFolder = folderMatch[1].trim();
      continue;
    }
    
    // Check for @param tag - match everything after the dash as description/metadata
    const paramMatch = line.match(/@param\s+\{([^}]+)\}\s+(\w+)(?:\s*-\s*(.+))?/);
    if (paramMatch) {
      const [, type, name, fullContent = ''] = paramMatch;
      // Extract metadata from brackets at the end - handle nested brackets
      let description = fullContent;
      let metadataStr = '';
      
      const metadataMatch = fullContent.match(/^(.*?)\s*\[(.*)\]\s*$/);
      if (metadataMatch) {
        description = metadataMatch[1].trim();
        metadataStr = metadataMatch[2];
      }
      
      // Debug logging
      console.log(`Parsing param: ${name}, type: ${type}, description: "${description}", metadataStr: "${metadataStr}"`);
      console.log('Full line:', line);
      
      const input = {
        name,
        type: normalizeType(type),
        folder: currentFolder,
        description: description.trim(),
        metadata: parseMetadata(metadataStr, type)
      };
      console.log(`Parsed metadata for ${name}:`, input.metadata);
      
      inputs.push(input);
    }
  }
  
  return inputs;
}

/**
 * Parses output parameters from JSDoc @returns comments
 * @param {string} jsDoc - JSDoc comment content
 * @returns {Array} Array of output parameter objects
 */
function parseOutputParameters(jsDoc) {
  const outputs = [];
  // Match all @returns with object type specification
  const returnsMatches = jsDoc.matchAll(/@returns\s+\{([^}]+)\}/g);
  for (const match of returnsMatches) {
    const returnsType = match[1];
    // Parse object-style returns: {type: THREE.Object3D, name: "name", ...}
    if (returnsType.includes('type:')) {
      const output = parseObjectReturns(returnsType);
      if (output) {
        outputs.push(output);
      }
    }
  }
  
  return outputs;
}

/**
 * Parses object-style @returns specification
 * @param {string} returnsType - The returns type specification
 * @returns {Object|null} Parsed output object or null
 */
function parseObjectReturns(returnsType) {
  try {
    const output = {};
    // Use regex to capture key-value pairs, handling quoted strings
    const pairRegex = /(\w+):\s*("([^"]*)"|([^,}]+))/g;
    let match;
    while ((match = pairRegex.exec(returnsType)) !== null) {
      const key = match[1];
      const value = match[3] || match[4]; // Group 3 is for quoted strings, 4 is for unquoted
      output[key.trim()] = value.trim();
    }
    
    // Set defaults if not specified
    output.name = output.name || 'output';
    output.style = output.style || 'filledThick';
    output.color = output.color || 'Ocean';
    
    // Validate values
    if (!isValidRenderStyle(output.style)) {
      console.warn(`Invalid render style: ${output.style}, using filledThick as fallback`);
      output.style = 'filledThick';
    }
    
    if (!isValidColor(output.color)) {
      console.warn(`Invalid color: ${output.color}, using Ocean as fallback`);
      output.color = 'Ocean';
    }
    
    if (output.lineStyle && !isValidLineStyle(output.lineStyle)) {
      console.warn(`Invalid line style: ${output.lineStyle}, using solid as fallback`);
      output.lineStyle = 'solid';
    }
    
    return output;
  } catch (error) {
    console.warn('Failed to parse object returns:', error);
    return null;
  }
}

/**
 * Normalizes parameter types to standard format
 * @param {string} type - Raw type from JSDoc
 * @returns {string} Normalized type
 */
function normalizeType(type) {
  const cleanType = type.trim();
  // Handle array types
  if (cleanType.includes('Array<number[]>')) {
    return 'Array<number[]>';
  }
  if (cleanType.includes('number[]')) {
    return 'number[]';
  }
  if (cleanType.includes('THREE.')) {
    return cleanType;
  }
  
  // Handle basic types
  if (cleanType.includes('number')) {
    return 'number';
  }
  if (cleanType.includes('string')) {
    return 'string';
  }
  if (cleanType.includes('boolean')) {
    return 'boolean';
  }
  
  return cleanType;
}

/**
 * Parses metadata from JSDoc parameter annotations
 * @param {string} metadataStr - Metadata string from JSDoc
 * @param {string} type - Parameter type
 * @returns {Object} Parsed metadata object
 */
function parseMetadata(metadataStr, type) {
  const metadata = {};
  if (!metadataStr) {
    return metadata;
  }
  
  // Handle array defaults specially - they contain commas that shouldn't be split
  let pairs = [];
  let currentPair = '';
  let bracketCount = 0;
  
  for (let i = 0; i < metadataStr.length; i++) {
    const char = metadataStr[i];
    
    if (char === '[') bracketCount++;
    if (char === ']') bracketCount--;
    
    if (char === ',' && bracketCount === 0) {
      pairs.push(currentPair.trim());
      currentPair = '';
      continue;
    }
    
    currentPair += char;
  }
  
  if (currentPair.trim()) {
    pairs.push(currentPair.trim());
  }
  
  for (const pair of pairs) {
    const [key, ...valueParts] = pair.split('=');
    const value = valueParts.join('=').trim();
    
    if (!value) {
        if (key.trim() === 'interactive') metadata.interactive = true;
        continue;
    }

    if (key.trim() === 'default') {
        metadata.default = parseDefaultValue(value, type);
    } else if (key.trim() === 'min') {
        metadata.min = parseFloat(value);
    } else if (key.trim() === 'max') {
        metadata.max = parseFloat(value);
    } else if (key.trim() === 'step') {
        metadata.step = parseFloat(value);
    } else if (key.trim() === 'interactive') {
        metadata.interactive = value.toLowerCase() === 'true';
    }
  }
  
  return metadata;
}

/**
 * Parses default values based on parameter type
 * @param {string} value - Raw default value string
 * @param {string} type - Parameter type
 * @returns {any} Parsed default value
 */
function parseDefaultValue(value, type) {
  const cleanValue = value.trim();
  if (type === 'number') {
    return parseFloat(cleanValue);
  }
  
  if (type === 'boolean') {
    return cleanValue.toLowerCase() === 'true';
  }
  
  if (type === 'string') {
    // Remove quotes if present
    return cleanValue.replace(/^["']|["']$/g, '');
  }
  
  if (type === 'number[]' || type === 'Array<number[]>') {
    try {
      // Parse array notation [1, 2, 3] or [[1,2,3], [4,5,6]]
      return JSON.parse(cleanValue);
    } catch (error) {
      console.warn('Failed to parse array default value:', cleanValue);
      return type === 'number[]' ? [0, 0, 0] : [[0, 0, 0]];
    }
  }
  
  return cleanValue;
}