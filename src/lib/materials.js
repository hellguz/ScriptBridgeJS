/**
 * Material creation utilities for Grasshopper.js Sandbox
 * Handles style and color application to Three.js geometries
 */

import * as THREE from 'three'
import { COLOR_PALETTE, RENDER_STYLES, LINE_STYLES, getColor, isValidColor, isValidRenderStyle, isValidLineStyle } from './constants.js'

/**
 * Create material based on style and color specifications
 * @param {string} style - Render style (filledThick, wireframe, transparentThick, transparentThin)
 * @param {string} colorName - Color name from palette
 * @param {string} lineStyle - Line style for wireframe/edges (solid, dashed, dotted)
 * @returns {Object} Material configuration object
 */
export function createMaterialConfig(style = 'filledThick', colorName = 'Ocean', lineStyle = 'solid') {
  // Validate inputs
  if (!isValidRenderStyle(style)) {
    console.warn(`Invalid render style: ${style}, using filledThick as fallback`)
    style = RENDER_STYLES.FILLED_THICK
  }

  if (!isValidColor(colorName)) {
    console.warn(`Invalid color: ${colorName}, using Ocean as fallback`)
    colorName = 'Ocean'
  }

  if (!isValidLineStyle(lineStyle)) {
    console.warn(`Invalid line style: ${lineStyle}, using solid as fallback`)
    lineStyle = LINE_STYLES.SOLID
  }

  const baseColor = getColor(colorName, 'base')
  const lightColor = getColor(colorName, 'light')
  const darkColor = getColor(colorName, 'dark')

  const config = {
    style,
    colorName,
    lineStyle,
    baseColor,
    lightColor,
    darkColor
  }

  switch (style) {
    case RENDER_STYLES.FILLED_THICK:
      return {
        ...config,
        meshMaterial: new THREE.MeshStandardMaterial({ 
          color: baseColor,
          metalness: 0.1,
          roughness: 0.7
        }),
        edgeMaterial: new THREE.LineBasicMaterial({ 
          color: darkColor,
          linewidth: 2
        }),
        showEdges: true,
        showFaces: true
      }

    case RENDER_STYLES.WIREFRAME:
      return {
        ...config,
        lineMaterial: createLineMaterial(darkColor, lineStyle),
        showEdges: true,
        showFaces: false
      }

    case RENDER_STYLES.TRANSPARENT_THICK:
      return {
        ...config,
        meshMaterial: new THREE.MeshStandardMaterial({ 
          color: baseColor,
          transparent: true,
          opacity: 0.6,
          metalness: 0.1,
          roughness: 0.7
        }),
        edgeMaterial: new THREE.LineBasicMaterial({ 
          color: darkColor,
          linewidth: 2
        }),
        showEdges: true,
        showFaces: true
      }

    case RENDER_STYLES.TRANSPARENT_THIN:
      return {
        ...config,
        meshMaterial: new THREE.MeshStandardMaterial({ 
          color: baseColor,
          transparent: true,
          opacity: 0.6,
          metalness: 0.1,
          roughness: 0.7
        }),
        edgeMaterial: new THREE.LineBasicMaterial({ 
          color: darkColor,
          linewidth: 1
        }),
        showEdges: true,
        showFaces: true
      }

    default:
      return config
  }
}

/**
 * Create line material based on line style
 * @param {string} color - Hex color string
 * @param {string} lineStyle - Line style (solid, dashed, dotted)
 * @returns {THREE.Material} Line material
 */
function createLineMaterial(color, lineStyle) {
  switch (lineStyle) {
    case LINE_STYLES.SOLID:
      return new THREE.LineBasicMaterial({ color })

    case LINE_STYLES.DASHED:
      return new THREE.LineDashedMaterial({ 
        color,
        scale: 5,
        dashSize: 0.4,
        gapSize: 0.2
      })

    case LINE_STYLES.DOTTED:
      return new THREE.LineDashedMaterial({ 
        color,
        scale: 1,
        dashSize: 0.02,
        gapSize: 0.05
      })

    default:
      return new THREE.LineBasicMaterial({ color })
  }
}

