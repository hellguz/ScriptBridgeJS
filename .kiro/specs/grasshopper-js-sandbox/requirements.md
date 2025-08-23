# Requirements Document

## Introduction

The Grasshopper.js Sandbox is a serverless, single-page React web application that enables users to create interactive 3D geometry visualizations through JavaScript code. The application parses JSDoc-annotated JavaScript functions to automatically generate UI controls and render Three.js geometry outputs in real-time. This tool bridges the gap between parametric design and web-based visualization, allowing for rapid prototyping and experimentation with 3D geometry generation.

## Requirements

### Requirement 1

**User Story:** As a developer, I want to paste JavaScript code with JSDoc annotations into a code editor, so that I can quickly test and visualize parametric 3D geometry functions.

#### Acceptance Criteria

1. WHEN a user pastes JavaScript code into the editor THEN the system SHALL provide syntax highlighting for better readability
2. WHEN a user clicks the "Run" button THEN the system SHALL parse the JSDoc comments and execute the function
3. WHEN a user clicks "Paste from Clipboard" THEN the system SHALL automatically paste clipboard content and trigger execution
4. WHEN a user clicks "Clear" THEN the system SHALL empty the code editor area
5. IF the code contains syntax errors THEN the system SHALL display clear error messages to the user

### Requirement 2

**User Story:** As a user, I want the system to automatically parse JSDoc annotations from my code, so that appropriate UI controls are generated without manual configuration.

#### Acceptance Criteria

1. WHEN code contains @param {number} with metadata [default=value, min=value, max=value, step=value] THEN the system SHALL generate slider controls with those exact specifications
2. WHEN code contains @param {string} with metadata [default="#ff00ff"] THEN the system SHALL generate color picker controls returning hex strings
3. WHEN code contains @param {string} with metadata [default="Hello World"] THEN the system SHALL generate text input controls
4. WHEN code contains @param {boolean} with metadata [default=true] THEN the system SHALL generate toggle controls
5. WHEN code contains @param {number[]} with metadata [default=[x, y, z]] THEN the system SHALL generate vector input controls for 3D points
6. WHEN code contains @param {Array<number[]>} with metadata [default=[[x1,y1,z1], [x2,y2,z2]]] THEN the system SHALL generate polyline input controls
7. WHEN code contains @param {number[]} or @param {Array<number[]>} with [interactive=true] metadata THEN the system SHALL render 3D TransformControls gizmos for direct manipulation
8. WHEN code contains @folder tags THEN the system SHALL group all subsequent @param tags into that folder until a new @folder is declared
9. WHEN code contains @param {THREE.BufferGeometry | THREE.Mesh} THEN the system SHALL recognize these as non-interactive inputs from other scripts

### Requirement 3

**User Story:** As a user, I want to manipulate input parameters through generated UI controls, so that I can see real-time changes in the 3D visualization.

#### Acceptance Criteria

1. WHEN a user changes any input control value THEN the system SHALL re-execute the function and update the 3D scene
2. WHEN a user drags a 3D gizmo for interactive points THEN the system SHALL update the corresponding Leva control value
3. WHEN a user drags a 3D gizmo for interactive polylines THEN the system SHALL update all point values in the polyline array
4. WHEN parameters are grouped in folders THEN the system SHALL display them in collapsible sections in the Leva panel
5. IF the function execution fails THEN the system SHALL display error information without crashing the interface

### Requirement 4

**User Story:** As a user, I want to see my generated 3D geometry rendered with predefined styles and colors, so that I can focus on the geometry logic rather than rendering details.

#### Acceptance Criteria

1. WHEN a function has @returns with type: THREE.Object3D, name: string, style: string, color: string, lineStyle?: string THEN the system SHALL parse and apply these exact properties
2. WHEN style is "filledThick" THEN the system SHALL render with MeshStandardMaterial + EdgesGeometry with thick LineBasicMaterial
3. WHEN style is "wireframe" THEN the system SHALL render as LineSegments with LineBasicMaterial (edges only, no faces)
4. WHEN style is "transparentThick" THEN the system SHALL render with MeshStandardMaterial (transparent:true, opacity:0.6) + thick EdgesGeometry
5. WHEN style is "transparentThin" THEN the system SHALL render with MeshStandardMaterial (transparent:true, opacity:0.6) + thin EdgesGeometry
6. WHEN color is specified as "Ocean", "Forest", "Sunset", "Grape", "Ruby", "Lemon", "Sky", or "Blush" THEN the system SHALL use the corresponding hex values from the predefined palette
7. WHEN lineStyle is "solid" THEN the system SHALL use LineBasicMaterial
8. WHEN lineStyle is "dashed" THEN the system SHALL use LineDashedMaterial with scale, dashSize, gapSize
9. WHEN lineStyle is "dotted" THEN the system SHALL use LineDashedMaterial with very small dashSize
10. IF no style is specified THEN the system SHALL apply filledThick as default

