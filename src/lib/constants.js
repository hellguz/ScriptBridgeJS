/**
 * Constants for Grasshopper.js Sandbox
 * Color palette and style definitions
 */

/**
 * Predefined color palette with base, light, and dark variants
 */
export const COLOR_PALETTE = {
  Ocean: {
    name: 'Ocean',
    base: '#0096C7',
    light: '#48B5D8',
    dark: '#0077A0'
  },
  Forest: {
    name: 'Forest',
    base: '#52B788',
    light: '#79D1A7',
    dark: '#41926D'
  },
  Sunset: {
    name: 'Sunset',
    base: '#F77F00',
    light: '#F9A040',
    dark: '#C56500'
  },
  Grape: {
    name: 'Grape',
    base: '#8338EC',
    light: '#A269F0',
    dark: '#682CC9'
  },
  Ruby: {
    name: 'Ruby',
    base: '#D62828',
    light: '#E15B5B',
    dark: '#AA2020'
  },
  Lemon: {
    name: 'Lemon',
    base: '#FCBF49',
    light: '#FDD57A',
    dark: '#C9983A'
  },
  Sky: {
    name: 'Sky',
    base: '#4CC9F0',
    light: '#76D9F4',
    dark: '#3C9FC0'
  },
  Blush: {
    name: 'Blush',
    base: '#FF7096',
    light: '#FF94B2',
    dark: '#CC5978'
  }
};

/**
 * Available rendering styles
 */
export const RENDER_STYLES = {
  FILLED_THICK: 'filledThick',
  WIREFRAME: 'wireframe',
  TRANSPARENT_THICK: 'transparentThick',
  TRANSPARENT_THIN: 'transparentThin'
};

/**
 * Available line styles
 */
export const LINE_STYLES = {
  SOLID: 'solid',
  DASHED: 'dashed',
  DOTTED: 'dotted'
};

/**
 * Get color hex value by name and variant
 * @param {string} colorName - Name of the color (Ocean, Forest, etc.)
 * @param {string} variant - Variant (base, light, dark)
 * @returns {string} Hex color value
 */
export function getColor(colorName, variant = 'base') {
  const color = COLOR_PALETTE[colorName];
  if (!color) {
    console.warn(`Unknown color: ${colorName}, using Ocean as fallback`);
    return COLOR_PALETTE.Ocean[variant] || COLOR_PALETTE.Ocean.base;
  }
  return color[variant] || color.base;
}

/**
 * Get all available color names
 * @returns {string[]} Array of color names
 */
export function getColorNames() {
  return Object.keys(COLOR_PALETTE);
}

/**
 * Validate if a color name exists in the palette
 * @param {string} colorName - Color name to validate
 * @returns {boolean} True if color exists
 */
export function isValidColor(colorName) {
  return colorName in COLOR_PALETTE;
}

/**
 * Validate if a render style is valid
 * @param {string} style - Style to validate
 * @returns {boolean} True if style is valid
 */
export function isValidRenderStyle(style) {
  return Object.values(RENDER_STYLES).includes(style);
}

/**
 * Validate if a line style is valid
 * @param {string} lineStyle - Line style to validate
 * @returns {boolean} True if line style is valid
 */
export function isValidLineStyle(lineStyle) {
  return Object.values(LINE_STYLES).includes(lineStyle);
}