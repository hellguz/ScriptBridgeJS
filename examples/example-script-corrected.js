/**
 * Generates a three-tiered cylindrical wireframe structure.
 * @folder Parameters
 * @param {number} divisionCount - Number of points on the circle. [default=21, min=3, max=50, step=1]
 * @param {number} circleRadius - Radius of the base circle. [default=100, min=10, max=200, step=1]
 * @param {number} layerHeight - Vertical distance between each layer. [default=96, min=0, max=200, step=1]
 * @param {number} scaleLayer1 - Scale factor for the bottom layer. [default=0.8, min=0.1, max=2.0, step=0.1]
 * @param {number} scaleLayer2 - Scale factor for the middle layer. [default=0.6, min=0.1, max=2.0, step=0.1]
 * @param {number} scaleLayer3 - Scale factor for the top layer. [default=0.8, min=0.1, max=2.0, step=0.1]
 * @param {number} shiftAmount - How many indices to shift points on each layer. [default=1, min=0, max=10, step=1]
 * @returns {{type: THREE.LineSegments, name: "Wireframe", style: "wireframe", color: "Ocean"}}
 */
function generateWireStructure(divisionCount, circleRadius, layerHeight, scaleLayer1, scaleLayer2, scaleLayer3, shiftAmount) {
    // A helper function to perform a circular shift on an array
    const shiftArray = (arr, shift) => {
        const len = arr.length;
        const normalizedShift = ((shift % len) + len) % len;
        if (normalizedShift === 0) return [...arr];
        return [...arr.slice(len - normalizedShift), ...arr.slice(0, len - normalizedShift)];
    };

    // 1. Generate base points on a circle
    const basePoints = [];
    for (let i = 0; i < divisionCount; i++) {
        const angle = (i / divisionCount) * 2 * Math.PI;
        const x = circleRadius * Math.cos(angle);
        const y = circleRadius * Math.sin(angle);
        basePoints.push(new THREE.Vector3(x, y, 0));
    }

    const allLineVertices = [];
    let currentPoints = basePoints.map(p => p.clone());
    let previousLayerPointsPostShift = null;

    const scaleFactors = [scaleLayer1, scaleLayer2, scaleLayer3];

    // 2. Sequentially generate each layer
    for (let i = 0; i < 3; i++) {
        // Move points up
        currentPoints.forEach(p => p.z += layerHeight);

        // Scale points from the layer's center
        const layerZ = currentPoints[0].z;
        const center = new THREE.Vector3(0, 0, layerZ);
        currentPoints.forEach(p => {
            p.sub(center).multiplyScalar(scaleFactors[i]).add(center);
        });
        const pointsPreShift = currentPoints.map(p => p.clone());

        // Shift the points
        const pointsPostShift = shiftArray(pointsPreShift, shiftAmount);

        // 3. Create lines based on Grasshopper script logic
        // Create lines connecting the pre-shift and post-shift points on the first layer
        if (i === 0) {
            for (let j = 0; j < divisionCount; j++) {
                allLineVertices.push(pointsPreShift[j], pointsPostShift[j]);
            }
        }

        // Create lines connecting this layer to the previous one
        if (previousLayerPointsPostShift) {
            for (let j = 0; j < divisionCount; j++) {
                allLineVertices.push(previousLayerPointsPostShift[j], pointsPostShift[j]);
            }
        }
        
        // Prepare for the next iteration
        previousLayerPointsPostShift = pointsPostShift;
        currentPoints = pointsPostShift.map(p => p.clone());
    }


    // 4. Create the final Three.js object
    if (allLineVertices.length === 0) {
        return { "Wireframe": new THREE.LineSegments() };
    }
    
    const geometry = new THREE.BufferGeometry().setFromPoints(allLineVertices);
    // The material will be applied by the renderer based on JSDoc, so a basic one here is fine.
    const material = new THREE.LineBasicMaterial();
    const lines = new THREE.LineSegments(geometry, material);

    return {
        "Wireframe": lines
    };
}