### Requirement 5

**User Story:** As a user, I want to control the visibility of individual output objects, so that I can focus on specific parts of complex geometry.

#### Acceptance Criteria

1. WHEN a function returns multiple named objects THEN the system SHALL create visibility toggles for each object in the Leva panel
2. WHEN a user toggles an object's visibility THEN the system SHALL show or hide that object in the 3D scene immediately
3. WHEN objects are initially rendered THEN the system SHALL make all objects visible by default
4. WHEN the Outputs folder is collapsed THEN the system SHALL still maintain the current visibility states
5. IF an object name changes between executions THEN the system SHALL reset visibility toggles appropriately

### Requirement 6

**User Story:** As a user, I want to navigate and interact with the 3D scene, so that I can examine the generated geometry from different angles and perspectives.

#### Acceptance Criteria

1. WHEN the 3D scene loads THEN the system SHALL provide orbit controls for camera manipulation
2. WHEN the scene is displayed THEN the system SHALL include a ground grid for spatial reference
3. WHEN the scene is rendered THEN the system SHALL provide appropriate lighting for geometry visibility
4. WHEN interactive gizmos are present THEN the system SHALL allow direct manipulation without interfering with camera controls
5. IF the scene becomes empty THEN the system SHALL maintain the camera position and controls

### Requirement 7

**User Story:** As a developer, I want the application to be deployable to GitHub Pages, so that I can easily share and host the tool without server infrastructure.

#### Acceptance Criteria

1. WHEN the application is built THEN the system SHALL generate static files compatible with GitHub Pages
2. WHEN deployed to GitHub Pages THEN the system SHALL function identically to local development
3. WHEN the application loads THEN the system SHALL not require any server-side processing
4. WHEN users access the deployed application THEN the system SHALL load all necessary dependencies from CDNs or bundled assets
5. IF the application is accessed via HTTPS THEN the system SHALL maintain full functionality including clipboard access where supported

### Requirement 8

**User Story:** As a user, I want clear feedback when errors occur, so that I can understand and fix issues with my code.

#### Acceptance Criteria

1. WHEN JavaScript parsing fails THEN the system SHALL display syntax error messages with line numbers
2. WHEN JSDoc parsing encounters invalid metadata THEN the system SHALL show specific validation errors
3. WHEN function execution throws an error THEN the system SHALL display the error message without breaking the interface
4. WHEN Three.js geometry creation fails THEN the system SHALL provide meaningful error feedback
5. IF required dependencies are missing THEN the system SHALL indicate which libraries or functions are needed
##
# Requirement 9

**User Story:** As a developer, I want to use exact color palette specifications, so that the visual output matches the design system precisely.

#### Acceptance Criteria

1. WHEN color "Ocean" is specified THEN the system SHALL use base #0096C7, light #48B5D8, dark #0077A0
2. WHEN color "Forest" is specified THEN the system SHALL use base #52B788, light #79D1A7, dark #41926D
3. WHEN color "Sunset" is specified THEN the system SHALL use base #F77F00, light #F9A040, dark #C56500
4. WHEN color "Grape" is specified THEN the system SHALL use base #8338EC, light #A269F0, dark #682CC9
5. WHEN color "Ruby" is specified THEN the system SHALL use base #D62828, light #E15B5B, dark #AA2020
6. WHEN color "Lemon" is specified THEN the system SHALL use base #FCBF49, light #FDD57A, dark #C9983A
7. WHEN color "Sky" is specified THEN the system SHALL use base #4CC9F0, light #76D9F4, dark #3C9FC0
8. WHEN color "Blush" is specified THEN the system SHALL use base #FF7096, light #FF94B2, dark #CC5978

### Requirement 10

**User Story:** As a developer, I want to follow the exact JSDoc format specification, so that the parser can reliably extract metadata.

#### Acceptance Criteria

1. WHEN parsing JSDoc THEN the system SHALL recognize the format /** @param {{type}} name - Description [metadata] */
2. WHEN parsing @returns THEN the system SHALL expect format /** @returns {{type: THREE.Object3D, name: string, style: string, color: string, lineStyle?: string}} */
3. WHEN parsing number metadata THEN the system SHALL extract [default=value, min=value, max=value, step=value] format
4. WHEN parsing string color metadata THEN the system SHALL extract [default="#hexcolor"] format
5. WHEN parsing string text metadata THEN the system SHALL extract [default="text"] format
6. WHEN parsing boolean metadata THEN the system SHALL extract [default=true/false] format
7. WHEN parsing point metadata THEN the system SHALL extract [default=[x, y, z], interactive=true] format
8. WHEN parsing polyline metadata THEN the system SHALL extract [default=[[x1,y1,z1], [x2,y2,z2]], interactive=true] format
9. WHEN @folder tag is encountered THEN the system SHALL group all subsequent @param tags until next @folder declaration