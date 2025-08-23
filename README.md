# Grasshopper.js Sandbox 🦗➡️📜➡️💻

Welcome to the Grasshopper.js Sandbox! This project is a powerful web-based tool designed to bridge the gap between visual prototyping in Grasshopper and modern web development with Three.js. It allows you to instantly test, visualize, and interact with JavaScript code that has been converted from Grasshopper definitions.

**The Vision:** Empower designers and developers to leverage the rapid, visual prototyping capabilities of Grasshopper to create an extensive library of production-ready, interactive JavaScript modules for 3D web applications.

---

## 💡 Core Concept & Workflow

The entire project revolves around a sophisticated pipeline that transforms a visual Grasshopper script into a tangible JavaScript function. This process is designed to distill the *intent* of the script, rather than performing a direct, low-level translation.



The workflow is broken down into a few key stages:

1.  ** Grasshopper to Specification (LLM Agent 1):** A Grasshopper script (`.gh` file) is analyzed by an LLM, which produces a structured technical specification. This document describes the script's purpose, its key inputs (like sliders and points), and its final outputs in a human-readable format.

2.  ** Specification to JavaScript (LLM Agent 2):** A second LLM agent takes this specification and generates a clean, self-contained JavaScript function. This function uses Three.js to replicate the geometric logic of the original Grasshopper script.

3.  ** Visualization & Testing (This App!):** The generated JavaScript code is pasted directly into this Sandbox application. The app instantly parses the code, generates interactive controls, and renders the 3D geometry, providing immediate visual feedback.

4.  ** Library Generation (Future Goal):** Once tested, these validated JavaScript functions can be saved to a library, creating a powerful repository of reusable geometric tools for larger web applications, like an urban design simulator.

---

## ✨ Key Features of the Sandbox

This application is the interactive heart of the workflow, built to provide a seamless testing experience.

* **✂️ Paste & Run:** A simple code editor allows you to paste your generated JavaScript function and see the results instantly. Helper buttons for pasting from the clipboard and clearing the editor streamline the process.
* **🤖 Automatic UI Generation:** The app intelligently reads JSDoc comments (`/** ... */`) in your code to automatically generate a rich user interface using **Leva**. Sliders, color pickers, toggles, and vector inputs are created on the fly.
* **🌐 Interactive 3D Viewport:** A high-performance 3D canvas built with **React Three Fiber** renders your geometry. It includes default lighting, a ground grid for reference, and intuitive orbit controls for easy navigation.
* **🕹️ Real-time Parameter Control:** All inputs generated in the Leva panel are interactive. Drag a slider or change a color, and watch the 3D geometry update in real-time.
* **📍 3D Gizmo Controls:** For `Point` or `Polyline` inputs marked as interactive in the JSDocs, the app renders 3D transform gizmos directly in the scene, allowing for intuitive, visual manipulation of geometric inputs.

---

## 📜 The JSDoc Annotation Standard

To make the JavaScript code machine-readable, we use a strict JSDoc format. This is the secret sauce that allows the app to understand your function's inputs and outputs.

### **Inputs (`@param`)**

Parameters are defined using standard `@param` tags, augmented with special metadata in brackets `[...]`. You can group related inputs using an `@folder` tag.

**Example: A Number Slider**
```javascript
/**
 * @folder Dimensions
 * @param {number} radius - The radius of the circle. [default=10, min=1, max=50, step=0.1]
 */
````

**Example: An Interactive Point with a 3D Gizmo**

```javascript
/**
 * @folder Geometry
 * @param {number[]} startPoint - The starting point of the line. [default=[0, 0, 0], interactive=true]
 */
```

### **Outputs (`@returns`)**

Each piece of geometry the function returns is described with an `@returns` tag. This tag specifies the object's name for the UI, its visual style, and its color.

**Example: A Styled Mesh and a Dashed Line**

```javascript
/**
 * @returns {{type: THREE.Mesh, name: "Lofted Surface", style: "filledThick", color: "ocean"}}
 * @returns {{type: THREE.Line, name: "Profile Viz", style: "wireframe", color: "sunset", lineStyle: "dashed"}}
 */
