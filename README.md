# ScriptBridgeJS 🦗➡️📜➡️💻

Welcome to the ScriptBridgeJS! This project is the interactive heart of a sophisticated pipeline designed to bridge the gap between visual prototyping in Grasshopper and modern web development with Three.js. It allows you to instantly test, visualize, and interact with JavaScript code that has been automatically converted from Grasshopper definitions by AI agents.

**The Vision:** Empower designers and developers to leverage the rapid, visual prototyping capabilities of Grasshopper to create an extensive library of production-ready, interactive JavaScript modules for 3D web applications.

---

## 💡 The Core Concept & Workflow

The entire project revolves around an AI-driven pipeline that transforms a visual Grasshopper script into a tangible, interactive JavaScript function. This process is designed to distill the *intent* of the script, rather than performing a direct, low-level translation of Grasshopper's data trees. The workflow is broken down into a few key stages:

1.  **Grasshopper to `.ghx`:** The process starts with a Grasshopper script saved in the XML format (`.ghx`).
2.  **`.ghx` to Compact JSON (`ghx2json_converter/`):** The Python script in the `ghx2json_converter` directory is used to parse the `.ghx` file. It converts the complex XML structure into a clean, indexed, and bidirectional JSON graph. This format is highly optimized for an LLM to understand the components and their connections.
3.  **JSON to Specification (LLM Agent 1):** The generated JSON graph, along with component documentation (scraped using scripts from `gh_docs_generation`), is fed to a Large Language Model (LLM). This agent's task is to produce a structured technical specification document that describes the script's purpose, its key inputs (like sliders and points), and its final outputs in a human-readable format.
4.  **Specification to JavaScript (LLM Agent 2):** A second LLM agent takes this specification and, guided by the master prompt found in `prompts/Grasshopper to JavaScript Conversion.md`, generates a clean, self-contained JavaScript function. This function uses Three.js to replicate the geometric logic of the original Grasshopper script.
5.  **Visualization & Testing (This App!):** The generated JavaScript code is pasted directly into this ScriptBridgeJS application. The app instantly parses the code's JSDoc comments, generates interactive controls for its parameters, and renders the 3D geometry, providing immediate visual feedback.
6.  **Library Generation (Future Goal):** Once tested and validated, these JavaScript functions can be saved to a library, creating a powerful repository of reusable geometric tools for larger web applications, such as an urban design simulator.

---

## ✨ Key Features of the ScriptBridgeJS

This application is built to provide a seamless and interactive testing experience for the generated JavaScript code.

* **✂️ Paste & Run:** A simple code editor allows you to paste your generated JavaScript function and see the results instantly. Helper buttons for pasting from the clipboard and clearing the editor streamline the process.
* **🤖 Automatic UI Generation:** The app intelligently reads JSDoc comments (`/** ... */`) in your code to automatically generate a rich user interface using **Leva**. Sliders, color pickers, toggles, and vector inputs are created on the fly.
* **🌐 Interactive 3D Viewport:** A high-performance 3D canvas built with **React Three Fiber** renders your geometry. It includes default lighting, a ground grid for reference, and intuitive orbit controls for easy navigation.
* **🕹️ Real-time Parameter Control:** All inputs generated in the Leva panel are interactive. Drag a slider or change a color, and watch the 3D geometry update in real-time.
* **📍 3D Gizmo Controls:** For `Point` or `Polyline` inputs marked as interactive in the JSDocs, the app renders 3D transform gizmos directly in the scene, allowing for intuitive, visual manipulation of geometric inputs.

---

## 📂 Project Structure & Repository Contents

This repository contains not only the ScriptBridgeJS application itself but also the core scripts and prompts that power the entire conversion pipeline.

* **/src/**: The source code for the React-based ScriptBridgeJS application. This is the user-facing tool for testing the generated JavaScript. Its internal architecture is detailed in the "Tech Stack" section below.
* **/ghx2json_converter/**: Contains the crucial `ghx2json.py` Python script. Its purpose is to perform the first step of the pipeline: converting the verbose `.ghx` XML file from Grasshopper into a compact, LLM-friendly JSON representation of the component graph.
* **/prompts/**: This directory contains the "brains" of the AI-driven conversion process. These are meticulously crafted markdown files that serve as instructions for the LLM agents. They define the persona, rules, and output format required to translate a technical specification into a valid, JSDoc-annotated JavaScript function.
* **/js_examples/**: A collection of sample JavaScript files that have been generated by the pipeline. You can copy and paste the content of these files into the ScriptBridgeJS to see how different inputs and outputs are handled.
* **/gh_docs_generation/**: Contains resources used by the first LLM agent to understand the function of various Grasshopper components. This context is essential for creating an accurate technical specification.

---

## 📜 The JSDoc Annotation Standard

To make the generated JavaScript code machine-readable by the ScriptBridgeJS, we use a strict JSDoc format. This is the secret sauce that allows the app to understand your function's inputs and outputs automatically.

### **Inputs (`@param`)**

Parameters are defined using standard `@param` tags, augmented with special metadata in brackets `[...]`. You can group related inputs in the UI using an `@folder` tag.

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
 * @returns {{type: THREE.Mesh, name: "Lofted Surface", style: "filledThick", color: "Ocean"}}
 * @returns {{type: THREE.Line, name: "Profile Viz", style: "wireframe", color: "Sunset", lineStyle: "dashed"}}
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

The ScriptBridgeJS is built with a modern, performant, and modular architecture.

### **Core Technologies**

  * **React (with Vite):** The foundation of our application, providing a fast, component-based UI framework and a blazing-fast development environment.
  * **Three.js:** The definitive library for 3D graphics in the browser. We use it for all rendering and geometry calculations.
  * **@react-three/fiber:** A React renderer for Three.js. It allows us to build our 3D scene declaratively with reusable components.
  * **@react-three/drei:** A collection of essential helpers for React Three Fiber, providing ready-to-use components for controls (`OrbitControls`) and gizmos (`TransformControls`).
  * **Leva:** A powerful GUI for React. We use it to automatically generate the parameter control panel based on the parsed JSDoc comments.
  * **Acorn:** A lightweight and fast JavaScript parser. It's the engine that reads the user's code as a string and converts it into an Abstract Syntax Tree (AST), which we then traverse to find the JSDoc comments and function body.

### **Application Architecture**

  * **`App.jsx` (The Conductor):** The main component that orchestrates the entire application, managing the state of the code string, the parsed script, and any errors.
  * **`/lib/parser.js` (The Brains):** This is the most critical piece of the application's logic. It uses Acorn to generate an AST and then traverses this tree to meticulously extract JSDoc tags and their metadata, returning a structured JSON object.
  * **`/components/` (The Building Blocks):** A collection of React components responsible for the UI, including the `CodeEditor`, the `GeometryRenderer` that executes the user's function and renders the output, and the `GizmoController` for interactive 3D inputs.
  * **`/lib/materials.js` (The Stylist):** This utility contains the logic for applying the predefined visual styles from the JSDoc metadata to the Three.js geometry.

-----

## 🚀 Getting Started

To run the ScriptBridgeJS on your local machine, follow these simple steps:

1.  **Clone the repository:**

    ```bash
    git clone <repository-url>
    ```

2.  **Install dependencies:**

    ```bash
    npm install
    ```

3.  **Run the development server:**

    ```bash
    npm run dev
    ```

The application will now be running, typically at `http://localhost:5173`. You can start by pasting code from the `/js_examples/` directory to see the ScriptBridgeJS in action\!