/**
 * Recursively applies material configuration to a Three.js object and its children.
 * @param {THREE.Object3D} object - The object to style (Mesh, Line, Group, etc.).
 * @param {Object} materialConfig - Material configuration from createMaterialConfig.
 * @returns {THREE.Object3D} A new, styled object or group.
 */
export function applyMaterialToObject(object, materialConfig) {
  // Base case 1: The object is a Line or LineSegments
  if (object.isLine || object.isLineSegments) {
    const clonedLine = object.clone();
    clonedLine.material = materialConfig.lineMaterial || createLineMaterial(materialConfig.darkColor, materialConfig.lineStyle);
    if (clonedLine.material.isLineDashedMaterial) {
      clonedLine.geometry.computeLineDistances();
    }
    return clonedLine;
  }

  // Base case 2: The object is a Mesh
  if (object.isMesh) {
    const styledMeshGroup = new THREE.Group();
    const clonedMesh = object.clone();

    if (materialConfig.showFaces && materialConfig.meshMaterial) {
      clonedMesh.material = materialConfig.meshMaterial;
      styledMeshGroup.add(clonedMesh);
    }

    if (materialConfig.showEdges) {
      const edges = createEdgesFromObject(clonedMesh, materialConfig);
      if (edges) {
        styledMeshGroup.add(edges);
      }
    }
    
    if (styledMeshGroup.children.length === 0 && !materialConfig.showFaces) {
        // Handle wireframe style for a mesh
        return createEdgesFromObject(clonedMesh, materialConfig) || styledMeshGroup;
    }

    return styledMeshGroup.children.length > 1 ? styledMeshGroup : styledMeshGroup.children[0] || styledMeshGroup;
  }

  // Recursive case: The object is a Group
  if (object.isGroup) {
    const newGroup = new THREE.Group();
    // Copy transformation properties
    newGroup.position.copy(object.position);
    newGroup.rotation.copy(object.rotation);
    newGroup.scale.copy(object.scale);

    for (const child of object.children) {
      // Recursively style each child and add the result to the new group
      newGroup.add(applyMaterialToObject(child, materialConfig));
    }
    return newGroup;
  }

  // Fallback for other object types (lights, cameras, etc.)
  return object.clone();
}


/**
 * Create edges geometry from a Three.js object
 * @param {THREE.Object3D} object - Source object
 * @param {Object} materialConfig - Material configuration
 * @returns {THREE.Group|null} Edges group or null if no edges are created
 */
function createEdgesFromObject(object, materialConfig) {
  const edgesGroup = new THREE.Group()
  
  object.traverse((child) => {
    if (child.isMesh && child.geometry && child.geometry.attributes.position && child.geometry.attributes.position.count > 0) {
      try {
        const edges = new THREE.EdgesGeometry(child.geometry);
        const lineMaterial = materialConfig.edgeMaterial || materialConfig.lineMaterial;
        if (!lineMaterial) return;
        
        let lineObject;
        if (lineMaterial.isLineDashedMaterial) {
          lineObject = new THREE.LineSegments(edges, lineMaterial);
          lineObject.computeLineDistances();
        } else {
          lineObject = new THREE.LineSegments(edges, lineMaterial);
        }
        
        // Copy transform from original mesh
        lineObject.position.copy(child.position);
        lineObject.rotation.copy(child.rotation);
        lineObject.scale.copy(child.scale);
        
        edgesGroup.add(lineObject);
      } catch (error) {
        console.warn("Could not generate edges for a geometry, it might be invalid.", error);
      }
    }
  })
  
  return edgesGroup.children.length > 0 ? edgesGroup : null
}

/**
 * Parse @returns metadata to extract styling information
 * @param {Object} outputParam - Output parameter from parser
 * @returns {Object} Styling configuration
 */
export function parseOutputStyling(outputParam) {
  const defaults = {
    style: RENDER_STYLES.FILLED_THICK,
    color: 'Ocean',
    lineStyle: LINE_STYLES.SOLID
  }

  if (!outputParam) {
    return defaults
  }

  return {
    style: outputParam.style || defaults.style,
    color: outputParam.color || defaults.color,
    lineStyle: outputParam.lineStyle || defaults.lineStyle
  }
}