function createGeometry(...) {
  // ... script logic
  return {
    "Lofted Surface": myMeshObject,
    "Profile Viz": myLineObject
  };
}
```

-----

## 🎨 Styling System

The JSDoc `@returns` tag references a predefined set of visual styles to ensure a consistent and modern aesthetic.

### **Color Palette**

A vibrant palette of 8 unique colors, each with a base, light, and dark variant. Use the capitalized name (e.g., `"Ocean"`, `"Sunset"`) in your JSDocs.

| Name   | Color                               | Name   | Color                               |
| :----- | :---------------------------------- | :----- | :---------------------------------- |
| Ocean  | \<span style="color:\#0096C7"\>■\</span\> | Sunset | \<span style="color:\#F77F00"\>■\</span\> |
| Forest | \<span style="color:\#52B788"\>■\</span\> | Grape  | \<span style="color:\#8338EC"\>■\</span\> |
| Ruby   | \<span style="color:\#D62828"\>■\</span\> | Lemon  | \<span style="color:\#FCBF49"\>■\</span\> |
| Sky    | \<span style="color:\#4CC9F0"\>■\</span\> | Blush  | \<span style="color:\#FF7096"\>■\</span\> |

### **Geometry & Line Styles**

Define the material and appearance of your meshes and curves.

| Geometry Style     | Description                                         |
| :----------------- | :-------------------------------------------------- |
| `filledThick`      | Solid, opaque mesh with a prominent outline.        |
| `wireframe`        | Edges only, no faces.                               |
| `transparentThick` | Semi-transparent mesh with a prominent outline.     |
| `transparentThin`  | Semi-transparent mesh with a subtle outline.        |

| Line Style | Description                           |
| :--------- | :------------------------------------ |
| `solid`    | A continuous line.                    |
| `dashed`   | A line with repeating dashes and gaps. |
| `dotted`   | A line composed of small dots.        |

-----

## 💻 Tech Stack & Architecture

The Sandbox is built with a modern, performant, and modular architecture. Here’s a breakdown of the technologies used and how they fit together.

### **Core Technologies**

  * **React (with Vite):** The foundation of our application, providing a fast, component-based UI framework and a blazing-fast development environment.
  * **Three.js:** The definitive library for 3D graphics in the browser. We use it for all rendering and geometry calculations.
  * **@react-three/fiber:** A React renderer for Three.js. It allows us to build our 3D scene declaratively with reusable components, managing the boilerplate of scene setup, rendering, and animation.
  * **@react-three/drei:** A collection of essential helpers for React Three Fiber, providing ready-to-use components for controls (`OrbitControls`), gizmos (`TransformControls`), and environment setups.
  * **Leva:** A powerful GUI for React. We use it to automatically generate the parameter control panel based on the parsed JSDoc comments.
  * **Acorn:** A lightweight and fast JavaScript parser. It's the engine that reads the user's code as a string and converts it into an Abstract Syntax Tree (AST), which we then traverse to find the JSDoc comments and function body.

### **Application Architecture**

The application is designed with a clear separation of concerns, managed primarily through React components and custom hooks.

  * **`App.jsx` (The Conductor):** This is the main component that orchestrates the entire application. It holds the primary state, including the raw code string from the editor, the parsed script object, and any execution errors. It connects the code editor panel with the 3D scene panel.

  * **`/lib/parser.js` (The Brains):** This is the most critical piece of the application's logic. It takes the raw code string, uses Acorn to generate an AST, and then traverses this tree to find function declarations and their associated JSDoc comments. It uses regular expressions to meticulously extract `@param`, `@returns`, and `@folder` tags and their metadata, returning a clean, structured JSON object.

  * **`/components/` (The Building Blocks):**

      * **`CodeEditor.jsx`:** A controlled component providing a simple text area with syntax highlighting for the user to input their code.
      * **`LevaControls.jsx`:** A component that takes the parsed script object and dynamically generates the Leva control schema. It also syncs state changes between Leva's internal store and the main `App.jsx` state.
      * **`GeometryRenderer.jsx`:** This component is responsible for the final execution. It takes the parsed script and the current parameter values from Leva, safely executes the user's function using `new Function(...)`, and renders the resulting Three.js objects into the scene.
      * **`GizmoController.jsx`:** This component conditionally renders `TransformControls` for any input parameters marked as `[interactive=true]`, linking the gizmo's state back to the corresponding parameter in the Leva panel.

  * **`/lib/materials.js` (The Stylist):** This utility file contains the logic for applying the predefined visual styles. It exports functions that take style names (e.g., `"filledThick"`, `"Ocean"`) and create the corresponding `THREE.Material` configurations, which are then applied to the geometry before rendering.

-----

## 🚀 Getting Started

To run the Grasshopper.js Sandbox on your local machine, follow these simple steps:

1.  **Clone the repository:**

    ```bash
    git clone <repository-url>
    cd grasshopper-js-sandbox
    ```

2.  **Install dependencies:**

    ```bash
    npm install
    ```

3.  **Run the development server:**

    ```bash
    npm run dev
    ```

The application will now be running, typically at `http://localhost:5173`. You can start by loading one of the sample scripts to see the sandbox in action\!

