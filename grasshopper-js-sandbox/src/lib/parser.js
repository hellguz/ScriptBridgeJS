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
  try {
    // Extract function declaration and JSDoc comments
    const functionMatch = extractFunctionWithJSDoc(code);
    if (!functionMatch) {
      throw new Error('No function declaration found in code');
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
  const functionRegex = /\/\*\*([\s\S]*?)\*\/\s*(?:export\s+)?(?:function\s+(\w+)\s*\(([^)]*)\)|const\s+(\w+)\s*=\s*(?:function\s*)?\(([^)]*)\)\s*=>|const\s+(\w+)\s*=\s*function\s*\(([^)]*)\))/;
  
  const match = code.match(functionRegex);
  if (!match) {
    return null;
  }

  const jsDoc = match[1];
  const functionName = match[2] || match[4] || match[6];
  const parameters = (match[3] || match[5] || match[7] || '').split(',').map(p => p.trim().split(/\s+/)[0]).filter(p => p);
  
  // Extract the full function declaration
  const functionStart = code.indexOf(match[0]);
  const functionDeclaration = extractCompleteFunction(code, functionStart + match[0].length);
  
  return {
    jsDoc,
    functionDeclaration: match[0] + functionDeclaration,
    functionName,
    parameters
  };
}

/**
 * Extracts the complete function body including nested braces
 * @param {string} code - Code starting after function signature
 * @param {number} startIndex - Starting index in the code
 * @returns {string} Complete function body
 */
function extractCompleteFunction(code, startIndex) {
  let braceCount = 0;
  let inString = false;
  let stringChar = '';
  let escaped = false;
  let functionBody = '';
  
  for (let i = startIndex; i < code.length; i++) {
    const char = code[i];
    functionBody += char;
    
    if (escaped) {
      escaped = false;
      continue;
    }
    
    if (char === '\\') {
      escaped = true;
      continue;
    }
    
    if (inString) {
      if (char === stringChar) {
        inString = false;
      }
      continue;
    }
    
    if (char === '"' || char === "'" || char === '`') {
      inString = true;
      stringChar = char;
      continue;
    }
    
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
    
    // Check for @param tag
    const paramMatch = line.match(/@param\s+\{([^}]+)\}\s+(\w+)(?:\s*-\s*(.+?))?(?:\s*\[([^\]]+)\])?/);
    if (paramMatch) {
      const [, type, name, description = '', metadataStr = ''] = paramMatch;
      
      const input = {
        name,
        type: normalizeType(type),
        folder: currentFolder,
        description: description.trim(),
        metadata: parseMetadata(metadataStr, type)
      };
      
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
  
  // Match @returns with object type specification
  const returnsMatch = jsDoc.match(/@returns\s+\{([^}]+)\}/);
  if (!returnsMatch) {
    return outputs;
  }
  
  const returnsType = returnsMatch[1];
  
  // Parse object-style returns: {type: THREE.Object3D, name: string, style: string, color: string, lineStyle?: string}
  if (returnsType.includes('type:')) {
    const output = parseObjectReturns(returnsType);
    if (output) {
      outputs.push(output);
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
    // Extract key-value pairs from the object specification
    const pairs = returnsType.match(/(\w+):\s*([^,}]+)/g);
    if (!pairs) return null;
    
    const output = {};
    
    for (const pair of pairs) {
      const [key, value] = pair.split(':').map(s => s.trim());
      
      // Remove type annotations and optional markers
      const cleanValue = value.replace(/\?$/, '').trim();
      
      if (key === 'type') {
        output.type = cleanValue;
      } else if (key === 'name') {
        output.name = cleanValue === 'string' ? 'output' : cleanValue.replace(/['"]/g, '');
      } else if (key === 'style') {
        output.style = cleanValue === 'string' ? 'filledThick' : cleanValue.replace(/['"]/g, '');
      } else if (key === 'color') {
        output.color = cleanValue === 'string' ? 'Ocean' : cleanValue.replace(/['"]/g, '');
      } else if (key === 'lineStyle') {
        output.lineStyle = cleanValue === 'string' ? 'solid' : cleanValue.replace(/['"]/g, '');
      }
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
  if (cleanType.includes('THREE.BufferGeometry')) {
    return 'THREE.BufferGeometry';
  }
  if (cleanType.includes('THREE.Mesh')) {
    return 'THREE.Mesh';
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
  
  // Parse key=value pairs
  const pairs = metadataStr.split(',').map(s => s.trim());
  
  for (const pair of pairs) {
    if (pair.includes('=')) {
      const [key, value] = pair.split('=').map(s => s.trim());
      
      if (key === 'default') {
        metadata.default = parseDefaultValue(value, type);
      } else if (key === 'min') {
        metadata.min = parseFloat(value);
      } else if (key === 'max') {
        metadata.max = parseFloat(value);
      } else if (key === 'step') {
        metadata.step = parseFloat(value);
      } else if (key === 'interactive') {
        metadata.interactive = value.toLowerCase() === 'true';
      }
    } else if (pair === 'interactive=true' || pair === 'interactive') {
      metadata.interactive = true;
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