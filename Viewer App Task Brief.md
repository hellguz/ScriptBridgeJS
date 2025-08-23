### 1\. JSDoc Specification for Inputs & Outputs

To allow the LLM to generate predictable and parsable code, we'll establish a strict JSDoc format. This format uses standard JSDoc tags (`@param`, `@returns`) enriched with custom, bracketed metadata for UI generation.

#### **Input Parameters (`@param`)**

The core format is: `/** @param {{type}} name - Description [metadata] */`

  * **`@folder` Tag (Optional):** To group inputs in Leva, use a preceding `@folder` tag. All subsequent `@param` tags will belong to this folder until a new `@folder` tag is declared.

  * **Supported Types & Metadata:**

      * **Number (Slider):**
          * `{number}`
          * Metadata: `[default=value, min=value, max=value, step=value]`
          * Example:
            ```javascript
            /**
             * @folder Geometry
             * @param {number} radius - The radius of the circle. [default=10, min=1, max=50, step=0.1]
             */
            ```
      * **Color:**
          * `{string}` (Leva's color picker returns a hex string)
          * Metadata: `[default="#ff00ff"]`
          * Example:
            ```javascript
            /**
             * @folder Style
             * @param {string} objectColor - The main color of the mesh. [default="#00aaff"]
             */
            ```
      * **Text:**
          * `{string}`
          * Metadata: `[default="Hello World"]`
          * Example:
            ```javascript
            /**
             * @folder Content
             * @param {string} label - The text to display. [default="My Object"]
             */
            ```
      * **Boolean (Toggle):**
          * `{boolean}`
          * Metadata: `[default=true]`
          * Example:
            ```javascript
            /**
             * @folder Controls
             * @param {boolean} enableBevel - Toggles the bevel effect. [default=false]
             */
            ```
      * **Point (Vector):**
          * `{number[]}` (An array of 3 numbers: `[x, y, z]`)
          * Metadata:
              * `[default=[x, y, z]]`
              * `[interactive=true]`: If present, a 3D gizmo will be rendered in the scene to control this point.
          * Example:
            ```javascript
            /**
             * @folder Geometry
             * @param {number[]} startPoint - The starting point of the line. [default=[0, 0, 0], interactive=true]
             */
            ```
      * **Polyline:**
          * `{Array<number[]>}` (An array of points)
          * Metadata:
              * `[default=[[x1,y1,z1], [x2,y2,z2], ...]]`
              * `[interactive=true]`: Renders a gizmo for each point in the polyline.
          * Example:
            ```javascript
            /**
             * @folder Geometry
             * @param {Array<number[]>} boundary - The boundary curve. [default=[[0,0,0], [10,0,0], [10,10,0]], interactive=true]
             */
            ```
      * **Mesh/Geometry (Non-interactive):**
          * `{THREE.BufferGeometry | THREE.Mesh}` (Or other Three.js types)
          * These are passed in from other scripts in a potential chain. They won't have a Leva input but are listed for clarity.
          * Example:
            ```javascript
            /**
             * @param {THREE.BufferGeometry} baseSurface - The surface to build upon.
             */
            ```

#### **Output Parameters (`@returns`)**

The format is: `/** @returns {{type: THREE.Object3D, name: string, style: string, color: string, lineStyle?: string}} */`

Each script should return a single object where keys are the output names and values are the Three.js objects to be rendered. The JSDoc describes the properties of the objects *within* the returned map.

  * `type`: The expected Three.js object type (e.g., `THREE.Mesh`, `THREE.LineSegments`).

  * `name`: A user-friendly name for the output, used in the Leva display toggle.

  * `style`: The geometry style to apply. (See Section 2.2).

  * `color`: The color to use from the palette. (See Section 2.1).

  * `lineStyle` (Optional): The line style to apply for curves or wireframes. (See Section 2.3).

  * **Example:**

    ```javascript
    /**
     * Creates a lofted surface from a series of profile curves.
     * @folder Profiles
     * @param {Array<number[]>} profile1 - First profile curve. [default=[[-5,0,0], [5,0,0]], interactive=true]
     * @param {Array<number[]>} profile2 - Second profile curve. [default=[[-5,10,2], [5,10,-2]], interactive=true]
     * @folder Style
     * @param {string} surfaceColor - Color of the main surface. [default="ocean"]
     *
     * @returns {{type: THREE.Mesh, name: "Lofted Surface", style: "filledThick", color: "ocean"}}
     * @returns {{type: THREE.Line, name: "Profile 1 Viz", style: "wireframe", color: "sunset", lineStyle: "dashed"}}
     */
    function loftProfiles(profile1, profile2, surfaceColor) {
      // ...script logic...
      return {
        "Lofted Surface": generatedMesh,
        "Profile 1 Viz": profile1LineObject
      };
    }
    ```

-----

### 2\. Output Display Styles

These are predefined constants the app will use to render geometry based on the JSDoc `@returns` metadata.

#### **2.1. Color Palette**

The LLM should use the **Name** column when specifying a color.

| Name | Hex (Base) | Hex (Light) | Hex (Dark) |
| :--- | :--- | :--- | :--- |
| **Ocean** | `#0096C7` | `#48B5D8` | `#0077A0` |
| **Forest** | `#52B788` | `#79D1A7` | `#41926D` |
| **Sunset** | `#F77F00` | `#F9A040` | `#C56500` |
| **Grape** | `#8338EC` | `#A269F0` | `#682CC9` |
| **Ruby** | `#D62828` | `#E15B5B` | `#AA2020` |
| **Lemon** | `#FCBF49` | `#FDD57A` | `#C9983A` |
| **Sky** | `#4CC9F0` | `#76D9F4` | `#3C9FC0` |
| **Blush** | `#FF7096` | `#FF94B2` | `#CC5978` |

#### **2.2. Geometry Styles**

| Name | Description | Three.js Implementation |
| :--- | :--- | :--- |
| `filledThick` | Solid, opaque mesh with a prominent outline. | `MeshStandardMaterial` + `EdgesGeometry` with thick `LineBasicMaterial`. |
| `wireframe` | Edges only, no faces. | `LineSegments` with `LineBasicMaterial`. |
| `transparentThick` | Semi-transparent mesh with a prominent outline. | `MeshStandardMaterial` (`transparent:true`, `opacity:0.6`) + `EdgesGeometry` with thick `LineBasicMaterial`. |
| `transparentThin` | Semi-transparent mesh with a subtle outline. | `MeshStandardMaterial` (`transparent:true`, `opacity:0.6`) + `EdgesGeometry` with thin `LineBasicMaterial`. |

#### **2.3. Line Styles**

| Name | Description | Three.js Implementation |
| :--- | :--- | :--- |
| `solid` | A continuous line. | `LineBasicMaterial`. |
| `dashed` | A line with repeating dashes and gaps. | `LineDashedMaterial` (`scale`, `dashSize`, `gapSize`). |
| `dotted` | A line composed of small dots. | `LineDashedMaterial` with very small `dashSize`. |

-----

### 3\. Application UX Design

The app will be a simple, single-page interface designed for immediate feedback.

  * **Layout:** A two-panel layout.
      * **Left Panel (Controls):** Takes up \~35% of the viewport width.
          * **Header:** A simple title like "Grasshopper.js Sandbox".
          * **Code Input:** A small, vertically resizable text area for pasting the JavaScript code. It should have syntax highlighting.
          * **Buttons:**
              * **`Run`:** Manually triggers the script parsing and execution. (Could also be debounced to run on code change).
              * **`Paste from Clipboard`:** A helper button to automatically paste clipboard content into the text area and run.
              * **`Clear`:** Empties the code area.
      * **Right Panel (Viewport):** Takes up the remaining \~65%.
          * **3D Canvas:** A full-height canvas for rendering the Three.js scene. It will include default orbit controls, a ground grid, and basic lighting.
      * **Leva Panel:** Floats on top of the 3D canvas in the top-right corner. It is populated dynamically based on the parsed JSDocs from the code input. It will contain folders for inputs and a dedicated "Outputs" folder with toggles for the visibility of each returned geometry object.

-----

### 4\. Full Design Task for an LLM Agent

Here is a detailed task description you can provide to a code-generating LLM.

-----

**Project Title:** Grasshopper.js Sandbox

**Objective:** Create a serverless, single-page React web application that allows a user to paste a JavaScript code snippet, dynamically generates a UI for its inputs using Leva, and renders its Three.js geometry output in a 3D viewport. The application should be deployable to GitHub Pages.

**Tech Stack:**

  * **Framework:** React (using Vite)
  * **3D Rendering:** `three`, `@react-three/fiber`, `@react-three/drei`
  * **UI Controls:** `leva`
  * **JS Parser:** `acorn` (to parse the code string and extract JSDoc comments)
  * **Code Editor:** `react-simple-code-editor` (for a lightweight input with syntax highlighting)

**Core Workflow:**

1.  The user pastes JavaScript code into a text editor component.
2.  On `Run`, the app parses this string using **Acorn** to build an Abstract Syntax Tree (AST).
3.  A custom parser function traverses the AST to find the main function declaration and its associated JSDoc comments.
4.  The parser extracts all `@param`, `@returns`, and `@folder` tags and their metadata into a structured JSON object.
5.  This structured object is used to dynamically generate a schema for **Leva**, creating sliders, color pickers, etc., for inputs and a folder of boolean toggles for output visibility.
6.  The body of the user's JavaScript function is extracted as a string.
7.  A React component (`DynamicScriptHost`) takes the current values from the Leva controls as arguments, executes the user's function using `new Function(...)`, and receives the output geometry.
8.  The component then renders the returned Three.js objects into the `@react-three/fiber` scene, applying the styles and colors specified in the `@returns` JSDoc metadata.
9.  Interactive inputs (`[interactive=true]`) will render `@react-three/drei`'s `TransformControls` gizmos in the scene, which update the corresponding Leva state on drag.

**File Structure:**

```plaintext
/public/
/src/
  /components/
    CodeEditor.jsx      # The code input text area and control buttons
    Scene.jsx           # The main R3F Canvas, lights, and environment
    DynamicRenderer.jsx # Renders a single piece of geometry based on style props
    GizmoController.jsx # Renders TransformControls for interactive points
  /hooks/
    useScriptParser.js  # Custom hook taking code string, returns parsed { inputs, outputs, functionBody }
    useLevaFromParams.js # Custom hook taking parsed inputs/outputs, returns [levaSchema, levaValues]
  /lib/
    constants.js        # Exports the color palette and style definitions
    parser.js           # The core AST traversal and JSDoc parsing logic
  App.jsx               # Main component, manages state and orchestrates the workflow
  main.jsx              # Vite entry point
  index.css             # Basic styling
```

**Implementation Details:**

  * **`parser.js`:**

      * This is the most complex part. It should use Acorn to parse the code.
      * It needs to find JSDoc blocks (`/** ... */`) attached to a function declaration.
      * It must parse the JSDoc comment text to extract tags (`@param`, `@returns`, `@folder`) and their metadata (e.g., `[default=10, min=0]`). Regular expressions will be useful here.
      * It should return a clean object, like:
        ```json
        {
          "inputs": [
            { "name": "radius", "type": "number", "folder": "Geometry", "default": 10, "min": 1, ... }
          ],
          "outputs": [
            { "name": "Lofted Surface", "style": "filledThick", "color": "ocean" }
          ],
          "functionBody": "...",
          "argNames": ["radius"]
        }
        ```

  * **`useScriptParser.js`:** A simple React hook wrapper around the `parser.js` logic that memoizes the result to avoid re-parsing on every render.

  * **`App.jsx`:**

      * Holds the raw code string in its state: `const [code, setCode] = useState('');`
      * Uses the `useScriptParser` hook to get the parsed script details.
      * Uses a `useLevaFromParams` hook which takes the parsed details and generates the Leva controls. This hook returns the current values from Leva.
      * Passes the `functionBody`, `argNames`, `outputs` configuration, and the current `levaValues` to the `<Scene />` component.

  * **`Scene.jsx`:**

      * Contains the R3F `<Canvas>`.
      * Includes `<OrbitControls />`, `<Grid />`, and `<ambientLight />`.
      * It will dynamically execute the user's code. An effect hook (`useEffect`) can be used to run the script whenever Leva values change.
      * **Execution:** Create the function: `const scriptFn = new Function(...parsed.argNames, parsed.functionBody);`.
      * Call it with Leva values: `const results = scriptFn(...Object.values(levaValues));`.
      * Map over the `results` object and render each piece of geometry using a `DynamicRenderer` component, but only if its corresponding visibility toggle in Leva is `true`.
      * Render `GizmoController` for any interactive inputs.

  * **Styling:** In `lib/constants.js`, define the color palette and material styles as objects that can be easily accessed. The `DynamicRenderer` component will take props like `style="filledThick"` and `color="ocean"` and select the correct materials and settings from these constants.

**Final Deliverable:** A complete, runnable React application source code adhering to the specified structure and functionality. Include a basic `README.md` explaining how to install dependencies (`npm install`) and run the development server (`npm run dev`).