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
        scale: 1,
        dashSize: 0.5,
        gapSize: 0.2
      })

    case LINE_STYLES.DOTTED:
      return new THREE.LineDashedMaterial({ 
        color,
        scale: 1,
        dashSize: 0.05,
        gapSize: 0.05
      })

    default:
      return new THREE.LineBasicMaterial({ color })
  }
}

/**
 * Apply material configuration to a Three.js object
 * @param {THREE.Object3D} object - Three.js object to style
 * @param {Object} materialConfig - Material configuration from createMaterialConfig
 * @returns {THREE.Object3D} Styled object (or a group containing the styled object and its edges)
 */
export function applyMaterialToObject(object, materialConfig) {
  const clonedObject = object.clone()

  // Case 1: The object is already a Line or LineSegments
  if (clonedObject.isLine || clonedObject.isLineSegments) {
    clonedObject.material = materialConfig.lineMaterial || createLineMaterial(materialConfig.darkColor, materialConfig.lineStyle)
    if (clonedObject.material.isLineDashedMaterial) {
      clonedObject.computeLineDistances()
    }
    return clonedObject
  }

  // Case 2: The object is a Mesh
  if (clonedObject.isMesh) {
    const group = new THREE.Group()
    if (materialConfig.showFaces && materialConfig.meshMaterial) {
      clonedObject.material = materialConfig.meshMaterial
      group.add(clonedObject)
    }

    if (materialConfig.showEdges) {
      const edgesGroup = createEdgesFromObject(clonedObject, materialConfig)
      if (edgesGroup) {
        group.add(edgesGroup)
      }
    }
    return group.children.length > 1 ? group : group.children[0]
  }

  // Fallback for unknown object types
  return clonedObject
}


/**
 * Create edges geometry from a Three.js object
 * @param {THREE.Object3D} object - Source object
 * @param {Object} materialConfig - Material configuration
 * @returns {THREE.Group} Edges group
 */
function createEdgesFromObject(object, materialConfig) {
  const edgesGroup = new THREE.Group()
  
  object.traverse((child) => {
    if (child.isMesh && child.geometry) {
      const edges = new THREE.EdgesGeometry(child.geometry)
      const lineMaterial = materialConfig.edgeMaterial || materialConfig.lineMaterial
      
      let lineObject
      if (lineMaterial.isLineDashedMaterial) {
        lineObject = new THREE.LineSegments(edges, lineMaterial)
        lineObject.computeLineDistances()
      } else {
        lineObject = new THREE.LineSegments(edges, lineMaterial)
      }
      
      // Copy transform from original mesh
      lineObject.position.copy(child.position)
      lineObject.rotation.copy(child.rotation)
      lineObject.scale.copy(child.scale)
      
      edgesGroup.add(lineObject)
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

