# Grasshopper Component Documentation
An automatically generated list of all available components, their parameters, and descriptions.

***

## Category: Caribou > About

### About Caribou
**Nickname:** `AB`
**Description:** Displays information about this plugin, including documentation sources and current/latest versions.
**GUID:** `4ccad95b-ec0d-4559-a26f-07dc5dc18a32`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`cV` (Text):** The version of the installed plugin.
- **`lV` (Text):** The latest released version of the installed plugin.
- **`cL` (Text):** The list of changes to date of the installed plugin.
- **`A` (Text):** Information about this plugin.
- **`U` (Text):** A link to this plugin's documentation.

***

## Category: Caribou > Parse

### Extract Buildings
**Nickname:** `Buildings`
**Description:** Load and parse node (e.g. point) data from an OSM file based on its metadata
**GUID:** `d6b1b021-2b5d-4fa6-9cf2-eb368dd632a1`

**Inputs:**
- **`FP` (Text):** The path to XML file(s) downloaded from Open Street map
- **`OF` (Text):** A list of features and subfeatures to extract from the OSM file, in a 'key=value' format separated by newlines or commas
- **`OH?` (Boolean):** If true, only outputs buildings with height data. If false, only outputs buildings without height data.

**Outputs:**
- **`B` (Brep):** Buildings as extrusions from associated way geometries
- **`T` (Text):** The metadata attached to each particular node
- **`R` (Text):** The name, description, and number of items found of each specified feature
- **`B` (Rectangle):** The boundary extends of the OSM file(s)

### Extract Nodes
**Nickname:** `Nodes`
**Description:** Load and parse node (e.g. point) data from an OSM file based on its metadata
**GUID:** `912176ea-061e-2b5b-9642-8417372d6371`

**Inputs:**
- **`FP` (Text):** The path to XML file(s) downloaded from Open Street map
- **`OF` (Text):** A list of features and subfeatures to extract from the OSM file, in a 'key=value' format separated by newlines or commas

**Outputs:**
- **`N` (Point):** Nodes; e.g. points that describe a location of interest
- **`T` (Text):** The metadata attached to each particular node
- **`R` (Text):** The name, description, and number of items found of each specified feature
- **`B` (Rectangle):** The boundary extends of the OSM file(s)

### Extract Ways
**Nickname:** `Ways`
**Description:** Load and parse way (e.g. polyline) data from an OSM file based on its metadata
**GUID:** `f677053e-0416-433b-9a8e-ce3124998b7d`

**Inputs:**
- **`FP` (Text):** The path to XML file(s) downloaded from Open Street map
- **`OF` (Text):** A list of features and subfeatures to extract from the OSM file, in a 'key=value' format separated by newlines or commas

**Outputs:**
- **`W` (Curve):** Ways; e.g. nodes linked in a linear order via a Polyline
- **`T` (Text):** The metadata attached to each particular node
- **`R` (Text):** The name, description, and number of items found of each specified feature
- **`B` (Rectangle):** The boundary extends of the OSM file(s)

***

## Category: Caribou > Select

### Filter Tags
**Nickname:** `OSM Filter`
**Description:** Provides a graphical interface of OSM features to filter the results of an Extract component based on common tags.
**GUID:** `0e86143a-d051-488b-bf65-b91087bce4ac`

**Inputs:**
- **`I` (Generic Data):** Nodes, Ways, or Building outputs from one of the Extract components
- **`R` (Text):** The Tags output from the same extract component whose nodes/ways/buildings you are providing as Items

**Outputs:**
- **`I` (Geometry):** The geometry that possess the specified tags
- **`T` (Text):** The metadata attached to each particular item
- **`R` (Text):** The name, count, and description of each feature

### Specify Features
**Nickname:** `OSM Specify`
**Description:** Provides a graphical interface to specify a list of OSM features that the Extract components will then find.
**GUID:** `cc8d82ba-f381-46ee-8014-7e2d1bff824c`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`OF` (Text):** A list of OSM features and subfeatures

***

## Category: Curve > Analysis

### Closed
**Nickname:** `Cls`
**Description:** Test if a curve is closed or periodic.
**GUID:** `323f3245-af49-4489-8677-7a2c73664077`

**Inputs:**
- **`C` (Curve):** Curve to evaluate

**Outputs:**
- **`C` (Boolean):** True if curve is closed or periodic
- **`P` (Boolean):** True if curve is periodic

### Control Points
**Nickname:** `CP`
**Description:** Extract the nurbs control points and knots of a curve.
**GUID:** `424eb433-2b3a-4859-beaf-804d8af0afd7`

**Inputs:**
- **`C` (Curve):** Curve to evaluate

**Outputs:**
- **`P` (Point):** Control points of the Nurbs-form.
- **`W` (Number):** Weights of control points.
- **`K` (Number):** Knot vector of Nurbs-form.

### Control Polygon
**Nickname:** `CPoly`
**Description:** Extract the nurbs control polygon of a curve.
**GUID:** `66d2a68e-2f1d-43d2-a53b-c6a4d17e627b`

**Inputs:**
- **`C` (Curve):** Curve to evaluate

**Outputs:**
- **`C` (Curve):** Control polygon curve for input curve adjusted for periodicity.
- **`P` (Point):** Control polygon points.

### Curvature
**Nickname:** `Curvature`
**Description:** Evaluate the curvature of a curve at a specified parameter.
**GUID:** `aaa665bd-fd6e-4ccb-8d2c-c5b33072125d`

**Inputs:**
- **`C` (Curve):** Curve to evaluate
- **`t` (Number):** Parameter on curve domain to evaluate

**Outputs:**
- **`P` (Point):** Point on curve at {t}
- **`K` (Vector):** Curvature vector at {t}
- **`C` (Curve):** Curvature circle at {t}

### Curvature Graph
**Nickname:** `CrvGraph`
**Description:** Draws Rhino Curvature Graphs.
**GUID:** `7376fe41-74ec-497e-b367-1ffe5072608b`

**Inputs:**
- **`C` (Curve):** Curve for Curvature graph display
- **`D` (Integer):** Sampling density of the Graph
- **`S` (Integer):** Scale of graph

**Outputs:**
- *This component has no outputs.*

### Curve Closest Point
**Nickname:** `Crv CP`
**Description:** Find the closest point on a curve.
**GUID:** `2dc44b22-b1dd-460a-a704-6462d6e91096`

**Inputs:**
- **`P` (Point):** Point to project onto curve
- **`C` (Curve):** Curve to project onto

**Outputs:**
- **`P` (Point):** Point on the curve closest to the base point
- **`t` (Number):** Parameter on curve domain of closest point
- **`D` (Number):** Distance between base point and curve

### Curve Depth
**Nickname:** `Depth`
**Description:** Measure the depth of a curve.
**GUID:** `a583f722-240a-4fc9-aa1d-021720a4516a`

**Inputs:**
- **`C` (Curve):** Base curve
- **`Min` (Number):** Minimum depth
- **`Max` (Number):** Maximum depth

**Outputs:**
- **`tMin` (Number):** Parameter along curve where minimum depth occurred.
- **`dMin` (Number):** Minimum depth of curve.
- **`tMax` (Number):** Parameter along curve where maximum depth occurred.
- **`dMax` (Number):** Maximum depth of curve.

### Curve Domain
**Nickname:** `CrvDom`
**Description:** Measure and set the curve domain
**GUID:** `ccfd6ba8-ecb1-44df-a47e-08126a653c51`

**Inputs:**
- **`C` (Curve):** Curve to measure/modify
- **`D` (Domain):** Optional domain, if omitted the curve will not be modified.

**Outputs:**
- **`C` (Curve):** Curve with new domain.
- **`D` (Domain):** Domain of original curve.

### Curve Frame
**Nickname:** `Frame`
**Description:** Get the curvature frame of a curve at a specified parameter.
**GUID:** `6b2a5853-07aa-4329-ba84-0a5d46b51dbd`

**Inputs:**
- **`C` (Curve):** Curve to evaluate
- **`t` (Number):** Parameter on curve domain to evaluate

**Outputs:**
- **`F` (Plane):** Curve frame at {t}

### Curve Middle
**Nickname:** `MidPt`
**Description:** Get the point in the middle of a curve
**GUID:** `ccc7b468-e743-4049-891f-299432545898`

**Inputs:**
- **`C` (Curve):** Curve for mid-point.

**Outputs:**
- **`M` (Point):** Point in the middle of the curve

### Curve Nearest Object
**Nickname:** `CrvNear`
**Description:** Find the object nearest to a curve.
**GUID:** `748f214a-bc64-4556-9da5-4fa59a30c5c7`

**Inputs:**
- **`C` (Curve):** Curve to search from
- **`G` (Geometry):** Shapes to search

**Outputs:**
- **`A` (Point):** Point on curve closest to nearest shape
- **`B` (Point):** Point on nearest shape closest to curve
- **`I` (Integer):** Index of nearest shape

### Curve Proximity
**Nickname:** `CrvProx`
**Description:** Find the pair of closest points between two curves.
**GUID:** `6b7ba278-5c9d-42f1-a61d-6209cbd44907`

**Inputs:**
- **`A` (Curve):** First curve
- **`B` (Curve):** Second curve

**Outputs:**
- **`A` (Point):** Point on curve A closest to curve B
- **`B` (Point):** Point on curve B closest to curve A
- **`D` (Number):** Smallest distance between two curves

### Curve Side
**Nickname:** `Side`
**Description:** Find on which side of a curve a point exists
**GUID:** `bb2e13da-09ca-43fd-bef8-8d71f3653af9`

**Inputs:**
- **`C` (Curve):** Base curve
- **`P` (Point):** Point to measure.
- **`Pl` (Plane):** Optional plane to measure in. If omitted, the curve plane will be used.

**Outputs:**
- **`S` (Integer):** Side of curve on which point was found (-1=Left, 0=Coincident, +1=Right).
- **`L` (Boolean):** Boolean indicating whether a point is to the left of the curve.
- **`R` (Boolean):** Boolean indicating whether a point is to the right of the curve.

### Deconstruct Arc
**Nickname:** `DArc`
**Description:** Retrieve the base plane, radius and angle domain of an arc.
**GUID:** `23862862-049a-40be-b558-2418aacbd916`

**Inputs:**
- **`A` (Arc):** Arc or Circle to deconstruct

**Outputs:**
- **`B` (Plane):** Base plane of arc or circle
- **`R` (Number):** Radius of arc or circle
- **`A` (Domain):** Angle domain (in radians) of arc

### Deconstuct Rectangle
**Nickname:** `DRec`
**Description:** Retrieve the base plane and side intervals of a rectangle.
**GUID:** `e5c33a79-53d5-4f2b-9a97-d3d45c780edc`

**Inputs:**
- **`R` (Rectangle):** Rectangle to deconstruct

**Outputs:**
- **`B` (Plane):** Base plane of rectangle
- **`X` (Domain):** Size interval along base plane X axis
- **`Y` (Domain):** Size interval along base plane Y axis

### Derivatives
**Nickname:** `CDiv`
**Description:** Evaluate the derivatives of a curve at a specified parameter.
**GUID:** `ab14760f-87a6-462e-b481-4a2c26a9a0d7`

**Inputs:**
- **`C` (Curve):** Curve to evaluate
- **`t` (Number):** Parameter on curve domain to evaluate

**Outputs:**
- **`P` (Point):** Point on curve at {t}
- **`1` (Vector):** First curve derivative at t (Velocity)

### Discontinuity
**Nickname:** `Disc`
**Description:** Find all discontinuities along a curve.
**GUID:** `269eaa85-9997-4d77-a9ba-4c58cb45c9d3`

**Inputs:**
- **`C` (Curve):** Curve to analyze
- **`L` (Integer):** Level of discontinuity to test for (1=C1, 2=C2, 3=Cinfinite)

**Outputs:**
- **`P` (Point):** Points at discontinuities
- **`t` (Number):** Curve parameters at discontinuities

### End Points
**Nickname:** `End`
**Description:** Extract the end points of a curve.
**GUID:** `11bbd48b-bb0a-4f1b-8167-fa297590390d`

**Inputs:**
- **`C` (Curve):** Curve to evaluate

**Outputs:**
- **`S` (Point):** Curve start point
- **`E` (Point):** Curve end point

### Evaluate Curve
**Nickname:** `Eval`
**Description:** Evaluate a curve at the specified parameter.
**GUID:** `fc6979e4-7e91-4508-8e05-37c680779751`

**Inputs:**
- **`C` (Curve):** Curve to evaluate
- **`t` (Number):** Parameter on curve domain to evaluate

**Outputs:**
- **`P` (Point):** Point on the curve at {t}
- **`T` (Vector):** Tangent vector at {t}
- **`A` (Number):** Angle (in Radians) of incoming vs. outgoing curve at {t}

### Evaluate Length
**Nickname:** `Eval`
**Description:** Evaluate a curve at a certain factor along its length. Length factors can be supplied both in curve units and normalized units. Change the [N] parameter to toggle between the two modes.
**GUID:** `6b021f56-b194-4210-b9a1-6cef3b7d0848`

**Inputs:**
- **`C` (Curve):** Curve to evaluate
- **`L` (Number):** Length factor for curve evaluation
- **`N` (Boolean):** If True, the Length factor is normalized (0.0 ~ 1.0)

**Outputs:**
- **`P` (Point):** Point at the specified length
- **`T` (Vector):** Tangent vector at the specified length
- **`t` (Number):** Curve parameter at the specified length

### Extremes
**Nickname:** `X-tremez`
**Description:** Find the extremes (highest and lowest points) on a curve.
**GUID:** `ebd6c758-19ae-4d74-aed7-b8a0392ff743`

**Inputs:**
- **`C` (Curve):** Base curve
- **`P` (Plane):** Plane for extreme direction.

**Outputs:**
- **`H` (Point):** Highest point on curve.
- **`L` (Point):** Lowest point on curve.

### Horizontal Frame
**Nickname:** `HFrame`
**Description:** Get a horizontally aligned frame along a curve at a specified parameter.
**GUID:** `c048ad76-ffcd-43b1-a007-4dd1b2373326`

**Inputs:**
- **`C` (Curve):** Curve to evaluate
- **`t` (Number):** Parameter on curve domain to evaluate

**Outputs:**
- **`F` (Plane):** Horizontal curve frame at {t}

### Length
**Nickname:** `Len`
**Description:** Measure the length of a curve.
**GUID:** `c75b62fa-0a33-4da7-a5bd-03fd0068fd93`

**Inputs:**
- **`C` (Curve):** Curve to measure

**Outputs:**
- **`L` (Number):** Curve length

### Length Domain
**Nickname:** `LenD`
**Description:** Measure the length of a curve subdomain.
**GUID:** `188edd02-14a9-4828-a521-34995b0d1e4a`

**Inputs:**
- **`C` (Curve):** Curve to measure
- **`D` (Domain):** Subdomain of curve to measure

**Outputs:**
- **`L` (Number):** Curve length on sub domain

### Length Parameter
**Nickname:** `LenP`
**Description:** Measure the length of a curve to and from a parameter.
**GUID:** `a1c16251-74f0-400f-9e7c-5e379d739963`

**Inputs:**
- **`C` (Curve):** Curve to measure
- **`P` (Number):** Parameter along curve

**Outputs:**
- **`L-` (Number):** Curve length from start to parameter
- **`L+` (Number):** Curve length from parameter to end

### Perp Frame
**Nickname:** `PFrame`
**Description:** Solve the perpendicular (zero-twisting) frame at a specified curve parameter.
**GUID:** `69f3e5ee-4770-44b3-8851-ae10ae555398`

**Inputs:**
- **`C` (Curve):** Curve to evaluate
- **`t` (Number):** Parameter on curve domain to evaluate

**Outputs:**
- **`F` (Plane):** Perpendicular curve frame at {t}

### Planar
**Nickname:** `Planar`
**Description:** Test a curve for planarity.
**GUID:** `5816ec9c-f170-4c59-ac44-364401ff84cd`

**Inputs:**
- **`C` (Curve):** Curve to evaluate

**Outputs:**
- **`p` (Boolean):** Planarity of curve
- **`P` (Plane):** Curve plane
- **`D` (Number):** Deviation from curve plane

### Point In Curve
**Nickname:** `InCurve`
**Description:** Test a point for closed curve containment.
**GUID:** `a72b0bd3-c7a7-458e-875d-09ae1624638c`

**Inputs:**
- **`P` (Point):** Point for region inclusion test
- **`C` (Curve):** Boundary region (closed curves only)

**Outputs:**
- **`R` (Integer):** Point/Region relationship (0 = outside, 1 = coincident, 2 = inside)
- **`P'` (Point):** Point projected on region plane.

### Point in Curves
**Nickname:** `InCurves`
**Description:** Test a point for multiple closed curve containment.
**GUID:** `0b04e8b9-00d7-47a7-95c3-0d51e654fe88`

**Inputs:**
- **`P` (Point):** Point for inclusion test
- **`C` (Curve):** Boundary regions (closed curves only)

**Outputs:**
- **`R` (Integer):** Point/Region relationship (0 = outside, 1 = coincident, 2 = inside)
- **`I` (Integer):** Index of first region that contains the point
- **`P'` (Point):** Point projected on region plane.

### Polygon Center
**Nickname:** `PCen`
**Description:** Find the center point (average) for a polyline.
**GUID:** `59e94548-cefd-4774-b3de-48142fc783fb`

**Inputs:**
- **`P` (Curve):** Polyline to average.

**Outputs:**
- **`Cv` (Point):** Average of polyline vertices.
- **`Ce` (Point):** Average of polyline edges
- **`Ca` (Point):** Area centroid of polyline shape

### Segment Lengths
**Nickname:** `LenSeg`
**Description:** Finds the shortest and longest segments of a curve.
**GUID:** `f88a6cd9-1035-4361-b896-4f2dfe79272d`

**Inputs:**
- **`C` (Curve):** Curve to measure

**Outputs:**
- **`Sl` (Number):** Length of shortest segment
- **`Sd` (Domain):** Curve domain of shortest segment
- **`Ll` (Number):** Length of longest segment
- **`Ld` (Domain):** Curve domain of longest segment

### Torsion
**Nickname:** `Torsion`
**Description:** Evaluate the torsion of a curve at a specified parameter.
**GUID:** `dbe9fce4-b6b3-465f-9615-34833c4763bd`

**Inputs:**
- **`C` (Curve):** Curve to evaluate
- **`t` (Number):** Parameter on curve domain to evaluate

**Outputs:**
- **`P` (Point):** Point on curve at {t}
- **`T` (Number):** Curvature torsion at {t}

***

## Category: Curve > Division

### Contour
**Nickname:** `Contour`
**Description:** Create a set of Curve contours
**GUID:** `88cff285-7f5e-41b3-96d5-9588ff9a52b1`

**Inputs:**
- **`C` (Curve):** Curve to contour
- **`P` (Point):** Contour start point
- **`N` (Vector):** Contour normal direction
- **`D` (Number):** Distance between contours

**Outputs:**
- **`C` (Point):** Resulting contour points (grouped by section)
- **`t` (Number):** Curve parameters for all contour points

### Contour (ex)
**Nickname:** `Contour`
**Description:** Create a set of Curve contours
**GUID:** `3e7e4827-6edd-4e10-93ac-cc234414d2b9`

**Inputs:**
- **`C` (Curve):** Curve to contour
- **`P` (Plane):** Base plane for contours
- **`O` (Number):** Contour offsets from base plane (if omitted, you must specify distances instead)
- **`D` (Number):** Distances between contours (if omitted, you must specify offset instead)

**Outputs:**
- **`C` (Point):** Resulting contour points (grouped by section)
- **`t` (Number):** Curve parameters for all contour points

### Curve Frames
**Nickname:** `Frames`
**Description:** Generate a number of equally spaced curve frames.
**GUID:** `0e94542a-2e46-4793-9f98-2200b06b28f4`

**Inputs:**
- **`C` (Curve):** Curve to divide
- **`N` (Integer):** Number of segments

**Outputs:**
- **`F` (Plane):** Curve frames
- **`t` (Number):** Parameter values at division points

### Dash Pattern
**Nickname:** `Dash`
**Description:** Convert a curve to a dash pattern.
**GUID:** `95866bbe-648e-4e2b-a97c-7d04679e94e0`

**Inputs:**
- **`C` (Curve):** Curve to dash
- **`Pt` (Number):** An collection of dash and gap lengths.

**Outputs:**
- **`D` (Curve):** Dash segments
- **`G` (Curve):** Gap segments

### Divide By Deviation
**Nickname:** `DivideDev`
**Description:** Divide a curve into segments with equal deviation
**GUID:** `6e9c0577-ae4a-4b21-8880-0ec3daf3eb4d`

**Inputs:**
- **`C` (Curve):** Curve to divide
- **`N` (Integer):** Number of segments

**Outputs:**
- **`P` (Point):** Division points
- **`T` (Vector):** Tangent vectors at division points
- **`t` (Number):** Parameter values at division points
- **`d` (Number):** Maximum deviation from segment to curve

### Divide Curve
**Nickname:** `Divide`
**Description:** Divide a curve into equal length segments
**GUID:** `2162e72e-72fc-4bf8-9459-d4d82fa8aa14`

**Inputs:**
- **`C` (Curve):** Curve to divide
- **`N` (Integer):** Number of segments
- **`K` (Boolean):** Split segments at kinks

**Outputs:**
- **`P` (Point):** Division points
- **`T` (Vector):** Tangent vectors at division points
- **`t` (Number):** Parameter values at division points

### Divide Distance
**Nickname:** `DivDist`
**Description:** Divide a curve with a preset distance between points
**GUID:** `1e531c08-9c80-46d6-8850-1b50d1dae69f`

**Inputs:**
- **`C` (Curve):** Curve to divide
- **`D` (Number):** Distance between points

**Outputs:**
- **`P` (Point):** Division points
- **`T` (Vector):** Tangent vectors at division points
- **`t` (Number):** Parameter values at division points

### Divide Length
**Nickname:** `DivLength`
**Description:** Divide a curve into segments with a preset length
**GUID:** `fdc466a9-d3b8-4056-852a-09dba0f74aca`

**Inputs:**
- **`C` (Curve):** Curve to divide
- **`L` (Number):** Length of segments

**Outputs:**
- **`P` (Point):** Division points
- **`T` (Vector):** Tangent vectors at division points
- **`t` (Number):** Parameter values at division points

### Horizontal Frames
**Nickname:** `HFrames`
**Description:** Generate a number of equally spaced, horizontally aligned curve frames.
**GUID:** `8d058945-ce47-4e7c-82af-3269295d7890`

**Inputs:**
- **`C` (Curve):** Curve to divide
- **`N` (Integer):** Number of segments

**Outputs:**
- **`F` (Plane):** Curvature frames
- **`t` (Number):** Parameter values at division points

### Perp Frames
**Nickname:** `PFrames`
**Description:** Generate a number of equally spaced, perpendicular frames along a curve.
**GUID:** `983c7600-980c-44da-bc53-c804067f667f`

**Inputs:**
- **`C` (Curve):** Curve to divide
- **`N` (Integer):** Number of segments
- **`A` (Boolean):** Align the frames

**Outputs:**
- **`F` (Plane):** Curve frames
- **`t` (Number):** Parameter values at frame points

### Shatter
**Nickname:** `Shatter`
**Description:** Shatter a curve into segments.
**GUID:** `2ad2a4d4-3de1-42f6-a4b8-f71835f35710`

**Inputs:**
- **`C` (Curve):** Curve to trim
- **`t` (Number):** Parameters to split at

**Outputs:**
- **`S` (Curve):** Shattered remains

***

## Category: Curve > Primitive

### Arc
**Nickname:** `Arc`
**Description:** Create an arc defined by base plane, radius and angle domain.
**GUID:** `bb59bffc-f54c-4682-9778-f6c3fe74fce3`

**Inputs:**
- **`P` (Plane):** Base plane of arc
- **`R` (Number):** Radius of arc
- **`A` (Domain):** Angle domain in radians

**Outputs:**
- **`A` (Arc):** Resulting arc
- **`L` (Number):** Arc length

### Arc 3Pt
**Nickname:** `Arc`
**Description:** Create an arc through three points.
**GUID:** `9fa1b081-b1c7-4a12-a163-0aa8da9ff6c4`

**Inputs:**
- **`A` (Point):** Start point of arc
- **`B` (Point):** Point on arc interior
- **`C` (Point):** End point of arc

**Outputs:**
- **`A` (Geometry):** Resulting arc
- **`P` (Plane):** Arc plane
- **`R` (Number):** Arc radius

### Arc SED
**Nickname:** `Arc`
**Description:** Create an arc defined by start point, end point and a tangent vector.
**GUID:** `9d2583dd-6cf5-497c-8c40-c9a290598396`

**Inputs:**
- **`S` (Point):** Start point of arc
- **`E` (Point):** End point of arc
- **`D` (Vector):** Direction (tangent) at start

**Outputs:**
- **`A` (Geometry):** Resulting arc
- **`P` (Plane):** Arc plane
- **`R` (Number):** Arc radius

### BiArc
**Nickname:** `BiArc`
**Description:** Create a bi-arc based on endpoints and tangents.
**GUID:** `75f4b0fd-9721-47b1-99e7-9c098b342e67`

**Inputs:**
- **`S` (Point):** Start point of bi-arc.
- **`Ts` (Vector):** Tangent vector at start of bi-arc.
- **`E` (Point):** End point of bi-arc.
- **`Te` (Vector):** Tangent vector at end of bi-arc.
- **`R` (Number):** Ratio of bi-arc segment weight

**Outputs:**
- **`A1` (Arc):** First segment of bi-arc curve
- **`A2` (Arc):** Second segment of bi-arc curve
- **`B` (Curve):** Resulting bi-arc.

### Circle
**Nickname:** `Cir`
**Description:** Create a circle defined by base plane and radius.
**GUID:** `807b86e3-be8d-4970-92b5-f8cdcb45b06b`

**Inputs:**
- **`P` (Plane):** Base plane of circle
- **`R` (Number):** Radius of circle

**Outputs:**
- **`C` (Circle):** Resulting circle

### Circle 3Pt
**Nickname:** `Circle`
**Description:** Create a circle defined by three points.
**GUID:** `47886835-e3ff-4516-a3ed-1b419f055464`

**Inputs:**
- **`A` (Point):** First point on circle
- **`B` (Point):** Second point on circle
- **`C` (Point):** Third point on circle

**Outputs:**
- **`C` (Circle):** Resulting circle
- **`P` (Plane):** Circle plane
- **`R` (Number):** Circle radius

### Circle CNR
**Nickname:** `Circle`
**Description:** Create a circle defined by center, normal and radius.
**GUID:** `d114323a-e6ee-4164-946b-e4ca0ce15efa`

**Inputs:**
- **`C` (Point):** Center point
- **`N` (Vector):** Normal vector of circle plane
- **`R` (Number):** Radius of circle

**Outputs:**
- **`C` (Circle):** Resulting circle

### Circle Fit
**Nickname:** `FCircle`
**Description:** Fit a circle to a collection of points.
**GUID:** `be52336f-a2e1-43b1-b5f5-178ba489508a`

**Inputs:**
- **`P` (Point):** Points to fit

**Outputs:**
- **`C` (Circle):** Resulting circle
- **`R` (Number):** Circle radius
- **`D` (Number):** Maximum distance between circle and points

### Circle TanTan
**Nickname:** `CircleTT`
**Description:** Create a circle tangent to two curves.
**GUID:** `50b204ef-d3de-41bb-a006-02fba2d3f709`

**Inputs:**
- **`A` (Curve):** First curve for tangency constraint
- **`B` (Curve):** Second curve for tangency constraint
- **`P` (Point):** Circle center point guide

**Outputs:**
- **`C` (Circle):** Resulting circle

### Circle TanTanTan
**Nickname:** `CircleTTT`
**Description:** Create a circle tangent to three curves.
**GUID:** `dcaa922d-5491-4826-9a22-5adefa139f43`

**Inputs:**
- **`A` (Curve):** First curve for tangency constraint
- **`B` (Curve):** Second curve for tangency constraint
- **`C` (Curve):** Third curve for tangency constraint
- **`P` (Point):** Circle center point guide

**Outputs:**
- **`C` (Circle):** Resulting circle

### Ellipse
**Nickname:** `Ellipse`
**Description:** Create an ellipse defined by base plane and two radii.
**GUID:** `46b5564d-d3eb-4bf1-ae16-15ed132cfd88`

**Inputs:**
- **`P` (Plane):** Base plane of ellipse
- **`R1` (Number):** Radius in {x} direction
- **`R2` (Number):** Radius in {y} direction

**Outputs:**
- **`E` (Curve):** Resulting ellipse
- **`F1` (Point):** First focus point
- **`F2` (Point):** Second focus point

### Fit Line
**Nickname:** `FLine`
**Description:** Fit a line to a collection of points.
**GUID:** `1f798a28-9de6-47b5-8201-cac57256b777`

**Inputs:**
- **`P` (Point):** Points to fit

**Outputs:**
- **`L` (Line):** Line segment

### InCircle
**Nickname:** `InCircle`
**Description:** Create the incircle of a triangle.
**GUID:** `28b1c4d4-ab1c-4309-accd-1b7a954ed948`

**Inputs:**
- **`A` (Point):** First corner of triangle
- **`B` (Point):** Second corner of triangle
- **`C` (Point):** Third corner of triangle

**Outputs:**
- **`C` (Circle):** Resulting circle
- **`P` (Plane):** Circle plane
- **`R` (Number):** Circle radius

### InEllipse
**Nickname:** `InEllipse`
**Description:** Create the inscribed ellipse (Steiner ellipse) of a triangle.
**GUID:** `679a9c6a-ab97-4c20-b02c-680f9a9a1a44`

**Inputs:**
- **`A` (Point):** First corner of triangle
- **`B` (Point):** Second corner of triangle
- **`C` (Point):** Third corner of triangle

**Outputs:**
- **`E` (Curve):** Resulting ellipse
- **`P` (Plane):** Ellipse plane

### Line
**Nickname:** `Ln`
**Description:** Create a line between two points.
**GUID:** `4c4e56eb-2f04-43f9-95a3-cc46a14f495a`

**Inputs:**
- **`A` (Point):** Line start point
- **`B` (Point):** Line end point

**Outputs:**
- **`L` (Line):** Line segment

### Line 2Plane
**Nickname:** `Ln2Pl`
**Description:** Create a line between two planes.
**GUID:** `510c4a63-b9bf-42e7-9d07-9d71290264da`

**Inputs:**
- **`L` (Line):** Guide line.
- **`A` (Plane):** First plane to intersect with the guide.
- **`B` (Plane):** Second plane to intersect with the guide.

**Outputs:**
- **`L` (Line):** Line segment between A and B

### Line 4Pt
**Nickname:** `Ln4Pt`
**Description:** Create a line from four points.
**GUID:** `b9fde5fa-d654-4306-8ee1-6b69e6757604`

**Inputs:**
- **`L` (Line):** Guide line.
- **`A` (Point):** First point to project onto the guide.
- **`B` (Point):** Second point to project onto the guide.

**Outputs:**
- **`L` (Line):** Line segment between A and B

### Line SDL
**Nickname:** `Line`
**Description:** Create a line segment defined by start point, tangent and length.}
**GUID:** `4c619bc9-39fd-4717-82a6-1e07ea237bbe`

**Inputs:**
- **`S` (Point):** Line start point
- **`D` (Vector):** Line tangent (direction)
- **`L` (Number):** Line length

**Outputs:**
- **`L` (Line):** Line segment

### Modified Arc
**Nickname:** `ModArc`
**Description:** Create an arc based on another arc.
**GUID:** `9d8dec9c-3fd1-481c-9c3d-75ea5e15eb1a`

**Inputs:**
- **`A` (Arc):** Base arc
- **`R` (Number):** Optional new radius
- **`A` (Domain):** Optional new angle domain

**Outputs:**
- **`A` (Arc):** Modified arc

### Polygon
**Nickname:** `Polygon`
**Description:** Create a polygon with optional round edges.
**GUID:** `845527a6-5cea-4ae9-a667-96ae1667a4e8`

**Inputs:**
- **`P` (Plane):** Polygon base plane
- **`R` (Number):** Radius of polygon (distance from center to tip).
- **`S` (Integer):** Number of segments
- **`Rf` (Number):** Polygon corner fillet radius

**Outputs:**
- **`P` (Curve):** Polygon
- **`L` (Number):** Length of polygon curve

### Polygon Edge
**Nickname:** `PolEdge`
**Description:** Create a polygon from a single edge.
**GUID:** `f4568ce6-aade-4511-8f32-f27d8a6bf9e9`

**Inputs:**
- **`E0` (Point):** Start point of polygon edge.
- **`E1` (Point):** End point of polygon edge.
- **`P` (Point):** Point on polygon plane.
- **`S` (Integer):** Number of segments

**Outputs:**
- **`P` (Curve):** Polygon
- **`C` (Point):** Centre of polygon
- **`Rc` (Number):** Distance from centre to polygon corner.
- **`Rc` (Number):** Distance from centre to edge mid-points.

### Rectangle
**Nickname:** `Rectangle`
**Description:** Create a rectangle on a plane
**GUID:** `d93100b6-d50b-40b2-831a-814659dc38e3`

**Inputs:**
- **`P` (Plane):** Rectangle base plane
- **`X` (Domain):** Dimensions of rectangle in plane X direction.
- **`Y` (Domain):** Dimensions of rectangle in plane Y direction.
- **`R` (Number):** Rectangle corner fillet radius

**Outputs:**
- **`R` (Generic Data):** Rectangle
- **`L` (Number):** Length of rectangle curve

### Rectangle 2Pt
**Nickname:** `Rec 2Pt`
**Description:** Create a rectangle from a base plane and two points
**GUID:** `575660b1-8c79-4b8d-9222-7ab4a6ddb359`

**Inputs:**
- **`P` (Plane):** Rectangle base plane
- **`A` (Point):** First corner point.
- **`B` (Point):** Second corner point.
- **`R` (Number):** Rectangle corner fillet radius

**Outputs:**
- **`R` (Generic Data):** Rectangle defined by P, A and B
- **`L` (Number):** Length of rectangle curve

### Rectangle 3Pt
**Nickname:** `Rec 3Pt`
**Description:** Create a rectangle from three points
**GUID:** `9bc98a1d-2ecc-407e-948a-09a09ed3e69d`

**Inputs:**
- **`A` (Point):** First corner of rectangle
- **`B` (Point):** Second corner of rectangle
- **`C` (Point):** Point along rectangle edge opposite to AB

**Outputs:**
- **`R` (Rectangle):** Rectangle defined by A, B and C.
- **`L` (Number):** Length of rectangle curve

### Tangent Arcs
**Nickname:** `TArc`
**Description:** Create tangent arcs between circles
**GUID:** `f1c0783b-60e9-42a7-8081-925bc755494c`

**Inputs:**
- **`A` (Circle):** First base circle
- **`B` (Circle):** Second base circle
- **`R` (Number):** Radius of tangent arcs

**Outputs:**
- **`A` (Arc):** First tangent arc solution
- **`B` (Arc):** Second tangent arc solution

### Tangent Lines
**Nickname:** `Tan`
**Description:** Create tangent lines between a point and a circle
**GUID:** `ea0f0996-af7a-481d-8099-09c041e6c2d5`

**Inputs:**
- **`P` (Point):** Point for tangent lines
- **`C` (Circle):** Base circle

**Outputs:**
- **`T1` (Line):** Primary tangent
- **`T2` (Line):** Secondary tangent

### Tangent Lines (Ex)
**Nickname:** `TanEx`
**Description:** Create external tangent lines between circles
**GUID:** `d6d68c93-d00f-4cd5-ba89-903c7f6be64c`

**Inputs:**
- **`A` (Circle):** First base circle
- **`B` (Circle):** Second base circle

**Outputs:**
- **`T1` (Line):** Primary exterior tangent
- **`T2` (Line):** Secondary exterior tangent

### Tangent Lines (In)
**Nickname:** `TanIn`
**Description:** Create internal tangent lines between circles
**GUID:** `e0168047-c46a-48c6-8595-2fb3d8574f23`

**Inputs:**
- **`A` (Circle):** First base circle
- **`B` (Circle):** Second base circle

**Outputs:**
- **`T1` (Line):** Primary interior tangent
- **`T2` (Line):** Secondary interior tangent

### TwoByFourJam
**Nickname:** `2x4 Jam`
**Description:** Jam a two-by-four into a crooked room
**GUID:** `c21e7bd5-b1f2-4448-ac56-206f98f90aa7`

**Inputs:**
- **`R` (Curve):** Room polyline with 4 corners
- **`W` (Number):** Width of fitting rectangle
- **`S` (Integer):** Number of samples to take (more samples = better solution)

**Outputs:**
- **`R` (Rectangle):** Fitted rectangle

***

## Category: Curve > Spline

### Bezier Span
**Nickname:** `BzSpan`
**Description:** Construct a bezier span from endpoints and tangents.
**GUID:** `30ce59ce-22a1-49ee-9e21-e6d16b3684a8`

**Inputs:**
- **`A` (Point):** Start of curve
- **`At` (Vector):** Tangent at start
- **`B` (Point):** End of curve
- **`Bt` (Vector):** Tangent at end

**Outputs:**
- **`C` (Curve):** Resulting bezier span
- **`L` (Number):** Curve length
- **`D` (Domain):** Curve domain

### Blend Curve
**Nickname:** `BlendC`
**Description:** Create a blend curve between two curves.
**GUID:** `5909dbcb-4950-4ce4-9433-7cf9e62ee011`

**Inputs:**
- **`A` (Curve):** First curve for blend
- **`B` (Curve):** Second curve for blend
- **`Fa` (Number):** Bulge factor at A
- **`Fb` (Number):** Bulge factor at B
- **`C` (Integer):** Continuity of blend (0=position, 1=tangency, 2=curvature)

**Outputs:**
- **`B` (Curve):** Blend curve connecting the end of A to the start of B

### Blend Curve Pt
**Nickname:** `BlendCPt`
**Description:** Create a blend curve between two curves that intersects a point.
**GUID:** `14cf43b6-5eb9-460f-899c-bdece732213a`

**Inputs:**
- **`A` (Curve):** First curve for blend
- **`B` (Curve):** Second curve for blend
- **`P` (Point):** Point for blend intersection
- **`C` (Integer):** Continuity of blend (1=tangency, 2=curvature)

**Outputs:**
- **`B` (Curve):** Blend curve connecting the end of A to the start of B, ideally coincident with P

### Catenary
**Nickname:** `Cat`
**Description:** Create a catenary chain between two points.
**GUID:** `275671d4-3e87-40bd-8aff-8e6a5fdbb892`

**Inputs:**
- **`A` (Point):** Start point of catenary
- **`B` (Point):** End point of catenary
- **`L` (Number):** Length of catenary chain (should be larger than the distance |AB|)
- **`G` (Vector):** Direction of gravity

**Outputs:**
- **`C` (Curve):** Catenary chain

### Catenary Ex
**Nickname:** `CatEx`
**Description:** Create a variable catenary chain between two points.
**GUID:** `769f9064-17f5-4c4a-921f-c3a0ee05ba3a`

**Inputs:**
- **`A` (Point):** Start point of catenary
- **`B` (Point):** End point of catenary
- **`L` (Number):** Length of catenary chain segments
- **`W` (Number):** Weight (per length unit) of catenargy chain segments
- **`G` (Vector):** Direction of gravity

**Outputs:**
- **`C` (Curve):** Catenary chain
- **`S` (Curve):** Catenary segments

### Connect Curves
**Nickname:** `Connect`
**Description:** Connect a sequence of curves.
**GUID:** `d0a1b843-873d-4d1d-965c-b5423b35f327`

**Inputs:**
- **`C` (Curve):** Curves to connect
- **`G` (Integer):** Continuity of blends (0=position, 1=tangency, 2=curvature)
- **`L` (Boolean):** Create a closed loop from all curves
- **`B` (Number):** Bulge factor for connecting segments

**Outputs:**
- **`C` (Curve):** Joined segments and connecting curves

### Curve On Surface
**Nickname:** `CrvSrf`
**Description:** Create an interpolated curve through a set of points on a surface.
**GUID:** `ffe2dbed-9b5d-4f91-8fe3-10c8961ac2f8`

**Inputs:**
- **`S` (Surface):** Base surface
- **`uv` (Point):** {v} coordinates of interpolation points
- **`C` (Boolean):** Closed curve

**Outputs:**
- **`C` (Curve):** Resulting nurbs curve
- **`L` (Number):** Curve length
- **`D` (Domain):** Curve domain

### Geodesic
**Nickname:** `Geodesic`
**Description:** Construct a surface geodesic between two points.
**GUID:** `ce5963b4-1cea-4f71-acd2-a3c28ab85662`

**Inputs:**
- **`S` (Surface):** Base surface for geodesic
- **`S` (Point):** Start point of geodesic
- **`E` (Point):** End point of geodesic

**Outputs:**
- **`G` (Curve):** Surface geodesic

### Interpolate
**Nickname:** `IntCrv`
**Description:** Create an interpolated curve through a set of points.
**GUID:** `2b2a4145-3dff-41d4-a8de-1ea9d29eef33`

**Inputs:**
- **`V` (Point):** Interpolation points
- **`D` (Integer):** Curve degree
- **`P` (Boolean):** Periodic curve
- **`K` (Integer):** Knot spacing (0=uniform, 1=chord, 2=sqrtchord)

**Outputs:**
- **`C` (Curve):** Resulting nurbs curve
- **`L` (Number):** Curve length
- **`D` (Domain):** Curve domain

### Interpolate (t)
**Nickname:** `IntCrv(t)`
**Description:** Create an interpolated curve through a set of points with tangents.
**GUID:** `75eb156d-d023-42f9-a85e-2f2456b8bcce`

**Inputs:**
- **`V` (Point):** Interpolation points
- **`Ts` (Vector):** Tangent at start of curve
- **`Te` (Vector):** Tangent at end of curve
- **`K` (Integer):** Knot spacing (0=uniform, 1=chord, 2=sqrtchord)

**Outputs:**
- **`C` (Curve):** Resulting nurbs curve
- **`L` (Number):** Curve length
- **`D` (Domain):** Curve domain

### Iso Curve
**Nickname:** `Iso`
**Description:** Construct {uv} isocurves on a surface.
**GUID:** `d1d57181-d594-41e8-8efb-041e29f8a5ca`

**Inputs:**
- **`S` (Surface):** Base surface
- **`uv` (Point):** {uv} coordinate on surface for isocurve extraction.

**Outputs:**
- **`U` (Curve):** Isocurves in {u} direction
- **`V` (Curve):** Isocurves in {v} direction

### Kinky Curve
**Nickname:** `KinkCrv`
**Description:** Construct an interpolated curve through a set of points with a kink angle threshold.
**GUID:** `6f0993e8-5f2f-4fc0-bd73-b84bc240e78e`

**Inputs:**
- **`V` (Point):** Interpolation points
- **`D` (Integer):** Curve degree
- **`A` (Number):** Kink angle threshold (in radians)

**Outputs:**
- **`C` (Curve):** Resulting nurbs curve
- **`L` (Number):** Curve length
- **`D` (Domain):** Curve domain

### Knot Vector
**Nickname:** `Knots`
**Description:** Construct a nurbs curve knot vector.
**GUID:** `846470bd-4918-4d00-9388-7e022b2cba73`

**Inputs:**
- **`N` (Integer):** Control point count.
- **`D` (Integer):** Curve Degree.
- **`P` (Boolean):** Curve periodicity

**Outputs:**
- **`K` (Number):** Nurbs Knot Vector.

### Match Curve
**Nickname:** `MatchCrv`
**Description:** Match two curves.
**GUID:** `282bf4eb-668a-4a2c-81af-2432ac863ddd`

**Inputs:**
- **`A` (Curve):** Curve to adjust.
- **`B` (Curve):** Curve to match
- **`C` (Integer):** Continuity of match (0=position, 1=tangency, 2=curvature)

**Outputs:**
- **`M` (Curve):** Matched curve

### Nurbs Curve
**Nickname:** `Nurbs`
**Description:** Construct a nurbs curve from control points.
**GUID:** `dde71aef-d6ed-40a6-af98-6b0673983c82`

**Inputs:**
- **`V` (Point):** Curve control points
- **`D` (Integer):** Curve degree
- **`P` (Boolean):** Periodic curve

**Outputs:**
- **`C` (Curve):** Resulting nurbs curve
- **`L` (Number):** Curve length
- **`D` (Domain):** Curve domain

### Nurbs Curve PWK
**Nickname:** `NurbCrv`
**Description:** Construct a nurbs curve from control points, weights and knots.
**GUID:** `1f8e1ff7-8278-4421-b39d-350e71d85d37`

**Inputs:**
- **`P` (Point):** Curve control points
- **`W` (Number):** Optional control point weights
- **`K` (Number):** Nurbs knot vector

**Outputs:**
- **`C` (Curve):** Resulting nurbs curve
- **`L` (Number):** Curve length
- **`D` (Domain):** Curve domain

### PolyArc
**Nickname:** `PArc`
**Description:** Create a polycurve consisting of arc and line segments.
**GUID:** `7159ef59-e4ef-44b8-8cb2-91231e278292`

**Inputs:**
- **`V` (Point):** Polyarc vertex coordinates
- **`T` (Vector):** Optional tangent vector at start.
- **`C` (Boolean):** Close the polyarc curve.

**Outputs:**
- **`Crv` (Curve):** Resulting polyarc curve

### PolyLine
**Nickname:** `PLine`
**Description:** Create a polyline connecting a number of points.
**GUID:** `71b5b089-500a-4ea6-81c5-2f960441a0e8`

**Inputs:**
- **`V` (Point):** Polyline vertex points
- **`C` (Boolean):** Close polyline

**Outputs:**
- **`Pl` (Curve):** Resulting polyline

### Sub Curve
**Nickname:** `SubCrv`
**Description:** Construct a curve from the sub-domain of a base curve.
**GUID:** `429cbba9-55ee-4e84-98ea-876c44db879a`

**Inputs:**
- **`C` (Curve):** Base curve
- **`D` (Domain):** Sub-domain to extract

**Outputs:**
- **`C` (Curve):** Resulting sub curve

### Swing Arc
**Nickname:** `Swing`
**Description:** Create a polycurve consisting of arcs defined by center points.
**GUID:** `3edc4fbd-24c6-43de-aaa8-5bdf0704373d`

**Inputs:**
- **`C` (Point):** Center points for swing arc segments
- **`P` (Plane):** Optional plane for swing arc solution. If omitted, the best fit plane is used.
- **`R` (Number):** Radius for first swing segment

**Outputs:**
- **`A` (Curve):** First resulting swing arc curve
- **`B` (Curve):** Second resulting swing arc curve
- **`C` (Circle):** Tangent circles that define the swing curves

### Tangent Curve
**Nickname:** `TanCurve`
**Description:** Create a curve through a set of points with tangents.
**GUID:** `f73498c5-178b-4e09-ad61-73d172fa6e56`

**Inputs:**
- **`V` (Point):** Interpolation points
- **`T` (Vector):** Tangent vectors for all interpolation points
- **`B` (Number):** Blend factor
- **`D` (Integer):** Curve degree (only odd degrees are supported)

**Outputs:**
- **`C` (Curve):** Resulting nurbs curve
- **`L` (Number):** Curve length
- **`D` (Domain):** Curve domain

### Tween Curve
**Nickname:** `TweenCrv`
**Description:** Tween between two curves.
**GUID:** `139619d2-8b18-47b6-b3b9-bf4fec0d6eb1`

**Inputs:**
- **`A` (Curve):** Curve to tween from.
- **`B` (Curve):** Curve to tween to
- **`F` (Number):** Tween factor (0.0=Curve A, 1.0=Curve B

**Outputs:**
- **`T` (Curve):** Resulting tween curve

***

## Category: Curve > Util

### Curve To Polyline
**Nickname:** `ToPoly`
**Description:** Convert a curve to a polyline.
**GUID:** `2956d989-3599-476f-bc92-1d847aff98b6`

**Inputs:**
- **`C` (Curve):** Curve to simplify
- **`Td` (Number):** Deviation tolerance
- **`Ta` (Number):** Angle tolerance in radians
- **`E-` (Number):** Optional minimum allowed segment length
- **`E+` (Number):** Optional maximum allowed segment length

**Outputs:**
- **`P` (Curve):** Converted curve
- **`S` (Integer):** Number of polyline segments

### Explode
**Nickname:** `Explode`
**Description:** Explode a curve into smaller segments.
**GUID:** `afb96615-c59a-45c9-9cac-e27acb1c7ca0`

**Inputs:**
- **`C` (Curve):** Curve to explode
- **`R` (Boolean):** Recursive decomposition until all segments are atomic

**Outputs:**
- **`S` (Curve):** Exploded segments that make up the base curve
- **`V` (Point):** Vertices of the exploded segments

### Extend Curve
**Nickname:** `Ext`
**Description:** Extend a curve by a specified distance.
**GUID:** `62cc9684-6a39-422e-aefa-ed44643557b9`

**Inputs:**
- **`C` (Curve):** Curve to extend
- **`T` (Integer):** Type of extension (0=Line, 1=Arc, 2=Smooth)
- **`L0` (Number):** Extension length at start of curve
- **`L1` (Number):** Extension length at end of curve

**Outputs:**
- **`C` (Curve):** Extended curve

### Fillet
**Nickname:** `Fillet`
**Description:** Fillet the sharp corners of a curve.
**GUID:** `2f407944-81c3-4062-a485-276454ec4b8c`

**Inputs:**
- **`C` (Curve):** Curve to fillet
- **`R` (Number):** Radius of fillet

**Outputs:**
- **`C` (Curve):** Curve with filleted corners

### Fillet
**Nickname:** `Fillet`
**Description:** Fillet a curve at a parameter.
**GUID:** `c92cdfc8-3df8-4c4e-abc1-ede092a0aa8a`

**Inputs:**
- **`C` (Curve):** Curve to fillet
- **`t` (Number):** Curve parameter for fillet
- **`R` (Number):** Radius of fillet

**Outputs:**
- **`C` (Curve):** Filleted curve
- **`t` (Number):** Parameter where the fillet eventually occured

### Fillet Distance
**Nickname:** `Fillet`
**Description:** Fillet the sharp corners of a curve by distance.
**GUID:** `6fb21315-a032-400e-a80f-248687f5507f`

**Inputs:**
- **`C` (Curve):** Curve to fillet
- **`D` (Number):** Distance from corner of fillet start

**Outputs:**
- **`C` (Curve):** Curve with filleted corners

### Fit Curve
**Nickname:** `Fit`
**Description:** Fit a curve along another curve.
**GUID:** `a3f9f19e-3e6c-4ac7-97c3-946de32c3e8e`

**Inputs:**
- **`C` (Curve):** Curve to fit
- **`D` (Integer):** Optional degree of curve (if omitted, input degree is used)
- **`Ft` (Number):** Tolerance for fitting (if omitted, document tolerance is used)

**Outputs:**
- **`C` (Curve):** Fitted curve

### Flip Curve
**Nickname:** `Flip`
**Description:** Flip a curve using an optional guide curve.
**GUID:** `22990b1f-9be6-477c-ad89-f775cd347105`

**Inputs:**
- **`C` (Curve):** Curve to flip
- **`G` (Curve):** Optional guide curve

**Outputs:**
- **`C` (Curve):** Flipped curve
- **`F` (Boolean):** Flip action

### Join Curves
**Nickname:** `Join`
**Description:** Join as many curves as possible
**GUID:** `8073a420-6bec-49e3-9b18-367f6fd76ac3`

**Inputs:**
- **`C` (Curve):** Curves to join
- **`P` (Boolean):** Preserve direction of input curves

**Outputs:**
- **`C` (Curve):** Joined curves and individual curves that could not be joined.

### Offset Curve
**Nickname:** `Offset`
**Description:** Offset a curve with a specified distance.
**GUID:** `1a38d325-98de-455c-93f1-bca431bc1243`

**Inputs:**
- **`C` (Curve):** Curve to offset
- **`D` (Number):** Offset distance
- **`P` (Plane):** Plane for offset operation
- **`C` (Integer):** Corner type flag. Possible values:

none = 0
sharp = 1
round = 2
smooth = 3
chamfer = 4

**Outputs:**
- **`C` (Curve):** Resulting offsets

### Offset Curve Loose
**Nickname:** `Offset (L)`
**Description:** Offset the control-points of a curve with a specified distance.
**GUID:** `80e55fc2-933b-4bfb-a353-12358786dba8`

**Inputs:**
- **`C` (Curve):** Curve to offset
- **`D` (Number):** Offset distance
- **`P` (Plane):** Optional Plane for offset operation

**Outputs:**
- **`C` (Curve):** Resulting offset

### Offset Loose 3D
**Nickname:** `Offset (3D)`
**Description:** Offset the control-points of a curve with a specified distance in 3D.
**GUID:** `c6fe61e7-25e2-4333-9172-f4e2a123fcfe`

**Inputs:**
- **`C` (Curve):** Curve to offset
- **`D` (Number):** Offset distance

**Outputs:**
- **`C` (Curve):** Resulting offset

### Offset Polyline
**Nickname:** `OP`
**Description:** Offset a 2D polyline
**GUID:** `e2c6cab3-91ea-4c01-900c-646642d3e436`

**Inputs:**
- **`P` (Curve):** Polyline to offset
- **`D` (Number):** Offset distance

**Outputs:**
- **`O` (Curve):** Offset results
- **`V` (Boolean):** Offset validity

### Offset on Srf
**Nickname:** `OffsetS`
**Description:** Offset a curve on a surface with a specified distance.
**GUID:** `b6f5cb51-f260-4c74-bf73-deb47de1bf91`

**Inputs:**
- **`C` (Curve):** Curve to offset
- **`D` (Number):** Offset distance
- **`S` (Surface):** Surface for offset operation

**Outputs:**
- **`C` (Curve):** Resulting offsets

### Polyline Collapse
**Nickname:** `PCol`
**Description:** Collapse short segments in a polyline curve.
**GUID:** `be298882-28c9-45b1-980d-7192a531c9a9`

**Inputs:**
- **`P` (Curve):** Polyline curve
- **`t` (Number):** Segment length tolerance

**Outputs:**
- **`Pl` (Curve):** Resulting polyline
- **`N` (Integer):** Number of segments that were collapsed

### Project
**Nickname:** `Project`
**Description:** Project a curve onto a Brep.
**GUID:** `d7ee52ff-89b8-4d1a-8662-3e0dd391d0af`

**Inputs:**
- **`C` (Curve):** Curve to project
- **`B` (Brep):** Brep to project onto
- **`D` (Vector):** Projection direction

**Outputs:**
- **`C` (Curve):** Projected curves

### Pull Curve
**Nickname:** `Pull`
**Description:** Pull a curve onto a surface.
**GUID:** `6b5812f5-bb36-4d74-97fc-5a1f2f77452d`

**Inputs:**
- **`C` (Curve):** Curve to pull
- **`S` (Surface):** Surface that pulls

**Outputs:**
- **`C` (Curve):** Curve pulled onto the surface

### Rebuild Curve
**Nickname:** `ReB`
**Description:** Rebuild a curve with a specific number of control-points.
**GUID:** `9333c5b3-11f9-423c-bbb5-7e5156430219`

**Inputs:**
- **`C` (Curve):** Curve to rebuild
- **`D` (Integer):** Optional degree of curve (if omitted, input degree is used)
- **`N` (Integer):** Number of control points
- **`T` (Boolean):** Preserve curve end tangents

**Outputs:**
- **`C` (Curve):** Rebuild curve

### Reduce
**Nickname:** `RedPLine`
**Description:** Reduce a polyline by removing least significant vertices.
**GUID:** `884646c3-0e70-4ad1-90c5-42601ee26450`

**Inputs:**
- **`P` (Curve):** Polyline to reduce
- **`T` (Number):** Tolerance (allowed deviation between original and reduction)

**Outputs:**
- **`P` (Curve):** Reduced polyline
- **`R` (Integer):** Number of vertices removed during reduction

### Seam
**Nickname:** `Seam`
**Description:** Adjust the seam of a closed curve.
**GUID:** `42ad8dc1-b0c0-40df-91f5-2c46e589e6c2`

**Inputs:**
- **`C` (Curve):** Curve to adjust
- **`t` (Number):** Parameter of new seam

**Outputs:**
- **`C` (Curve):** Adjusted curve

### Simplify Curve
**Nickname:** `Simplify`
**Description:** Simplify a curve.
**GUID:** `922dc7e5-0f0e-4c21-ae4b-f6a8654e63f6`

**Inputs:**
- **`C` (Curve):** Curve to simplify
- **`t` (Number):** Optional deviation tolerance (if omitted, the current document tolerance is used)
- **`a` (Number):** Optional angle tolerance (if omitted, the current document tolerance is used)

**Outputs:**
- **`C` (Curve):** Simplified curve
- **`S` (Boolean):** True if curve was modified in any way

### Smooth Polyline
**Nickname:** `SmoothPLine`
**Description:** Smooth the vertices of a polyline curve.
**GUID:** `5c5fbc42-3e1d-4081-9cf1-148d0b1d9610`

**Inputs:**
- **`P` (Curve):** Polyline to smooth
- **`S` (Number):** Smoothing strength (0 = none, 1 = maximum)
- **`T` (Integer):** Number of times to apply the smoothing operation

**Outputs:**
- **`P` (Curve):** Smoothed polyline

***

## Category: Display > Colour

### Colour CMYK
**Nickname:** `CMYK`
**Description:** Create a colour from floating point {CMYK} channels.
**GUID:** `17af01a5-a846-4769-9478-de1df65a0afa`

**Inputs:**
- **`C` (Number):** Cyan channel (cyan is defined in the range {0.0 to 1.0})
- **`M` (Number):** Magenta channel (magenta is defined in the range {0.0 to 1.0})
- **`Y` (Number):** Yellow channel (yellow is defined in the range {0.0 to 1.0})
- **`K` (Number):** Key channel (key is defined in the range {0.0 to 1.0})

**Outputs:**
- **`C` (Colour):** Resulting colour

### Colour HSL
**Nickname:** `HSL`
**Description:** Create a colour from floating point {HSL} channels.
**GUID:** `a45d68b3-c299-4b17-bdae-7975f216cec6`

**Inputs:**
- **`A` (Number):** Alpha channel (alpha is defined in the range {0.0 to 1.0})
- **`H` (Number):** Hue channel (hue is defined in the range {0.0 to 1.0})
- **`S` (Number):** Saturation channel (saturation is defined in the range {0.0 to 1.0})
- **`L` (Number):** Luminance channel (luminance is defined in the range {0.0 to 1.0})

**Outputs:**
- **`C` (Colour):** Resulting colour

### Colour HSV
**Nickname:** `HSV`
**Description:** Create a colour from floating point {HSV} channels.
**GUID:** `5958a658-20c2-4a2b-86ba-4d1b81bf5348`

**Inputs:**
- **`A` (Number):** Alpha channel (alpha is defined in the range {0.0 to 1.0})
- **`H` (Number):** Hue channel (hue is defined in the range {0.0 to 1.0})
- **`S` (Number):** Saturation channel (saturation is defined in the range {0.0 to 1.0})
- **`V` (Number):** Value channel (value/brightness is defined in the range {0.0 to 1.0})

**Outputs:**
- **`C` (Colour):** Resulting colour

### Colour L*ab
**Nickname:** `L*AB`
**Description:** Create a colour from floating point {CIE L*ab} channels.
**GUID:** `f922ed44-6e4a-44a0-8b4b-4b4a46bdfe29`

**Inputs:**
- **`A` (Number):** Alpha channel (alpha is defined in the range {0.0 to 1.0})
- **`L` (Number):** Luminance channel (luminance is defined in the range {0.0 to 1.0})
- **`A` (Number):** First colour channel (A is defined in the range {-1.0 to 1.0})
- **`B` (Number):** Opposing colour channel (B is defined in the range {-1.0 to 1.0})

**Outputs:**
- **`C` (Colour):** Resulting colour

### Colour LCH
**Nickname:** `LCH`
**Description:** Create a colour from floating point {CIE LCH} channels.
**GUID:** `75a07554-8a2c-4d87-81b9-d854f498509d`

**Inputs:**
- **`A` (Number):** Alpha channel (alpha is defined in the range {0.0 to 1.0})
- **`L` (Number):** Luminance channel (luminance is defined in the range {0.0 to 1.0})
- **`C` (Number):** Chromaticity channel (chroma is defined in the range {0.0 to 1.0})
- **`H` (Number):** Hue channel (hue is defined in the range {0.0 to 1.0})

**Outputs:**
- **`C` (Colour):** Resulting colour

### Colour RGB
**Nickname:** `RGB`
**Description:** Create a colour from {RGB} channels.
**GUID:** `49d2e200-b34e-4e1c-82a3-07feb4cb9378`

**Inputs:**
- **`A` (Integer):** Alpha channel (255 = opaque)
- **`R` (Integer):** Red channel
- **`G` (Integer):** Green channel
- **`B` (Integer):** Blue channel

**Outputs:**
- **`C` (Colour):** Resulting colour

### Colour RGB (f)
**Nickname:** `fRGB`
**Description:** Create a colour from floating point {RGB} channels.
**GUID:** `f35132c0-c298-4b9c-b446-42e960f52677`

**Inputs:**
- **`A` (Number):** Alpha channel (1.0 = opaque)
- **`R` (Number):** Red channel
- **`G` (Number):** Green channel
- **`B` (Number):** Blue channel

**Outputs:**
- **`C` (Colour):** Resulting colour

### Colour XYZ
**Nickname:** `XYZ`
**Description:** Create a colour from floating point {XYZ} channels (CIE 1931 spec).
**GUID:** `77185dc2-2f18-469d-9686-00f5b6049195`

**Inputs:**
- **`A` (Number):** Alpha channel (alpha is defined in the range {0.0 to 1.0})
- **`X` (Number):** X stimulus (X is defined in the range {0.0 to 1.0})
- **`Y` (Number):** Y stimulus (y is defined in the range {0.0 to 1.0})
- **`Z` (Number):** Z stimulus (Z is defined in the range {0.0 to 1.0})

**Outputs:**
- **`C` (Colour):** Resulting colour

### Split AHSL
**Nickname:** `AHSL`
**Description:** Split a colour into floating point {AHSL} channels
**GUID:** `0a1331c8-c58d-4b3f-a886-47051532e35e`

**Inputs:**
- **`C` (Colour):** Input colour

**Outputs:**
- **`A` (Number):** Alpha channel
- **`H` (Number):** Hue
- **`S` (Number):** Saturation
- **`L` (Number):** Luminance

### Split AHSV
**Nickname:** `AHSV`
**Description:** Split a colour into floating point {AHSV} channels
**GUID:** `d84d2c2a-2813-4667-afb4-46642581e5f9`

**Inputs:**
- **`C` (Colour):** Input colour

**Outputs:**
- **`A` (Number):** Alpha channel
- **`H` (Number):** Hue
- **`S` (Number):** Saturation
- **`V` (Number):** Value (Brightness)

### Split ARGB
**Nickname:** `ARGB`
**Description:** Split a colour into floating point {ARGB} channels.
**GUID:** `350f7d03-a48f-4121-bcee-328cfe1ed9ef`

**Inputs:**
- **`C` (Colour):** Input colour

**Outputs:**
- **`A` (Number):** Alpha channel
- **`R` (Number):** Red channel
- **`G` (Number):** Green channel
- **`B` (Number):** Blue channel

***

## Category: Display > Dimensions

### Aligned Dimension
**Nickname:** `AlignDim`
**Description:** Create a distance annotation between two points
**GUID:** `3de3d3a0-1a1b-488c-b3d9-3fba0fdf07a8`

**Inputs:**
- **`P` (Plane):** Plane for dimension
- **`A` (Point):** First dimension point
- **`B` (Point):** Second dimension point
- **`O` (Number):** Offset for base line
- **`T` (Text):** Dimension text
- **`S` (Number):** Dimension size

**Outputs:**
- *This component has no outputs.*

### Angular Dimension
**Nickname:** `AngleDim`
**Description:** Create an angle annotation between points.
**GUID:** `fc6b519e-df6d-4ce1-a1f4-083f1c217c14`

**Inputs:**
- **`C` (Point):** Angle centre point
- **`A` (Point):** End of first angle direction
- **`B` (Point):** End of second angle direction
- **`R` (Boolean):** Create dimension for reflex angle
- **`T` (Text):** Dimension text
- **`S` (Number):** Dimension size

**Outputs:**
- *This component has no outputs.*

### Angular Dimensions (Mesh)
**Nickname:** `AngleDimMesh`
**Description:** Create angle annotations for all mesh corners.
**GUID:** `91f3bde5-26e6-432e-a5fe-a2938b2a94f9`

**Inputs:**
- **`M` (Mesh):** Mesh to annotate
- **`T` (Text):** Dimension text
- **`S` (Number):** Dimension size
- **`F` (Number):** Radius of dimension as part of edge length.
- **`A0` (Number):** Threshold angle below which dimensions are not drawn.
- **`A1` (Number):** Threshold angle above which dimensions are not drawn.

**Outputs:**
- *This component has no outputs.*

### Arc Dimension
**Nickname:** `ArcDim`
**Description:** Create an angle annotation based on an arc.
**GUID:** `1bd97813-4fec-4453-9645-4ac920844f9d`

**Inputs:**
- **`A` (Arc):** Arc guide
- **`O` (Number):** Dimension offset
- **`T` (Text):** Dimension text
- **`S` (Number):** Dimension size

**Outputs:**
- *This component has no outputs.*

### Circular Dimension
**Nickname:** `CircleDim`
**Description:** Create an angle annotation projected to a circle.
**GUID:** `7e9489e0-122d-401a-aba8-f1dae0217c40`

**Inputs:**
- **`C` (Circle):** Dimension guide circle
- **`A` (Point):** First angle point
- **`B` (Point):** Second angle point
- **`T` (Text):** Dimension text
- **`S` (Number):** Dimension size

**Outputs:**
- *This component has no outputs.*

### Gradient Hatch
**Nickname:** `GHatch`
**Description:** Create a gradient hatch
**GUID:** `6ce90407-9eac-4a1a-a81a-949b601f18f3`

**Inputs:**
- **`B` (Curve):** Boundary curves for hatch objects
- **`A` (Line):** Gradient axis
- **`C1` (Colour):** Colour at start of axis.
- **`C2` (Colour):** Colour at end of axis.

**Outputs:**
- *This component has no outputs.*

### Line Dimension
**Nickname:** `LineDim`
**Description:** Create a distance annotation along a line.
**GUID:** `d78f026a-0109-4bcc-bf91-d08475711466`

**Inputs:**
- **`L` (Line):** Dimension base line
- **`T` (Text):** Dimension text
- **`S` (Number):** Dimension size

**Outputs:**
- *This component has no outputs.*

### Linear Dimension
**Nickname:** `LinearDim`
**Description:** Create a distance annotation between points, projected to a line.
**GUID:** `5018bf8d-8566-4917-a6e3-5a623bda8079`

**Inputs:**
- **`L` (Line):** Dimension base line
- **`A` (Point):** First dimension point
- **`B` (Point):** Second dimension point
- **`T` (Text):** Dimension text
- **`S` (Number):** Dimension size

**Outputs:**
- *This component has no outputs.*

### Make2D
**Nickname:** `Make2D`
**Description:** Create a hidden line drawing from geometry
**GUID:** `96e40f6b-ba46-4102-bf15-ebf90471f4a0`

**Inputs:**
- **`G` (Geometry):** Geometry to include (Breps, Meshes and Curves only).
- **`C` (Plane):** Optional clipping planes.
- **`V` (Projection):** Make2D projection details
- **`Te` (Boolean):** Whether or not to compute tangent edges.
- **`Ts` (Boolean):** Whether or not to compute tangent seams.

**Outputs:**
- **`V` (Curve):** List of visible curves
- **`Vi` (Integer):** For each visible curve, index of source object
- **`Vt` (Text):** For each visible curve, type description
- **`H` (Curve):** List of hidden curves
- **`Hi` (Integer):** For each hidden curve, index of source object
- **`Ht` (Text):** For each hidden curve, type description

### Make2D Parallel View
**Nickname:** `M2D Parallel`
**Description:** Define a parallel view for a Make2D solution
**GUID:** `3fc08088-d75d-43bc-83cc-7a654f156cb7`

**Inputs:**
- **`P` (Rectangle):** View projection.

**Outputs:**
- **`V` (Projection):** Parallel view

### Make2D Perspective View
**Nickname:** `M2D Perspective`
**Description:** Define a perspective view for a Make2D solution
**GUID:** `33359c6d-984e-42f3-a869-0c3364ab33b6`

**Inputs:**
- **`C` (Point):** Camera position
- **`F` (Rectangle):** Projection framing.

**Outputs:**
- **`V` (Projection):** Parallel view

### Make2D Rhino View
**Nickname:** `M2D Rhino`
**Description:** Import a Rhino view for a Make2D solution
**GUID:** `4ac24770-e38b-4363-be38-551a3b134707`

**Inputs:**
- **`N` (Text):** Named view or viewport name.
- **`C` (Boolean):** If true, the view will be clipped to the frustum.

**Outputs:**
- **`V` (Projection):** Parallel view

### Marker Dimension
**Nickname:** `MarkDim`
**Description:** Create a text annotation at a point
**GUID:** `c5208969-16f9-48af-8a86-e500c033fb76`

**Inputs:**
- **`L` (Line):** Dimension base line
- **`T` (Text):** Dimension text
- **`S` (Number):** Dimension size

**Outputs:**
- *This component has no outputs.*

### Pattern Hatch
**Nickname:** `PHatch`
**Description:** Create a patterned hatch
**GUID:** `5f9e4549-8135-4a90-97c8-8a34bf05e99a`

**Inputs:**
- **`B` (Curve):** Boundary curves for hatch objects
- **`P` (Integer):** Hatch pattern style
- **`S` (Number):** Pattern scale
- **`A` (Number):** Pattern angle

**Outputs:**
- *This component has no outputs.*

### Serial Dimension
**Nickname:** `SerialDim`
**Description:** Create a distance annotation between multiple points, projected to a line.
**GUID:** `7dd42002-75bb-4f41-857f-472a140b3b28`

**Inputs:**
- **`L` (Line):** Dimension base line
- **`P` (Point):** Dimension points, the first one marks the zero point
- **`T` (Text):** Dimension text
- **`S` (Number):** Dimension size

**Outputs:**
- *This component has no outputs.*

### Text Tag
**Nickname:** `Tag`
**Description:** Represents a list of text tags in a Rhino viewport
**GUID:** `3b220754-4114-4170-b6c3-b286b86ed524`

**Inputs:**
- **`L` (Point):** Location of text tag
- **`T` (Text):** The text to display
- **`C` (Colour):** Optional colour for tag

**Outputs:**
- *This component has no outputs.*

### Text Tag 3D
**Nickname:** `Tag`
**Description:** Represents a list of 3D text tags in a Rhino viewport
**GUID:** `5a41528b-12b9-40dc-a3f2-842034d267c4`

**Inputs:**
- **`L` (Plane):** Location and orientation of text tag
- **`T` (Text):** The text to display
- **`S` (Number):** Size of text
- **`C` (Colour):** Optional colour of tag
- **`J` (Integer):** Text justification

**Outputs:**
- *This component has no outputs.*

***

## Category: Display > Graphs

### Legend
**Nickname:** `Legend`
**Description:** Display a legend consisting of Tags and Colours
**GUID:** `f6867cdd-2216-4451-9134-7da94bdcd5af`

**Inputs:**
- **`C` (Colour):** Legend colours
- **`T` (Text):** Legend tags
- **`R` (Rectangle):** Optional legend rectangle in 3D space

**Outputs:**
- *This component has no outputs.*

***

## Category: Display > Preview

### Cloud Display
**Nickname:** `Cloud`
**Description:** Draw a collection of points as a fuzzy cloud
**GUID:** `059b72b0-9bb3-4542-a805-2dcd27493164`

**Inputs:**
- **`P` (Point):** Location for each blob
- **`C` (Colour):** Colour for each blob
- **`S` (Number):** Size for each blob

**Outputs:**
- *This component has no outputs.*

### Create Material
**Nickname:** `Material`
**Description:** Create an OpenGL material.
**GUID:** `76975309-75a6-446a-afed-f8653720a9f2`

**Inputs:**
- **`Kd` (Colour):** Colour of the diffuse channel
- **`Ks` (Colour):** Colour of the specular highlight
- **`Ke` (Colour):** Emissive colour of the material
- **`T` (Number):** Amount of transparency (0.0 = opaque, 1.0 = transparent
- **`S` (Integer):** Amount of shinyness (0 = none, 1 = low shine, 100 = max shine

**Outputs:**
- **`M` (Shader):** Resulting material

### Custom Preview
**Nickname:** `Preview`
**Description:** Allows for customized geometry previews
**GUID:** `537b0419-bbc2-4ff4-bf08-afe526367b2c`

**Inputs:**
- **`G` (Geometry):** Geometry to preview
- **`M` (Shader):** The material override

**Outputs:**
- *This component has no outputs.*

### Dot Display
**Nickname:** `Dots`
**Description:** Draw a collection of coloured dots
**GUID:** `6b1bd8b2-47a4-4aa6-a471-3fd91c62a486`

**Inputs:**
- **`P` (Point):** Dot location
- **`C` (Colour):** Dot colour
- **`S` (Number):** Dot size

**Outputs:**
- *This component has no outputs.*

### Symbol (Advanced)
**Nickname:** `SymAdv`
**Description:** Advanced symbol display properties
**GUID:** `e5c82975-8011-412c-b56d-bb7fc9e7f28d`

**Inputs:**
- **`X` (Integer):** Symbol style
- **`S1` (Number):** Symbol size
- **`S2` (Number):** Alternative size or offset (depending on style).
- **`R` (Number):** Rotation angle
- **`Cf` (Colour):** Fill colour
- **`Ce` (Colour):** Edge colour
- **`W` (Number):** Edge width
- **`A` (Boolean):** Adjust apparent size based on view

**Outputs:**
- **`D` (Symbol Display):** Symbol display properties

### Symbol (Simple)
**Nickname:** `SymSim`
**Description:** Simple symbol display properties
**GUID:** `79747717-1874-4c34-b790-faef53b50569`

**Inputs:**
- **`X` (Integer):** Symbol style
- **`S` (Number):** Primary radius or outer size
- **`R` (Number):** Rotation angle
- **`C` (Colour):** Main colour

**Outputs:**
- **`D` (Symbol Display):** Symbol display properties

### Symbol Display
**Nickname:** `Symbol`
**Description:** Display symbols
**GUID:** `62d5ead4-53c4-4d0b-b5ce-6bd6e0850ab8`

**Inputs:**
- **`P` (Point):** Symbol location
- **`D` (Symbol Display):** Symbol display properties

**Outputs:**
- *This component has no outputs.*

***

## Category: Display > Test

### Test Crash
**Nickname:** `Test Crash`
**Description:** Test crashing of GH
**GUID:** `f3c769fd-aa9b-4695-a1ce-3ad4c53d1440`

**Inputs:**
- **`C` (Boolean):** crash

**Outputs:**
- *This component has no outputs.*

***

## Category: Display > Vector

### Point List
**Nickname:** `Points`
**Description:** Displays the indices in lists of points
**GUID:** `1f18e802-4ab9-444f-bf3c-3e7e421a2acf`

**Inputs:**
- **`P` (Point):** Points to display
- **`T` (Boolean):** Draw point index numbers
- **`L` (Boolean):** Draw connecting lines
- **`S` (Number):** Optional Font size (in units)

**Outputs:**
- *This component has no outputs.*

### Point List
**Nickname:** `Points`
**Description:** Displays details about lists of points
**GUID:** `cc14daa5-911a-4fcc-8b3b-1149bf7f2eeb`

**Inputs:**
- **`P` (Point):** Points to display
- **`S` (Number):** Optional text size (in Rhino units)

**Outputs:**
- *This component has no outputs.*

### Point Order
**Nickname:** `Order`
**Description:** Displays the order of a list of points
**GUID:** `0ad9f1ab-2204-45bb-b282-474469e2fa7b`

**Inputs:**
- **`P` (Point):** Points to display

**Outputs:**
- *This component has no outputs.*

### Vector Display
**Nickname:** `VDis`
**Description:** Preview vectors in the viewport
**GUID:** `2a3f7078-2e25-4dd4-96f7-0efb491bd61c`

**Inputs:**
- **`A` (Point):** Anchor point for preview vector
- **`V` (Vector):** Vector to preview

**Outputs:**
- *This component has no outputs.*

### Vector Display Ex
**Nickname:** `VDisEx`
**Description:** Preview vectors in the viewport
**GUID:** `11e95a7b-1e2c-4b66-bd95-fcad51f8662a`

**Inputs:**
- **`P` (Point):** Start point of vector
- **`V` (Vector):** Vector to display
- **`C` (Colour):** Colour of vector
- **`W` (Integer):** Width of vector lines

**Outputs:**
- *This component has no outputs.*

***

## Category: Display > Viewport

### Viewport Display
**Nickname:** `Viewport Display`
**Description:** Display viewport on canvas
**GUID:** `b78d95bc-dffb-414c-b177-c611c92580b9`

**Inputs:**
- **`V` (Boolean):** Show viewport
- **`L` (Integer):** Viewport left
- **`T` (Integer):** Viewport top
- **`W` (Integer):** Viewport width
- **`H` (Integer):** Viewport height

**Outputs:**
- *This component has no outputs.*

***

## Category: Fologram > Flow

### Counter
**Nickname:** `C`
**Description:** Every time this component updates the value increase by 1
**GUID:** `9ddb1c65-cdfd-4b7f-8edf-69f5142da51a`

**Inputs:**
- **`T` (Generic Data):** Triggers the component to change states
- **`R` (Boolean):** Sets the counter to 0

**Outputs:**
- **`C` (Integer):** Whether the component is flipped or flopped

### Get Global Value
**Nickname:** `Get Global`
**Description:** Retrieves a global value.
This component will update when the component it is attached to updates.
**GUID:** `423a8354-6086-48d0-9582-88f6dd13b8a7`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`Global` (Generic Data):** Rename this parameter to the global variable 

### Set Global Value
**Nickname:** `Set Global`
**Description:** Sets a global value
**GUID:** `3c41341b-0da8-4913-8b4c-425d77c2fc1d`

**Inputs:**
- **`Global` (Generic Data):** Rename this parameter to the global variable 

**Outputs:**
- *This component has no outputs.*

### State Gate
**Nickname:** `T`
**Description:** Control the lock state of components in the definition based on a boolean.
**GUID:** `eef560c1-c0c3-4986-865d-bae1e6c4d563`

**Inputs:**
- **`S` (Text):** The states to activate

**Outputs:**
- **`True` (Generic Data):** The branch activated when state is True
- **`False` (Generic Data):** The branch activated when state is False

***

## Category: Fologram > Sync

### Assign Material
**Nickname:** `AssignMat`
**Description:** Assigns a material to synchronized geometry
**GUID:** `e5d07541-40bf-4829-ae4a-c448dd99dca1`

**Inputs:**
- **`G` (Synchronized Geometry (?)):** A reference to the synchronized geometry
- **`M` (Synchronized Material):** A reference to the synchronized material

**Outputs:**
- *This component has no outputs.*

### Assign Transform
**Nickname:** `AssignXfm`
**Description:** Assigns a transform to a synchronized geometry
**GUID:** `a716660c-8b4f-455e-9330-283520c01af1`

**Inputs:**
- **`G` (Synchronized Geometry (?)):** A reference to the synchronized geometry
- **`T` (Dynamic Transform):** A point, vector, plane, or transform to assign to the geometry

**Outputs:**
- *This component has no outputs.*

### Parameter Change
**Nickname:** `Chaange`
**Description:** Detects which device made a change to a parameter
**GUID:** `2fb15ad9-3756-4d4d-bdfb-809adbfe6a38`

**Inputs:**
- **`P` (Generic Data):** The parameter that changed

**Outputs:**
- **`D` (Device Reference):** The device that changed the parameter

### Sync Material
**Nickname:** `SyncMat`
**Description:** Synchronizes a material
**GUID:** `52f67fb4-d3c1-466c-88e2-7d9fe63a8939`

**Inputs:**
- **`M` (Shader):** The material

**Outputs:**
- **`M` (Synchronized Material):** A reference to the synchronized material

### Sync Object
**Nickname:** `Sync`
**Description:** Synchronizes geometry with Fologram. Right click for for display options
**GUID:** `5c1b0f38-b397-47d3-b09b-c8c129aea365`

**Inputs:**
- **`GM` (Geometry):** Breps, meshes or curves to synchronize

**Outputs:**
- **`SG` (Synchronized Geometry (?)):** A synchronized object

### Sync Text Tag
**Nickname:** `SyncTag`
**Description:** Synchronizes text tags
**GUID:** `48cf1a36-41c8-4a3f-aad0-fe5626dc93d5`

**Inputs:**
- **`T` (Text):** The text to synchronize
- **`P` (Point):** The location of the text
- **`S` (Number):** The size of the text, in your Rhino document units

**Outputs:**
- **`S` (Synchronized Geometry (?)):** A reference to the synchronized geometry

***

## Category: Fologram > Track

### Connected Devices
**Nickname:** `Devices`
**Description:** Gets the devices currently connected to Fologram
**GUID:** `93ff3a4f-2304-455f-9376-96e673f5365e`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`D` (Device Reference):** The currently connected devices

### Track Controllers
**Nickname:** `Controllers`
**Description:** Tracks the position of controllers
**GUID:** `632e8608-9ef8-4d47-886e-daa14a47f4f6`

**Inputs:**
- **`D` (Device Reference):** The device to track

**Outputs:**
- **`C` (Controller Snapshot):** The controllers of each device

### Track Device
**Nickname:** `Device`
**Description:** Tracks the position of a connected device
**GUID:** `aa4548e6-de22-461a-866a-567bc64c3128`

**Inputs:**
- **`D` (Device Reference):** The device to track

**Outputs:**
- **`T` (Pointer Snapshot):** The transform of the device

### Track Hands
**Nickname:** `Hands`
**Description:** Tracks the points and/or features of a hand
**GUID:** `7557e541-5449-40f6-a394-5891ba10a983`

**Inputs:**
- **`D` (Device Reference):** The device to track

**Outputs:**
- **`P` (Point):** The points of each hand

### Track Markers
**Nickname:** `Markers`
**Description:** Tracks QR codes or Aruco markers
**GUID:** `55841262-85b4-4262-b712-a220f256115f`

**Inputs:**
- **`D` (Device Reference):** The device to track

**Outputs:**
- **`T` (Trackable Snapshot):** The tracked data

### Track Pointers
**Nickname:** `Pointers`
**Description:** Tracks the position of device pointers
**GUID:** `1f7bb7ef-cf50-4c9c-9dec-84be10b992bb`

**Inputs:**
- **`D` (Device Reference):** The device to track

**Outputs:**
- **`R` (Pointer Snapshot):** The rays of each pointer

### Track Scan
**Nickname:** `Scan`
**Description:** Tracks changes to the users environment
**GUID:** `cb5868a1-a21b-44c9-88bb-eb8c0e9ab6b4`

**Inputs:**
- **`D` (Device Reference):** The device to track

**Outputs:**
- **`G` (Synchronized Geometry (?)):** The tracked geometry

### Track State
**Nickname:** `State`
**Description:** Tracks the state of device inputs
**GUID:** `04478be6-6703-4ade-8c95-cf4de62ec602`

**Inputs:**
- **`D` (Device Reference):** The device to track

**Outputs:**
- **`S` (Text):** The most recent state of each pointer

### Track Taps
**Nickname:** `Taps`
**Description:** Tracks taps on a set of objects
**GUID:** `125b025e-73d0-49e0-9495-fb8c1e65b129`

**Inputs:**
- **`D` (Device Reference):** The devices to track
- **`G` (Synchronized Geometry (?)):** The synchronized objects to detect clicks on

**Outputs:**
- **`D` (Device Reference):** The device that initiated the tap
- **`I` (Integer):** The index of the object that was tapped

***

## Category: Fologram > Utilities

### Decimate Mesh
**Nickname:** `Decimate`
**Description:** Decimates a mesh. C# implementation by Mattias Edlund and released under the MIT License, see https://github.com/Whinarn/MeshDecimator
**GUID:** `ebf5b362-c5c9-469f-a626-6e8dcd5f4d01`

**Inputs:**
- **`M` (Mesh):** The meshes to decimate.
- **`R` (Number):** The reduction percentage (0-1).

**Outputs:**
- **`M` (Mesh):** The decimated meshes

### Get Rhino Material
**Nickname:** `Get Material`
**Description:** Extracts materials (with textures) from Rhino document geometry.
**GUID:** `dac8eab2-48a9-4e38-859a-bb06569b8048`

**Inputs:**
- **`G` (Geometry):** The referenced geometry from the document

**Outputs:**
- **`M` (Shader):** The materials

### Mesh Pipe
**Nickname:** `MPipe`
**Description:** Pipes multiple curves into a single mesh.
**GUID:** `e46091dd-ca99-47cf-af59-dc2c4fe6f98f`

**Inputs:**
- **`P` (Curve):** The polylines to pipe.
- **`N` (Integer):** The number of sides for the pipe.
- **`T` (Number):** The maximum deviation of the pipe from the curve (splines).
- **`R` (Number):** The radius of the pipe
- **`C` (Boolean):** Cap the loft.
- **`J` (Boolean):** Join the output meshes.

**Outputs:**
- **`M` (Mesh):** The mesh pipe.

***

## Category: Intersect > Mathematical

### Brep | Line
**Nickname:** `BLX`
**Description:** Solve intersection events for a Brep and a line.
**GUID:** `ed0742f9-6647-4d95-9dfd-9ad17080ae9c`

**Inputs:**
- **`B` (Brep):** Base Brep
- **`L` (Line):** Intersection line

**Outputs:**
- **`C` (Curve):** Intersection overlap curves
- **`P` (Point):** Intersection points

### Brep | Plane
**Nickname:** `Sec`
**Description:** Solve intersection events for a Brep and a plane (otherwise known as section).
**GUID:** `4fe828e8-fa95-4cc5-9a8c-c33856ecc783`

**Inputs:**
- **`B` (Brep):** Base Brep
- **`P` (Plane):** Section plane

**Outputs:**
- **`C` (Curve):** Section curves
- **`P` (Point):** Section points

### Contour
**Nickname:** `Contour`
**Description:** Create a set of Brep or Mesh contours
**GUID:** `3b112fb6-3eba-42d2-ba75-0f903c18faab`

**Inputs:**
- **`S` (Geometry):** Brep or Mesh to contour
- **`P` (Point):** Contour start point
- **`N` (Vector):** Contour normal direction
- **`D` (Number):** Distance between contours

**Outputs:**
- **`C` (Curve):** Resulting contours (grouped by section)

### Contour (ex)
**Nickname:** `Contour`
**Description:** Create a set of Brep or Mesh contours
**GUID:** `246cda78-5e88-4087-ba09-ae082bbc4af8`

**Inputs:**
- **`S` (Geometry):** Brep or Mesh to contour
- **`P` (Plane):** Base plane for contours
- **`O` (Number):** Contour offsets from base plane (if omitted, you must specify distances instead)
- **`D` (Number):** Distances between contours (if omitted, you must specify offset instead)

**Outputs:**
- **`C` (Curve):** Resulting contours (grouped by section)

### Curve | Line
**Nickname:** `CLX`
**Description:** Solve intersection events for a curve and a line.
**GUID:** `0e3173b6-91c6-4845-a748-e45d4fdbc262`

**Inputs:**
- **`C` (Curve):** Curve to intersect
- **`L` (Line):** Line to intersect with

**Outputs:**
- **`P` (Point):** Intersection events
- **`t` (Number):** Parameters on curve
- **`N` (Integer):** Number of intersection events

### Curve | Plane
**Nickname:** `PCX`
**Description:** Solve intersection events for a curve and a plane.
**GUID:** `b7c12ed1-b09a-4e15-996f-3fa9f3f16b1c`

**Inputs:**
- **`C` (Curve):** Base curve
- **`P` (Plane):** Intersection plane

**Outputs:**
- **`P` (Point):** Intersection events
- **`t` (Number):** Parameters {t} on curve
- **`uv` (Point):** Parameters {uv} on plane

### IsoVist
**Nickname:** `IVist`
**Description:** Compute an isovist sampling at a location
**GUID:** `cab92254-1c79-4e5a-9972-0a4412b35c88`

**Inputs:**
- **`P` (Plane):** Sampling plane and origin
- **`N` (Integer):** Sample count
- **`R` (Number):** Sample radius
- **`O` (Geometry):** Obstacle outlines

**Outputs:**
- **`P` (Point):** Intersection points of the sample rays with the obstacles
- **`D` (Number):** List of intersection distances
- **`I` (Integer):** List of obstacle indices for each hit, or -1 if no obstacle was hit

### IsoVist Ray
**Nickname:** `IVRay`
**Description:** Compute a single isovist sample at a location
**GUID:** `93d0dcbc-6207-4745-aaf7-fe57a880f959`

**Inputs:**
- **`S` (Line):** Sampling ray
- **`R` (Number):** Sample radius
- **`O` (Geometry):** Obstacle outlines (curves, planes, meshes and breps are allowed)

**Outputs:**
- **`P` (Point):** Intersection point of the sample ray with the obstacles
- **`D` (Number):** Distance from ray start to intersection point
- **`I` (Integer):** Obstacle index for hit, or -1 if no obstacle was hit

### Line | Line
**Nickname:** `LLX`
**Description:** Solve intersection events for two lines.
**GUID:** `6d4b82a7-8c1d-4bec-af7b-ca321ba4beb1`

**Inputs:**
- **`A` (Line):** First line for intersection
- **`B` (Line):** Second line for intersection

**Outputs:**
- **`tA` (Number):** Parameter on line A
- **`tB` (Number):** Parameter on line B
- **`pA` (Point):** Point on line A
- **`pB` (Point):** Point on line B

### Line | Plane
**Nickname:** `PLX`
**Description:** Solve intersection event for a line and a plane.
**GUID:** `75d0442c-1aa3-47cf-bd94-457b42c16e9f`

**Inputs:**
- **`L` (Line):** Base line
- **`P` (Plane):** Intersection plane

**Outputs:**
- **`P` (Point):** Intersection event
- **`t` (Number):** Parameter {t} on infinite line
- **`uv` (Point):** Parameter {uv} on plane

### Mesh | Plane
**Nickname:** `Sec`
**Description:** Solve intersection events for a Mesh and a Plane (otherwise known as section).
**GUID:** `3b1ae469-0e9b-461d-8c30-fa5a7de8b7a9`

**Inputs:**
- **`M` (Mesh):** Base Mesh
- **`P` (Plane):** Section plane

**Outputs:**
- **`C` (Curve):** Section polylines

### Mesh | Ray
**Nickname:** `MeshRay`
**Description:** Intersect a mesh with a semi-infinite ray
**GUID:** `4c02a168-9aba-4f42-8951-2719f24d391f`

**Inputs:**
- **`M` (Mesh):** Mesh to intersect
- **`P` (Point):** Ray start point
- **`D` (Vector):** Ray direction

**Outputs:**
- **`X` (Point):** First intersection point
- **`H` (Boolean):** Boolean indicating hit or miss

### Plane Region
**Nickname:** `PlReg`
**Description:** Create a bounded region from intersecting planes.
**GUID:** `80e3614a-25ae-43e7-bb0a-760e68ade864`

**Inputs:**
- **`P` (Plane):** Region plane and origin
- **`B` (Plane):** Region bounding planes

**Outputs:**
- **`R` (Curve):** Bounded region

### Plane | Plane
**Nickname:** `PPX`
**Description:** Solve the intersection event of two planes.
**GUID:** `290cf9c4-0711-4704-851e-4c99e3343ac5`

**Inputs:**
- **`A` (Plane):** First plane
- **`B` (Plane):** Second plane

**Outputs:**
- **`L` (Line):** Intersection line

### Plane | Plane | Plane
**Nickname:** `3PX`
**Description:** Solve the intersection events of three planes.
**GUID:** `f1ea5a4b-1a4f-4cf4-ad94-1ecfb9302b6e`

**Inputs:**
- **`A` (Plane):** First plane
- **`B` (Plane):** Second plane
- **`C` (Plane):** Third plane

**Outputs:**
- **`Pt` (Point):** Intersection point
- **`AB` (Line):** Intersection line between A and B
- **`AC` (Line):** Intersection line between A and C
- **`BC` (Line):** Intersection line between B and C

### Surface | Line
**Nickname:** `SLX`
**Description:** Solve intersection events for a surface and a line.
**GUID:** `a834e823-ae01-44d8-9066-c138eeb6f391`

**Inputs:**
- **`S` (Surface):** Base surface
- **`L` (Line):** Intersection line

**Outputs:**
- **`C` (Curve):** Intersection overlap curves
- **`P` (Point):** Intersection points
- **`uv` (Point):** Surface {uv} coordinates at intersection events
- **`N` (Vector):** Surface normal vector at intersection events

***

## Category: Intersect > Physical

### Brep | Brep
**Nickname:** `BBX`
**Description:** Solve intersection events for two Breps.
**GUID:** `904e4b56-484a-4814-b35f-aa4baf362117`

**Inputs:**
- **`A` (Brep):** First Brep
- **`B` (Brep):** Second Brep

**Outputs:**
- **`C` (Curve):** Intersection curves
- **`P` (Point):** Intersection points

### Brep | Curve
**Nickname:** `BCX`
**Description:** Solve intersection events for a Brep and a curve.
**GUID:** `20ef81e8-df15-4a0c-acf1-993a7607cafb`

**Inputs:**
- **`B` (Brep):** Base Brep
- **`C` (Curve):** Intersection curve

**Outputs:**
- **`C` (Curve):** Intersection overlap curves
- **`P` (Point):** Intersection points

### Clash
**Nickname:** `Clash`
**Description:** Perform clash analysis on a set of shapes.
**GUID:** `4439a51b-8d24-4924-b8e2-f77e7f8f5bec`

**Inputs:**
- **`A` (Mesh):** First set of shapes
- **`B` (Mesh):** Second set of shapes
- **`D` (Number):** Distance tolerance for clash detection
- **`L` (Integer):** Maximum number of results to search for.

**Outputs:**
- **`N` (Integer):** Number of clashes found
- **`P` (Point):** Collection of clashing points.
- **`R` (Number):** Collection of clashing radii (one for each point).
- **`i` (Integer):** Index of clashing mesh in first set.
- **`j` (Integer):** Index of clashing mesh in second set.

### Collision Many|Many
**Nickname:** `ColMM`
**Description:** Test for many|many collision between objects
**GUID:** `2168853c-acd8-4a63-9c9b-ecde9e239eae`

**Inputs:**
- **`C` (Geometry):** Objects for collision

**Outputs:**
- **`C` (Boolean):** True if object at this index collides with any of the other objects
- **`I` (Integer):** Index of object in set which collided with the object at this index

### Collision One|Many
**Nickname:** `ColOM`
**Description:** Test for one|many collision between objects
**GUID:** `bb6c6501-0500-4678-859b-b838348981d1`

**Inputs:**
- **`C` (Geometry):** Object for collision
- **`O` (Geometry):** Obstacles for collision

**Outputs:**
- **`C` (Boolean):** True if objects collides with any of the obstacles
- **`I` (Integer):** Index of first obstacle that collides with the object

### Curve | Curve
**Nickname:** `CCX`
**Description:** Solve intersection events for two curves.
**GUID:** `84627490-0fb2-4498-8138-ad134ee4cb36`

**Inputs:**
- **`A` (Curve):** First curve
- **`B` (Curve):** Second curve

**Outputs:**
- **`P` (Point):** Intersection events
- **`tA` (Number):** Parameters on first curve
- **`tB` (Number):** Parameters on second curve

### Curve | Self
**Nickname:** `CX`
**Description:** Solve all self intersection events for a curve.
**GUID:** `0991ac99-6a0b-47a9-b07d-dd510ca57f0f`

**Inputs:**
- **`C` (Curve):** Curve for self-intersections

**Outputs:**
- **`P` (Point):** Intersection events
- **`t` (Number):** Parameters on curve

### Mesh | Curve
**Nickname:** `MCX`
**Description:** Mesh Curve intersection
**GUID:** `19632848-4b95-4e5e-9e86-b79b47987a46`

**Inputs:**
- **`M` (Mesh):** Mesh to intersect
- **`C` (Curve):** Curve to intersect with

**Outputs:**
- **`X` (Point):** Intersection points
- **`F` (Integer):** Intersection face index for each point

### Mesh | Mesh
**Nickname:** `MMX`
**Description:** Mesh Mesh intersection
**GUID:** `21b6a605-9568-4bf8-acc1-631565d609d7`

**Inputs:**
- **`A` (Mesh):** First mesh
- **`B` (Mesh):** Second mesh

**Outputs:**
- **`X` (Curve):** Intersection polylines

### Multiple Curves
**Nickname:** `MCX`
**Description:** Solve intersection events for multiple curves.
**GUID:** `931e6030-ccb3-4a7b-a89a-99dcce8770cd`

**Inputs:**
- **`C` (Curve):** Curves to intersect

**Outputs:**
- **`P` (Point):** Intersection events
- **`iA` (Integer):** Index of first intersection curve
- **`iB` (Integer):** Index of second intersection curve
- **`tA` (Number):** Parameter on first curve
- **`tB` (Number):** Parameter on second curve

### Surface Split
**Nickname:** `SrfSplit`
**Description:** Split a surface with a bunch of curves.
**GUID:** `7db14002-c09c-4d7b-9f80-e4e2b00dfa1d`

**Inputs:**
- **`S` (Surface):** Base surface
- **`C` (Curve):** Splitting curves

**Outputs:**
- **`F` (Surface):** Splitting fragments

### Surface | Curve
**Nickname:** `SCX`
**Description:** Solve intersection events for a surface and a curve.
**GUID:** `68546dd0-aa82-471c-87e9-81cb16ac50ed`

**Inputs:**
- **`S` (Surface):** Base surface
- **`C` (Curve):** Intersection curve

**Outputs:**
- **`C` (Curve):** Intersection overlap curves
- **`P` (Point):** Intersection points
- **`uv` (Point):** Surface {uv} coordinates at intersection events
- **`N` (Vector):** Surface normal vector at intersection events
- **`t` (Number):** Curve parameter at intersection events
- **`T` (Vector):** Curve tangent vector at intersection events

***

## Category: Intersect > Region

### Split with Brep
**Nickname:** `Split`
**Description:** Split a curve with a Brep.
**GUID:** `4bdc2eb0-24ed-4c90-a27b-a32db069eaef`

**Inputs:**
- **`C` (Curve):** Curve to split
- **`B` (Brep):** Brep to split with

**Outputs:**
- **`C` (Curve):** Split curves
- **`P` (Point):** Split points

### Split with Breps
**Nickname:** `Split`
**Description:** Split a curve with multiple Breps.
**GUID:** `5b742537-9bcb-4f06-9613-866da5bf845e`

**Inputs:**
- **`C` (Curve):** Curve to trim
- **`B` (Brep):** Brep to trim against

**Outputs:**
- **`C` (Curve):** Split curves
- **`P` (Point):** Split points

### Trim with Brep
**Nickname:** `Trim`
**Description:** Trim a curve with a Brep.
**GUID:** `3eba04bc-00e8-416d-b58f-a3dc8b3e22e2`

**Inputs:**
- **`C` (Curve):** Curve to trim
- **`B` (Brep):** Brep to trim against

**Outputs:**
- **`Ci` (Curve):** Split curves inside the Brep
- **`Co` (Curve):** Split curves outside the Brep

### Trim with Breps
**Nickname:** `Trim`
**Description:** Trim a curve with multiple Breps.
**GUID:** `916e7ebc-524c-47ce-8936-e50a09a7b43c`

**Inputs:**
- **`C` (Curve):** Curve to trim
- **`B` (Brep):** Breps to trim against

**Outputs:**
- **`Ci` (Curve):** Split curves on the inside of the trimming Breps
- **`Co` (Curve):** Split curves on the outside of the trimming Breps

### Trim with Region
**Nickname:** `Trim`
**Description:** Trim a curve with a region.
**GUID:** `3092caf0-7cf9-4885-bcc0-e635d878832a`

**Inputs:**
- **`C` (Curve):** Curve to trim
- **`R` (Curve):** Region to trim against
- **`P` (Plane):** Optional solution plane. If omitted the curve best-fit plane is used.

**Outputs:**
- **`Ci` (Curve):** Split curves inside the region
- **`Co` (Curve):** Split curves outside the region

### Trim with Regions
**Nickname:** `Trim`
**Description:** Trim a curve with multiple regions.
**GUID:** `26949c81-9b50-43b7-ac49-3203deb6eec7`

**Inputs:**
- **`C` (Curve):** Curve to trim
- **`R` (Curve):** Regions to trim against
- **`P` (Plane):** Optional solution plane. If omitted the curve best-fit plane is used.

**Outputs:**
- **`Ci` (Curve):** Split curves inside the regions
- **`Co` (Curve):** Split curves outside the regions

***

## Category: Intersect > Shape

### Boundary Volume
**Nickname:** `BVol`
**Description:** Create a closed polysurface from boundary surfaces
**GUID:** `b57bf805-046a-4360-ad76-51aeddfe9720`

**Inputs:**
- **`B` (Brep):** Boundary surfaces

**Outputs:**
- **`S` (Brep):** Solid volume

### Box Slits
**Nickname:** `Slits`
**Description:** Add slits to a collection of intersecting boxes
**GUID:** `2d3b6ef3-5c26-4e2f-bcb3-8ffb9fb0f7c3`

**Inputs:**
- **`B` (Box):** Boxes to intersect
- **`G` (Number):** Additional gap width

**Outputs:**
- **`B` (Brep):** Boxes with slits
- **`T` (Integer):** Slit topology

### Mesh Difference
**Nickname:** `MDif`
**Description:** Perform a solid difference on two sets of meshes
**GUID:** `4f3147f4-9fcd-4a7e-be0e-b1841caa5f97`

**Inputs:**
- **`A` (Mesh):** First mesh set
- **`B` (Mesh):** Second mesh set

**Outputs:**
- **`R` (Mesh):** Difference result of A-B

### Mesh Intersection
**Nickname:** `MInt`
**Description:** Perform a solid intersection on a set of meshes
**GUID:** `95aef4f6-66fc-477e-b8f8-32395a837831`

**Inputs:**
- **`A` (Mesh):** First mesh set
- **`B` (Mesh):** Second mesh set

**Outputs:**
- **`R` (Mesh):** Intersection result of A&B

### Mesh Split
**Nickname:** `MSplit`
**Description:** Mesh Mesh split
**GUID:** `afbf2fe0-4965-48d2-8470-9e991540093b`

**Inputs:**
- **`M` (Mesh):** Mesh to split
- **`S` (Mesh):** Meshes to split with

**Outputs:**
- **`R` (Mesh):** Result of mesh split

### Mesh Union
**Nickname:** `MUnion`
**Description:** Perform a solid union on a set of meshes
**GUID:** `88060a82-0bf7-46bb-9af8-bdc860cf7e1d`

**Inputs:**
- **`M` (Mesh):** Meshes to union

**Outputs:**
- **`R` (Mesh):** Mesh solid union result

### Region Difference
**Nickname:** `RDiff`
**Description:** Difference between two sets of planar closed curves (regions)
**GUID:** `f72c480b-7ee6-42ef-9821-c371e9203b44`

**Inputs:**
- **`A` (Curve):** Curves to subtract from.
- **`B` (Curve):** Curves to subtract.
- **`P` (Plane):** Optional plane for boolean solution

**Outputs:**
- **`R` (Curve):** Result outlines of boolean difference (A - B)

### Region Intersection
**Nickname:** `RInt`
**Description:** Intersection between two sets of planar closed curves (regions)
**GUID:** `477c2e7b-c5e5-421e-b8b2-ba60cdf5398b`

**Inputs:**
- **`A` (Curve):** First set of regions.
- **`B` (Curve):** Second set of regions.
- **`P` (Plane):** Optional plane for boolean solution

**Outputs:**
- **`R` (Curve):** Result outlines of boolean intersection (A and B)

### Region Slits
**Nickname:** `RSlits`
**Description:** Add slits to a collection of intersecting planar regions
**GUID:** `0feeeaca-8f1f-4d7c-a24a-8e7dd68604a2`

**Inputs:**
- **`R` (Curve):** Planar regions to intersect
- **`W` (Number):** Width of slits
- **`G` (Number):** Additional gap size at slit meeting points

**Outputs:**
- **`R` (Surface):** Regions with slits
- **`T` (Integer):** Slit topology

### Region Union
**Nickname:** `RUnion`
**Description:** Union of a set of planar closed curves (regions)
**GUID:** `1222394f-0d33-4f31-9101-7281bde89fe5`

**Inputs:**
- **`C` (Curve):** Curves for boolean union operation
- **`P` (Plane):** Optional plane for boolean solution

**Outputs:**
- **`R` (Curve):** Result outlines of boolean union

### Solid Difference
**Nickname:** `SDiff`
**Description:** Perform a solid difference on two Brep sets.
**GUID:** `fab11c30-2d9c-4d15-ab3c-2289f1ae5c21`

**Inputs:**
- **`A` (Brep):** First Brep set
- **`B` (Brep):** Second Brep set

**Outputs:**
- **`R` (Brep):** Difference result

### Solid Intersection
**Nickname:** `SInt`
**Description:** Perform a solid intersection on two Brep sets.
**GUID:** `5723c845-cafc-442d-a667-8c76532845e6`

**Inputs:**
- **`A` (Brep):** First Brep set
- **`B` (Brep):** Second Brep set

**Outputs:**
- **`R` (Brep):** Intersection result

### Solid Union
**Nickname:** `SUnion`
**Description:** Perform a solid union on a set of Breps.
**GUID:** `10434a15-da85-4281-bb64-a2b3a995b9c6`

**Inputs:**
- **`B` (Brep):** Breps to union

**Outputs:**
- **`R` (Brep):** Union result

### Split Brep
**Nickname:** `Split`
**Description:** Split one brep with another.
**GUID:** `ef6b26f4-f820-48d6-b0c5-85898ef8888b`

**Inputs:**
- **`B` (Brep):** Brep to split
- **`C` (Brep):** Cutting shape

**Outputs:**
- **`R` (Brep):** Brep fragments

### Split Brep Multiple
**Nickname:** `SplitMul`
**Description:** Split one brep with a bunch of others.
**GUID:** `03f22640-ff80-484e-bb53-a4025c5faa07`

**Inputs:**
- **`B` (Brep):** Brep to split
- **`C` (Brep):** Cutting shapes

**Outputs:**
- **`R` (Brep):** Brep fragments

### Trim Solid
**Nickname:** `Trim`
**Description:** Cut holes into a shape with a set of solid cutters.
**GUID:** `f0b70e8e-7337-4ce4-a7bb-317fc971f918`

**Inputs:**
- **`S` (Brep):** Shape to trim
- **`T` (Brep):** Trimming shapes

**Outputs:**
- **`R` (Brep):** Shape with holes

***

## Category: Kangaroo2 > Goals

### Length(Pts)
**Nickname:** `Length(Pts)`
**Description:** Length(Pts)
**GUID:** `c681ef8e-fbf7-4277-a6a8-8a00d94cc953`

**Inputs:**
- **`Start` (Generic Data):** Start
- **`End` (Generic Data):** End
- **`Length` (Number):** Length
- **`Strength` (Number):** Strength

**Outputs:**
- **`S` (Generic Data):** Spring out

### RigidBody
**Nickname:** `RigidBody`
**Description:** RigidBody
**GUID:** `559ec10e-2671-4bba-b5a7-11816e8fb17b`

**Inputs:**
- **`Part` (Mesh):** Part
- **`Points` (Point):** Points to attach to the rigid body
- **`Strength` (Number):** Strength

**Outputs:**
- **`RB` (Generic Data):** RB

***

## Category: Kangaroo2 > Goals-6dof

### AlignFaces
**Nickname:** `AlignFaces`
**Description:** Align faces of a pair of rigid bodies
**GUID:** `eda40a97-17ec-4a46-99bc-21d952b80ece`

**Inputs:**
- **`PlaneA` (Plane):** The frame of one rigid body
- **`PlaneB` (Plane):** The frame of the other rigid body
- **`FaceA` (Plane):** The plane on body A to align
- **`FaceB` (Plane):** The plane on body B to align
- **`Flip` (Boolean):** Reverse the relative direction of the planes
- **`Strength` (Number):** Strength

**Outputs:**
- **`A` (Generic Data):** A

### Beam
**Nickname:** `Beam`
**Description:** Beam resisting bending and torsion
**GUID:** `3f8b0f83-6e8e-4a9d-b0ff-9474cc9eb89b`

**Inputs:**
- **`StartFrame` (Plane):** The plane at one end of the beam, its Z axis aligned with the beam direction
- **`EndFrame` (Plane):** Should be parallel to StartFrame
- **`StartNode` (Plane):** The plane defining the node the start of the beam attaches to. If none supplied this defaults to XY aligned
- **`EndNode` (Plane):** The plane defining the node the end of the beam attaches to. If none supplied this defaults to XY aligned
- **`E` (Number):** Young's Modulus
- **`A` (Number):** Cross-section area
- **`Ix` (Number):** 2nd moment of area about X
- **`Iy` (Number):** 2nd moment of area about Y
- **`GJ` (Number):** Shear modulus * torsional constant

**Outputs:**
- **`B` (Generic Data):** B

### Concentric
**Nickname:** `Concentric`
**Description:** Align axes of a pair of rigid bodies
**GUID:** `ec32b3f0-38ac-4c29-9af8-1043d66ff3c5`

**Inputs:**
- **`PlaneA` (Plane):** The frame of one rigid body
- **`PlaneB` (Plane):** The frame of the other rigid body
- **`AxisA` (Line):** The axis of the first body
- **`AxisB` (Line):** The axis of the other body
- **`Flip` (Boolean):** Reverse the relative direction of the axes
- **`Strength` (Number):** Strength

**Outputs:**
- **`C` (Generic Data):** C

### RigidBody
**Nickname:** `RigidBody`
**Description:** RigidBody
**GUID:** `76b38cca-507d-409e-a773-044b2577d0b4`

**Inputs:**
- **`Part` (Brep):** Part
- **`Plane` (Plane):** The initial frame of the body. If none supplied, an XY aligned plane at the centroid will be used
- **`Points` (Point):** Optional points to attach to the rigid body
- **`Strength` (Number):** Strength

**Outputs:**
- **`RB` (Generic Data):** RB

### RigidBody
**Nickname:** `RigidBody`
**Description:** RigidBody
**GUID:** `e245de5b-6d3b-48d3-8092-3bf0202ebf8f`

**Inputs:**
- **`Part` (Generic Data):** Part as a Mesh or Brep
- **`Plane` (Plane):** The initial frame of the body. If none supplied, an XY aligned plane at the centroid will be used
- **`Points` (Point):** Optional points to attach to the rigid body
- **`Strength` (Number):** Strength

**Outputs:**
- **`RB` (Generic Data):** RB
- **`P` (Plane):** The planes of the rigid bodies

### RigidBodyCollide
**Nickname:** `RigidBodyCollide`
**Description:** Collision between a pair of rigid bodies
**GUID:** `b01ceba0-0bff-4901-af2a-daca22f8fc07`

**Inputs:**
- **`MeshA` (Mesh):** MeshA
- **`MeshB` (Mesh):** MeshB
- **`PlaneA` (Plane):** The initial frame of meshA
- **`PlaneB` (Plane):** The initial frame of meshB
- **`Strength` (Number):** Strength

**Outputs:**
- **`SC` (Generic Data):** SC

### RigidPointSet
**Nickname:** `RigidPointSet`
**Description:** A set of points which maintain their relative positions
**GUID:** `8aa5774d-422a-433b-9a3f-667946bde157`

**Inputs:**
- **`Points` (Point):** Rigid point set
- **`Plane` (Plane):** The initial frame of the body. If none supplied, an XY aligned plane at the centroid will be used
- **`Strength` (Number):** Strength

**Outputs:**
- **`RB` (Generic Data):** RB
- **`P` (Plane):** The planes of the rigid bodies

### SolidPlaneCollide
**Nickname:** `SolidPlaneCollide`
**Description:** Collision between a plane and a solid
**GUID:** `81cc6201-6cda-4954-8503-66be5363aac8`

**Inputs:**
- **`Solid` (Mesh):** Solid
- **`SolidPlane` (Plane):** The initial frame of the solid
- **`CollisionPlane` (Plane):** The plane to collide with
- **`Strength` (Number):** Strength

**Outputs:**
- **`SP` (Generic Data):** SP

### Support
**Nickname:** `Support`
**Description:** Set support conditions for a beam end or rigid body
**GUID:** `0b3b7956-f88b-4ca3-99f6-b6508a8dac3f`

**Inputs:**
- **`Frame` (Plane):** The plane to restrain
- **`Target` (Plane):** Target plane. If none supplied, the initial Frame will be used
- **`X` (Boolean):** Translation in X
- **`Y` (Boolean):** Translation in Y
- **`Z` (Boolean):** Translation in Z
- **`XX` (Boolean):** Rotation about X
- **`YY` (Boolean):** Rotation about Y
- **`ZZ` (Boolean):** Rotation about Z
- **`Strength` (Number):** Strength

**Outputs:**
- **`S` (Generic Data):** S

### Support
**Nickname:** `Support`
**Description:** Set support conditions for a beam end or rigid body
**GUID:** `c41696fc-e8e8-42c9-89b2-a5a6aac030b0`

**Inputs:**
- **`Frame` (Plane):** The plane to restrain
- **`X` (Boolean):** Translation in X
- **`Y` (Boolean):** Translation in Y
- **`Z` (Boolean):** Translation in Z
- **`XX` (Boolean):** Rotation about X
- **`YY` (Boolean):** Rotation about Y
- **`ZZ` (Boolean):** Rotation about Z
- **`Strength` (Number):** Strength

**Outputs:**
- **`S` (Generic Data):** S

***

## Category: Kangaroo2 > Goals-Angle

### Angle
**Nickname:** `Angle`
**Description:** Angle
**GUID:** `f5f95b51-7431-4e80-a32f-d33e5dee53a5`

**Inputs:**
- **`LineA` (Line):** First line segment
- **`LineB` (Line):** Second line segment
- **`RestAngle` (Number):** RestAngle in radians - if none provided current angle will be used
- **`Strength` (Number):** Strength

**Outputs:**
- **`A` (Generic Data):** Angle out

### AngleSnap
**Nickname:** `AS`
**Description:** Snap the angle between 2 lines to the closest whole number multiple of a given value
**GUID:** `c5ca5c17-3d7c-4848-b994-a7406dc519ed`

**Inputs:**
- **`LineA` (Line):** First line segment
- **`LineB` (Line):** Second line segment
- **`Factor` (Number):** Angle will become an integer multiple of this value (in radians)
- **`Strength` (Number):** Strength

**Outputs:**
- **`A` (Generic Data):** Angle out

### ClampAngle
**Nickname:** `ClampAngle`
**Description:** Keep an angle between 2 lines within a given range
**GUID:** `d228945d-3133-412f-9283-d2ac418e82a2`

**Inputs:**
- **`LineA` (Line):** First line segment
- **`LineB` (Line):** Second line segment
- **`Upper` (Number):** Maximum allowed angle in radians
- **`Lower` (Number):** Minimum allowed angle in radians
- **`Strength` (Number):** Strength

**Outputs:**
- **`C` (Generic Data):** ClampAngle out

### EqualAngle
**Nickname:** `EA`
**Description:** Equalize angles between multiple pairs of lines
**GUID:** `f8e123b6-517c-409a-9a2f-c3acf58617cd`

**Inputs:**
- **`LineA` (Line):** First line segment of each pair
- **`LineB` (Line):** Second line segment of each pair
- **`Strength` (Number):** Strength

**Outputs:**
- **`EA` (Generic Data):** EqualAngle Goal

### G2
**Nickname:** `G2`
**Description:** Maintain curvature continuity between 2 nurbs curves
**GUID:** `8abedb3c-ff82-46ea-8f77-fcb236b55d89`

**Inputs:**
- **`Points` (Point):** 5 points - the three control points at the end of the 1st curve, and the 3 at the start of the 2nd curve, with the middle one shared by both
- **`Strength` (Number):** Strength

**Outputs:**
- **`G2` (Generic Data):** G2 Goal

### Rod
**Nickname:** `Rod`
**Description:** Bending and stretching resistant rod
**GUID:** `51cbcf97-8cf9-4f52-9941-a9b484593db2`

**Inputs:**
- **`Polyline` (Curve):** Polyline to turn into rod
- **`LengthFactor` (Number):** Target edge length as a multiple of current length
- **`AngleFactor` (Number):** Target angle as a multiple of current angle
- **`AxialStrength` (Number):** Axial Strength
- **`BendStrength` (Number):** Bending Strength

**Outputs:**
- **`R` (Generic Data):** out

***

## Category: Kangaroo2 > Goals-Co

### CoCircular
**Nickname:** `CoCircular`
**Description:** CoCircular
**GUID:** `6e9f7437-714b-4140-99e8-0842de58f59c`

**Inputs:**
- **`Points` (Point):** Points to make coplanar
- **`Strength` (Number):** Strength

**Outputs:**
- **`C` (Generic Data):** CoCircular out

### CoLinear
**Nickname:** `CoLinear`
**Description:** CoLinear
**GUID:** `236d3928-a06f-4c60-bd2d-787691421391`

**Inputs:**
- **`Points` (Point):** Points to make coLinear
- **`Strength` (Number):** Strength

**Outputs:**
- **`C` (Generic Data):** CoLinear out

### CoPlanar
**Nickname:** `CoPlanar`
**Description:** CoPlanar
**GUID:** `8f78572b-7fd0-4795-b444-3de3ca5933ae`

**Inputs:**
- **`Points` (Point):** Points to make coplanar
- **`Strength` (Number):** Strength

**Outputs:**
- **`C` (Generic Data):** Coplanar out

### CoSpherical
**Nickname:** `CoSpherical`
**Description:** CoSpherical
**GUID:** `dd500398-727a-466f-9b51-83634266a83a`

**Inputs:**
- **`Points` (Point):** Points to make coSpherical
- **`Strength` (Number):** Strength

**Outputs:**
- **`C` (Generic Data):** CoSpherical out

***

## Category: Kangaroo2 > Goals-Col

### Collide2d
**Nickname:** `C2d`
**Description:** Collisions between closed polygons in a given plane
**GUID:** `4dd9ea95-2ec8-44e3-a772-0e5889d95344`

**Inputs:**
- **`Polylines` (Curve):** Closed Polylines to collide
- **`Plane` (Plane):** Plane in which to check for collisions
- **`Strength` (Number):** Strength

**Outputs:**
- **`C` (Generic Data):** C

### Collider
**Nickname:** `Collider`
**Description:** Collisions between thickened line segments and spheres
**GUID:** `94bf912d-4d0c-4764-a100-5813a98a8b73`

**Inputs:**
- **`Objects` (Generic Data):** Lines or points
- **`Radii` (Number):** A radius for each item in Objects. Alternatively, a single value to use for all
- **`IgnoreA` (Integer):** First index of a pair to exclude from collisions
- **`IgnoreB` (Integer):** Second index of a pair to exclude from collisions
- **`Strength` (Number):** Strength

**Outputs:**
- **`C` (Generic Data):** Collider out

### CurveCollide
**Nickname:** `CC`
**Description:** Collisions between closed curves in a given plane
**GUID:** `da30b731-7ec7-4cd5-88e6-a6009a681a13`

**Inputs:**
- **`C` (Curve):** Closed Curves to collide
- **`F` (Plane):** The frame of each curve (if none provided, a WorldXY aligned plane at the curve centroid will be used)
- **`P` (Curve):** Passive curves (they take part in collisions but are not themselves moved)
- **`B` (Plane):** Plane in which to check for collisions
- **`S` (Number):** Strength

**Outputs:**
- **`G` (Generic Data):** Connect this to the GoalObjects input of a Kangaroo Solver component
- **`F` (Plane):** The planes of each of the curves

### CurvePointCollide
**Nickname:** `CPC`
**Description:** Keep a set of points outside or inside a given 2d curve
**GUID:** `02b1c69b-b3f7-4528-988e-449a59963e5e`

**Inputs:**
- **`Points` (Point):** Points to affect
- **`Curve` (Curve):** A closed 2d curve
- **`Pl` (Plane):** Plane in which to consider collisions
- **`In` (Boolean):** If false, points will be kept outside the curve. If true they will be kept inside
- **`Strength` (Number):** Strength

**Outputs:**
- **`S` (Generic Data):** S

### ImageCircles
**Nickname:** `ImgCircles`
**Description:** Circle packing with sizes from image colours
**GUID:** `cb643f13-4969-4688-928f-5dd1dcbc8517`

**Inputs:**
- **`Pts` (Point):** Initial circle centre locations
- **`M` (Mesh):** Coloured mesh - darker areas will get smaller circles
- **`Min` (Number):** Smallest circle radius
- **`Max` (Number):** Largest circle radius
- **`Crvs` (Curve):** Optional collision curves
- **`Strength` (Number):** Strength

**Outputs:**
- **`I` (Generic Data):** ImageCircles Goal

### SoftBodyCollide
**Nickname:** `SoftBodyCollide`
**Description:** Collisions between a collection of deformable meshes
**GUID:** `86cee9bc-ba05-49ff-ad55-895ae66cc978`

**Inputs:**
- **`Meshes` (Mesh):** Meshes to collide with each other
- **`Strength` (Number):** Strength

**Outputs:**
- **`SB` (Generic Data):** SB

### SolidPointCollide
**Nickname:** `SPC`
**Description:** Keep a set of points outside or inside a given Mesh
**GUID:** `763c5b56-3dc6-4fe0-be7b-6b60cd27f744`

**Inputs:**
- **`Points` (Point):** Points to affect
- **`Solid` (Mesh):** A closed solid (Brep or mesh)
- **`In` (Boolean):** If false, points will be kept outside the solid. If true they will be kept inside
- **`Uni` (Boolean):** If true the mesh is used only as input, and is not itself affected by the collisions
- **`Strength` (Number):** Strength

**Outputs:**
- **`S` (Generic Data):** S

### SphereCollide
**Nickname:** `SC`
**Description:** Collisions between large numbers of equal sized spheres
**GUID:** `4b106d6a-0e09-4edc-941c-27d734ac4d59`

**Inputs:**
- **`Points` (Point):** List of points at the centres of the spheres to collide
- **`R` (Number):** The radius of the spheres
- **`Strength` (Number):** Strength

**Outputs:**
- **`S` (Generic Data):** S

***

## Category: Kangaroo2 > Goals-Lin

### ClampLength
**Nickname:** `ClampLength`
**Description:** Keep length within given bounds
**GUID:** `0822cf4a-be2e-4352-aed2-dad197f0611e`

**Inputs:**
- **`Line` (Curve):** Line
- **`LowerLimit` (Number):** Length will be kept above this length
- **`UpperLimit` (Number):** Length will be kept below this length
- **`Strength` (Number):** Strength

**Outputs:**
- **`C` (Generic Data):** Clamp

### ConstantTension
**Nickname:** `CT`
**Description:** An element which adapts its stiffness to maintain a constant force
**GUID:** `c9cf79b9-eced-4591-8f8e-641739df0211`

**Inputs:**
- **`Line` (Curve):** Line
- **`Strength` (Number):** Strength - positive for tension, negative for compression

**Outputs:**
- **`CT` (Generic Data):** ConstantTension out

### Direction
**Nickname:** `Direction`
**Description:** Align a line segment with a given vector, or if none supplied, the closest of the World XYZ vectors
**GUID:** `6d36a97d-811f-423a-a4a1-35a7a7637697`

**Inputs:**
- **`Line` (Line):** Line
- **`Direction` (Vector):** Direction - if none supplied, closest ortho axis will be used
- **`Strength` (Number):** Strength

**Outputs:**
- **`D` (Generic Data):** Direction out

### DynamicWeight1d
**Nickname:** `DW`
**Description:** A load in the negative Z direction, which updates its magnitude according to the length of the line
**GUID:** `7db2c4c9-15b5-4378-8495-a8f9a8db5723`

**Inputs:**
- **`Line` (Curve):** Line
- **`W` (Number):** Weight per unit length

**Outputs:**
- **`DW` (Generic Data):** DynamicWeight out

### EqualLength
**Nickname:** `EqualLength`
**Description:** EqualLength
**GUID:** `537e7b52-4f3e-4bb6-b5f5-98233a66b79d`

**Inputs:**
- **`Line` (Curve):** List of lines to make equal length
- **`Strength` (Number):** Strength

**Outputs:**
- **`E` (Generic Data):** EqualLength out

### Length(Line)
**Nickname:** `Length(Line)`
**Description:** Length(Line)
**GUID:** `091bae84-8fa9-4b35-8aad-b25b859055f6`

**Inputs:**
- **`Line` (Curve):** Line
- **`Length` (Number):** Length - If none provided, starting length will be used
- **`Strength` (Number):** Strength

**Outputs:**
- **`S` (Generic Data):** Spring out

### LengthRatio
**Nickname:** `LengthRatio`
**Description:** Maintain a fixed ratio between the lengths of a pair of lines
**GUID:** `09fef083-0d7b-4e3d-a24c-928a19a71aed`

**Inputs:**
- **`LineA` (Line):** First line segment
- **`LineB` (Line):** Second line segment
- **`Ratio` (Number):** Length B divided by Length A
- **`Strength` (Number):** Strength

**Outputs:**
- **`A` (Generic Data):** Angle out

### LengthSnap
**Nickname:** `LengthSnap`
**Description:** Snap length to whole number multiples of a given number
**GUID:** `5fa0d301-9b28-47ce-a281-5292c1b1364b`

**Inputs:**
- **`Line` (Curve):** Line
- **`Factor` (Number):** Length will become an integer multiple of this
- **`Strength` (Number):** Strength

**Outputs:**
- **`S` (Generic Data):** Snap out

### PlasticLength
**Nickname:** `PL`
**Description:** This tries to preserve the length of the line elastically, until it is deformed beyond the limit, then its rest length gets changed
**GUID:** `030749a0-2773-45d3-9647-d37662d2ad4c`

**Inputs:**
- **`Line` (Curve):** Line
- **`L` (Number):** Maximum elastic deformation distance
- **`Strength` (Number):** Strength

**Outputs:**
- **`S` (Generic Data):** Spring out

***

## Category: Kangaroo2 > Goals-Mesh

### Conicalize
**Nickname:** `Conical`
**Description:** Adjust a quad mesh to make vertices conical - so the mesh has a face-face offset (See the paper 'The focal geometry of circular and conical meshes' for details). Use together with Planarize
**GUID:** `54443347-13e2-4ad6-b68f-53c878d32c84`

**Inputs:**
- **`M` (Mesh):** M
- **`Strength` (Number):** Strength

**Outputs:**
- **`C` (Generic Data):** Planarize out

### CyclicQuad
**Nickname:** `CyclicQuad`
**Description:** Make a quadrilateral have a circumscribed circle
**GUID:** `15ab0db0-5093-4a37-854a-cee70457a847`

**Inputs:**
- **`P0` (Point):** P0
- **`P1` (Point):** P1
- **`P2` (Point):** P2
- **`P3` (Point):** P3
- **`Strength` (Number):** Strength

**Outputs:**
- **`C` (Generic Data):** Cyclic out

### CyclicQuad
**Nickname:** `CyclicQuad`
**Description:** Make a quadrilateral have a circumscribed circle
**GUID:** `5d81faae-befc-4c12-b558-beaf2ebee8f1`

**Inputs:**
- **`M` (Mesh):** M
- **`Strength` (Number):** Strength

**Outputs:**
- **`C` (Generic Data):** Cyclic out

### Developablize
**Nickname:** `Developablize`
**Description:** Turn a triangular mesh into developable patches with creases. Based on the paper 'Developability of Triangle Meshes' by Stein, Grinspun & Crane
**GUID:** `856bd786-9f29-4052-b721-0d64b7b3f3ea`

**Inputs:**
- **`M` (Mesh):** M
- **`Strength` (Number):** Strength

**Outputs:**
- **`D` (Generic Data):** out

### EdgeLengths
**Nickname:** `EdgeLengths`
**Description:** Set the edge lengths of a mesh
**GUID:** `24e2b0d2-d7b8-4478-8a83-1f04cba701a1`

**Inputs:**
- **`Mesh` (Mesh):** Mesh to set edge lengths for
- **`LengthFactor` (Number):** Target edge length as a multiple of current length
- **`Strength` (Number):** Strength

**Outputs:**
- **`EL` (Generic Data):** out

### Hinge
**Nickname:** `Hinge`
**Description:** Hinge
**GUID:** `b6b6632e-a164-491a-8874-9a214dcc79bc`

**Inputs:**
- **`FoldStart` (Point):** FoldStart
- **`FoldEnd` (Point):** FoldEnd
- **`Tip1` (Point):** Tip1
- **`Tip2` (Point):** Tip2
- **`RestAngle` (Number):** Rest angle - if none supplied, current angle will be used
- **`Strength` (Number):** Strength

**Outputs:**
- **`H` (Generic Data):** Hinge out

### Isothermic
**Nickname:** `Iso`
**Description:** Make a quad mesh S-Isothermic, as described in the paper 'Quasiisothermic Mesh Layout' by Sechelmann, Rörig & Bobenko
**GUID:** `9103348d-9ec2-4937-a04f-79c509f8093c`

**Inputs:**
- **`M` (Mesh):** A quad mesh to make isothermic
- **`Strength` (Number):** Strength

**Outputs:**
- **`G` (Generic Data):** Isothermic goals

### LiveSoap
**Nickname:** `LS`
**Description:** For generating minimal and CMC (zero and constant mean curvature respectively) meshes which adapt their connectivity during relaxation to maintain triangle quality
**GUID:** `b2389d9a-c991-4175-a35f-0d23443a15d2`

**Inputs:**
- **`M` (Mesh):** The mesh to minimize
- **`U` (Boolean):** If true this will find a CMC mesh with a given volume. If false it finds a minimal surface
- **`V` (Number):** Volume difference relative to starting mesh. Ignored if UseVolume is false
- **`S` (Number):** Strength
- **`R` (Boolean):** Reset the meshing

**Outputs:**
- **`LS` (Generic Data):** LiveSoap out

### NoFoldThrough
**Nickname:** `NoFoldThrough`
**Description:** To stop the sides of a hinge passing through each other
**GUID:** `8f083dbb-357b-4172-80d0-b584b21b6d75`

**Inputs:**
- **`FoldStart` (Point):** FoldStart
- **`FoldEnd` (Point):** FoldEnd
- **`Tip1` (Point):** Tip1
- **`Tip2` (Point):** Tip2
- **`Strength` (Number):** Strength

**Outputs:**
- **`H` (Generic Data):** HingeLimit out

### Planarize
**Nickname:** `Planarize`
**Description:** Planarize
**GUID:** `e29cdc8a-b58e-4854-aa1d-f09b43a9b6a3`

**Inputs:**
- **`M` (Mesh):** M
- **`Strength` (Number):** Strength

**Outputs:**
- **`P` (Generic Data):** Planarize out

### PlasticHinge
**Nickname:** `PH`
**Description:** Like Hinge, except folding beyond the plastic/elastic threshold will alter the rest angle
**GUID:** `69a52798-b567-4a36-b5b4-7614bea071bc`

**Inputs:**
- **`FoldStart` (Point):** FoldStart
- **`FoldEnd` (Point):** FoldEnd
- **`Tip1` (Point):** Tip1
- **`Tip2` (Point):** Tip2
- **`RestAngle` (Number):** Rest angle(in radians) - if none supplied, current angle will be used
- **`Limit` (Number):** Maximum elastic deformation angle in radians
- **`Strength` (Number):** Strength

**Outputs:**
- **`H` (Generic Data):** Hinge out

### PolygonArea
**Nickname:** `PolygonArea`
**Description:** PolygonArea
**GUID:** `f4b4e68f-150f-4c3f-bc52-cf5ec4047f79`

**Inputs:**
- **`Polyline` (Curve):** Polyline
- **`Area` (Number):** Area
- **`Strength` (Number):** Strength

**Outputs:**
- **`A` (Generic Data):** A

### Pressure
**Nickname:** `Pressure`
**Description:** A force normal to each triangle, and proportional to its area
**GUID:** `2e1fb4fb-22a8-4853-a9f5-ab65602aad77`

**Inputs:**
- **`M` (Mesh):** M
- **`Strength` (Number):** Strength

**Outputs:**
- **`P` (Generic Data):** out

### Smooth
**Nickname:** `Smooth`
**Description:** Smooth
**GUID:** `0b7b2ba2-7ecd-4f33-b138-883f6e96d08c`

**Inputs:**
- **`M` (Mesh):** M
- **`Strength` (Number):** Strength

**Outputs:**
- **`P` (Generic Data):** out

### SoapFilm
**Nickname:** `SG`
**Description:** Area minimizing triangle, for generating zero mean curvature meshes
**GUID:** `0c68b153-3c88-4e62-9827-f3793c013f88`

**Inputs:**
- **`Pts` (Point):** Pts
- **`Strength` (Number):** Strength

**Outputs:**
- **`S` (Generic Data):** Soap out

### SoapFilm
**Nickname:** `SG`
**Description:** For generating zero mean curvature meshes
**GUID:** `76ab889c-8593-4892-861d-a80b5311a981`

**Inputs:**
- **`M` (Mesh):** The mesh to minimize
- **`Strength` (Number):** Strength

**Outputs:**
- **`S` (Generic Data):** Soap out

### TangentIncircles
**Nickname:** `TangentIncircles`
**Description:** TangentIncircles
**GUID:** `3962cf86-9b9e-41d7-94f9-42bd0326291d`

**Inputs:**
- **`M` (Mesh):** Triangular mesh
- **`B` (Curve):** Optional boundary curve
- **`Strength` (Number):** Strength

**Outputs:**
- **`TI` (Generic Data):** TI out

### TangentIncircles
**Nickname:** `TangentIncircles`
**Description:** TangentIncircles
**GUID:** `56e9e40d-6d2f-4daf-9316-034f30cf24a0`

**Inputs:**
- **`EdgeStart` (Point):** EdgeStart
- **`EdgeEnd` (Point):** EdgeEnd
- **`Tip1` (Point):** Tip1
- **`Tip2` (Point):** Tip2
- **`Strength` (Number):** Strength

**Outputs:**
- **`TI` (Generic Data):** TI out

### TangentialSmooth
**Nickname:** `TSmooth`
**Description:** Smooth a mesh only in the local tangent planes. Used in conjunction with SoapFilm
**GUID:** `72dadfdd-3be9-44e3-a352-9343f3d5d3b1`

**Inputs:**
- **`M` (Mesh):** M
- **`Strength` (Number):** Strength

**Outputs:**
- **`P` (Generic Data):** out

### VertexLoads
**Nickname:** `VertexLoads`
**Description:** Apply equal vertical loads to all vertices of a mesh
**GUID:** `2b3f5029-cfec-4f95-96d1-757bd9c51da1`

**Inputs:**
- **`Mesh` (Mesh):** Mesh to apply loads to
- **`Strength` (Number):** Strength

**Outputs:**
- **`L` (Generic Data):** out

### Volume
**Nickname:** `Volume`
**Description:** Set the total volume of a mesh
**GUID:** `26efde70-0c5c-4181-af3e-1a767d64b449`

**Inputs:**
- **`M` (Mesh):** M
- **`V` (Number):** Target Volume - if none supplied, starting volume will be used
- **`Strength` (Number):** Strength

**Outputs:**
- **`V` (Generic Data):** Volume out

### Wind
**Nickname:** `Wind`
**Description:** Wind
**GUID:** `928b2951-2a01-4b6b-8ccb-6fbeb3e490ad`

**Inputs:**
- **`M` (Mesh):** Mesh to apply wind to
- **`W` (Vector):** Direction and strength of wind

**Outputs:**
- **`W` (Generic Data):** out

***

## Category: Kangaroo2 > Goals-On

### OnCurve
**Nickname:** `OnCurve`
**Description:** Keep a point on a given Curve
**GUID:** `8b4dbe32-0c6c-4304-972e-3f60ed613114`

**Inputs:**
- **`Points` (Point):** Points to keep on a Curve
- **`Curve` (Curve):** Curve
- **`Strength` (Number):** Strength

**Outputs:**
- **`P` (Generic Data):** P

### OnMesh
**Nickname:** `OnMesh`
**Description:** Keep a point on a given Mesh
**GUID:** `6c1c3018-487b-4573-afc5-3af263ae5808`

**Inputs:**
- **`Points` (Point):** Points to keep on a Mesh
- **`Mesh` (Mesh):** Mesh
- **`Strength` (Number):** Strength

**Outputs:**
- **`P` (Generic Data):** P

### OnPlane
**Nickname:** `OnPlane`
**Description:** Keep a point on a given plane
**GUID:** `d4d13384-1914-42ed-b1f2-687c1959bd14`

**Inputs:**
- **`Points` (Point):** Points to keep on a plane
- **`Plane` (Plane):** Plane (default is WorldXY)
- **`Strength` (Number):** Strength

**Outputs:**
- **`P` (Generic Data):** P

***

## Category: Kangaroo2 > Goals-Pt

### Anchor
**Nickname:** `Anchor`
**Description:** Anchor
**GUID:** `3c30b1a1-4473-4ad4-a700-ea9770726c03`

**Inputs:**
- **`P` (Point):** Point to anchor
- **`T` (Point):** Location to pull the anchor to. If left empty, the initial location will be used.
- **`Strength` (Number):** Strength

**Outputs:**
- **`A` (Generic Data):** Anchor out

### Anchor
**Nickname:** `Anchor`
**Description:** Anchor
**GUID:** `b476d3d0-4daf-489c-b91a-49f5dd72a256`

**Inputs:**
- **`P` (Point):** Point to anchor
- **`I` (Integer):** Optional explicit index
- **`Strength` (Number):** Strength

**Outputs:**
- **`A` (Generic Data):** Anchor out

### AnchorXYZ
**Nickname:** `AnchorXYZ`
**Description:** Fix a point only along chosen world axes. If you need to reset the initial position, disconnect then reconnect the Point input.
**GUID:** `2128cde3-9694-40b0-874c-670c89341acd`

**Inputs:**
- **`P` (Point):** Point to anchor
- **`X` (Boolean):** True to prevent movement in the X direction
- **`Y` (Boolean):** True to prevent movement in the Y direction
- **`Z` (Boolean):** True to prevent movement in the Z direction
- **`Strength` (Number):** Strength

**Outputs:**
- **`A` (Generic Data):** Anchor XYZ out

### Bomb
**Nickname:** `B`
**Description:** Causes an explosion after a given number of iterations
**GUID:** `2f3fd2e9-2cc4-47be-af5a-2f3916f76a92`

**Inputs:**
- **`Location` (Point):** The point which will be the center of the explosion
- **`Points` (Point):** The points which will be affected by the explosion
- **`Detonation` (Integer):** The solver iteration at which the explosion will occur
- **`Strength` (Number):** Strength
- **`Reset` (Boolean):** Connect this to the same button you have connected to the Solver component reset input

**Outputs:**
- **`B` (Generic Data):** Bomb Goal

### Coincident
**Nickname:** `C`
**Description:** Equivalent to a zero length constraint between a pair of points
**GUID:** `c955cf0a-2294-423d-bf1a-fc5cba5d2103`

**Inputs:**
- **`P0` (Point):** Point 0
- **`P1` (Point):** Point 1
- **`Strength` (Number):** Strength

**Outputs:**
- **`C` (Generic Data):** Coincident

### Floor
**Nickname:** `Floor`
**Description:** Floor
**GUID:** `14ac13f4-c22d-487c-be01-c6daf952f1be`

**Inputs:**
- **`Strength` (Number):** Strength

**Outputs:**
- **`H` (Generic Data):** Floor out

### FloorFriction
**Nickname:** `Floor`
**Description:** Floor with static friction
**GUID:** `780a08f2-c42d-4b8e-b8c9-8b3e09c318d0`

**Inputs:**
- **`P` (Point):** Points to act on
- **`L` (Number):** Limit - set to 0 for no friction
- **`S` (Number):** Strength

**Outputs:**
- **`F` (Generic Data):** Floor goal

### Load
**Nickname:** `Load`
**Description:** Load
**GUID:** `2019c995-53af-4eb2-976d-95b1fdc823fa`

**Inputs:**
- **`P` (Generic Data):** Point (as either index or Point)
- **`FV` (Vector):** FV
- **`W` (Number):** Scalar weighting factor (for most purposes you can leave this as the default 1.0)

**Outputs:**
- **`U` (Generic Data):** Unary out

### Load
**Nickname:** `Load`
**Description:** Load
**GUID:** `580a1a0c-314d-4033-a54c-c129400b4b58`

**Inputs:**
- **`P` (Generic Data):** Point (as either index or Point)
- **`FV` (Vector):** FV

**Outputs:**
- **`U` (Generic Data):** Unary out

### MagnetSnap
**Nickname:** `MS`
**Description:** Snap points together according to proximity
**GUID:** `28bedc62-006a-4f19-b97d-e12b20aff875`

**Inputs:**
- **`Points` (Point):** List of points to apply snap between
- **`R` (Number):** The distance at which the snap activates
- **`Strength` (Number):** Strength

**Outputs:**
- **`S` (Generic Data):** S

### PlasticAnchor
**Nickname:** `PlasticAnchor`
**Description:** PlasticAnchor
**GUID:** `76469b0a-11f0-4b8e-ad65-31a555d4cddd`

**Inputs:**
- **`P` (Point):** Point to anchor
- **`L` (Number):** Distance at which target point starts to slide
- **`Strength` (Number):** Strength
- **`R` (Boolean):** Reset plastic positions

**Outputs:**
- **`A` (Generic Data):** A out

### PlasticAnchor
**Nickname:** `PlasticAnchor`
**Description:** PlasticAnchor
**GUID:** `c2d6c6db-37d4-4c95-928f-7afc27842a1e`

**Inputs:**
- **`P` (Point):** Point to anchor
- **`L` (Number):** Distance at which target point starts to slide
- **`Strength` (Number):** Strength

**Outputs:**
- **`A` (Generic Data):** A out

### Transform
**Nickname:** `Transform`
**Description:** Keep a given transformation between 2 points
**GUID:** `5002d2f7-7878-4965-98ab-2403503891ab`

**Inputs:**
- **`P0` (Point):** First Point
- **`P1` (Point):** Second Point
- **`T` (Transform):** Transformation from P0 to P1
- **`Strength` (Number):** Strength

**Outputs:**
- **`T` (Generic Data):** Transform out

***

## Category: Kangaroo2 > Main

### BouncySolver
**Nickname:** `BouncySolver`
**Description:** Solver with momentum
**GUID:** `0febdb68-70bd-4882-b5e4-f68d1cddc4ae`

**Inputs:**
- **`GoalObjects` (Generic Data):** GoalObjects
- **`Reset` (Boolean):** Hard Reset (completely rebuild the particle list and indexing)
- **`Threshold` (Number):** Stop when average movement is less than this (default is 1e-15)
- **`Tolerance` (Number):** Points closer than this distance will be combined into a single particle
- **`Damping` (Number):** Value between 0 and 1, for how much velocity is preserved between iterations
- **`Iterations` (Integer):** This many internal iterations will be performed for each results output
- **`On` (Boolean):** If true, Kangaroo will continue to iterate until reaching the given threshold value

**Outputs:**
- **`I` (Integer):** Iterations
- **`V` (Point):** V
- **`O` (Generic Data):** GoalFunction Outputs

### Grab
**Nickname:** `Grab`
**Description:** This lets you drag Kangaroo particles in Rhino viewports
**GUID:** `3d13a415-6ac5-4b59-9677-3975e4696a85`

**Inputs:**
- **`On` (Boolean):** When on, drag vertices in the Rhino viewport with LMB
- **`Strength` (Number):** Strength
- **`Range` (Number):** Maximum distance from which to grab points

**Outputs:**
- **`G` (Generic Data):** Connect to Goals input

### Grab
**Nickname:** `Grab`
**Description:** This lets you drag particles in Rhino. Hold Alt key and drag with LMB, or toggle anchors with LMB+RMB
**GUID:** `4c53ba00-f4bd-4ede-8d26-55106278268d`

**Inputs:**
- **`On` (Boolean):** When on, hold the Alt key and drag vertices in the Rhino viewport with LMB
- **`Strength` (Number):** Strength
- **`Range` (Number):** Maximum distance from which to grab points

**Outputs:**
- **`G` (Generic Data):** Connect to Goals input
- **`A` (Point):** Point marking location of any anchors placed by right clicking

### Grab
**Nickname:** `Grab`
**Description:** This lets you drag particles in Rhino. Hold Left Ctrl and drag with LMB, or toggle anchors with LMB+RMB
**GUID:** `4c90aad1-0748-4800-99db-a27d690bb1e1`

**Inputs:**
- **`On` (Boolean):** When on, hold the Left Ctrl key and drag vertices in the Rhino viewport with LMB. Click RMB while holding LMB to toggle anchors
- **`Strength` (Number):** Strength
- **`Range` (Number):** Maximum distance from which to grab points

**Outputs:**
- **`G` (Generic Data):** Connect to Goals input
- **`A` (Point):** Point marking location of any anchors placed by right clicking

### Grab
**Nickname:** `Grab`
**Description:** This lets you drag particles in Rhino. Hold Alt key and drag with LMB, or toggle anchors with LMB+RMB
**GUID:** `ea145d1d-7727-4d52-8db6-c9b7100ab7f9`

**Inputs:**
- **`On` (Boolean):** When on, hold the Alt key and drag vertices in the Rhino viewport with LMB. Click RMB while holding LMB to toggle anchors
- **`Strength` (Number):** Strength
- **`Range` (Number):** Maximum distance from which to grab points

**Outputs:**
- **`G` (Generic Data):** Connect to Goals input
- **`A` (Point):** Point marking location of any anchors placed by right clicking

### Show
**Nickname:** `Show`
**Description:** Show
**GUID:** `0ed5e67d-539d-480e-88cb-d81fa795d66c`

**Inputs:**
- **`G` (Generic Data):** Geometry

**Outputs:**
- **`G` (Generic Data):** Connect to GoalFunctions input

### Soft & Hard Solver
**Nickname:** `Soft&HardSolver`
**Description:** Solver with separate inputs for soft goals, and hard constraint type goals
**GUID:** `35c49588-244d-43a4-81b2-fd3ef59c1b1d`

**Inputs:**
- **`SoftGoals` (Generic Data):** These goals will be met only if they do not conflict with the hard goals
- **`HardGoals` (Generic Data):** These goals will override the soft goals
- **`HardIterations` (Integer):** The number of hard iterations performed after each soft step
- **`SoftMultiplier` (Number):** Multiplier for the soft movement. This can be decreased to zero at the end if you want maximum accuracy
- **`Reset` (Boolean):** Hard Reset (completely rebuild the particle list and indexing)
- **`Threshold` (Number):** Stop when average movement is less than this (default is 1e-15)
- **`Tolerance` (Number):** Points closer than this distance will be combined into a single particle
- **`On` (Boolean):** If true, Kangaroo will continue to iterate until reaching the given threshold value

**Outputs:**
- **`I` (Integer):** Iterations
- **`V` (Point):** V
- **`O` (Generic Data):** GoalFunction Output tree

### Solver
**Nickname:** `Solver`
**Description:** The main component where Goals are combined and applied
**GUID:** `313490f5-8e38-4dde-9e9a-05e4d739b35d`

**Inputs:**
- **`GoalObjects` (Generic Data):** GoalObjects
- **`Reset` (Boolean):** Hard Reset (completely rebuild the particle list and indexing)
- **`Threshold` (Number):** Stop when average movement is less than this (default is 1e-15)
- **`Tolerance` (Number):** Points closer than this distance will be combined into a single particle
- **`On` (Boolean):** If true, Kangaroo will continue to iterate until reaching the given threshold value

**Outputs:**
- **`I` (Integer):** Iterations
- **`V` (Point):** V
- **`O` (Generic Data):** GoalFunction Output tree

### Solver
**Nickname:** `Solver`
**Description:** The main component where Goals are combined and applied
**GUID:** `8f9f19c0-207a-419d-90f6-2fcadaa845f9`

**Inputs:**
- **`GoalObjects` (Generic Data):** GoalObjects
- **`Reset` (Boolean):** Hard Reset (completely rebuild the particle list and indexing)
- **`Threshold` (Number):** Stop when average movement is less than this (default is 1e-15)
- **`Tolerance` (Number):** Points closer than this distance will be combined into a single particle
- **`On` (Boolean):** If true, Kangaroo will continue to iterate until reaching the given threshold value

**Outputs:**
- **`I` (Integer):** Iterations
- **`V` (Point):** V
- **`O` (Generic Data):** GoalFunction Outputs

### Solver
**Nickname:** `Solver`
**Description:** The main component where Goals are combined and applied
**GUID:** `a54d250e-e285-4f38-9fb3-8dd9c886c659`

**Inputs:**
- **`GoalObjects` (Generic Data):** GoalObjects
- **`Points` (Point):** Initial particle positions (only needed when giving Goals by index)
- **`Reset` (Boolean):** Hard Reset (completely rebuild the particle list and indexing)
- **`Restart` (Boolean):** Soft Reset (move particles back to initial positions, but without changing topology)
- **`Parallel` (Boolean):** Whether to use multi-threading (This can speed calculation when you have very complex or numerous Goals, but may be slower for simple setups)
- **`Threshold` (Number):** Stop when average movement is less than this (default is 1e-15)
- **`Tolerance` (Number):** Points closer than this distance will be combined into a single particle
- **`AddCurrent` (Boolean):** If true, new GoalObjects given by position will combine vertices with current particle positions, and if false, based on initial positions
- **`On` (Boolean):** If true, Kangaroo will continue to iterate until reaching the given threshold value

**Outputs:**
- **`V` (Point):** V
- **`O` (Generic Data):** GoalFunction Outputs

### StepSolver
**Nickname:** `StepSolver`
**Description:** Solver which advances only when input refreshed. Useful for making animations
**GUID:** `fa27771b-cf25-4a21-bf31-8bb20a7822b3`

**Inputs:**
- **`GoalObjects` (Generic Data):** GoalObjects
- **`Tolerance` (Number):** Points closer than this distance will be combined into a single particle
- **`Momentum` (Boolean):** If false, the simulation tries to converge as quickly as possible. If true, the dynamics are more physically based
- **`Damping` (Number):** Value between 0 and 1, for how much velocity is preserved between iterations. Only used if Momentum is on
- **`SubIterations` (Integer):** Number of iterations per frame
- **`Animate` (Boolean):** If false, simulation resets. If true the solution will advance by one frame each time this input is received

**Outputs:**
- **`I` (Integer):** Iterations
- **`V` (Point):** V
- **`O` (Generic Data):** GoalFunction Outputs

### ZombieSolver
**Nickname:** `ZombieSolver`
**Description:** A version of the solver component which keeps all iterations internal, and outputs the final result
**GUID:** `4408343b-577e-4fd8-96ff-df7549189186`

**Inputs:**
- **`GoalObjects` (Generic Data):** GoalObjects
- **`Threshold` (Number):** Stop when average movement is less than this (default is 1e-10)
- **`Tolerance` (Number):** Points closer than this distance will be combined into a single particle
- **`MaxIterations` (Integer):** If the energy threshold has not been reached, it will stop after this many iterations

**Outputs:**
- **`I` (Integer):** Iterations
- **`V` (Point):** V
- **`O` (Generic Data):** GoalFunction Outputs

***

## Category: Kangaroo2 > Mesh

### Bipartite
**Nickname:** `Bipartite`
**Description:** Attempt to assign a boolean to each vertex of a mesh such that no connected vertices share the same value
**GUID:** `8cb1880b-464e-470e-87af-ea27ae95132d`

**Inputs:**
- **`M` (Mesh):** Mesh

**Outputs:**
- **`A` (Integer):** Vertex assignments

### ByParent
**Nickname:** `ByParent`
**Description:** Refine a Mesh, separating outputs by parent face
**GUID:** `5a4ba654-7203-474d-83d6-7f1cdfc0a41f`

**Inputs:**
- **`M` (Mesh):** Mesh to refine
- **`L` (Integer):** Level of subdivision

**Outputs:**
- **`M` (Mesh):** Refined Meshes list

### Checkerboard
**Nickname:** `Checkerboard`
**Description:** Attempt to assign a boolean to each face of a mesh such that no adjacent faces share the same value
**GUID:** `c0139ec9-4e5a-4978-ab5f-31f5deb9ba4e`

**Inputs:**
- **`M` (Mesh):** Mesh to checkerboard

**Outputs:**
- **`A` (Integer):** Face assignments

### Combine&Clean
**Nickname:** `Clean`
**Description:** Combine and Clean a list of meshes, removing unused and duplicate vertices
**GUID:** `2491e794-8360-4317-b0ad-4950f6e0906a`

**Inputs:**
- **`M` (Mesh):** Meshes to combine

**Outputs:**
- **`M` (Mesh):** Cleaned and combined mesh

### Diagonalize
**Nickname:** `Diag`
**Description:** Replace each edge with a new face
**GUID:** `77e9376b-a397-4010-9b2c-dd0326107a91`

**Inputs:**
- **`M` (Mesh):** Mesh to diagonalize

**Outputs:**
- **`M` (Mesh):** Diagonal mesh

### FaceFaceOffset
**Nickname:** `FaceFace`
**Description:** Offset a conical mesh so that corresponding faces are constant distance apart
**GUID:** `f3fcd287-f1f2-4b76-84ac-e7dd462979fa`

**Inputs:**
- **`M` (Mesh):** Input Mesh
- **`D` (Number):** Offset distance

**Outputs:**
- **`O` (Mesh):** The offset mesh
- **`B` (Mesh):** Beams between the 2 meshes

### FoldAngle
**Nickname:** `FoldAngle`
**Description:** Measure the current angle between two triangles about their common edge
**GUID:** `b09481df-b73c-4889-b2d7-6ed306beddad`

**Inputs:**
- **`P1` (Point):** Start of the common edge shared by both triangles
- **`P2` (Point):** End of the common edge shared by both triangles
- **`P3` (Point):** Tip of first triangle
- **`P4` (Point):** Tip of second triangle

**Outputs:**
- **`A` (Number):** Angle between the triangles

### HingePoints
**Nickname:** `HingePoints`
**Description:** Get the 4 points for each internal edge to use in a Hinge Force
**GUID:** `24f82a13-a700-45e0-9528-8646323d4af2`

**Inputs:**
- **`M` (Mesh):** Mesh to get points for

**Outputs:**
- **`1` (Point):** Point 1
- **`2` (Point):** Point 2
- **`3` (Point):** Point 3
- **`4` (Point):** Point 4

### MeshCorners
**Nickname:** `MC`
**Description:** Extract corners sharper than some angle
**GUID:** `c8b01cec-6dd9-460b-b43f-254314ffdc2e`

**Inputs:**
- **`M` (Mesh):** Mesh
- **`A` (Number):** Interior angle below which a vertex is considered a corner

**Outputs:**
- **`C` (Point):** Corners

### MeshDirection
**Nickname:** `MD`
**Description:** Sort the face directions of a mesh
**GUID:** `9c2695de-127b-4b46-a17b-f3a676891c0d`

**Inputs:**
- **`M` (Mesh):** Mesh to sort

**Outputs:**
- **`M` (Mesh):** Mesh with face directions sorted

### MeshMap
**Nickname:** `MeshMap`
**Description:** Map points from one mesh to another
**GUID:** `ab723d11-5713-4df2-9d3c-b8bbb3bb5d61`

**Inputs:**
- **`M1` (Mesh):** Mesh to map from
- **`M2` (Mesh):** Mesh to map to
- **`P` (Point):** Point to map
- **`D` (Number):** maximum search distance

**Outputs:**
- **`P` (Point):** Mapped point

### MeshTurn
**Nickname:** `Turn`
**Description:** Rotate the vertex order of each face
**GUID:** `bf54f98d-2fc0-4cb8-91b9-29619a2c6005`

**Inputs:**
- **`M` (Mesh):** Mesh to turn faces

**Outputs:**
- **`M` (Mesh):** Mesh with faces turned

### NakedVertices
**Nickname:** `NV`
**Description:** Sorts the vertices of a mesh into 2 lists according to whether or not they are surrounded by faces
**GUID:** `ddb24b31-1192-448f-ace3-b5b3d2399831`

**Inputs:**
- **`M` (Mesh):** Mesh

**Outputs:**
- **`ClothedI` (Integer):** Indexes of vertices surrounded by faces
- **`NakedI` (Integer):** Indexes of vertices not surrounded by faces
- **`ClothedPts` (Point):** Point locations of vertices surrounded by faces
- **`NakedPts` (Point):** Point locations of vertices not surrounded by faces

### PlanarityAnalysis
**Nickname:** `PA`
**Description:** Display face planarity as a coloured mesh
**GUID:** `97253642-cb05-43e6-bc79-4bd0306441e5`

**Inputs:**
- **`M` (Mesh):** Mesh to analyze
- **`X` (Number):** Value to map to red in display

**Outputs:**
- **`M` (Mesh):** Mesh coloured by deviation from planarity, with green=planar and red=max
- **`P` (Number):** Planarity deviation per face - as shortest between diagonals divided by average diagonal length.

### Refine
**Nickname:** `Refine`
**Description:** Divide each quad into 4 quads, and each triangle into 4 triangles
**GUID:** `6003658a-c422-41cf-8a2f-8e106b09cc10`

**Inputs:**
- **`M` (Mesh):** Mesh to refine
- **`L` (Integer):** Level of subdivision

**Outputs:**
- **`M` (Mesh):** Refined Mesh

### RefineStrips
**Nickname:** `Strips`
**Description:** Directional subdivision, refines quads in one direction only
**GUID:** `39a12e0c-25a7-43ce-9546-115f3a211a0c`

**Inputs:**
- **`M` (Mesh):** Mesh to refine
- **`L` (Integer):** Level of subdivision

**Outputs:**
- **`M` (Mesh):** Refined Mesh

### RemeshByColour
**Nickname:** `RemeshByColour`
**Description:** Remeshing with edge lengths dependent on the vertex colours of the input mesh
**GUID:** `f4d3e531-f23d-495d-8362-d7145e9f762e`

**Inputs:**
- **`Mesh` (Mesh):** Input coloured Mesh
- **`LengthInterval` (Domain):** Edge length interval from black to white
- **`FixC` (Curve):** Curves which will be kept sharp during remeshing. Can be boundary or internal curves
- **`FixV` (Point):** Points to keep fixed during remeshing
- **`Flip` (Integer):** Criterion used to decide when to flip edges (0 for valence based, 1 for angle based)
- **`Iter` (Integer):** Number of steps between outputs
- **`Reset` (Boolean):** True to initialize, false to run remeshing. Connect a timer for continuous remeshing

**Outputs:**
- **`M` (Mesh):** Remeshed result

### Simple
**Nickname:** `Simple`
**Description:** Simple Target Length
**GUID:** `d3ed43b3-73db-4259-82dd-26005879c0a2`

**Inputs:**
- **`S` (Number):** Target Length

**Outputs:**
- **`T` (Generic Data):** Target Length

### SimpleRemesh
**Nickname:** `SimpleRemesh`
**Description:** Isotropically remesh a Brep or Mesh
**GUID:** `87c0cc0e-d792-481e-b219-cc16b3e7b7b9`

**Inputs:**
- **`Geometry` (Geometry):** Input Surface or Mesh
- **`Length` (Number):** Target edge length
- **`Creases` (Curve):** Curves which will be kept sharp during remeshing. Can be boundary or internal curves
- **`Corners` (Point):** Points to keep fixed during remeshing, eg sharp corners
- **`Steps` (Integer):** Number of remeshing steps to perform

**Outputs:**
- **`M` (Mesh):** Remeshed result

### Stripper
**Nickname:** `Stripper`
**Description:** Divide a mesh into strips
**GUID:** `c8514ca2-3243-487a-becc-c07a4083db94`

**Inputs:**
- **`M` (Mesh):** Input Mesh

**Outputs:**
- **`S` (Mesh):** List of Mesh Strips

### TangentCircles
**Nickname:** `TC`
**Description:** Generate face incircles, circle packing centred on vertices, or incircular dual
**GUID:** `bdda1028-13e6-41ee-b410-701234f9d39f`

**Inputs:**
- **`M` (Mesh):** Mesh

**Outputs:**
- **`I` (Circle):** Incircles
- **`C` (Circle):** C
- **`D` (Curve):** Dual based on incircle centers

### Unroller
**Nickname:** `Unroller`
**Description:** Unroll a strip of quads
**GUID:** `dca330b6-f705-4d5e-b9d4-ea90c915ddaf`

**Inputs:**
- **`M` (Mesh):** Mesh to unroll (must be a non looping strip of quads)
- **`T` (Number):** How much to unroll (0 keeps original, 1 is completely unrolled

**Outputs:**
- **`U` (Mesh):** Unrolled Mesh

### VertexNeighbours
**Nickname:** `VN`
**Description:** Returns the positions of the vertices connected the given vertex by an edge
**GUID:** `fecd8879-9e63-4ff9-a16e-fe85bb0de884`

**Inputs:**
- **`M` (Mesh):** Mesh
- **`V` (Integer):** The integer of the central vertex to get neighbours for

**Outputs:**
- **`C` (Point):** The position of the central vertex
- **`N` (Point):** Positions of neighbouring vertices
- **`V` (Vector):** The mesh normal at the central vertex

### WarpWeft
**Nickname:** `WarpWeft`
**Description:** Separate the edges of a mesh into 2 lists according to Warp and Weft direction
**GUID:** `cb7c0f04-123f-4b12-8f81-583b9fc793be`

**Inputs:**
- **`M` (Mesh):** Input Mesh

**Outputs:**
- **`A` (Line):** Lines in first direction
- **`B` (Line):** Lines in first direction
- **`NA` (Boolean):** List of booleans for whether each line in A lies on the mesh boundary
- **`NB` (Boolean):** List of booleans for whether each line in B lies on the mesh boundary

### remesher
**Nickname:** `remesher`
**Description:** Remeshing tool
**GUID:** `9f055808-c262-4462-b429-7e20d4ca3a5e`

**Inputs:**
- **`Geom` (Geometry):** Input Surface or Mesh
- **`L` (Generic Data):** A function determining local edge length
- **`FixC` (Curve):** Curves which will be kept sharp during remeshing. Can be boundary or internal curves
- **`FixV` (Point):** Points to keep fixed during remeshing
- **`Flip` (Integer):** Criterion used to decide when to flip edges (0 for valence based, 1 for angle based)
- **`Pull` (Number):** Strength of pull to target geometry (between 0 and 1). Set to 0 for minimal surfaces
- **`Iter` (Integer):** Number of steps between outputs
- **`Reset` (Boolean):** True to initialize, false to run remeshing. Connect a timer for continuous remeshing

**Outputs:**
- **`M` (Generic Data):** Remeshed result as KPlankton Mesh

***

## Category: Kangaroo2 > Utility

### DotDisplay
**Nickname:** `Dot`
**Description:** Show points as round dots
**GUID:** `d27b55c6-9d5f-4d05-be7b-b91009aad383`

**Inputs:**
- **`P` (Point):** Points to display

**Outputs:**
- *This component has no outputs.*

### Möbius Transformation
**Nickname:** `MB`
**Description:** 3d Möbius Transformations of any geometry using 4d rotation
**GUID:** `51ea6cbf-9681-4a4b-8f66-20e0e2faf182`

**Inputs:**
- **`G` (Generic Data):** Input Geometry to transform
- **`C` (Circle):** Circle defining the transformation. Points on this circle will stay on it, and all other points are pulled through and around it
- **`T` (Number):** Amount of transformation. 2π brings it back to the original
- **`Q` (Number):** This parameter controls the rotation around the axis of the circle. Set to 1 for Isoclinic rotations
- **`F` (Boolean):** If true, this transforms and scales the geometry so that points on the sphere defined by the input circle stay on that sphere

**Outputs:**
- **`G` (Geometry):** Transformed Geometry

### SplitAtCorners
**Nickname:** `SplitAtCorners`
**Description:** Break a polyline into multiple parts based on angle
**GUID:** `74953dd1-9af7-4736-983c-f258302de692`

**Inputs:**
- **`P` (Curve):** The polyline to split
- **`A` (Number):** Angle in radians to split at

**Outputs:**
- **`C` (Point):** Points at which the angle exceeded the threshold
- **`S` (Curve):** A list of separate polylines

### interconnectPoints
**Nickname:** `inter`
**Description:** Draws one line between every pair of points in a list
**GUID:** `a412ddf4-4899-4456-8325-f3f9a8134a25`

**Inputs:**
- **`P` (Point):** list of points to interconnect

**Outputs:**
- **`I` (Curve):** interconnection lines

### removeDuplicateLines
**Nickname:** `dupLn`
**Description:** Removes similar lines from a list.
**GUID:** `5b882297-9063-439e-82b9-70961f743c5d`

**Inputs:**
- **`L` (Line):** list of lines to clean
- **`t` (Number):** lines with start/endpoints closer than this distance will be combined

**Outputs:**
- **`Q` (Line):** list of unique lines

### removeDuplicatePts
**Nickname:** `dupPt`
**Description:** Removes similar points from a list
**GUID:** `5e2f9e3f-d467-46f6-870c-6fa7cd01e1ed`

**Inputs:**
- **`P` (Point):** list of points to clean
- **`t` (Number):** If any points are less than this distance apart along all axes x,y and z, they will be combined

**Outputs:**
- **`Q` (Point):** list of unique points

***

## Category: Maths > Domain

### Bounds
**Nickname:** `Bnd`
**Description:** Create a numeric domain which encompasses a list of numbers.
**GUID:** `f44b92b0-3b5b-493a-86f4-fd7408c3daf3`

**Inputs:**
- **`N` (Number):** Numbers to include in Bounds

**Outputs:**
- **`I` (Domain):** Numeric Domain between the lowest and highest numbers in {N}

### Bounds 2D
**Nickname:** `Bnd`
**Description:** Create a numeric two-dimensional domain which encompasses a list of coordinates.
**GUID:** `dd53b24c-003a-4a04-b185-a44d91633cbe`

**Inputs:**
- **`C` (Point):** Two dimensional coordinates to include in Bounds

**Outputs:**
- **`I` (Domain²):** Numeric two-dimensional domain between the lowest and highest numbers in {N.x ; N.y}

### Consecutive Domains
**Nickname:** `Consec`
**Description:** Create consecutive domains from a list of numbers
**GUID:** `95992b33-89e1-4d36-bd35-2754a11af21e`

**Inputs:**
- **`N` (Number):** Numbers for consecutive domains
- **`A` (Boolean):** If True, values are added to a sum-total

**Outputs:**
- **`D` (Domain):** Domains describing the spaces between the numbers

### Construct Domain
**Nickname:** `Dom`
**Description:** Create a numeric domain from two numeric extremes.
**GUID:** `d1a28e95-cf96-4936-bf34-8bf142d731bf`

**Inputs:**
- **`A` (Number):** Start value of numeric domain
- **`B` (Number):** End value of numeric domain

**Outputs:**
- **`I` (Domain):** Numeric domain between {A} and {B}

### Construct Domain²
**Nickname:** `Dom²`
**Description:** Create a two-dimensional domain from two simple domains.
**GUID:** `8555a743-36c1-42b8-abcc-06d9cb94519f`

**Inputs:**
- **`U` (Domain):** Domain in {u} direction
- **`V` (Domain):** Domain in {v} direction

**Outputs:**
- **`I²` (Domain²):** Two dimensional numeric domain of {u} and {v}

### Construct Domain²
**Nickname:** `Dom²Num`
**Description:** Create a two-dimensinal domain from four numbers.
**GUID:** `9083b87f-a98c-4e41-9591-077ae4220b19`

**Inputs:**
- **`U0` (Number):** Lower limit of domain in {u} direction
- **`U1` (Number):** Upper limit of domain in {u} direction
- **`V0` (Number):** Lower limit of domain in {v} direction
- **`V1` (Number):** Upper limit of domain in {v} direction

**Outputs:**
- **`I²` (Domain²):** Two dimensional numeric domain of {u} and {v}

### Deconstruct Domain
**Nickname:** `DeDomain`
**Description:** Deconstruct a numeric domain into its component parts.
**GUID:** `825ea536-aebb-41e9-af32-8baeb2ecb590`

**Inputs:**
- **`I` (Domain):** Base domain

**Outputs:**
- **`S` (Number):** Start of domain
- **`E` (Number):** End of domain

### Deconstruct Domain²
**Nickname:** `DeDom2Num`
**Description:** Deconstruct a two-dimensional domain into four numbers
**GUID:** `47c30f9d-b685-4d4d-9b20-5b60e48d5af8`

**Inputs:**
- **`I` (Domain²):** Base domain

**Outputs:**
- **`U0` (Number):** Lower limit of domain in {u} direction
- **`U1` (Number):** Upper limit of domain in {u} direction
- **`V0` (Number):** Lower limit of domain in {v} direction
- **`V1` (Number):** Upper limit of domain in {v} direction

### Deconstruct Domain²
**Nickname:** `DeDom2`
**Description:** Deconstruct a two-dimensional domain into its component parts
**GUID:** `f0adfc96-b175-46a6-80c7-2b0ee17395c4`

**Inputs:**
- **`I` (Domain²):** Base domain

**Outputs:**
- **`U` (Domain):** {u} component of domain
- **`V` (Domain):** {v} component of domain

### Divide Domain
**Nickname:** `Div`
**Description:** Divide a domain into equal segments.
**GUID:** `75ef4190-91a2-42d9-a245-32a7162b0384`

**Inputs:**
- **`I` (Domain):** Base domain
- **`C` (Integer):** Number of segments

**Outputs:**
- **`S` (Domain):** Division segments

### Divide Domain²
**Nickname:** `Divide`
**Description:** Divides a two-dimensional domain into equal segments.
**GUID:** `75ac008b-1bc2-4edd-b967-667d628b9d24`

**Inputs:**
- **`I` (Domain²):** Base domain
- **`U` (Integer):** Number of segments in {u} direction
- **`V` (Integer):** Number of segments in {v} direction

**Outputs:**
- **`S` (Domain²):** Individual segments

### Find Domain
**Nickname:** `FDom`
**Description:** Find the first domain that contains a specific value
**GUID:** `0b5c7fad-0473-41aa-bf52-d7a861dcaa29`

**Inputs:**
- **`D` (Domain):** Collection of domains to search
- **`N` (Number):** Number to test
- **`S` (Boolean):** Strict comparison, if true then the value must be on the interior of a domain

**Outputs:**
- **`I` (Integer):** Index of first domain that includes the specified value
- **`N` (Integer):** Index of domain that is closest to the specified value

### Includes
**Nickname:** `Inc`
**Description:** Test a numeric value to see if it is included in the domain
**GUID:** `f217f873-92f1-47ae-ad71-ca3c5a45c3f8`

**Inputs:**
- **`V` (Number):** Value to test for inclusion
- **`D` (Domain):** Domain to test with

**Outputs:**
- **`I` (Boolean):** True if the value is included in the domain
- **`D` (Number):** Distance between the value and the nearest value inside the domain

### Remap Numbers
**Nickname:** `ReMap`
**Description:** Remap numbers into a new numeric domain
**GUID:** `2fcc2743-8339-4cdf-a046-a1f17439191d`

**Inputs:**
- **`V` (Number):** Value to remap
- **`S` (Domain):** Source domain
- **`T` (Domain):** Target domain

**Outputs:**
- **`R` (Number):** Remapped number
- **`C` (Number):** Remapped and clipped number

***

## Category: Maths > Matrix

### Construct Matrix
**Nickname:** `Matrix`
**Description:** Construct a matrix from initial values
**GUID:** `54ac80cf-74f3-43f7-834c-0e3fe94632c6`

**Inputs:**
- **`R` (Integer):** Number of rows in the matrix
- **`C` (Integer):** Number of columns in the matrix
- **`V` (Number):** Optional matrix values, if omitted, an identity matrix will be created

**Outputs:**
- **`M` (Matrix):** A newly created matrix

### Deconstruct Matrix
**Nickname:** `DeMatrix`
**Description:** Deconstruct a matrix into its component parts
**GUID:** `3aa2a080-e322-4be3-8c6e-baf6c8000cf1`

**Inputs:**
- **`M` (Matrix):** Matrix to deconstruct

**Outputs:**
- **`R` (Integer):** Number of rows in the matrix
- **`C` (Integer):** Number of columns in the matrix
- **`V` (Number):** Matrix values

### Invert Matrix
**Nickname:** `MInvert`
**Description:** Invert a matrix
**GUID:** `f986e79a-1215-4822-a1e7-3311dbdeb851`

**Inputs:**
- **`M` (Matrix):** Matrix to invert
- **`t` (Number):** Zero-tolerance for inversion

**Outputs:**
- **`M` (Matrix):** Inverted matrix
- **`S` (Boolean):** Boolean indicating inversion success

### Swap Columns
**Nickname:** `SwapC`
**Description:** Swap two columns in a matrix
**GUID:** `4cebcaf7-9a6a-435b-8f8f-95a62bacb0f2`

**Inputs:**
- **`M` (Matrix):** Matrix for column swap
- **`A` (Integer):** First column index
- **`B` (Integer):** Second column index

**Outputs:**
- **`M` (Matrix):** Matrix with swapped rows

### Swap Rows
**Nickname:** `SwapR`
**Description:** Swap two rows in a matrix
**GUID:** `8600a3fc-30f0-4df6-b126-aaa79ece5bfe`

**Inputs:**
- **`M` (Matrix):** Matrix for row swap
- **`A` (Integer):** First row index
- **`B` (Integer):** Second row index

**Outputs:**
- **`M` (Matrix):** Matrix with swapped rows

### Transpose Matrix
**Nickname:** `Transpose`
**Description:** Transpose a matrix (swap rows and columns)
**GUID:** `0e90b1f3-b870-4e09-8711-4bf819675d90`

**Inputs:**
- **`M` (Matrix):** A newly created matrix

**Outputs:**
- **`M` (Matrix):** Transposed matrix

***

## Category: Maths > Operators

### Absolute
**Nickname:** `Abs`
**Description:** Compute the absolute of a value.
**GUID:** `28124995-cf99-4298-b6f4-c75a8e379f18`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Addition
**Nickname:** `A+B`
**Description:** Mathematical addition
**GUID:** `a0d62394-a118-422d-abb3-6af115c75b25`

**Inputs:**
- **`A` (Generic Data):** First item for addition
- **`B` (Generic Data):** Second item for addition

**Outputs:**
- **`R` (Generic Data):** Result of addition

### Division
**Nickname:** `A/B`
**Description:** Mathematical division
**GUID:** `9c85271f-89fa-4e9f-9f4a-d75802120ccc`

**Inputs:**
- **`A` (Generic Data):** Item to divide (dividend)
- **`B` (Generic Data):** Item to divide with (divisor)

**Outputs:**
- **`R` (Generic Data):** The result of the Division

### Equality
**Nickname:** `Equals`
**Description:** Test for (in)equality of two numbers
**GUID:** `5db0fb89-4f22-4f09-a777-fa5e55aed7ec`

**Inputs:**
- **`A` (Number):** Number to compare
- **`B` (Number):** Number to compare to

**Outputs:**
- **`=` (Boolean):** True if A = B
- **`≠` (Boolean):** True if A ≠ B

### Factorial
**Nickname:** `Fac`
**Description:** Returns the factorial of an integer.
**GUID:** `a0a38131-c5fc-4984-b05d-34cf57f0c018`

**Inputs:**
- **`N` (Integer):** Input integer

**Outputs:**
- **`F` (Generic Data):** Factorial of {N}

### Gate And
**Nickname:** `And`
**Description:** Perform boolean conjunction (AND gate).
**GUID:** `040f195d-0b4e-4fe0-901f-fedb2fd3db15`

**Inputs:**
- **`A` (Boolean):** First boolean for AND operation
- **`B` (Boolean):** Second boolean for AND operation

**Outputs:**
- **`R` (Boolean):** Resulting value

### Gate Majority
**Nickname:** `Vote`
**Description:** Calculates the majority vote among three booleans.
**GUID:** `78669f9c-4fea-44fd-ab12-2a69eeec58de`

**Inputs:**
- **`A` (Boolean):** First boolean
- **`B` (Boolean):** Second boolean
- **`C` (Boolean):** Third boolean

**Outputs:**
- **`R` (Boolean):** Average value

### Gate Nand
**Nickname:** `Nand`
**Description:** Perform boolean alternative denial (NAND gate).
**GUID:** `5ca5de6b-bc71-46c4-a8f7-7f30d7040acb`

**Inputs:**
- **`A` (Boolean):** Left hand boolean
- **`B` (Boolean):** Right hand boolean

**Outputs:**
- **`R` (Boolean):** Resulting value

### Gate Nor
**Nickname:** `Nor`
**Description:** Perform boolean joint denial (NOR gate).
**GUID:** `548177c2-d1db-4172-b667-bec979e2d38b`

**Inputs:**
- **`A` (Boolean):** Left hand boolean
- **`B` (Boolean):** Right hand boolean

**Outputs:**
- **`R` (Boolean):** Resulting value

### Gate Not
**Nickname:** `Not`
**Description:** Perform boolean negation (NOT gate).
**GUID:** `cb2c7d3c-41b4-4c6d-a6bd-9235bd2851bb`

**Inputs:**
- **`A` (Boolean):** Boolean value

**Outputs:**
- **`R` (Boolean):** Inverse of {A}

### Gate Or
**Nickname:** `Or`
**Description:** Perform boolean disjunction (OR gate).
**GUID:** `5cad70f9-5a53-4c5c-a782-54a479b4abe3`

**Inputs:**
- **`A` (Boolean):** First boolean for OR operation
- **`B` (Boolean):** Second boolean for OR operation

**Outputs:**
- **`R` (Boolean):** Resulting value

### Gate Xnor
**Nickname:** `Xnor`
**Description:** Perform boolean biconditional (XNOR gate).
**GUID:** `b6aedcac-bf43-42d4-899e-d763612f834d`

**Inputs:**
- **`A` (Boolean):** Left hand boolean
- **`B` (Boolean):** Right hand boolean

**Outputs:**
- **`R` (Boolean):** Resulting value

### Gate Xor
**Nickname:** `Xor`
**Description:** Perform boolean exclusive disjunction (XOR gate).
**GUID:** `de4a0d86-2709-4564-935a-88bf4d40af89`

**Inputs:**
- **`A` (Boolean):** Left hand boolean
- **`B` (Boolean):** Right hand boolean

**Outputs:**
- **`R` (Boolean):** Resulting value

### Integer Division
**Nickname:** `A\B`
**Description:** Mathematical integer division
**GUID:** `54db2568-3441-4ae2-bcef-92c4cc608e11`

**Inputs:**
- **`A` (Integer):** Item to divide (dividend)
- **`B` (Integer):** Item to divide with (divisor)

**Outputs:**
- **`R` (Integer):** Result of integer division

### Larger Than
**Nickname:** `Larger`
**Description:** Larger than (or equal to)
**GUID:** `30d58600-1aab-42db-80a3-f1ea6c4269a0`

**Inputs:**
- **`A` (Number):** Number to test
- **`B` (Number):** Number to test against

**Outputs:**
- **`>` (Boolean):** True if A > B
- **`>=` (Boolean):** True if A >= B

### Mass Addition
**Nickname:** `MA`
**Description:** Perform mass addition of a list of items
**GUID:** `5b850221-b527-4bd6-8c62-e94168cd6efa`

**Inputs:**
- **`I` (Generic Data):** Input values for mass addition.

**Outputs:**
- **`R` (Generic Data):** Result of mass addition
- **`Pr` (Generic Data):** List of partial results

### Mass Multiplication
**Nickname:** `MM`
**Description:** Perform mass multiplication of a list of items
**GUID:** `e44c1bd7-72cc-4697-80c9-02787baf7bb4`

**Inputs:**
- **`I` (Generic Data):** Input values for mass multiplication.

**Outputs:**
- **`R` (Generic Data):** Result of mass multiplication
- **`Pr` (Generic Data):** List of partial results

### Modulus
**Nickname:** `Mod`
**Description:** Divides two numbers and returns only the remainder.
**GUID:** `431bc610-8ae1-4090-b217-1a9d9c519fe2`

**Inputs:**
- **`A` (Generic Data):** First number for modulo (dividend)
- **`B` (Generic Data):** Second number for modulo (divisor)

**Outputs:**
- **`R` (Generic Data):** The remainder of A/B

### Multiplication
**Nickname:** `A×B`
**Description:** Mathematical multiplication
**GUID:** `ce46b74e-00c9-43c4-805a-193b69ea4a11`

**Inputs:**
- **`A` (Generic Data):** First item for multiplication
- **`B` (Generic Data):** Second item for multiplication

**Outputs:**
- **`R` (Generic Data):** Result of multiplication

### Negative
**Nickname:** `Neg`
**Description:** Compute the negative of a value.
**GUID:** `a3371040-e552-4bc8-b0ff-10a840258e88`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Power
**Nickname:** `Pow`
**Description:** Raise a value to a power.
**GUID:** `78fed580-851b-46fe-af2f-6519a9d378e0`

**Inputs:**
- **`A` (Generic Data):** The item to be raised
- **`B` (Generic Data):** The exponent

**Outputs:**
- **`R` (Generic Data):** A raised to the B power

### Relative Differences
**Nickname:** `RelDif`
**Description:** Compute relative differences for a list of data
**GUID:** `dd17d442-3776-40b3-ad5b-5e188b56bd4c`

**Inputs:**
- **`V` (Generic Data):** List of data to operate on (numbers or points or vectors allowed)

**Outputs:**
- **`D` (Generic Data):** Differences between consecutive items

### Series Addition
**Nickname:** `SA`
**Description:** Perform serial addition until a goal has been reached
**GUID:** `586706a8-109b-43ec-b581-743e920c951a`

**Inputs:**
- **`N` (Integer):** Number pool from which to take summands
- **`G` (Integer):** Goal value of addition series
- **`S` (Integer):** Starting value of addition series

**Outputs:**
- **`S` (Integer):** Addition series
- **`R` (Integer):** Difference between series summation and goal

### Similarity
**Nickname:** `Similar`
**Description:** Test for similarity of two numbers
**GUID:** `40177d8a-a35c-4622-bca7-d150031fe427`

**Inputs:**
- **`A` (Number):** Number to compare
- **`B` (Number):** Number to compare to
- **`T%` (Number):** Percentage (0% ~ 100%) of A and B below which similarity is assumed

**Outputs:**
- **`=` (Boolean):** True if A ≈ B
- **`dt` (Number):** The absolute difference between A and B

### Smaller Than
**Nickname:** `Smaller`
**Description:** Smaller than (or equal to)
**GUID:** `ae840986-cade-4e5a-96b0-570f007d4fc0`

**Inputs:**
- **`A` (Number):** Number to test
- **`B` (Number):** Number to test against

**Outputs:**
- **`<` (Boolean):** True if A < B
- **`<=` (Boolean):** True if A <= B

### Subtraction
**Nickname:** `A-B`
**Description:** Mathematical subtraction
**GUID:** `9c007a04-d0d9-48e4-9da3-9ba142bc4d46`

**Inputs:**
- **`A` (Generic Data):** First operand for subtraction
- **`B` (Generic Data):** Second operand for subtraction

**Outputs:**
- **`R` (Generic Data):** Result of subtraction

***

## Category: Maths > Polynomials

### Cube
**Nickname:** `Cube`
**Description:** Compute the cube of a value
**GUID:** `7e3185eb-a38c-4949-bcf2-0e80dee3a344`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Cube Root
**Nickname:** `Cbrt`
**Description:** Compute the cube root of a value
**GUID:** `5b0be57a-31f5-4446-a11a-ae0d348bca90`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Log N
**Nickname:** `LogN`
**Description:** Return the N-base logarithm of a number.
**GUID:** `7ab8d289-26a2-4dd4-b4ad-df5b477999d8`

**Inputs:**
- **`V` (Number):** Value
- **`B` (Number):** Logarithm base

**Outputs:**
- **`R` (Number):** Result

### Logarithm
**Nickname:** `Log`
**Description:** Compute the Base-10 logarithm of a value.
**GUID:** `27d6f724-a701-4585-992f-3897488abf08`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Natural logarithm
**Nickname:** `Ln`
**Description:** Compute the natural logarithm of a value.
**GUID:** `23afc7aa-2d2f-4ae7-b876-bf366246b826`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### One Over X
**Nickname:** `1/x`
**Description:** Compute one over x.
**GUID:** `797d922f-3a1d-46fe-9155-358b009b5997`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Power of 10
**Nickname:** `10º`
**Description:** Raise 10 to the power of N.
**GUID:** `2ebb82ef-1f90-4ac9-9a71-1fe0f4ef7044`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Power of 2
**Nickname:** `2º`
**Description:** Raise 2 to the power of N.
**GUID:** `7a1e5fd7-b7da-4244-a261-f1da66614992`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Power of E
**Nickname:** `Eº`
**Description:** Raise E to the power of N.
**GUID:** `c717f26f-e4a0-475c-8e1c-b8f77af1bc99`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Square
**Nickname:** `Sqr`
**Description:** Compute the square of a value
**GUID:** `2280dde4-9fa2-4b4a-ae2f-37d554861367`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Square Root
**Nickname:** `Sqrt`
**Description:** Compute the square root of a value
**GUID:** `ad476cb7-b6d1-41c8-986b-0df243a64146`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

***

## Category: Maths > Script

### C# Script
**Nickname:** `C#`
**Description:** A C#.NET scriptable component
**GUID:** `a9a8ebd2-fff5-4c44-a8f5-739736d129ba`

**Inputs:**
- **`x` (Generic Data):** Script Variable x
- **`y` (Generic Data):** Script Variable y

**Outputs:**
- **`out` (Text):** Print, Reflect and Error streams
- **`A` (Generic Data):** Output parameter A

### DotNET C# Script (LEGACY)
**Nickname:** `C#`
**Description:** A C#.NET scriptable component
**GUID:** `88c3f2b5-27f7-48a2-9528-1397fad62b93`

**Inputs:**
- **`x` (Generic Data):** Script Variable x
- **`y` (Generic Data):** Script Variable y

**Outputs:**
- **`out` (Text):** Print, Reflect and Error streams
- **`A` (Generic Data):** Output parameter A

### DotNET VB Script (LEGACY)
**Nickname:** `VB`
**Description:** A VB.NET scriptable component
**GUID:** `fb6aba99-fead-4e42-b5d8-c6de5ff90ea6`

**Inputs:**
- **`x` (Generic Data):** Script Variable x
- **`y` (Generic Data):** Script Variable y

**Outputs:**
- **`out` (Text):** Print, Reflect and Error streams
- **`A` (Generic Data):** Output parameter A

### Evaluate
**Nickname:** `Eval`
**Description:** Evaluate an expression with a flexible number of variables.
**GUID:** `cc2b626f-6eff-4d08-9829-2877560693f4`

**Inputs:**
- **`F` (Expression):** Expression to evaluate
- **`x` (Expression Variant):** Expression variable
- **`y` (Expression Variant):** Expression variable

**Outputs:**
- **`r` (Generic Data):** Expression result

### Expression
**Nickname:** `Expression`
**Description:** Evaluate an expression
**GUID:** `9df5e896-552d-4c8c-b9ca-4fc147ffa022`

**Inputs:**
- **`x` (Expression Variant):** Expression variable
- **`y` (Expression Variant):** Expression variable

**Outputs:**
- **`R` (Generic Data):** Result of expression

### GhPython Script
**Nickname:** `Python`
**Description:** GhPython provides a Python script component
**GUID:** `410755b1-224a-4c1e-a407-bf32fb45ea7e`

**Inputs:**
- **`x` (Generic Data):** Script variable Python
- **`y` (Generic Data):** Script variable Python

**Outputs:**
- **`out` (Text):** The execution information, as output and error streams
- **`a` (Generic Data):** Script variable Python

### VB Script
**Nickname:** `VB`
**Description:** A VB.NET scriptable component
**GUID:** `079bd9bd-54a0-41d4-98af-db999015f63d`

**Inputs:**
- **`x` (Generic Data):** Script Variable x
- **`y` (Generic Data):** Script Variable y

**Outputs:**
- **`out` (Text):** Print, Reflect and Error streams
- **`A` (Generic Data):** Output parameter A

***

## Category: Maths > Time

### Combine Date & Time
**Nickname:** `CDate`
**Description:** Combine a pure date and a pure time into a single date
**GUID:** `31534405-6573-4be6-8bf8-262e55847a3a`

**Inputs:**
- **`D` (Time):** Date portion
- **`T` (Time):** Time portion

**Outputs:**
- **`R` (Time):** Resulting combination of date and time.

### Construct Date
**Nickname:** `Date`
**Description:** Construct a date and time instance.
**GUID:** `0c2f0932-5ddc-4ece-bd84-a3a059d3df7a`

**Inputs:**
- **`Y` (Integer):** Year number (must be between 1 and 9999)
- **`M` (Integer):** Month number (must be between 1 and 12)
- **`D` (Integer):** Day of month (must be between 1 and 31)
- **`h` (Integer):** Hour of day (must be between 0 and 23)
- **`m` (Integer):** Minute of the hour (must be between 0 and 59)
- **`s` (Integer):** Second of the minute (must be between 0 and 59)

**Outputs:**
- **`D` (Time):** Date and Time data

### Construct Exotic Date
**Nickname:** `DateEx`
**Description:** Construct a date using a specific calendar
**GUID:** `e5ff52c5-40df-4f43-ac3b-d2418d05ae32`

**Inputs:**
- **`Y` (Integer):** Year number (must be between 1 and 9999)
- **`M` (Integer):** Month number (must be between 1 and 12)
- **`D` (Integer):** Day of month (must be between 1 and 31)

**Outputs:**
- **`T` (Time):** Gregorian representation of date.

### Construct Smooth Time
**Nickname:** `SmTime`
**Description:** Construct a time instance from smooth components
**GUID:** `f151b0b9-cef8-4809-96fc-9b14f1c3a7b9`

**Inputs:**
- **`D` (Number):** Number of days
- **`H` (Number):** Number of hours
- **`M` (Number):** Number of minutes
- **`S` (Number):** Number of seconds

**Outputs:**
- **`T` (Time):** Time construct

### Construct Time
**Nickname:** `Time`
**Description:** Construct a time instance
**GUID:** `595aded2-8916-402d-87a3-a825244bbe3d`

**Inputs:**
- **`H` (Integer):** Number of hours
- **`M` (Integer):** Number of minutes
- **`S` (Integer):** Number of seconds

**Outputs:**
- **`T` (Time):** Time construct

### Date Range
**Nickname:** `RDate`
**Description:** Create a range of successive dates or times
**GUID:** `38a4e722-ad5a-4229-a170-e27ae1345538`

**Inputs:**
- **`A` (Time):** First time
- **`B` (Time):** Second time
- **`N` (Integer):** Number of times to create between A and B

**Outputs:**
- **`R` (Time):** Range of varying times between A and B.

### Deconstruct Date
**Nickname:** `DDate`
**Description:** Deconstruct a date into years, months, days, hours, minutes and seconds
**GUID:** `d5e28df8-495b-4892-bca8-60748743d955`

**Inputs:**
- **`D` (Time):** Date and Time data

**Outputs:**
- **`Y` (Integer):** Year number
- **`M` (Integer):** Month number
- **`D` (Integer):** Day of month
- **`h` (Integer):** Hour of day
- **`m` (Integer):** Minute of the hour
- **`s` (Integer):** Second of the minute

### Interpolate Date
**Nickname:** `IntDate`
**Description:** Interpolate between two dates or times.
**GUID:** `4083802b-3dd9-4b13-9756-bf5441213e70`

**Inputs:**
- **`A` (Time):** First date
- **`B` (Time):** Second date
- **`t` (Number):** Interpolation factor

**Outputs:**
- **`D` (Time):** Interpolated Date & Time

***

## Category: Maths > Trig

### ArcCosine
**Nickname:** `ACos`
**Description:** Compute the angle whose cosine is the specified value.
**GUID:** `49584390-d541-41f7-b5f6-1f9515ac0f73`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### ArcSine
**Nickname:** `ASin`
**Description:** Compute the angle whose sine is the specified value.
**GUID:** `cc15ba56-fae7-4f05-b599-cb7c43b60e11`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### ArcTangent
**Nickname:** `ATan`
**Description:** Compute the angle whose tangent is the specified value.
**GUID:** `b4647919-d041-419e-99f5-fa0dc0ddb8b6`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Centroid
**Nickname:** `Centroid`
**Description:** Generate the triangle centroid from medians.
**GUID:** `afbcbad4-2a2a-4954-8040-d999e316d2bd`

**Inputs:**
- **`A` (Point):** First triangle corner
- **`B` (Point):** Second triangle corner
- **`C` (Point):** Third triangle corner

**Outputs:**
- **`C` (Point):** Centroid point for triangle
- **`AB` (Line):** Median line connecting edge AB with corner C
- **`BC` (Line):** Median line connecting edge BC with corner A
- **`CA` (Line):** Median line connecting edge CA with corner B

### Circumcentre
**Nickname:** `CCentre`
**Description:** Generate the triangle circumcentre from perpendicular bisectors.
**GUID:** `21d0767c-5340-4087-aa09-398d0e706908`

**Inputs:**
- **`A` (Point):** First triangle corner
- **`B` (Point):** Second triangle corner
- **`C` (Point):** Third triangle corner

**Outputs:**
- **`C` (Point):** Circumcentre point for triangle
- **`AB` (Line):** Perpendicular bisector line emanating from edge AB
- **`BC` (Line):** Perpendicular bisector line emanating from edge AB
- **`CA` (Line):** Perpendicular bisector line emanating from edge AB

### CoSecant
**Nickname:** `Csc`
**Description:** Compute the co-secant (reciprocal of the Sine) of an angle.
**GUID:** `d222500b-dfd5-45e0-933e-eabefd07cbfa`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### CoTangent
**Nickname:** `Cot`
**Description:** Compute the co-tangent (reciprocal of the Tangent) of an angle.
**GUID:** `1f602c33-f38e-4f47-898b-359f0a4de3c2`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Cosine
**Nickname:** `Cos`
**Description:** Compute the cosine of a value
**GUID:** `d2d2a900-780c-4d58-9a35-1f9d8d35df6f`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Degrees
**Nickname:** `Deg`
**Description:** Convert an angle specified in radians to degrees
**GUID:** `0d77c51e-584f-44e8-aed2-c2ddf4803888`

**Inputs:**
- **`R` (Number):** Angle in radians

**Outputs:**
- **`D` (Number):** Angle in degrees

### Incentre
**Nickname:** `ICentre`
**Description:** Generate the triangle incentre from angle bisectors.
**GUID:** `c3342ea2-e181-46aa-a9b9-e438ccbfb831`

**Inputs:**
- **`A` (Point):** First triangle corner
- **`B` (Point):** Second triangle corner
- **`C` (Point):** Third triangle corner

**Outputs:**
- **`I` (Point):** Incentre point for triangle
- **`A` (Line):** Perpendicular bisector line emanating from corner A
- **`B` (Line):** Perpendicular bisector line emanating from corner B
- **`C` (Line):** Perpendicular bisector line emanating from corner C

### Orthocentre
**Nickname:** `OCentre`
**Description:** Generate the triangle orthocentre from altitudes.
**GUID:** `36dd5551-b6bd-4246-bd2f-1fd91eb2f02d`

**Inputs:**
- **`A` (Point):** First triangle corner
- **`B` (Point):** Second triangle corner
- **`C` (Point):** Third triangle corner

**Outputs:**
- **`C` (Point):** Orthocentre point for triangle
- **`AB` (Line):** Altitude line connecting edge AB with corner C
- **`BC` (Line):** Altitude line connecting edge BC with corner A
- **`CA` (Line):** Altitude line connecting edge CA with corner B

### Radians
**Nickname:** `Rad`
**Description:** Convert an angle specified in degrees to radians
**GUID:** `a4cd2751-414d-42ec-8916-476ebf62d7fe`

**Inputs:**
- **`D` (Number):** Angle in degrees

**Outputs:**
- **`R` (Number):** Angle in radians

### Right Trigonometry
**Nickname:** `RTrig`
**Description:** Right triangle trigonometry
**GUID:** `e75d4624-8ee2-4067-ac8d-c56bdc901d83`

**Inputs:**
- **`α` (Number):** Optional alpha angle
- **`β` (Number):** Optional beta angle
- **`P` (Number):** Optional length of P edge
- **`Q` (Number):** Optional length of Q edge
- **`R` (Number):** Optional length of R edge

**Outputs:**
- **`α` (Number):** Computed alpha angle
- **`β` (Number):** Computed beta angle
- **`P` (Number):** Computed length of P edge
- **`Q` (Number):** Computed length of Q edge
- **`R` (Number):** Computed length of R edge

### Secant
**Nickname:** `Sec`
**Description:** Compute the secant (reciprocal of the Cosine) of an angle.
**GUID:** `60103def-1bb7-4700-b294-3a89100525c4`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Sinc
**Nickname:** `Sinc`
**Description:** Compute the sinc (Sinus Cardinalis) of a value.
**GUID:** `a2d9503d-a83c-4d71-81e0-02af8d09cd0c`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Sine
**Nickname:** `Sin`
**Description:** Compute the sine of a value
**GUID:** `7663efbb-d9b8-4c6a-a0da-c3750a7bbe77`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Tangent
**Nickname:** `Tan`
**Description:** Compute the tangent of a value
**GUID:** `0f31784f-7177-4104-8500-1f4f4a306df4`

**Inputs:**
- **`x` (Generic Data):** Input value

**Outputs:**
- **`y` (Generic Data):** Output value

### Triangle Trigonometry
**Nickname:** `Trig`
**Description:** Generic triangle trigonometry
**GUID:** `92af1a02-9b87-43a0-8c45-0ce1b81555ec`

**Inputs:**
- **`α` (Number):** Optional alpha angle
- **`β` (Number):** Optional beta angle
- **`γ` (Number):** Optional gamma angle
- **`A` (Number):** Optional length of A edge (opposite alpha)
- **`B` (Number):** Optional length of B edge (opposite beta)
- **`C` (Number):** Optional length of C edge (opposite gamma)

**Outputs:**
- **`α` (Number):** Computed alpha angle
- **`β` (Number):** Computed beta angle
- **`γ` (Number):** Computed gamma angle
- **`A` (Number):** Computed length of A edge
- **`B` (Number):** Computed length of B edge
- **`C` (Number):** Computed length of C edge

***

## Category: Maths > Util

### Average
**Nickname:** `Avr`
**Description:** Solve the arithmetic average for a set of items
**GUID:** `7986486c-621a-48fb-8f27-a28a22c91cc9`

**Inputs:**
- **`I` (Generic Data):** Input values for averaging

**Outputs:**
- **`AM` (Generic Data):** Arithmetic mean (average) of all input values

### Blur Numbers
**Nickname:** `NBlur`
**Description:** Blur a list of numbers by averaging neighbours
**GUID:** `57e1d392-e3fb-4de9-be98-982854a92351`

**Inputs:**
- **`N` (Number):** Numbers to blur
- **`S` (Number):** Blurring strength (0=none, 1=full)
- **`I` (Integer):** Number of successive blurring iterations
- **`L` (Boolean):** Lock first and last value
- **`W` (Boolean):** Treat the list as a cyclical collection

**Outputs:**
- **`N` (Number):** Blurred numbers

### Complex Argument
**Nickname:** `Arg`
**Description:** Get the argument of a Complex number
**GUID:** `be715e4c-d6d8-447b-a9c3-6fea700d0b83`

**Inputs:**
- **`C` (Complex):** Complex number

**Outputs:**
- **`A` (Number):** Argument of the Complex number [C]

### Complex Components
**Nickname:** `Complex`
**Description:** Extract the Real and Imaginary components from a complex number
**GUID:** `1f384257-b26b-4160-a6d3-1dcd89b64acd`

**Inputs:**
- **`C` (Complex):** Complex number to disembowel

**Outputs:**
- **`R` (Number):** Real component of complex number
- **`i` (Number):** Imaginary component of complex number

### Complex Conjugate
**Nickname:** `z*`
**Description:** Create the conjugate of a Complex number
**GUID:** `7d2a6064-51f0-45b2-adc4-f417b30dcd15`

**Inputs:**
- **`C` (Complex):** Complex number

**Outputs:**
- **`C` (Complex):** Conjugate of the Complex number [C]

### Complex Modulus
**Nickname:** `CMod`
**Description:** Get the modulus of a Complex number
**GUID:** `88fb33f9-f467-452b-a0e3-44bdb78a9b06`

**Inputs:**
- **`C` (Complex):** Complex number

**Outputs:**
- **`M` (Number):** Modulus of the Complex number [C]

### Create Complex
**Nickname:** `Complex`
**Description:** Create a complex number from a Real and an Imaginary component
**GUID:** `63d12974-2915-4ccf-ac26-5d566c3bac92`

**Inputs:**
- **`R` (Number):** Real component of complex number
- **`i` (Number):** Imaginary component of complex number

**Outputs:**
- **`C` (Complex):** Complex number

### Epsilon
**Nickname:** `Eps`
**Description:** Returns a factor of double precision floating point epsilon.
**GUID:** `deadf87d-99a6-4980-90c3-f98350aa6f0f`

**Inputs:**
- **`N` (Number):** Factor to be multiplied by epsilon

**Outputs:**
- **`y` (Number):** Output value

### Extremes
**Nickname:** `Extrz`
**Description:** Find the extremes in a list of values
**GUID:** `37084b3f-2b66-4f3a-9737-80d0b0b7f0cb`

**Inputs:**
- **`A` (Generic Data):** Value for comparison
- **`B` (Generic Data):** Value for comparison

**Outputs:**
- **`V-` (Generic Data):** Lowest of all values
- **`V+` (Generic Data):** Highest of all values

### Golden Ratio
**Nickname:** `Phi`
**Description:** Returns a factor of the golden ratio (Phi).
**GUID:** `cb22d3ed-93d8-4629-bdf2-c0c7c25afd2c`

**Inputs:**
- **`N` (Number):** Factor to be multiplied by Phi

**Outputs:**
- **`y` (Number):** Output value

### Interpolate data
**Nickname:** `Interp`
**Description:** Interpolate a collection of data.
**GUID:** `e168ff6b-e5c0-48f1-b831-f6996bf3b459`

**Inputs:**
- **`D` (Generic Data):** Data to interpolate (simple data types only).
- **`t` (Number):** Normalised interpolation parameter.

**Outputs:**
- **`V` (Generic Data):** Interpolated value.

### Maximum
**Nickname:** `Max`
**Description:** Return the greater of two items.
**GUID:** `0d1e2027-f153-460d-84c0-f9af431b08cb`

**Inputs:**
- **`A` (Generic Data):** First item for comparison
- **`B` (Generic Data):** Second item for comparison

**Outputs:**
- **`R` (Generic Data):** The greater of A and B

### Minimum
**Nickname:** `Min`
**Description:** Return the lesser of two items.
**GUID:** `57308b30-772d-4919-ac67-e86c18f3a996`

**Inputs:**
- **`A` (Generic Data):** First item for comparison
- **`B` (Generic Data):** Second item for comparison

**Outputs:**
- **`R` (Generic Data):** The lesser of A and B

### Natural logarithm
**Nickname:** `E`
**Description:** Returns a factor of the natural number (e).
**GUID:** `b6cac37c-21b9-46c6-bd0d-17ff67796578`

**Inputs:**
- **`N` (Number):** Factor to be multiplied by e

**Outputs:**
- **`y` (Number):** Output value

### Pi
**Nickname:** `Pi`
**Description:** Returns a factor of Pi.
**GUID:** `0d2ccfb3-9d41-4759-9452-da6a522c3eaa`

**Inputs:**
- **`N` (Number):** Factor to be multiplied by Pi

**Outputs:**
- **`y` (Number):** Output value

### Round
**Nickname:** `Round`
**Description:** Round a floating point value.
**GUID:** `a50c4a3b-0177-4c91-8556-db95de6c56c8`

**Inputs:**
- **`x` (Number):** Number to round

**Outputs:**
- **`N` (Integer):** Integer nearest to x
- **`F` (Integer):** First integer smaller than or equal to x
- **`C` (Integer):** First integer larger than or equal to x

### Smooth Numbers
**Nickname:** `Smooth`
**Description:** Smooth out changing numbers over time
**GUID:** `5b424e1c-d061-43cd-8c20-db84564b0502`

**Inputs:**
- **`N` (Number):** Changing numbers

**Outputs:**
- **`N` (Number):** Smoothened numbers

### Truncate
**Nickname:** `Trunc`
**Description:** Perform truncation of numerical extremes
**GUID:** `bd96f893-d57b-4f04-90d0-dca0d72ff2f9`

**Inputs:**
- **`I` (Generic Data):** Input values for truncation
- **`t` (Number):** Truncation factor. Must be between 0.0 (no trucation) and 1.0 (full truncation)

**Outputs:**
- **`T` (Generic Data):** Truncated set

### Weighted Average
**Nickname:** `Wav`
**Description:** Solve the arithmetic weighted average for a set of items
**GUID:** `338666eb-14c5-4d9b-82e2-2b5be60655df`

**Inputs:**
- **`I` (Generic Data):** Input values for averaging
- **`W` (Number):** Collection of weights for each value

**Outputs:**
- **`AM` (Generic Data):** Arithmetic mean (average) of all input values

***

## Category: Mesh > Analysis

### Deconstruct Face
**Nickname:** `DeFace`
**Description:** Deconstruct a mesh face into its four corner indices.
**GUID:** `aab142b1-b870-46de-8e86-654c9a554d90`

**Inputs:**
- **`F` (Mesh face):** Mesh face

**Outputs:**
- **`A` (Integer):** Index of first face vertex
- **`B` (Integer):** Index of second face vertex
- **`C` (Integer):** Index of third face vertex
- **`D` (Integer):** Index of fourth face vertex (identical to C if face is a triangle)

### Deconstruct Mesh
**Nickname:** `DeMesh`
**Description:** Deconstruct a mesh into its component parts.
**GUID:** `ba2d8f57-0738-42b4-b5a5-fe4d853517eb`

**Inputs:**
- **`M` (Mesh):** Base mesh

**Outputs:**
- **`V` (Point):** Mesh vertices
- **`F` (Mesh face):** Mesh faces
- **`C` (Colour):** Mesh vertex colours
- **`N` (Vector):** Mesh normals

### Face Boundaries
**Nickname:** `FaceB`
**Description:** Convert all mesh faces to polylines
**GUID:** `0b4ac802-fc4a-4201-9c66-0078b837c1eb`

**Inputs:**
- **`M` (Mesh):** Mesh for face boundary extraction

**Outputs:**
- **`B` (Curve):** Boundary polylines for each mesh face

### Face Circles
**Nickname:** `FaceC`
**Description:** Solve the circumscribed circles for all mesh faces
**GUID:** `d8cf1555-a0d5-43cb-8a10-46f8c014db3a`

**Inputs:**
- **`M` (Mesh):** Mesh for normal and center point extraction

**Outputs:**
- **`C` (Circle):** Circum-circles for all mesh triangles (quads are skipped)
- **`R` (Number):** Ratio of triangles; altitude / longest edge. (quads are skipped)

### Face Normals
**Nickname:** `FaceN`
**Description:** Extract the normals and center points of all faces in a mesh
**GUID:** `cb4ca22c-3419-4962-a078-ad4ff7f1f929`

**Inputs:**
- **`M` (Mesh):** Mesh for normal and center point extraction

**Outputs:**
- **`C` (Point):** Center-points of all faces
- **`N` (Vector):** Normal vectors for all faces

### Mesh Closest Point
**Nickname:** `MeshCP`
**Description:** Finds the closest point on a mesh
**GUID:** `a559fee2-4b76-4370-8042-c7440cd75049`

**Inputs:**
- **`P` (Point):** Point to search from
- **`M` (Mesh):** Mesh to search for closest point

**Outputs:**
- **`P` (Point):** Location on mesh closest to search point
- **`I` (Integer):** Face index of closest point
- **`P` (Mesh Parameter):** Mesh parameter for closest point

### Mesh Depth
**Nickname:** `MDepth`
**Description:** Validate the depth of a mesh.
**GUID:** `07a3b2a0-c4d0-4638-9044-39ac4681e782`

**Inputs:**
- **`M` (Mesh):** Mesh for inclusion test (only closed meshes will be considered)
- **`Min` (Number):** Minimum valid mesh depth.
- **`Max` (Number):** Maximum valid mesh depth.

**Outputs:**
- **`M` (Mesh):** Coloured mesh
- **`V` (Boolean):** True if mesh does not exceed limits

### Mesh Edges
**Nickname:** `MEdges`
**Description:** Get all the edges of a mesh
**GUID:** `2b9bf01d-5fe5-464c-b0b3-b469eb5f2efb`

**Inputs:**
- **`M` (Mesh):** Mesh for edge extraction

**Outputs:**
- **`E1` (Line):** Edges with valence 1 (a single adjacent face)
- **`E2` (Line):** Edges with valence 2 (two adjacent faces)
- **`E3` (Line):** Edges with valence 3 or higher

### Mesh Eval
**Nickname:** `MEval`
**Description:** Evaluate a mesh at a given parameter
**GUID:** `b2dc090f-b022-4264-8889-87e22979336e`

**Inputs:**
- **`M` (Mesh):** Mesh to evaluate
- **`P` (Mesh Parameter):** Mesh parameter for evaluation

**Outputs:**
- **`P` (Point):** Point at mesh parameter
- **`N` (Vector):** Normal vector at mesh parameter
- **`C` (Colour):** Colour at mesh parameter

### Mesh Inclusion
**Nickname:** `MInc`
**Description:** Test a point for Mesh inclusion
**GUID:** `01e3991d-18bd-474f-9fbd-076a8700159f`

**Inputs:**
- **`M` (Mesh):** Mesh for inclusion test (only closed meshes will be considered)
- **`P` (Point):** Point for inclusion test
- **`S` (Boolean):** If true, then the inclusion is strict

**Outputs:**
- **`I` (Boolean):** Inside flag for point inclusion

***

## Category: Mesh > Primitive

### Construct Mesh
**Nickname:** `ConMesh`
**Description:** Construct a mesh from vertices, faces and optional colours.
**GUID:** `e2c0f9db-a862-4bd9-810c-ef2610e7a56f`

**Inputs:**
- **`V` (Point):** Vertices of mesh object
- **`F` (Mesh face):** Faces of mesh object
- **`C` (Colour):** Optional vertex colours

**Outputs:**
- **`M` (Mesh):** Constructed mesh

### Mesh Box
**Nickname:** `MBox`
**Description:** Create a mesh box.
**GUID:** `2696bd14-3fb5-4750-827f-86df6c31d664`

**Inputs:**
- **`B` (Box):** Base box
- **`X` (Integer):** Face count in {x} direction
- **`Y` (Integer):** Face count in {y} direction
- **`Z` (Integer):** Face count in {z} direction

**Outputs:**
- **`M` (Mesh):** The 3D mesh box

### Mesh Colours
**Nickname:** `MCol`
**Description:** Assign a repeating colour pattern to a mesh object.
**GUID:** `d2cedf38-1149-4adc-8dbf-b06571cb5106`

**Inputs:**
- **`M` (Mesh):** Base mesh
- **`C` (Colour):** Colour pattern

**Outputs:**
- **`M` (Mesh):** Coloured mesh

### Mesh Plane
**Nickname:** `MPlane`
**Description:** Create a mesh plane.
**GUID:** `8adbf481-7589-4a40-b490-006531ea001d`

**Inputs:**
- **`B` (Rectangle):** Rectangle describing boundary of plane
- **`W` (Integer):** Number of faces along {x} direction
- **`H` (Integer):** Number of faces along {y} direction

**Outputs:**
- **`M` (Mesh):** Mesh plane
- **`A` (Number):** Area of mesh plane

### Mesh Quad
**Nickname:** `Quad`
**Description:** Create a mesh quad.
**GUID:** `1cb59c86-7f6b-4e52-9a0c-6441850e9520`

**Inputs:**
- **`A` (Integer):** Index of first face corner
- **`B` (Integer):** Index of second face corner
- **`C` (Integer):** Index of third face corner
- **`D` (Integer):** Index of fourth face corner

**Outputs:**
- **`F` (Mesh face):** Quadrangular mesh face

### Mesh Sphere
**Nickname:** `MSphere`
**Description:** Create a mesh sphere.
**GUID:** `0a391eac-5048-443c-9c1b-f592299b6dd6`

**Inputs:**
- **`B` (Plane):** Base plane
- **`R` (Number):** Radius of mesh sphere
- **`U` (Integer):** Number of faces around sphere
- **`V` (Integer):** Number of faces from pole to pole

**Outputs:**
- **`M` (Mesh):** Mesh sphere

### Mesh Sphere Ex
**Nickname:** `MSphereEx`
**Description:** Create a mesh sphere from square patches.
**GUID:** `76f85ee4-5a88-4511-8ba7-30df07e50533`

**Inputs:**
- **`B` (Plane):** Base plane
- **`R` (Number):** Radius of mesh sphere
- **`C` (Integer):** Number of faces along each patch edge

**Outputs:**
- **`M` (Mesh):** Mesh sphere

### Mesh Spray
**Nickname:** `MSpray`
**Description:** Assign colours to a mesh based on spray points.
**GUID:** `edcf10e1-02a0-48a4-ae2d-70c50d903dc8`

**Inputs:**
- **`M` (Mesh):** Base mesh
- **`P` (Point):** Spray points
- **`C` (Colour):** Colours of spray points

**Outputs:**
- **`M` (Mesh):** Sprayed mesh

### Mesh Triangle
**Nickname:** `Triangle`
**Description:** Create a mesh triangle.
**GUID:** `5a4ddedd-5af9-49e5-bace-12910a8b9366`

**Inputs:**
- **`A` (Integer):** Index of first face corner
- **`B` (Integer):** Index of second face corner
- **`C` (Integer):** Index of third face corner

**Outputs:**
- **`F` (Mesh face):** Triangular mesh face

***

## Category: Mesh > Triangulation

### Convex Hull
**Nickname:** `Hull`
**Description:** Compute the planar, convex hull for a collection of points
**GUID:** `9d0c5284-ea24-4f9f-a183-ef57fc48b5b8`

**Inputs:**
- **`P` (Point):** Points for convex hull solution
- **`Pl` (Plane):** Optional base plane. If no plane is provided, then the best-fit plane will be used.

**Outputs:**
- **`H` (Curve):** Convex hull in base plane space
- **`Hz` (Curve):** Convex hull in world space
- **`I` (Integer):** Indices of points on convex hull

### Delaunay Edges
**Nickname:** `Con`
**Description:** Delaunay connectivity
**GUID:** `db2a4d25-23fa-4887-8983-ee5293cc82c0`

**Inputs:**
- **`P` (Point):** Points for triangulate
- **`Pl` (Plane):** Optional base plane. If no plane is provided, then the best-fit plane will be used.

**Outputs:**
- **`C` (Integer):** Topological Connectivity diagram
- **`E` (Line):** Edges of the connectivity diagram

### Delaunay Mesh
**Nickname:** `Del`
**Description:** Delaunay triangulation
**GUID:** `1eb4f6ff-3547-4184-bead-1b01e7cfd668`

**Inputs:**
- **`P` (Point):** Points for triangulate
- **`Pl` (Plane):** Optional base plane. If no plane is provided, then the best-fit plane will be used.

**Outputs:**
- **`M` (Mesh):** Mesh

### Facet Dome
**Nickname:** `Facet`
**Description:** Create a facetted dome
**GUID:** `190c0070-8cbf-4347-94c2-d84bbb488d55`

**Inputs:**
- **`P` (Point):** Points on dome that describe the facet centers
- **`B` (Box):** Optional bounding box for facet boundary
- **`R` (Number):** Optional radius for facets

**Outputs:**
- **`P` (Curve):** Complete facet pattern
- **`D` (Surface):** dome surface

### MetaBall
**Nickname:** `MetaBall`
**Description:** 2D Metaball isocurve through point
**GUID:** `dc934310-67eb-4d1d-8607-7cc62a501dd9`

**Inputs:**
- **`P` (Point):** Point charge locations
- **`Pl` (Plane):** Metaball section plane
- **`X` (Point):** Isocurve intersection
- **`A` (Number):** Isocurve sampling accuracy (leave blank for adaptive accuracy)

**Outputs:**
- **`I` (Curve):** Metaball isocurve

### MetaBall(t)
**Nickname:** `MetaBall(t)`
**Description:** 2D Metaball isosurface by threshold
**GUID:** `c48cf4d4-432c-41b6-b77a-77650479a31f`

**Inputs:**
- **`P` (Point):** Point charge locations
- **`Pl` (Plane):** Metaball section plane
- **`T` (Number):** Isocurve threshold value
- **`A` (Number):** Isocurve sampling accuracy (leave blank for default accuracy)

**Outputs:**
- **`I` (Curve):** Metaball isocurves

### MetaBall(t) Custom
**Nickname:** `MetaBall(t)`
**Description:** 2D Metaball isosurface by threshold and custom charge values
**GUID:** `c4373505-a4cf-4992-8db1-fd6e6bb5850d`

**Inputs:**
- **`P` (Point):** Point charge locations
- **`C` (Number):** Point charges (positive values only)
- **`Pl` (Plane):** Metaball section plane
- **`T` (Number):** Isocurve threshold value
- **`A` (Number):** Isocurve sampling accuracy (leave blank for default accuracy)

**Outputs:**
- **`I` (Curve):** Metaball isocurves

### OcTree
**Nickname:** `OcT`
**Description:** A three-dimensional oc-tree structure
**GUID:** `a59a68ad-fdd6-41dd-88f0-d7a6fb8d2e16`

**Inputs:**
- **`P` (Point):** Input points
- **`S` (Boolean):** Square leafs
- **`G` (Integer):** Permitted content per leaf

**Outputs:**
- **`B` (Box):** Oc-tree leave boxes
- **`P` (Point):** Points per box

### Proximity 2D
**Nickname:** `Prox`
**Description:** Search for two-dimensional proximity within a point list
**GUID:** `458ed0e0-19a3-419b-8ead-f524925b8a35`

**Inputs:**
- **`P` (Point):** Input points
- **`Pl` (Plane):** Optional base plane. If null, the best fit plane is used
- **`G` (Integer):** Maximum number of closest points to find
- **`R-` (Number):** Optional minimum search radius.
- **`R+` (Number):** Optional maximum search radius.

**Outputs:**
- **`L` (Line):** Proximity links
- **`T` (Integer):** Proximity topology

### Proximity 3D
**Nickname:** `Prox`
**Description:** Search for three-dimensional proximity within a point list
**GUID:** `e504d619-4467-437a-92fa-c6822d16b066`

**Inputs:**
- **`P` (Point):** Input points
- **`G` (Integer):** Maximum number of closest points to find
- **`R-` (Number):** Optional minimum search radius.
- **`R+` (Number):** Optional maximum search radius.

**Outputs:**
- **`L` (Line):** Proximity links
- **`T` (Integer):** Proximity topology

### Quad Remesh
**Nickname:** `QRMesh`
**Description:** Perform quad-remeshing on a shape.
**GUID:** `1a17d3f0-c8f8-4ee9-8dab-ea1c29db6a49`

**Inputs:**
- **`M` (Mesh):** Mesh to operate on
- **`G` (Curve):** Guide curves
- **`S` (Quad meshing settings):** Remeshing settings

**Outputs:**
- **`Q` (Mesh):** Resulting mesh with quad faces only.

### Quad Remesh Settings
**Nickname:** `QRSettings`
**Description:** Create setting for Quad-remeshing.
**GUID:** `f562505b-4c49-49d1-932d-c8804b3fcec6`

**Inputs:**
- **`Tc` (Integer):** Number of quads to aim for in the result.
- **`As` (Number):** A number in the range [0, 100] controlling how the quad sizes change depending on curvature.
- **`Ac` (Boolean):** True if the number of quads is allowed to be higher for high-curvature areas.
- **`He` (Boolean):** Detect and retain hard edges in the input mesh.
- **`Se` (Integer):** Detect and retain brep-face boundary edges (0=Off, 1=Smart, 2=Strict).
- **`Sy` (Integer):** Symmetry axis (0=none, 1=X, 2=Y, 3=Z).
- **`Gc` (Integer):** Guide curve influence. (0=approximate, 1=edge-ring, 2=edge-loop).

**Outputs:**
- **`S` (Quad meshing settings):** Quad-remesher settings

### QuadTree
**Nickname:** `QT`
**Description:** A two-dimensional quadtree structure
**GUID:** `8102032b-9699-4949-ab12-3017a31d1062`

**Inputs:**
- **`P` (Point):** Input points
- **`Pl` (Plane):** Optional base plane. If omitted, the best fit plane is used
- **`S` (Boolean):** Square leafs
- **`G` (Integer):** Permitted content per leaf

**Outputs:**
- **`Q` (Curve):** Quad tree leaves
- **`P` (Point):** Points per quad

### Substrate
**Nickname:** `Substrate`
**Description:** Substrate algorithm inspired by Jared Tarbell (Complexification.net)
**GUID:** `415750fd-c0ec-4411-84d0-01f28ab23066`

**Inputs:**
- **`B` (Rectangle):** Border for substrate
- **`N` (Integer):** Number of lines in substrate
- **`A` (Number):** Base angles (in radians) in substrate
- **`D` (Number):** Angular deviation (in radians) of new lines
- **`S` (Integer):** Random seed for solution

**Outputs:**
- **`S` (Line):** Substrate diagram

### TriRemesh
**Nickname:** `TriRemesh`
**Description:** Convert a Brep or Mesh into a mesh of near equilateral triangles
**GUID:** `866222ee-6093-4af8-8944-2f9264885385`

**Inputs:**
- **`Geometry` (Geometry):** Initial Mesh, Brep, Surface or Curve to remesh
- **`Target` (Mesh):** Optional different target mesh to pull to. If none given, initial mesh is used.
- **`Sharp` (Boolean):** Preserve sharp features
- **`Features` (Generic Data):** Optional additional curves or points to preserve
- **`Length` (Number):** Target edge length
- **`Iters` (Integer):** Number of remeshing steps to perform

**Outputs:**
- **`T` (Mesh):** Remeshed result
- **`D` (Mesh):** Dual Ngon mesh
- **`C` (Line):** Edge lines of sharp features

### Voronoi
**Nickname:** `Voronoi`
**Description:** Planar voronoi diagram for a collection of points
**GUID:** `a4011be0-1c91-45bd-8280-17dd3a9f46f1`

**Inputs:**
- **`P` (Point):** Points for Voronoi diagram
- **`R` (Number):** Optional cell radius
- **`B` (Rectangle):** Optional containment boundary for diagram.
- **`Pl` (Plane):** Optional base plane. If no plane is provided, then the best-fit plane will be used.

**Outputs:**
- **`C` (Curve):** Cells of the voronoi diagram.

### Voronoi 3D
**Nickname:** `Voronoi³`
**Description:** Volumetric voronoi diagram for a collection of points
**GUID:** `ba9bb57a-61cf-4207-a1c4-994e371ba4f9`

**Inputs:**
- **`P` (Point):** Points for Voronoi diagram
- **`B` (Box):** Optional diagram boundary

**Outputs:**
- **`C` (Brep):** Cells of the 3D Voronoi diagram
- **`B` (Boolean):** List of boolean values indicating for each cell whether it is part of the original boundary

### Voronoi Cell
**Nickname:** `VCell`
**Description:** Compute a single 3D Voronoi cell
**GUID:** `7b181be1-30e7-4a97-915a-1b461741aef8`

**Inputs:**
- **`P` (Point):** Seed point for voronoi cell
- **`N` (Point):** Neighbour points
- **`B` (Box):** Optional cell boundary

**Outputs:**
- **`C` (Brep):** Voronoi 3D cell

### Voronoi Groups
**Nickname:** `VorGroup`
**Description:** Compute a custom set of nested voronoi diagrams.
**GUID:** `9d4854fe-70db-4863-967b-4120d0b6d2e4`

**Inputs:**
- **`B` (Rectangle):** Diagram boundary
- **`G1` (Point):** Points in generation 1
- **`G2` (Point):** Points in generation 2

**Outputs:**
- **`D1` (Curve):** Voronoi diagram for generation 1
- **`D2` (Curve):** Voronoi diagram for generation 2

***

## Category: Mesh > Util

### Align Vertices
**Nickname:** `AlignVert`
**Description:** Align nearby vertices in a mesh
**GUID:** `db661dd7-63a4-44c6-91f2-6faab2471383`

**Inputs:**
- **`M` (Mesh):** Mesh to align
- **`T` (Number):** Alignment tolerance

**Outputs:**
- **`R` (Mesh):** Aligned mesh
- **`N` (Integer):** Number of aligned vertices

### Blur Mesh
**Nickname:** `MBlur`
**Description:** Blur the colours on a mesh
**GUID:** `48a9fa10-8d3c-4767-aca6-81232271f6e0`

**Inputs:**
- **`M` (Mesh):** Mesh to blur
- **`I` (Integer):** Number of consecutive blurring iterations

**Outputs:**
- **`M` (Mesh):** Mesh with blurred vertex colours

### Cull Faces
**Nickname:** `CullF`
**Description:** Cull faces from a mesh
**GUID:** `57edd208-760a-4f0f-87e6-ca1bbd74133b`

**Inputs:**
- **`M` (Mesh):** Mesh for face culling
- **`P` (Boolean):** Face culling pattern

**Outputs:**
- **`M` (Mesh):** Mesh with all indicated faces removed

### Cull Vertices
**Nickname:** `CullV`
**Description:** Cull vertices from a mesh
**GUID:** `9d50bf9b-46bc-403a-9ec9-1052f51dd6b6`

**Inputs:**
- **`M` (Mesh):** Mesh for vertex culling
- **`P` (Boolean):** Vertex culling pattern
- **`S` (Boolean):** Shrink quads, if true, quads will become triangles if possible

**Outputs:**
- **`M` (Mesh):** Mesh with all indicated vertices removed

### Delete Faces
**Nickname:** `DeleteF`
**Description:** Delete faces from a mesh
**GUID:** `d0f1311b-8287-4484-b2ea-1475c6770926`

**Inputs:**
- **`M` (Mesh):** Mesh for face deletion
- **`I` (Integer):** List of all face indices to delete

**Outputs:**
- **`M` (Mesh):** Mesh with all indexed faces removed

### Delete Vertices
**Nickname:** `DeleteV`
**Description:** Delete vertices from a mesh
**GUID:** `23d715f7-4bc6-4e69-b76d-7c04ca2ebf5f`

**Inputs:**
- **`M` (Mesh):** Mesh for vertex deletion
- **`I` (Integer):** List of all vertex indices to delete
- **`S` (Boolean):** Shrink quads, if true, quads will become triangles if possible

**Outputs:**
- **`M` (Mesh):** Mesh with all indexed vertices removed

### Disjoint Mesh
**Nickname:** `Disjoint`
**Description:** Split a mesh into disjoint pieces.
**GUID:** `4dce5963-dc1a-4710-8991-9437ea23888d`

**Inputs:**
- **`M` (Mesh):** Mesh to split

**Outputs:**
- **`M` (Mesh):** Disjoint pieces

### Exposure
**Nickname:** `Exposure`
**Description:** Solve mesh exposure for a collection of energy rays and obstructions.
**GUID:** `a78e3fbc-d199-4bd9-8df0-fc4c2743eb31`

**Inputs:**
- **`S` (Mesh):** Mesh for exposure solution
- **`O` (Mesh):** Optional additional obstructing geometry
- **`R` (Vector):** Light ray directions
- **`E` (Number):** Optional Energy values for each ray
- **`L` (Boolean):** If true, Lambertian shading will be applied,

**Outputs:**
- **`E` (Number):** Combined exposure for every individual mesh vertex.
- **`R` (Domain):** Exposure Range for the entire mesh.

### Flip Mesh
**Nickname:** `FlipM`
**Description:** Flip the normal vectors of a mesh
**GUID:** `47fbc929-e88a-4a13-882e-dad84763256d`

**Inputs:**
- **`M` (Mesh):** Mesh to flip
- **`Vn` (Boolean):** Flip all vertex normals
- **`Fn` (Boolean):** Flip all face normals
- **`Fo` (Boolean):** Reverse all face orientations

**Outputs:**
- **`R` (Mesh):** Flipped mesh

### Mesh Brep
**Nickname:** `Mesh`
**Description:** Create a mesh that approximates Brep geometry
**GUID:** `60e7defa-8b21-4ee1-99aa-a9223d6134ff`

**Inputs:**
- **`B` (Brep):** Brep geometry
- **`S` (MeshParameters):** Settings to be used by meshing algorithm

**Outputs:**
- **`M` (Mesh):** Mesh approximation

### Mesh Join
**Nickname:** `MJoin`
**Description:** Join a set of meshes into a single mesh
**GUID:** `4bc9dbbf-fec8-4348-a3af-e33e7edc8e7b`

**Inputs:**
- **`M` (Mesh):** Meshes to join

**Outputs:**
- **`M` (Mesh):** Mesh join result

### Mesh Shadow
**Nickname:** `MShadow`
**Description:** Compute the shadow outline for a mesh object
**GUID:** `c3dce3e8-c9cc-413c-a93f-732434282fdd`

**Inputs:**
- **`M` (Mesh):** Mesh for shadow casting
- **`L` (Vector):** Direction of light rays
- **`P` (Plane):** Plane that receives the shadows

**Outputs:**
- **`O` (Curve):** Shadow contours

### Mesh Split Plane
**Nickname:** `MSplit`
**Description:** Split a mesh with an infinite plane.
**GUID:** `330eb9c9-0098-4375-9078-e00a419d49fb`

**Inputs:**
- **`M` (Mesh):** Mesh to split
- **`P` (Plane):** Splitting plane

**Outputs:**
- **`A` (Mesh):** Pieces above the plane.
- **`B` (Mesh):** Pieces below the plane.

### Mesh Surface
**Nickname:** `Mesh UV`
**Description:** Create a Surface UV mesh
**GUID:** `58cf422f-19f7-42f7-9619-fc198c51c657`

**Inputs:**
- **`S` (Surface):** Surface geometry
- **`U` (Integer):** Number of quads in U direction
- **`V` (Integer):** Number of quads in V direction
- **`H` (Boolean):** Allow faces to overhang trims
- **`Q` (Boolean):** Equalize span length

**Outputs:**
- **`M` (Mesh):** UV Mesh

### Occlusion
**Nickname:** `Occ`
**Description:** Solve occlusion for a collection of view rays and obstructions.
**GUID:** `1583bd7e-4ab7-4439-b922-d6f8cd63c399`

**Inputs:**
- **`S` (Point):** Sample points for occlusion testing
- **`O` (Mesh):** Obstructing geometry
- **`R` (Vector):** View rays

**Outputs:**
- **`H` (Integer):** Number of occluded rays per sample.
- **`O` (Boolean):** Occlusion topology for every individual sample.

### Quadrangulate
**Nickname:** `Quad`
**Description:** Quadrangulate as many triangles as possible in a mesh
**GUID:** `9266a2bb-918f-4675-9c91-f67d0dd33eac`

**Inputs:**
- **`M` (Mesh):** Mesh to quadrangulate
- **`A` (Number):** Angle threshold. Triangles that exceed this kink-angle will not be merged.
- **`R` (Number):** Ratio threshold. Quads that have a ratio (shortest diagonal/longest diagonal) that exceed the threshold, will not be considered.

**Outputs:**
- **`M` (Mesh):** Quadrangulated mesh (not all triangles are guaranteed to be converted).
- **`N` (Integer):** Number of triangles that were quadrangulated

### Settings (Custom)
**Nickname:** `Custom Mesh Settings`
**Description:** Represents custom mesh settings.
**GUID:** `4a0180e5-d8f9-46e7-bd34-ced804601462`

**Inputs:**
- **`Stitch` (Boolean):** Edges of adjacent faces are matched up if True.
- **`Planes` (Boolean):** Planar faces are meshed with a minimum amount of triangles.
- **`Refine` (Boolean):** Refine the initial grid if it exceeds tolerance accuracy.
- **`Min` (Integer):** Minimum number of quads in the initial grid per face.
- **`Max` (Integer):** Maximum number of quads in the initial grid per face.
- **`Aspect` (Number):** Maximum aspect ratio of quads in the initial grid.
- **`Max Dist` (Number):** Maximum allowed distance between center of edges and underlying surface.
- **`Max Angle` (Number):** Maximum allowed angle (in degrees) between the normals of two adjacent quads.
- **`Min Edge` (Number):** Minimum allowed edge length.
- **`Max Edge` (Number):** Maximum allowed edge length.

**Outputs:**
- **`S` (MeshParameters):** Smooth mesh settings

### Settings (Quality)
**Nickname:** `Smooth`
**Description:** Represents 'Smooth & slower' mesh settings.
**GUID:** `1b0ee096-cc76-4847-8941-04a9e256de76`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`S` (MeshParameters):** Smooth mesh settings

### Settings (Speed)
**Nickname:** `Jagged`
**Description:** Represents 'Jagged & faster' mesh settings.
**GUID:** `255ca3e9-2c1e-443a-a404-e76b5c63f4cb`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`S` (MeshParameters):** Coarse mesh settings

### Simple Mesh
**Nickname:** `SMesh`
**Description:** Create a mesh that represents a Brep as simply as possible
**GUID:** `c3f9cea5-6fd4-4db5-959b-08cd08ed9fe1`

**Inputs:**
- **`B` (Brep):** Brep to mesh, only breps with triangle or quad faces are supported.

**Outputs:**
- **`M` (Mesh):** Mesh

### Smooth Mesh
**Nickname:** `MSmooth`
**Description:** Smooth the vertices of a mesh
**GUID:** `e45aa4a0-e40d-421c-a335-5185dd131836`

**Inputs:**
- **`M` (Mesh):** Mesh to smooth
- **`S` (Number):** Smoothing strength (0.0=none, 1.0=max)
- **`N` (Boolean):** Skip naked vertices
- **`I` (Integer):** Number of successive smoothing steps
- **`L` (Number):** Optional maximum displacement per point

**Outputs:**
- **`M` (Mesh):** Smoothed mesh

### Triangulate
**Nickname:** `Tri`
**Description:** Triangulate all quads in a mesh
**GUID:** `3fba11d5-b30a-4146-8d80-d591e7a0a287`

**Inputs:**
- **`M` (Mesh):** Mesh to triangulate

**Outputs:**
- **`M` (Mesh):** Mesh with only triangle faces
- **`N` (Integer):** Number of quads that were triangulated

### Unify Mesh
**Nickname:** `UniM`
**Description:** Unify the normals of a mesh
**GUID:** `ca6a48f4-b681-4989-b0c1-301a2929a84c`

**Inputs:**
- **`M` (Mesh):** Mesh to unify

**Outputs:**
- **`R` (Mesh):** Unified mesh
- **`N` (Integer):** Number of faces that were flipped

### Unweld Mesh
**Nickname:** `Unweld`
**Description:** Unweld (split) creases in a mesh
**GUID:** `47814a17-ca9e-4305-9400-3a9c8d71c19d`

**Inputs:**
- **`M` (Mesh):** Mesh to unweld
- **`A` (Number):** Unweld angle

**Outputs:**
- **`R` (Mesh):** Unwelded mesh

### Weld Mesh
**Nickname:** `Weld`
**Description:** Weld (merge) creases in a mesh
**GUID:** `9f6d85c9-1143-4538-bca7-69dcb11a74ef`

**Inputs:**
- **`M` (Mesh):** Mesh to weld
- **`A` (Number):** Weld angle

**Outputs:**
- **`R` (Mesh):** Welded mesh

***

## Category: Params > Fologram

***

## Category: Params > Geometry

***

## Category: Params > Input

### Atom Data
**Nickname:** `Atom`
**Description:** Get detailed information for an atom
**GUID:** `7b371d04-53e3-47d8-b3dd-7b113c48bc59`

**Inputs:**
- **`A` (Atom):** Atom to evaluate

**Outputs:**
- **`P` (Point):** Location of atom
- **`E` (Text):** Element name of atom
- **`C` (Text):** Chain ID to which this atom belongs
- **`R` (Text):** Residue name to which this atom belongs
- **`e` (Integer):** Charge of this atom
- **`O` (Number):** Occupancy of this atom
- **`T` (Number):** Temperature factor of this atom
- **`AN` (Integer):** Atomic number of atom
- **`SN` (Integer):** Atom serial number
- **`RN` (Integer):** Residue serial number

### Gradient
**Nickname:** `Gradient`
**Description:** Represents a multiple colour gradient
**GUID:** `6da9f120-3ad0-4b6e-9fe0-f8cde3a649b7`

**Inputs:**
- **`L0` (Number):** Lower limit of gradient range
- **`L1` (Number):** Upper limit of gradient range
- **`t` (Number):** Parameter along gradient range

**Outputs:**
- **`C` (Colour):** Colour along gradient at parameter

### Import 3DM
**Nickname:** `3DM`
**Description:** Import geometry into a RhinoDoc
**GUID:** `317f1cb2-820d-4a8f-b5c8-5de3594ddfba`

**Inputs:**
- **`F` (Text):** Location of file
- **`L` (Text):** Layer name filter
- **`N` (Text):** Object name filter

**Outputs:**
- **`G` (Geometry):** Imported geometry

### Import Coordinates
**Nickname:** `Coords`
**Description:** Import point coordinates from generic text files.
**GUID:** `b8a66384-fc66-4574-a8a9-ad18e610d623`

**Inputs:**
- **`F` (Text):** Location of point text file
- **`S` (Text):** Coordinate fragment separator
- **`C` (Text):** Optional comment line start
- **`X` (Integer):** Index of point X coordinate
- **`Y` (Integer):** Index of point Y coordinate
- **`Z` (Integer):** Index of point Z coordinate

**Outputs:**
- **`P` (Point):** Imported points

### Import Image
**Nickname:** `IMG`
**Description:** Import image data from bmp, jpg or png files.
**GUID:** `c2c0c6cf-f362-4047-a159-21a72e7c272a`

**Inputs:**
- **`F` (Text):** Location of image file
- **`R` (Rectangle):** Optional image destination rectangle
- **`X` (Integer):** Number of samples along image X direction
- **`Y` (Integer):** Number of samples along image Y direction

**Outputs:**
- **`I` (Mesh):** A mesh representation of the image

### Import PDB
**Nickname:** `PDB`
**Description:** Import data from Protein Data Bank *.pdb files.
**GUID:** `383929c0-6515-4899-8b4b-3bd0d0b32471`

**Inputs:**
- **`F` (Text):** Location of *.pdb file

**Outputs:**
- **`A` (Atom):** All atoms in the PDB file
- **`B` (Line):** Bonds between atoms

### Import SHP
**Nickname:** `SHP`
**Description:** Import data from GIS *.shp files.
**GUID:** `aa538b89-3df8-436f-9ae4-bc44525984de`

**Inputs:**
- **`F` (Text):** Location of *.shp file

**Outputs:**
- **`P` (Point):** Points in file
- **`C` (Curve):** Curves in file
- **`R` (Brep):** Regions in file

### Object Details
**Nickname:** `ObjDet`
**Description:** Retrieve some details about referenced Rhino objects.
**GUID:** `c7b5c66a-6360-4f5f-aa17-a918d0b1c314`

**Inputs:**
- **`O` (Geometry):** Referenced objects

**Outputs:**
- **`R` (Boolean):** Value indicating whether object was referenced.
- **`A` (Boolean):** Value indicating whether object was available in the current Rhino document.
- **`N` (Text):** Object name, if any.
- **`L` (Text):** Object layer.
- **`C` (Colour):** Object display colour resolved within the current document.
- **`Id` (Guid):** Rhino object id

### Read File
**Nickname:** `File`
**Description:** Read the contents of a file
**GUID:** `6587fcbf-e3cf-480a-b2f5-641794474194`

**Inputs:**
- **`F` (Text):** Uri of file to read

**Outputs:**
- **`C` (Generic Data):** File content

***

## Category: Params > Primitive

***

## Category: Params > Special

### Timeline
**Nickname:** `Timeline`
**Description:** A timeline of values
**GUID:** `33eb59b9-5f81-4ef5-8c89-46e6e744522b`

**Inputs:**
- **`A` (Domain):** Value domain for parameter

**Outputs:**
- **`A` (Number):** Interpolated values for A

***

## Category: Params > SyncGeo

***

## Category: Params > SyncMat

***

## Category: Params > Util

### Cluster
**Nickname:** `Cluster`
**Description:** Contains a cluster of Grasshopper components
**GUID:** `f31d8d7a-7536-4ac8-9c96-fde6ecda4d0a`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- *This component has no outputs.*

### Context Bake
**Nickname:** `Context Bake`
**Description:** Geometry for baking at the end of the GrasshopperPlayer command.
**GUID:** `ae2531b4-bab2-4bb1-b5bf-f2143d10c132`

**Inputs:**
- **`Geometry` (Generic Data):** Geometry to collect for baking

**Outputs:**
- *This component has no outputs.*

### Context Print
**Nickname:** `Context Print`
**Description:** Textual data to print at the end of the GrasshopperPlayer command.
**GUID:** `73215ec5-0eb5-4f85-9e07-b09c4590ce2b`

**Inputs:**
- **`Tx` (Text):** Text for printing.

**Outputs:**
- *This component has no outputs.*

### Data Dam
**Nickname:** `Dam`
**Description:** Delay data on its way through the document
**GUID:** `65283518-ad00-49d3-87fb-f76823ebb162`

**Inputs:**
- **`A` (Generic Data):** Data to buffer

**Outputs:**
- **`A` (Generic Data):** Buffered data

### Data Input
**Nickname:** `Input`
**Description:** Read a bunch of data from a file.
**GUID:** `d8033e3f-8387-4ffc-ab99-929218e8c740`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- *This component has no outputs.*

### Data Output
**Nickname:** `Output`
**Description:** Write a bunch of data to a file.
**GUID:** `dcd23728-8e0e-4241-94b3-7cc3985031dd`

**Inputs:**
- **`A` (Generic Data):** Data to include in the file.

**Outputs:**
- *This component has no outputs.*

### Fitness Landscape
**Nickname:** `LScape`
**Description:** Display a 2.5D fitness landscape
**GUID:** `fe9db51e-1ac6-4298-b9dc-6acf3008c8f2`

**Inputs:**
- **`B` (Rectangle):** Landscape bounds
- **`V` (Number):** Landscape values
- **`N` (Integer):** Number of samples along X direction

**Outputs:**
- **`L` (Mesh):** Landscaper mesh

***

## Category: Sets > List

### Combine Data
**Nickname:** `Combine`
**Description:** Combine non-null items out of several inputs
**GUID:** `e7c80ff6-0299-4303-be36-3080977c14a1`

**Inputs:**
- **`0` (Generic Data):** Data to combine
- **`1` (Generic Data):** Data to combine

**Outputs:**
- **`R` (Generic Data):** Resulting data with as few nulls as possible
- **`I` (Integer):** Index of input that was copied into result

### Cross Reference
**Nickname:** `CrossRef`
**Description:** Cross Reference data from multiple lists
**GUID:** `36947590-f0cb-4807-a8f9-9c90c9b20621`

**Inputs:**
- **`A` (Generic Data):** List (A) to operate on
- **`B` (Generic Data):** List (B) to operate on

**Outputs:**
- **`A` (Generic Data):** Adjusted list (A)
- **`B` (Generic Data):** Adjusted list (B)

### Dispatch
**Nickname:** `Dispatch`
**Description:** Dispatch the items in a list into two target lists.
**GUID:** `d8332545-21b2-4716-96e3-8559a9876e17`

**Inputs:**
- **`L` (Generic Data):** List to filter
- **`P` (Boolean):** Dispatch pattern

**Outputs:**
- **`A` (Generic Data):** Dispatch target for True values
- **`B` (Generic Data):** Dispatch target for False values

### Insert Items
**Nickname:** `Ins`
**Description:** Insert a collection of items into a list.
**GUID:** `e2039b07-d3f3-40f8-af88-d74fed238727`

**Inputs:**
- **`L` (Generic Data):** List to modify
- **`I` (Generic Data):** Items to insert. If no items are supplied, nulls will be inserted.
- **`i` (Integer):** Insertion index for each item
- **`W` (Boolean):** If true, indices will be wrapped

**Outputs:**
- **`L` (Generic Data):** List with inserted values

### Item Index
**Nickname:** `Index`
**Description:** Retrieve the index of a certain item in a list.
**GUID:** `a759fd55-e6be-4673-8365-c28d5b52c6c0`

**Inputs:**
- **`L` (Generic Data):** List to search
- **`i` (Generic Data):** Item to search for

**Outputs:**
- **`i` (Integer):** The index of item in the list, or -1 if the item could not be found.

### List Item
**Nickname:** `Item`
**Description:** Retrieve a specific item from a list.
**GUID:** `59daf374-bc21-4a5e-8282-5504fb7ae9ae`

**Inputs:**
- **`L` (Generic Data):** Base list
- **`i` (Integer):** Item index
- **`W` (Boolean):** Wrap index to list bounds

**Outputs:**
- **`i` (Generic Data):** Item at {i'}

### List Length
**Nickname:** `Lng`
**Description:** Measure the length of a list.
**GUID:** `1817fd29-20ae-4503-b542-f0fb651e67d7`

**Inputs:**
- **`L` (Generic Data):** Base list

**Outputs:**
- **`L` (Integer):** Number of items in L

### Longest List
**Nickname:** `Long`
**Description:** Grow a collection of lists to the longest length amongst them
**GUID:** `8440fd1b-b6e0-4bdb-aa93-4ec295c213e9`

**Inputs:**
- **`A` (Generic Data):** List (A) to operate on
- **`B` (Generic Data):** List (B) to operate on

**Outputs:**
- **`A` (Generic Data):** Adjusted list (A)
- **`B` (Generic Data):** Adjusted list (B)

### Null Item
**Nickname:** `Null`
**Description:** Test a data item for null or invalidity
**GUID:** `c74efd0e-7fe3-4c2d-8c9d-295c5672fb13`

**Inputs:**
- **`I` (Generic Data):** Item to test

**Outputs:**
- **`N` (Boolean):** True if item is Null
- **`X` (Boolean):** True if item is Invalid
- **`D` (Text):** A textual description of the object state

### Partition List
**Nickname:** `Partition`
**Description:** Partition a list into sub-lists
**GUID:** `5a93246d-2595-4c28-bc2d-90657634f92a`

**Inputs:**
- **`L` (Generic Data):** List to partition
- **`S` (Integer):** Size of partitions

**Outputs:**
- **`C` (Generic Data):** List chunks

### Pick'n'Choose
**Nickname:** `P'n'C`
**Description:** Pick and choose from a set of input data.
**GUID:** `03b801eb-87cd-476a-a591-257fe5d5bf0f`

**Inputs:**
- **`P` (Integer):** Pick pattern of input indices
- **`0` (Generic Data):** Input stream 0
- **`1` (Generic Data):** Input stream 1

**Outputs:**
- **`R` (Generic Data):** Picked result

### Replace Items
**Nickname:** `Replace`
**Description:** Replace certain items in a list.
**GUID:** `7a218bfb-b93d-4c1f-83d3-5a0b909dd60b`

**Inputs:**
- **`L` (Generic Data):** List to modify
- **`I` (Generic Data):** Items to replace with. If no items are supplied, nulls will be inserted.
- **`i` (Integer):** Replacement index for each item
- **`W` (Boolean):** If true, indices will be wrapped

**Outputs:**
- **`L` (Generic Data):** List with replaced values

### Replace Nulls
**Nickname:** `NullRep`
**Description:** Replace nulls or invalid data with other data
**GUID:** `f3230ecb-3631-4d6f-86f2-ef4b2ed37f45`

**Inputs:**
- **`I` (Generic Data):** Items to test for null
- **`R` (Generic Data):** Items to replace nulls with

**Outputs:**
- **`I` (Generic Data):** List without any nulls
- **`N` (Integer):** Number of items replaced

### Reverse List
**Nickname:** `Rev`
**Description:** Reverse the order of a list.
**GUID:** `6ec97ea8-c559-47a2-8d0f-ce80c794d1f4`

**Inputs:**
- **`L` (Generic Data):** Base list

**Outputs:**
- **`L` (Generic Data):** Reversed list

### Shift List
**Nickname:** `Shift`
**Description:** Offset all items in a list.
**GUID:** `4fdfe351-6c07-47ce-9fb9-be027fb62186`

**Inputs:**
- **`L` (Generic Data):** List to shift
- **`S` (Integer):** Shift offset
- **`W` (Boolean):** Wrap values

**Outputs:**
- **`L` (Generic Data):** Shifted list

### Shortest List
**Nickname:** `Short`
**Description:** Shrink a collection of lists to the shortest length amongst them
**GUID:** `5a13ec19-e4e9-43da-bf65-f93025fa87ca`

**Inputs:**
- **`A` (Generic Data):** List (A) to operate on
- **`B` (Generic Data):** List (B) to operate on

**Outputs:**
- **`A` (Generic Data):** Adjusted list (A)
- **`B` (Generic Data):** Adjusted list (B)

### Sift Pattern
**Nickname:** `Sift`
**Description:** Sift elements in a list using a repeating index pattern.
**GUID:** `3249222f-f536-467a-89f4-f0353fba455a`

**Inputs:**
- **`L` (Generic Data):** List to sift
- **`P` (Integer):** Sifting pattern

**Outputs:**
- **`0` (Generic Data):** Output for sift index 0
- **`1` (Generic Data):** Output for sift index 1

### Sort List
**Nickname:** `Sort`
**Description:** Sort a list of numeric keys.
**GUID:** `6f93d366-919f-4dda-a35e-ba03dd62799b`

**Inputs:**
- **`K` (Number):** List of sortable keys
- **`A` (Generic Data):** Optional list of values to sort synchronously

**Outputs:**
- **`K` (Number):** Sorted keys
- **`A` (Generic Data):** Synchronous values in A

### Split List
**Nickname:** `Split`
**Description:** Split a list into separate parts.
**GUID:** `9ab93e1a-ebdf-4090-9296-b000cff7b202`

**Inputs:**
- **`L` (Generic Data):** Base list
- **`i` (Integer):** Splitting index

**Outputs:**
- **`A` (Generic Data):** Items to the left of (i)
- **`B` (Generic Data):** Items to the right of and including (i)

### Sub List
**Nickname:** `SubSet`
**Description:** Extract a subset from a list.
**GUID:** `b333ff42-93bd-406b-8e17-15780719b6ec`

**Inputs:**
- **`L` (Generic Data):** Base list
- **`D` (Domain):** Domain of indices to copy
- **`W` (Boolean):** Remap indices that overshoot list domain

**Outputs:**
- **`L` (Generic Data):** Subset of base list
- **`I` (Integer):** Indices of subset items

### Weave
**Nickname:** `Weave`
**Description:** Weave a set of input data using a custom pattern.
**GUID:** `50faccbd-9c92-4175-a5fa-d65e36013db6`

**Inputs:**
- **`P` (Integer):** Weave pattern of input indices
- **`0` (Generic Data):** Input stream  0
- **`1` (Generic Data):** Input stream  1

**Outputs:**
- **`W` (Generic Data):** Weave result

***

## Category: Sets > Sequence

### Char Sequence
**Nickname:** `CharSeq`
**Description:** Create a sequence of textual characters.
**GUID:** `01640871-69ea-40ac-9380-4660d6d28bd2`

**Inputs:**
- **`C` (Integer):** Number of elements in the sequence.
- **`P` (Text):** Pool of characters available to the sequence.
- **`F` (Text):** Optional formatting mask

**Outputs:**
- **`S` (Text):** Sequence of character tags

### Cull Index
**Nickname:** `Cull i`
**Description:** Cull (remove) indexed elements from a list.
**GUID:** `501aecbb-c191-4d13-83d6-7ee32445ac50`

**Inputs:**
- **`L` (Generic Data):** List to cull
- **`I` (Integer):** Culling indices
- **`W` (Boolean):** Wrap indices to list range

**Outputs:**
- **`L` (Generic Data):** Culled list

### Cull Nth
**Nickname:** `CullN`
**Description:** Cull (remove) every Nth element in a list.
**GUID:** `932b9817-fcc6-4ac3-b5fd-c0e8eeadc53f`

**Inputs:**
- **`L` (Generic Data):** List to cull
- **`N` (Integer):** Cull frequency

**Outputs:**
- **`L` (Generic Data):** Culled list

### Cull Pattern
**Nickname:** `Cull`
**Description:** Cull (remove) elements in a list using a repeating bit mask.
**GUID:** `008e9a6f-478a-4813-8c8a-546273bc3a6b`

**Inputs:**
- **`L` (Generic Data):** List to cull
- **`P` (Boolean):** Culling pattern

**Outputs:**
- **`L` (Generic Data):** Culled list

### Duplicate Data
**Nickname:** `Dup`
**Description:** Duplicate data a predefined number of times.
**GUID:** `dd8134c0-109b-4012-92be-51d843edfff7`

**Inputs:**
- **`D` (Generic Data):** Data to duplicate
- **`N` (Integer):** Number of duplicates
- **`O` (Boolean):** Retain list order

**Outputs:**
- **`D` (Generic Data):** Duplicated data

### Fibonacci
**Nickname:** `Fib`
**Description:** Creates a Fibonacci sequence.
**GUID:** `fe99f302-3d0d-4389-8494-bd53f7935a02`

**Inputs:**
- **`A` (Number):** First seed number of the sequence
- **`B` (Number):** Second seed number of the sequence
- **`N` (Integer):** Number of values in the sequence

**Outputs:**
- **`S` (Number):** First N numbers in this Fibonacci sequence

### Jitter
**Nickname:** `Jitter`
**Description:** Randomly shuffles a list of values.
**GUID:** `f02a20f6-bb49-4e3d-b155-8ed5d3c6b000`

**Inputs:**
- **`L` (Generic Data):** Values to shuffle
- **`J` (Number):** Shuffling strength. (0.0 = no shuffling, 1.0 = complete shuffling)
- **`S` (Integer):** Seed of shuffling engine

**Outputs:**
- **`V` (Generic Data):** Shuffled values
- **`I` (Integer):** Index map of shuffled items

### Random
**Nickname:** `Random`
**Description:** Generate a list of pseudo random numbers.
**GUID:** `2ab17f9a-d852-4405-80e1-938c5e57e78d`

**Inputs:**
- **`R` (Domain):** Domain of random numeric range
- **`N` (Integer):** Number of random values
- **`S` (Integer):** Seed of random engine

**Outputs:**
- **`R` (Generic Data):** Random numbers

### Random Reduce
**Nickname:** `Reduce`
**Description:** Randomly remove N items from a list
**GUID:** `455925fd-23ff-4e57-a0e7-913a4165e659`

**Inputs:**
- **`L` (Generic Data):** List to reduce
- **`R` (Integer):** Number of items to remove
- **`S` (Integer):** Random Generator Seed value

**Outputs:**
- **`L` (Generic Data):** Reduced list

### RandomEx
**Nickname:** `RndEx`
**Description:** Generate random data between extremes.
**GUID:** `a12dddbf-bb49-4ef4-aeb8-5653bc882cbd`

**Inputs:**
- **`L0` (Integer):** Lower limit
- **`L1` (Integer):** Upper limit
- **`N` (Integer):** Number of values to generate
- **`S` (Integer):** Random Seed

**Outputs:**
- **`V` (Integer):** Random values

### Range
**Nickname:** `Range`
**Description:** Create a range of numbers.
**GUID:** `9445ca40-cc73-4861-a455-146308676855`

**Inputs:**
- **`D` (Domain):** Domain of numeric range
- **`N` (Integer):** Number of steps

**Outputs:**
- **`R` (Number):** Range of numbers

### Repeat Data
**Nickname:** `Repeat`
**Description:** Repeat a pattern until it reaches a certain length.
**GUID:** `c40dc145-9e36-4a69-ac1a-6d825c654993`

**Inputs:**
- **`D` (Generic Data):** Pattern to repeat
- **`L` (Integer):** Length of final pattern

**Outputs:**
- **`D` (Generic Data):** Repeated data

### Sequence
**Nickname:** `Seq`
**Description:** Generate a sequence of numbers
**GUID:** `e9b2d2a6-0377-4c1c-a89e-b3f219a95b4d`

**Inputs:**
- **`N` (Text):** Sequence notation
- **`L` (Integer):** Final length of sequence
- **`I` (Number):** Initial values in sequence

**Outputs:**
- **`S` (Number):** Sequence

### Series
**Nickname:** `Series`
**Description:** Create a series of numbers.
**GUID:** `e64c5fb1-845c-4ab1-8911-5f338516ba67`

**Inputs:**
- **`S` (Number):** First number in the series
- **`N` (Number):** Step size for each successive number
- **`C` (Integer):** Number of values in the series

**Outputs:**
- **`S` (Number):** Series of numbers

### Stack Data
**Nickname:** `Stack`
**Description:** Duplicate individual items in a list of data
**GUID:** `5fa4e736-0d82-4af0-97fb-30a79f4cbf41`

**Inputs:**
- **`D` (Generic Data):** Data to stack
- **`S` (Integer):** Stacking pattern

**Outputs:**
- **`D` (Generic Data):** Stacked data

***

## Category: Sets > Sets

### Carthesian Product
**Nickname:** `CProd`
**Description:** Create the Carthesian product for two sets of identical cardinality.
**GUID:** `deffaf1e-270a-4c15-a693-9216b68afd4a`

**Inputs:**
- **`A` (Generic Data):** First set for carthesian product.
- **`B` (Generic Data):** Second set for carthesian product.

**Outputs:**
- **`P` (Generic Data):** Carthesian product of A and B.

### Create Set
**Nickname:** `CSet`
**Description:** Creates the valid set from a list of items (a valid set only contains distinct elements).
**GUID:** `98c3c63a-e78a-43ea-a111-514fcf312c95`

**Inputs:**
- **`L` (Generic Data):** List of data.

**Outputs:**
- **`S` (Generic Data):** A set of all the distincts values in L
- **`M` (Integer):** An index map from original indices to set indices

### Delete Consecutive
**Nickname:** `DCon`
**Description:** Delete consecutive similar members in a set.
**GUID:** `190d042c-2270-4bc1-81c0-4f90c170c9c9`

**Inputs:**
- **`S` (Generic Data):** Set to operate on.
- **`W` (Boolean):** If true, the last and first member are considered to be adjacent.

**Outputs:**
- **`S` (Generic Data):** Set with consecutive identical members removed.
- **`N` (Integer):** Number of members removed.

### Disjoint
**Nickname:** `Disjoint`
**Description:** Test whether two sets are disjoint.
**GUID:** `81800098-1060-4e2b-80d4-17f835cc825f`

**Inputs:**
- **`A` (Generic Data):** First set.
- **`B` (Generic Data):** Second set.

**Outputs:**
- **`R` (Boolean):** True if none of the items in A occur in B.

### Find similar member
**Nickname:** `FSim`
**Description:** Find the most similar member in a set.
**GUID:** `b4d4235f-14ff-4d4e-a29a-b358dcd2baf4`

**Inputs:**
- **`D` (Generic Data):** Data to search for.
- **`S` (Generic Data):** Set to search.

**Outputs:**
- **`H` (Generic Data):** Member in S closest to D.
- **`i` (Integer):** Index of H in set.

### Key/Value Search
**Nickname:** `KeySearch`
**Description:** Extract an item from a collection using a key-value match
**GUID:** `1edcc3cf-cf84-41d4-8204-561162cfe510`

**Inputs:**
- **`K` (Generic Data):** A list of key values.
- **`V` (Generic Data):** A list of value data, one for each key.
- **`S` (Generic Data):** A key value to search for

**Outputs:**
- **`R` (Generic Data):** Resulting item in the value list that matches the Search key

### Member Index
**Nickname:** `MIndex`
**Description:** Find the occurences of a specific member in a set.
**GUID:** `3ff27857-b988-417a-b495-b24c733dbd00`

**Inputs:**
- **`S` (Generic Data):** Set to operate on.
- **`M` (Generic Data):** Member to search for.

**Outputs:**
- **`I` (Integer):** Indices of member.
- **`N` (Integer):** Number of occurences of the member.

### Replace Members
**Nickname:** `Replace`
**Description:** Replace members in a set.
**GUID:** `bafac914-ede4-4a59-a7b2-cc41bc3de961`

**Inputs:**
- **`S` (Generic Data):** Set to operate on.
- **`F` (Generic Data):** Item(s) to replace.
- **`R` (Generic Data):** Item(s) to replace with.

**Outputs:**
- **`R` (Generic Data):** Sets with replaced members.

### Set Difference
**Nickname:** `Difference`
**Description:** Create the difference of two sets (the collection of objects present in A but not in B).
**GUID:** `e3b1a10c-4d49-4140-b8e6-0b5732a26c31`

**Inputs:**
- **`A` (Generic Data):** Set to subtract from.
- **`B` (Generic Data):** Substraction set.

**Outputs:**
- **`U` (Generic Data):** The Set Difference of A minus B

### Set Difference (S)
**Nickname:** `ExDiff`
**Description:** Create the symmetric difference of two sets (the collection of objects present in A or B but not both).
**GUID:** `d2461702-3164-4894-8c10-ed1fc4b52965`

**Inputs:**
- **`A` (Generic Data):** First set for symmetric difference.
- **`B` (Generic Data):** Second set for symmetric difference.

**Outputs:**
- **`X` (Generic Data):** The symmetric difference between A and B.

### Set Intersection
**Nickname:** `Intersection`
**Description:** Creates the intersection of two sets (the collection of unique objects present in both sets).
**GUID:** `82f19c48-9e73-43a4-ae6c-3a8368099b08`

**Inputs:**
- **`A` (Generic Data):** Data for set Intersection
- **`B` (Generic Data):** Data for set Intersection

**Outputs:**
- **`U` (Generic Data):** The Set Union of all input sets

### Set Majority
**Nickname:** `Majority`
**Description:** Determine majority member presence amongst three sets.
**GUID:** `d4136a7b-7422-4660-9404-640474bd2725`

**Inputs:**
- **`A` (Generic Data):** First set.
- **`B` (Generic Data):** Second set.
- **`C` (Generic Data):** Third set.

**Outputs:**
- **`R` (Generic Data):** Set containing all unique elements in that occur in at least two of the input sets.

### Set Union
**Nickname:** `SUnion`
**Description:** Creates the union of two sets (the collection of unique objects present in either set).
**GUID:** `8eed5d78-7810-4ba1-968e-8a1f1db98e39`

**Inputs:**
- **`A` (Generic Data):** Data for set Union.
- **`B` (Generic Data):** Data for set Union.

**Outputs:**
- **`U` (Generic Data):** The Set Union of A and B.

### SubSet
**Nickname:** `SubSet`
**Description:** Test two sets for inclusion.
**GUID:** `4cfc0bb0-0745-4772-a520-39f9bf3d99bc`

**Inputs:**
- **`A` (Generic Data):** Super set.
- **`B` (Generic Data):** Sub set.

**Outputs:**
- **`R` (Boolean):** True if all items in B are present in A.

***

## Category: Sets > Text

### Characters
**Nickname:** `Chars`
**Description:** Break text into individual characters
**GUID:** `86503240-d884-43f9-9323-efe30488a6e1`

**Inputs:**
- **`T` (Text):** Text to split.

**Outputs:**
- **`C` (Text):** Resulting characters
- **`U` (Integer):** Unicode value of character

### Concatenate
**Nickname:** `Concat`
**Description:** Concatenate some fragments of text
**GUID:** `2013e425-8713-42e2-a661-b57e78840337`

**Inputs:**
- **`A` (Text):** First text fragment
- **`B` (Text):** Second text fragment

**Outputs:**
- **`R` (Text):** Resulting text consisting of all the fragments

### Format
**Nickname:** `Format`
**Description:** Format some data using placeholders and formatting tags
**GUID:** `758d91a0-4aec-47f8-9671-16739a8a2c5d`

**Inputs:**
- **`F` (Text):** Text format
- **`C` (Culture):** Formatting culture
- **`0` (Generic Data):** Data to insert at {0} placeholders
- **`1` (Generic Data):** Data to insert at {1} placeholders

**Outputs:**
- **`T` (Text):** Formatted text

### Match Text
**Nickname:** `TMatch`
**Description:** Match a text against a pattern
**GUID:** `3756c55f-95c3-442c-a027-6b3ab0455a94`

**Inputs:**
- **`T` (Text):** Text to match
- **`P` (Text):** Optional wildcard pattern for matching
- **`R` (Text):** Optional RegEx pattern for matching
- **`C` (Boolean):** Compare using case-sensitive matching

**Outputs:**
- **`M` (Boolean):** True if the text adheres to all supplied patterns

### Replace Text
**Nickname:** `Rep`
**Description:** Replace all occurences of a specific text fragment with another
**GUID:** `4df8df00-3635-45bd-95e6-f9206296c110`

**Inputs:**
- **`T` (Text):** Text to operate on.
- **`F` (Text):** Fragment to replace.
- **`R` (Text):** Optional fragment to replace with. If blank, all occurences of F will be removed.

**Outputs:**
- **`R` (Text):** Result of text replacement

### Sort Text
**Nickname:** `TSort`
**Description:** Sort a collection of text fragments
**GUID:** `cec16c67-7b8b-41f7-a5a5-f675177e524b`

**Inputs:**
- **`K` (Text):** Text fragments to sort (sorting key)
- **`V` (Generic Data):** Optional values to sort synchronously
- **`C` (Culture):** Cultural sorting rules

**Outputs:**
- **`K` (Text):** Sorted text fragments
- **`V` (Generic Data):** Sorted values

### Text Case
**Nickname:** `Case`
**Description:** Change the CaSiNg of a piece of text
**GUID:** `b1991128-8bf1-4dea-8497-4b7188a64e9d`

**Inputs:**
- **`T` (Text):** Text to modify
- **`C` (Culture):** Cultural rules for text casing

**Outputs:**
- **`U` (Text):** Upper case representation of T
- **`L` (Text):** Lower case representation of T

### Text Distance
**Nickname:** `TDist`
**Description:** Compute the Levenshtein distance between two fragments of text.
**GUID:** `f7608c4d-836c-4adf-9d1f-3b04e6a2647d`

**Inputs:**
- **`A` (Text):** First text fragment
- **`B` (Text):** Second text fragment
- **`C` (Boolean):** Compare using case-sensitive matching

**Outputs:**
- **`D` (Integer):** Levenshtein distance between the two fragments

### Text Fragment
**Nickname:** `Fragment`
**Description:** Extract a fragment (subset) of some text
**GUID:** `07e0811f-034a-4504-bca0-2d03b2c46217`

**Inputs:**
- **`T` (Text):** Text to operate on.
- **`i` (Integer):** Zero based index of first character to copy.
- **`N` (Integer):** Optional number of characters to copy. If blank, the entire remainder will be copied.

**Outputs:**
- **`F` (Text):** The resulting text fragment

### Text Join
**Nickname:** `Join`
**Description:** Join a collection of text fragments into one
**GUID:** `1274d51a-81e6-4ccf-ad1f-0edf4c769cac`

**Inputs:**
- **`T` (Text):** Text fragments to join.
- **`J` (Text):** Fragment separator.

**Outputs:**
- **`R` (Text):** Resulting text

### Text Length
**Nickname:** `Len`
**Description:** Get the length (character count) of some text
**GUID:** `dca05f6f-e3d9-42e3-b3bb-eb20363fb335`

**Inputs:**
- **`T` (Text):** Text to measure.

**Outputs:**
- **`L` (Integer):** Number of characters

### Text On Surface
**Nickname:** `TextSrf`
**Description:** Create a collection of textual symbols aligned on a surface.
**GUID:** `28504f1f-a8d9-40c8-b8aa-529413456258`

**Inputs:**
- **`T` (Text):** Text to create.
- **`F` (Text):** Font name, with optional 'Bold' or 'Italic' tags.
- **`H` (Number):** Height of text shapes.
- **`D` (Number):** Depth of text shapes.
- **`B` (Curve):** Base line for text.
- **`S` (Generic Data):** Optional base surface for text orientation. Surfaces, meshes and SubDs are all allowed.

**Outputs:**
- **`S` (Brep):** Symbols making up the text shapes.

### Text Split
**Nickname:** `Split`
**Description:** Split some text into fragments using separators
**GUID:** `04887d01-504c-480e-b2a2-01ea19cc5922`

**Inputs:**
- **`T` (Text):** Text to split.
- **`C` (Text):** Separator characters.

**Outputs:**
- **`R` (Text):** Resulting text fragments

### Text Trim
**Nickname:** `Trim`
**Description:** Remove whitespace characters from the start and end of some text.
**GUID:** `e4cb7168-5e32-4c54-b425-5a31c6fd685a`

**Inputs:**
- **`T` (Text):** Text to split.
- **`S` (Boolean):** Trim whitespace at start.
- **`E` (Boolean):** Trim whitespace at end.

**Outputs:**
- **`R` (Text):** Trimmed text.

***

## Category: Sets > Tree

### Clean Tree
**Nickname:** `Clean`
**Description:** Removed all null and invalid items from a data tree.
**GUID:** `071c3940-a12d-4b77-bb23-42b5d3314a0d`

**Inputs:**
- **`N` (Boolean):** Remove null items from the tree.
- **`X` (Boolean):** Remove invalid items from the tree.
- **`E` (Boolean):** Remove empty branches from the tree.
- **`T` (Generic Data):** Data tree to clean

**Outputs:**
- **`T` (Generic Data):** Spotless data tree

### Clean Tree
**Nickname:** `Clean`
**Description:** Removed all null and invalid items from a data tree.
**GUID:** `7991bc5f-8a01-4768-bfb0-a39357ac6b84`

**Inputs:**
- **`T` (Generic Data):** Data tree to clean
- **`X` (Boolean):** Remove invalid items in addition to null items.
- **`E` (Boolean):** Remove empty branches.

**Outputs:**
- **`T` (Generic Data):** Spotless data tree

### Construct Path
**Nickname:** `Path`
**Description:** Construct a data tree branch path.
**GUID:** `946cb61e-18d2-45e3-8840-67b0efa26528`

**Inputs:**
- **`I` (Integer):** Branch path indices

**Outputs:**
- **`B` (Path):** Branch path

### Deconstruct Path
**Nickname:** `DPath`
**Description:** Deconstruct a data tree path into individual integers.
**GUID:** `df6d9197-9a6e-41a2-9c9d-d2221accb49e`

**Inputs:**
- **`B` (Path):** Branch path

**Outputs:**
- **`I` (Integer):** Branch path indices

### Entwine
**Nickname:** `Entwine`
**Description:** Flatten and combine a collection of data streams
**GUID:** `c9785b8e-2f30-4f90-8ee3-cca710f82402`

**Inputs:**
- **`{0;0}` (Generic Data):** Data to entwine
- **`{0;1}` (Generic Data):** Data to entwine
- **`{0;2}` (Generic Data):** Data to entwine

**Outputs:**
- **`R` (Generic Data):** Entwined result

### Explode Tree
**Nickname:** `BANG!`
**Description:** Extract all the branches from a tree
**GUID:** `74cad441-2264-45fe-a57d-85034751208a`

**Inputs:**
- **`D` (Generic Data):** Data to explode

**Outputs:**
- **`-` (Generic Data):** All data inside the branch at index: 0
- **`-` (Generic Data):** All data inside the branch at index: 1

### Flatten Tree
**Nickname:** `Flatten`
**Description:** Flatten a data tree by removing all branching information.
**GUID:** `f80cfe18-9510-4b89-8301-8e58faf423bb`

**Inputs:**
- **`T` (Generic Data):** Data tree to flatten
- **`P` (Path):** Path of flattened tree

**Outputs:**
- **`T` (Generic Data):** Flattened data tree

### Flip Matrix
**Nickname:** `Flip`
**Description:** Flip a matrix-like data tree by swapping rows and columns.
**GUID:** `41aa4112-9c9b-42f4-847e-503b9d90e4c7`

**Inputs:**
- **`D` (Generic Data):** Data matrix to flip

**Outputs:**
- **`D` (Generic Data):** Flipped data matrix

### Graft Tree
**Nickname:** `Graft`
**Description:** Graft a data tree by adding an extra branch for every item.
**GUID:** `87e1d9ef-088b-4d30-9dda-8a7448a17329`

**Inputs:**
- **`T` (Generic Data):** Data tree to graft

**Outputs:**
- **`T` (Generic Data):** Grafted data tree

### Match Tree
**Nickname:** `Match`
**Description:** Match one data tree with another.
**GUID:** `46372d0d-82dc-4acb-adc3-25d1fde04c4e`

**Inputs:**
- **`T` (Generic Data):** Data tree to modify
- **`G` (Generic Data):** Data tree to match

**Outputs:**
- **`T` (Generic Data):** Matched data tree containing the data of T but the layout of G

### Merge
**Nickname:** `Merge`
**Description:** Merge a bunch of data streams
**GUID:** `3cadddef-1e2b-4c09-9390-0e8f78f7609f`

**Inputs:**
- **`D1` (Generic Data):** Data stream 1
- **`D2` (Generic Data):** Data stream 2

**Outputs:**
- **`R` (Generic Data):** Result of merge

### Merge
**Nickname:** `Merge`
**Description:** Merge two streams into one.
**GUID:** `86866576-6cc0-485a-9cd2-6f7d493f57f7`

**Inputs:**
- **`A` (Generic Data):** Input stream #1
- **`B` (Generic Data):** Input stream #2

**Outputs:**
- **`S` (Generic Data):** Merged stream

### Merge 03
**Nickname:** `M3`
**Description:** Merge three streams into one.
**GUID:** `481f0339-1299-43ba-b15c-c07891a8f822`

**Inputs:**
- **`A` (Generic Data):** Input stream #1
- **`B` (Generic Data):** Input stream #2
- **`C` (Generic Data):** Input stream #3

**Outputs:**
- **`S` (Generic Data):** Merged stream

### Merge 04
**Nickname:** `M4`
**Description:** Merge four streams into one.
**GUID:** `b5be5d1f-717f-493c-b958-816957f271fd`

**Inputs:**
- **`A` (Generic Data):** Input stream #1
- **`B` (Generic Data):** Input stream #2
- **`C` (Generic Data):** Input stream #3
- **`D` (Generic Data):** Input stream #4

**Outputs:**
- **`S` (Generic Data):** Merged stream

### Merge 05
**Nickname:** `M5`
**Description:** Merge five streams into one.
**GUID:** `f4b0f7b4-5a10-46c4-8191-58d7d66ffdff`

**Inputs:**
- **`A` (Generic Data):** Input stream #1
- **`B` (Generic Data):** Input stream #2
- **`C` (Generic Data):** Input stream #3
- **`D` (Generic Data):** Input stream #4
- **`E` (Generic Data):** Input stream #5

**Outputs:**
- **`S` (Generic Data):** Merged stream

### Merge 06
**Nickname:** `M6`
**Description:** Merge six streams into one.
**GUID:** `ac9b4faf-c9d5-4f6a-a5e9-58c0c2cac116`

**Inputs:**
- **`A` (Generic Data):** Input stream #1
- **`B` (Generic Data):** Input stream #2
- **`C` (Generic Data):** Input stream #3
- **`D` (Generic Data):** Input stream #4
- **`E` (Generic Data):** Input stream #5
- **`F` (Generic Data):** Input stream #6

**Outputs:**
- **`S` (Generic Data):** Merged stream

### Merge 08
**Nickname:** `M8`
**Description:** Merge eight streams into one.
**GUID:** `a70aa477-0109-4e75-ba73-78725dca0274`

**Inputs:**
- **`A` (Generic Data):** Input stream #1
- **`B` (Generic Data):** Input stream #2
- **`C` (Generic Data):** Input stream #3
- **`D` (Generic Data):** Input stream #4
- **`E` (Generic Data):** Input stream #5
- **`F` (Generic Data):** Input stream #6
- **`G` (Generic Data):** Input stream #7
- **`H` (Generic Data):** Input stream #8

**Outputs:**
- **`S` (Generic Data):** Merged stream

### Merge 10
**Nickname:** `M10`
**Description:** Merge ten streams into one.
**GUID:** `22f66ff6-d281-453c-bd8c-36ed24026783`

**Inputs:**
- **`A` (Generic Data):** Input stream #1
- **`B` (Generic Data):** Input stream #2
- **`C` (Generic Data):** Input stream #3
- **`D` (Generic Data):** Input stream #4
- **`E` (Generic Data):** Input stream #5
- **`F` (Generic Data):** Input stream #6
- **`G` (Generic Data):** Input stream #7
- **`H` (Generic Data):** Input stream #8
- **`I` (Generic Data):** Input stream #9
- **`J` (Generic Data):** Input stream #10

**Outputs:**
- **`S` (Generic Data):** Merged stream

### Merge Multiple
**Nickname:** `Merge`
**Description:** Merge multiple input streams into one
**GUID:** `0b6c5dac-6c93-4158-b8d1-ca3187d45f25`

**Inputs:**
- **`0` (Generic Data):** Input stream #1
- **`1` (Generic Data):** Input stream #2

**Outputs:**
- **`S` (Generic Data):** Merged stream

### Path Compare
**Nickname:** `Compare`
**Description:** Compare a path to a mask pattern
**GUID:** `1d8b0e2c-e772-4fa9-b7f7-b158251b34b8`

**Inputs:**
- **`P` (Path):** Path to compare
- **`M` (Text):** Comparison mask

**Outputs:**
- **`C` (Boolean):** Comparison (True = Match, False = Mismatch)

### Prune Tree
**Nickname:** `Prune`
**Description:** Remove small branches from a Data Tree.
**GUID:** `fe769f85-8900-45dd-ba11-ec9cd6c778c6`

**Inputs:**
- **`T` (Generic Data):** Data tree to prune
- **`N0` (Integer):** Remove branches with fewer than N0 items.
- **`N1` (Integer):** Remove branches with more than N1 items (use zero to ignore upper limit).

**Outputs:**
- **`T` (Generic Data):** Pruned tree

### Relative Item
**Nickname:** `RelItem`
**Description:** Retrieve a relative item combo from a data tree
**GUID:** `fac0d5be-e3ff-4bbb-9742-ec9a54900d41`

**Inputs:**
- **`T` (Generic Data):** Tree to operate on
- **`O` (Text):** Relative offset for item combo
- **`Wp` (Boolean):** Wrap paths when the shift is out of bounds
- **`Wi` (Boolean):** Wrap items when the shift is out of bounds

**Outputs:**
- **`A` (Generic Data):** Tree item
- **`B` (Generic Data):** Tree item relative to A

### Relative Items
**Nickname:** `RelItem2`
**Description:** Retrieve a relative item combo from two data trees
**GUID:** `2653b135-4df1-4a6b-820c-55e2ad3bc1e0`

**Inputs:**
- **`A` (Generic Data):** First Data Tree
- **`B` (Generic Data):** Second Data Tree
- **`O` (Text):** Relative offset for item combo
- **`Wp` (Boolean):** Wrap paths when the shift is out of bounds
- **`Wi` (Boolean):** Wrap items when the shift is out of bounds

**Outputs:**
- **`A` (Generic Data):** Item in tree A
- **`B` (Generic Data):** Relative item in tree B

### Replace Paths
**Nickname:** `Replace`
**Description:** Find & replace paths in a data tree
**GUID:** `bfaaf799-77dc-4f31-9ad8-2f7d1a80aeb0`

**Inputs:**
- **`D` (Generic Data):** Data stream to process
- **`S` (Text):** Search masks
- **`R` (Path):** Respective replacement paths

**Outputs:**
- **`D` (Generic Data):** Processed tree data

### Shift Paths
**Nickname:** `PShift`
**Description:** Shift the indices in all data tree paths
**GUID:** `2d61f4e0-47c5-41d6-a41d-6afa96ee63af`

**Inputs:**
- **`D` (Generic Data):** Data to modify
- **`O` (Integer):** Offset to apply to each branch

**Outputs:**
- **`D` (Generic Data):** Shifted data

### Simplify Tree
**Nickname:** `Simplify`
**Description:** Simplify a data tree by removing the overlap shared amongst all branches.
**GUID:** `1303da7b-e339-4e65-a051-82c4dce8224d`

**Inputs:**
- **`T` (Generic Data):** Data tree to simplify.
- **`F` (Boolean):** Limit path collapse to indices at the start of the path only.

**Outputs:**
- **`T` (Generic Data):** Simplified data tree.

### Split Tree
**Nickname:** `Split`
**Description:** Split a data tree into two parts using path masks.
**GUID:** `d8b1e7ac-cd31-4748-b262-e07e53068afc`

**Inputs:**
- **`D` (Generic Data):** Tree to split
- **`M` (Text):** Splitting masks

**Outputs:**
- **`P` (Generic Data):** Positive set of data (all branches that match any of the masks)
- **`N` (Generic Data):** Negative set of data (all branches that do not match any of the masks

### Stream Filter
**Nickname:** `Filter`
**Description:** Filters a collection of input streams
**GUID:** `eeafc956-268e-461d-8e73-ee05c6f72c01`

**Inputs:**
- **`G` (Integer):** Index of Gate stream
- **`0` (Generic Data):** Input stream at index 0
- **`1` (Generic Data):** Input stream at index 1

**Outputs:**
- **`S` (Generic Data):** Filtered stream

### Stream Gate
**Nickname:** `Gate`
**Description:** Redirects a stream into specific outputs.
**GUID:** `71fcc052-6add-4d70-8d97-cfb37ea9d169`

**Inputs:**
- **`S` (Generic Data):** Input stream
- **`G` (Integer):** Gate index of output stream

**Outputs:**
- **`0` (Generic Data):** Output for Gate index 0
- **`1` (Generic Data):** Output for Gate index 1

### Tree Branch
**Nickname:** `Branch`
**Description:** Retrieve a specific branch from a data tree.
**GUID:** `3a710c1e-1809-4e19-8c15-82adce31cd62`

**Inputs:**
- **`T` (Generic Data):** Data Tree
- **`P` (Path):** Data tree branch path

**Outputs:**
- **`B` (Generic Data):** Branch at {P}

### Tree Item
**Nickname:** `Item`
**Description:** Retrieve a specific item from a data tree.
**GUID:** `c1ec65a3-bda4-4fad-87d0-edf86ed9d81c`

**Inputs:**
- **`T` (Generic Data):** Data Tree
- **`P` (Path):** Data tree branch path
- **`i` (Integer):** Item index
- **`W` (Boolean):** Wrap index to list bounds

**Outputs:**
- **`E` (Generic Data):** Item at {P:i'}

### Tree Statistics
**Nickname:** `TStat`
**Description:** Get some statistics regarding a data tree.
**GUID:** `99bee19d-588c-41a0-b9b9-1d00fb03ea1a`

**Inputs:**
- **`T` (Generic Data):** Data Tree to analyze

**Outputs:**
- **`P` (Path):** All the paths of the tree
- **`L` (Integer):** The length of each branch in the tree
- **`C` (Integer):** Number of paths and branches in the tree

### Trim Tree
**Nickname:** `Trim`
**Description:** Reduce the complexity of a tree by merging the outermost branches.
**GUID:** `1177d6ee-3993-4226-9558-52b7fd63e1e3`

**Inputs:**
- **`T` (Generic Data):** Data tree to flatten
- **`D` (Integer):** Number of outermost branches to merge

**Outputs:**
- **`T` (Generic Data):** Trimmed data tree

### Unflatten Tree
**Nickname:** `Unflatten`
**Description:** Unflatten a data tree by moving items back into branches.
**GUID:** `b8e2aa8f-8830-4ee1-bb59-613ea279c281`

**Inputs:**
- **`T` (Generic Data):** Data tree to unflatten
- **`G` (Generic Data):** Guide data tree that defines the path layout

**Outputs:**
- **`T` (Generic Data):** Unflattened data tree

***

## Category: Speckle 2 >   Send/Receive

### Local Receive
**Nickname:** `LR`
**Description:** Receives data locally, without the need of a Speckle Server. NOTE: updates will not be automatically received.
**GUID:** `43e22b36-891b-4478-8a4e-2338272ea3b3`

**Inputs:**
- **`id` (Generic Data):** ID of the local data sent.

**Outputs:**
- **`D` (Generic Data):** Data to send.

### Local sender
**Nickname:** `LS`
**Description:** Sends data locally, without the need of a Speckle Server.
**GUID:** `80ac1649-ff36-4b8b-a5b4-320e9d88f8bf`

**Inputs:**
- **`D` (Generic Data):** Data to send.

**Outputs:**
- **`id` (Generic Data):** ID of the local data sent.

### Receive
**Nickname:** `Receive`
**Description:** Receive data from a Speckle server
**GUID:** `06a3e53b-2bff-4ebd-bbce-71b9ce36283e`

**Inputs:**
- **`S` (Generic Data):** The Speckle Stream to receive data from. You can also input the Stream ID or it's URL as text.

**Outputs:**
- **`I` (Text):** Commit information.
- **`D` (Generic Data):** The received data.

### Send
**Nickname:** `Send`
**Description:** Sends data to a Speckle server (or any other provided transport).
**GUID:** `b7b46ba5-df54-4d0c-9668-7e9287409c20`

**Inputs:**
- **`S` (Generic Data):** Stream(s) and/or transports to send to.
- **`M` (Text):** Commit message. If left blank, one will be generated for you.
- **`D` (Generic Data):** The data to send.

**Outputs:**
- **`S` (Generic Data):** Stream or streams pointing to the created commit

### Synchronous Receiver
**Nickname:** `SR`
**Description:** Receive data from a Speckle server Synchronously. This will block GH untill all the data are received which can be used to safely trigger other processes downstream
**GUID:** `08c7078e-c6da-4b3b-a57d-cd291cc79b1c`

**Inputs:**
- **`S` (Generic Data):** The Speckle Stream to receive data from. You can also input the Stream ID or it's URL as text.

**Outputs:**
- **`D` (Generic Data):** Data received.
- **`I` (Text):** Commit information.

### Synchronous Sender
**Nickname:** `SS`
**Description:** Send data to a Speckle server Synchronously. This will block GH until all the data are received which can be used to safely trigger other processes downstream
**GUID:** `a6ed7a5f-d013-4086-a4bb-f08b42b2a6b8`

**Inputs:**
- **`D` (Generic Data):** The data to send.
- **`S` (Generic Data):** Stream(s) and/or transports to send to.
- **`M` (Text):** Commit message. If left blank, one will be generated for you.

**Outputs:**
- **`S` (Generic Data):** Stream or streams pointing to the created commit

***

## Category: Speckle 2 >  Object Management

### Create Speckle Object
**Nickname:** `CSO`
**Description:** Allows you to create a Speckle object by setting its keys and values.
In each individual parameter, you can select between 'item' and 'list' access type via the right-click menu.

**GUID:** `dc561a9d-bf12-4eb3-8412-4b7fc6ecb291`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Create Speckle Object by Key/Value
**Nickname:** `CSOKV`
**Description:** Creates a speckle object from key value pairs
**GUID:** `b5232bf7-7014-4f10-8716-c3cee6a54e2f`

**Inputs:**
- **`K` (Text):** List of keys
- **`V` (Generic Data):** List of values

**Outputs:**
- **`O` (Untyped):** Speckle object

### Deconstruct Speckle Object
**Nickname:** `DSO`
**Description:** Allows you to deconstruct a Speckle object in its constituent parts.
**GUID:** `1913ab7a-50d6-4b6c-8353-d3366f73fc84`

**Inputs:**
- **`O` (Generic Data):** Speckle object to deconstruct into it's properties.

**Outputs:**
- *This component has no outputs.*

### Extend Speckle Object
**Nickname:** `ESO`
**Description:** Allows you to extend a Speckle object by setting its keys and values.
**GUID:** `2d455b11-f372-47e5-98be-515ea758a669`

**Inputs:**
- **`O` (Generic Data):** Speckle object to extend. If the input is not a Speckle Object, it will attempt a conversion of the input first.

**Outputs:**
- **`EO` (Untyped):** Extended speckle object.

### Extend Speckle Object by Key/Value
**Nickname:** `ESOKV`
**Description:** Extend a current object with key/value pairs
**GUID:** `0d862057-254f-40c2-ac4a-9d163bb1e24b`

**Inputs:**
- **`O` (Generic Data):** Speckle object to extend. If the input is not a Speckle Object, it will attempt a conversion of the input first.
- **`K` (Text):** List of keys
- **`V` (Generic Data):** List of values

**Outputs:**
- **`EO` (Untyped):** The resulting extended Speckle object.

### Speckle Object Keys
**Nickname:** `SOK`
**Description:** Get a list of keys available in a speckle object
**GUID:** `16e28d2d-ea9f-4f59-96ca-045a32ea130c`

**Inputs:**
- **`O` (Untyped):** Speckle object to deconstruct into it's properties.

**Outputs:**
- **`K` (Text):** The keys available on this speckle object

### Speckle Object Value by Key
**Nickname:** `SOVK`
**Description:** Gets the value of a specific key in a Speckle object.
**GUID:** `ba787569-36e6-4522-ac76-b09983e0a40d`

**Inputs:**
- **`O` (Untyped):** Object to get values from.
- **`K` (Generic Data):** List of keys

**Outputs:**
- **`V` (Generic Data):** Speckle object

### Speckle Schema Object
**Nickname:** `SSO`
**Description:** Allows you to create a Speckle object from a schema class.
**GUID:** `4dc285e3-810d-47db-bfb5-cd96fe459fdd`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 >  Streams & Accounts

### Account Details
**Nickname:** `AccDet`
**Description:** Gets the details from a specific account
**GUID:** `04822a33-777a-457b-bef3-e54044322db0`

**Inputs:**
- **`A` (Text):** Account to get stream with.

**Outputs:**
- **`D` (Boolean):** Determines if the account is the default of this machine.
- **`SN` (Text):** Name of the server.
- **`SC` (Text):** Name of the company running this server.
- **`SU` (Text):** URL of the server.
- **`UID` (Text):** Unique ID of this account's user.
- **`UN` (Text):** Name of this account's user
- **`UC` (Text):** Name of the company this user belongs to
- **`UE` (Text):** Email of this account's user

### Create Stream
**Nickname:** `sCreate`
**Description:** Create a new speckle stream.
**GUID:** `722690de-218d-45e1-9183-98b13c7f411d`

**Inputs:**
- **`A` (Text):** Account to be used when creating the stream.

**Outputs:**
- **`S` (Stream):** The created stream.

### Stream Details
**Nickname:** `sDet`
**Description:** Extracts the details of a given stream, use is limited to 20 streams.
**GUID:** `b47cad66-187c-4d1f-ac77-9ca03bf82a0e`

**Inputs:**
- **`S` (Stream):** A stream object of the stream to be updated.

**Outputs:**
- **`ID` (Text):** Unique ID of the stream to be updated.
- **`N` (Text):** Name of the stream.
- **`D` (Text):** Description of the stream
- **`C` (Text):** Date of creation
- **`U` (Text):** Date when it was last modified
- **`P` (Boolean):** True if the stream is to be publicly available.
- **`Cs` (Generic Data):** Users that have collaborated in this stream
- **`B` (Generic Data):** List of branches for this stream

### Stream Get
**Nickname:** `sGet`
**Description:** Gets a specific stream from your account
**GUID:** `d66afb58-a1ba-487c-94bf-af0fffba6ce5`

**Inputs:**
- **`ID/URL` (Stream):** Speckle stream ID or URL
- **`A` (Text):** Account to get stream with.

**Outputs:**
- **`S` (Stream):** Speckle Stream

### Stream List
**Nickname:** `sList`
**Description:** Lists all the streams for this account
**GUID:** `be790af4-1834-495b-be68-922b42fd53c7`

**Inputs:**
- **`A` (Text):** Account to get streams from
- **`L` (Integer):** Max number of streams to fetch

**Outputs:**
- **`S` (Stream):** List of streams for the provided account.

### Stream Update
**Nickname:** `sUp`
**Description:** Updates a stream with new details
**GUID:** `f83b9956-1a5c-4844-b7f6-87a956105831`

**Inputs:**
- **`S` (Stream):** Unique ID of the stream to be updated.
- **`N` (Text):** Name of the stream.
- **`D` (Text):** Description of the stream
- **`P` (Boolean):** True if the stream is to be publicly available.

**Outputs:**
- **`ID` (Text):** Unique ID of the stream to be updated.

***

## Category: Speckle 2 > Params

***

## Category: Speckle 2 > [Dev/Compute]

### Get Account Token
**Nickname:** `sGAT`
**Description:** Gets the account token from an account stored in Manager for Speckle
**GUID:** `a6327165-18e7-4316-9f57-2c212ac1fa27`

**Inputs:**
- **`A` (Text):** Account to get the auth token from. Expects the `userId`

**Outputs:**
- **`T` (Text):** The auth token for this user that is stored in Manager

### Stream Get with Token
**Nickname:** `SGetWT`
**Description:** Returns a stream that will authenticate with a specific user by their Personal Access Token.
 TREAT EACH TOKEN AS A PASSWORD AND NEVER SHARE/SAVE IT IN THE FILE ITSELF
**GUID:** `89ac8586-9f37-4c99-9a65-9c3a029ba07d`

**Inputs:**
- **`S` (Stream):** A stream object of the stream to be updated.
- **`t` (Text):** The auth token to access the account

**Outputs:**
- **`S` (Stream):** The stream object, with the authenticated account based on the input token.

***

## Category: Speckle 2 > [Dev/Conversion]

### Deserialize
**Nickname:** `Deserialize`
**Description:** Deserializes a JSON string to a Speckle Base object.
**GUID:** `0336f3d1-2fee-4b66-980d-63db624980c9`

**Inputs:**
- **`J` (Text):** Serialized base objects in JSON format.

**Outputs:**
- **`B` (Untyped):** Deserialized Speckle Base objects.

### Serialize
**Nickname:** `SRL`
**Description:** Serializes a Speckle Base object to JSON
**GUID:** `6f6a5347-8de1-44fa-8d26-c73fd21650a9`

**Inputs:**
- **`B` (Untyped):** Speckle base objects to serialize.

**Outputs:**
- **`J` (Text):** Serialized objects in JSON format.

### To Native
**Nickname:** `To Native`
**Description:** Convert data from Speckle's Base object to its Rhino equivalent.
**GUID:** `7f4bda01-f9c8-42ed-abc1-da0443283219`

**Inputs:**
- **`B` (Generic Data):** Speckle Base object to convert to Grasshopper.

**Outputs:**
- **`D` (Generic Data):** Converted data in GH native format.

### To Speckle
**Nickname:** `To Speckle`
**Description:** Convert data from Rhino to their Speckle Base equivalent.
**GUID:** `fb88150a-1885-4a77-92ea-9b1378310fdd`

**Inputs:**
- **`D` (Generic Data):** Data to convert to Speckle Base objects.

**Outputs:**
- **`B` (Generic Data):** Converted Base Speckle objects.

***

## Category: Speckle 2 > [Dev/Transports]

### Disk Transport
**Nickname:** `Disk`
**Description:** Creates a Disk Transport. This transport will store objects in files in a folder that you can specify (including one on a network drive!). It's useful for understanding how Speckle's decomposition api works. It's not meant to be performant - it's useful for debugging purposes - e.g., when developing a new class/object model you can understand easily the relative sizes of the resulting objects.
**GUID:** `ba068b11-2bc0-4669-bc73-09cf16820659`

**Inputs:**
- **`P` (Text):** The root folder where you want the data to be stored. Defaults to `%appdata%/Speckle/DiskTransportFiles`.

**Outputs:**
- **`T` (Generic Data):** The Disk Transport you have created.

### Memory Transport
**Nickname:** `Memory`
**Description:** Creates a Memory Transport. This is useful for debugging, or just sending data around one grasshopper defintion. We don't recommend you use it!
**GUID:** `b3e7a1e0-fb96-45ae-9f47-54d1b495aac9`

**Inputs:**
- **`N` (Text):** The name of this Memory Transport.

**Outputs:**
- **`T` (Generic Data):** The Memory Transport you have created.

### Receive From Transports
**Nickname:** `RT`
**Description:** Receives a list of objects from a given transport. Please use this component with caution: it can freeze your defintion. It also does not perform any conversions on the output.
**GUID:** `8c7c6ca5-1557-4216-810b-f64e710526d0`

**Inputs:**
- **`T` (Generic Data):** The transport to receive from.
- **`IDs` (Text):** The ids of the objects you want to receive.

**Outputs:**
- **`O` (Generic Data):** The objects you requested.

### Send To Transports
**Nickname:** `ST`
**Description:** Sends an object to a list of given transports: the object will be stored in each of them. Please use this component with caution: it can freeze your defintion. It also does not perform any conversions, so ensure that the object input already has converted speckle objects inside.
**GUID:** `4229b8dc-9f81-49a3-9ef9-df3de0b8e4b6`

**Inputs:**
- **`T` (Generic Data):** The transports to send to.
- **`O` (Untyped):** The speckle object you want to send. It needs to be a Speckle Object in which everything is already converted to Speckle already. 

**Outputs:**
- **`ID` (Text):** The sent object's id.

### Sqlite Transport
**Nickname:** `Sqlite`
**Description:** Creates a Sqlite Transport. This transport will store its objects in a sqlite database at the location you will specify (including a network drive!).
**GUID:** `dffaf45e-06a8-4458-85d8-74fda8df3268`

**Inputs:**
- **`P` (Text):** The root folder where you want the sqlite db to be stored. Defaults to `%appdata%`.
- **`N` (Text):** The subfolder you want the sqlite db to be stored. Defaults to `Speckle`.
- **`D` (Text):** The name of the actual database file. Defaults to `UserLocalDefaultDb`.

**Outputs:**
- **`T` (Generic Data):** The Sqlite transport you have created.

***

## Category: Speckle 2 Archicad > Structure

### ArchicadBeam
**Nickname:** `ArchicadBeam`
**Description:** Creates an Archicad Structures beam by curve.
**GUID:** `73860182-c94b-d570-f568-1ab73eec8bfd`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 BIM > Architecture

### Arch Opening
**Nickname:** `Arch Opening`
**Description:** Creates a Speckle opening
**GUID:** `087f847f-6f51-3cc9-5b7d-2cce478b46f4`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Ceiling
**Nickname:** `Ceiling`
**Description:** Creates a Speckle ceiling
**GUID:** `91b38d18-dd01-dfc7-f11d-e3d2c118ff0b`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Floor
**Nickname:** `Floor`
**Description:** Creates a Speckle floor
**GUID:** `74c5b6bf-257e-8d4e-d9cb-7dc2c7ae3f22`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Level
**Nickname:** `Level`
**Description:** Creates a Speckle level
**GUID:** `04fca79a-ae5b-6ac4-581d-79438351a4e8`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitMaterial
**Nickname:** `RevitMaterial`
**Description:** Creates a Speckle material
**GUID:** `a2ec94ca-c50c-01bf-3d12-0c8feb41004b`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Room
**Nickname:** `Room`
**Description:** Creates a Speckle room
**GUID:** `c62087b7-2a9d-743d-336d-e8ea2ab72a29`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Topography
**Nickname:** `Topography`
**Description:** Creates a Speckle topography
**GUID:** `b9207a45-eebc-72d6-a411-f496443d8b7f`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Wall
**Nickname:** `Wall`
**Description:** Creates a Speckle wall
**GUID:** `6878cc65-2628-d00d-e8c0-b130e828a6c7`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 BIM > MEP

### Duct
**Nickname:** `Duct`
**Description:** Creates a Speckle duct
**GUID:** `7e3a3fba-7d4f-d549-96c0-41693b512db0`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Pipe
**Nickname:** `Pipe`
**Description:** Creates a Speckle pipe
**GUID:** `6892cf99-6913-7004-27ab-2cfb8435a644`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Space
**Nickname:** `Space`
**Description:** Creates a Speckle space
**GUID:** `c6907933-2792-eb6d-7c64-fb54835e9b44`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Space with top level and offset parameters
**Nickname:** `Space with top level and offset parameters`
**Description:** Creates a Speckle space with the specified top level and offsets
**GUID:** `8f7b0323-3533-e7cd-ae43-0bdeb34f3570`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Wire
**Nickname:** `Wire`
**Description:** Creates a Speckle wire from curve segments and points
**GUID:** `c10c9c87-b93d-4e98-d2fb-942d182008dc`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 BIM > Objects.Other

### Block Definition
**Nickname:** `Block Definition`
**Description:** A Speckle Block definition
**GUID:** `91f1164e-b519-d72f-d64b-e68bb14836e3`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Block Instance
**Nickname:** `Block Instance`
**Description:** A Speckle Block Instance
**GUID:** `28238ece-f2e0-fe7d-e25f-e8f8cb35e629`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### MaterialQuantity
**Nickname:** `MaterialQuantity`
**Description:** Creates the quantity of a material
**GUID:** `c94a9777-99bb-d501-281a-c10300309038`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 BIM > Other

### Area
**Nickname:** `Area`
**Description:** Creates a Speckle area
**GUID:** `b98bd134-1ebd-b805-821c-465f1a25fb4e`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GridLine
**Nickname:** `GridLine`
**Description:** Creates a Speckle grid line with a label
**GUID:** `436f3773-b3f9-1a35-684e-a75f25f6c3bd`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RenderMaterial
**Nickname:** `RenderMaterial`
**Description:** Creates a render material.
**GUID:** `03a49484-4eba-6e08-5e96-b3b78ed13f70`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 BIM > Structure

### Beam
**Nickname:** `Beam`
**Description:** Creates a Speckle beam
**GUID:** `5c0a392e-bc1c-cf28-0048-a99ee090ffa1`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Brace
**Nickname:** `Brace`
**Description:** Creates a Speckle brace
**GUID:** `cf5f1dad-80cd-d499-2ef7-6ae1f8d34a5c`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Column
**Nickname:** `Column`
**Description:** Creates a Speckle column
**GUID:** `d92fc447-81b6-e595-1905-6239ea13a49b`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 CSI > Geometry

### Element1D (from local axis)
**Nickname:** `Element1D (from local axis)`
**Description:** Creates a Speckle CSI 1D element (from local axis)
**GUID:** `b19522f8-4264-ce56-3cc7-ec2132ece2e1`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Element1D (from orientation node and angle)
**Nickname:** `Element1D (from orientation node and angle)`
**Description:** Creates a Speckle CSI 1D element (from orientation node and angle)
**GUID:** `95254c64-1e71-0902-06a1-206b2f17b844`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Element2D
**Nickname:** `Element2D`
**Description:** Creates a Speckle CSI 2D element (based on a list of edge ie. external, geometry defining nodes)
**GUID:** `33c58e3c-d8cb-86ca-b494-ee5c69ec7b14`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Node with properties
**Nickname:** `Node with properties`
**Description:** Creates a Speckle CSI node with spring, mass and/or damper properties
**GUID:** `2c39977e-f47f-3202-c778-ac46b8462fea`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 CSI > Properties

### CSI Diaphragm
**Nickname:** `CSI Diaphragm`
**Description:** Create an CSI Diaphragm
**GUID:** `97f96eaa-f4f3-ef29-0de3-63829f163dc1`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### CSILink
**Nickname:** `CSILink`
**Description:** Create an CSI Link Property
**GUID:** `0d7960c0-ddc2-fa77-3b52-fd4d1587af32`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### DeckFilled
**Nickname:** `DeckFilled`
**Description:** Create an CSI Filled Deck
**GUID:** `151a2166-f739-501f-d3bc-f1a24bdd4093`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### DeckSlab
**Nickname:** `DeckSlab`
**Description:** Create an CSI Slab Deck
**GUID:** `b8102cde-4ea3-0583-9580-4a9530154440`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### DeckUnFilled
**Nickname:** `DeckUnFilled`
**Description:** Create an CSI UnFilled Deck
**GUID:** `680e6f0c-d140-e8c4-27e1-28d353a87b8f`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### LinearSpring
**Nickname:** `LinearSpring`
**Description:** Create an CSI LinearSpring
**GUID:** `a81ebbcb-78a6-9f21-5212-09701d89fa5d`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### LinearSpring
**Nickname:** `LinearSpring`
**Description:** Create an CSI AreaSpring
**GUID:** `f1b019ec-dac8-2669-a790-818aabd77c81`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Opening
**Nickname:** `Opening`
**Description:** Create an CSI Opening
**GUID:** `e6405aac-40ff-97c5-66d7-be3586eebbdd`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### PointSpring from Link
**Nickname:** `PointSpring from Link`
**Description:** Create an CSI PointSpring from Link
**GUID:** `efa38436-affe-3ba9-2413-743fe26eb9f7`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### PointSpring from Soil Profile
**Nickname:** `PointSpring from Soil Profile`
**Description:** Create an CSI PointSpring from Soil Profile
**GUID:** `9b2854b3-f8bc-b8e6-fd86-aa5c55051759`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RibbedSlab
**Nickname:** `RibbedSlab`
**Description:** Create an CSI Ribbed Slab
**GUID:** `e5db5889-0924-136f-be6d-39c7de9a3649`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Slab
**Nickname:** `Slab`
**Description:** Create an CSI Slab
**GUID:** `27930f28-6811-7f66-f432-07dd5585f6e0`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### WaffleSlab
**Nickname:** `WaffleSlab`
**Description:** Create an CSI Waffle Slab
**GUID:** `b8956ee0-8372-db59-654a-c11c4af5e0f6`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 GSA > Analysis

### GSAAnalysisCase
**Nickname:** `GSAAnalysisCase`
**Description:** Creates a Speckle structural analysis case for GSA
**GUID:** `4bfc261f-98eb-7b2a-5da6-f2ef3505b9b7`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAAnalysisTask
**Nickname:** `GSAAnalysisTask`
**Description:** Creates a Speckle structural analysis task for GSA
**GUID:** `958d20e6-b44e-1dbc-4df3-6dee9b9e13bb`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAStage
**Nickname:** `GSAStage`
**Description:** Creates a Speckle structural analysis stage for GSA
**GUID:** `0f7bf991-1225-1cea-5543-7dea926b1089`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 GSA > Bridge

### GSAAlignment
**Nickname:** `GSAAlignment`
**Description:** Creates a Speckle structural alignment for GSA (as a setting out feature for bridge models)
**GUID:** `fc274806-efb5-c3b2-9c1d-bc9a6aba1a34`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAAssembly
**Nickname:** `GSAAssembly`
**Description:** Creates a Speckle structural assembly (ie. a way to define an entity that is formed from a collection of elements or members) for GSA
**GUID:** `9b2c7be3-5172-7660-659a-e39253688363`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAInfluenceBeam
**Nickname:** `GSAInfluenceBeam`
**Description:** Creates a Speckle structural node influence effect for GSA (for an influence analysis)
**GUID:** `61efde90-bb48-abf4-e69a-87376cab33bd`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAInfluenceBeam
**Nickname:** `GSAInfluenceBeam`
**Description:** Creates a Speckle structural beam influence effect for GSA (for an influence analysis)
**GUID:** `8844e443-368c-0b7d-89d8-fc563aa7a56d`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAPath
**Nickname:** `GSAPath`
**Description:** Creates a Speckle structural path for GSA (a path defines traffic lines along a bridge relative to an alignments, for influence analysis)
**GUID:** `f6c0f7f0-b742-f8ca-ebc4-0872bfd0517c`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAUserVehicle
**Nickname:** `GSAUserVehicle`
**Description:** Creates a Speckle structural user-defined vehicle (as a pattern of loading based on axle and wheel positions, for influence analysis) for GSA
**GUID:** `891ecc6d-cf2a-a476-d94c-f31b51eff020`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 GSA > Geometry

### GSAElement1D (from local axis)
**Nickname:** `GSAElement1D (from local axis)`
**Description:** Creates a Speckle structural 1D element for GSA (from local axis)
**GUID:** `8b41c9e5-f24b-f0bc-7b62-169f839883ec`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAElement1D (from orientation node and angle)
**Nickname:** `GSAElement1D (from orientation node and angle)`
**Description:** Creates a Speckle structural 1D element for GSA (from orientation node and angle)
**GUID:** `d3ff71ed-34b8-6f9b-7ebc-50ff8195d1b2`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAElement2D
**Nickname:** `GSAElement2D`
**Description:** Creates a Speckle structural 2D element for GSA
**GUID:** `9a1c5132-a785-c389-fe5f-441820f07446`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAElement3D
**Nickname:** `GSAElement3D`
**Description:** Creates a Speckle structural 3D element for GSA
**GUID:** `3fb3f410-62f0-f972-de47-4e55d8aee0b6`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAGeneralisedRestraint
**Nickname:** `GSAGeneralisedRestraint`
**Description:** Creates a Speckle structural generalised restraint (a set of restraint conditions to be applied to a list of nodes) for GSA
**GUID:** `e3b018a2-2196-d3aa-a66a-3248343143aa`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAGridLine
**Nickname:** `GSAGridLine`
**Description:** Creates a Speckle structural grid line for GSA
**GUID:** `1fdfd333-8214-4f28-1835-7609247412ac`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAGridPlane
**Nickname:** `GSAGridPlane`
**Description:** Creates a Speckle structural grid plane for GSA
**GUID:** `f7db7fc7-c05e-c257-c11c-7d3a3e7ecdfc`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAGridSurface
**Nickname:** `GSAGridSurface`
**Description:** Creates a Speckle structural grid surface for GSA
**GUID:** `868d0f73-da31-e362-f5c5-c2e5a98f0f46`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAMember1D (from local axis)
**Nickname:** `GSAMember1D (from local axis)`
**Description:** Creates a Speckle structural 1D member for GSA (from local axis)
**GUID:** `e86d92aa-cefd-5a09-138d-a1cd1fe36e7d`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAMember1D (from orientation node and angle)
**Nickname:** `GSAMember1D (from orientation node and angle)`
**Description:** Creates a Speckle structural 1D member for GSA (from orientation node and angle)
**GUID:** `7c4f3597-5d45-eb1e-c7e9-c3a4dfb9a240`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAMember2D
**Nickname:** `GSAMember2D`
**Description:** Creates a Speckle structural 2D member for GSA
**GUID:** `3b367574-1c20-77d0-c4e8-46979f8a3f42`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSANode
**Nickname:** `GSANode`
**Description:** Creates a Speckle structural node for GSA
**GUID:** `3b6c01e9-4d99-90a8-357e-def8c043faa0`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAPolyline
**Nickname:** `GSAPolyline`
**Description:** Creates a Speckle structural polyline for GSA
**GUID:** `e1e8bcb7-7a12-79be-d15f-c2a2bc9ad6df`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSARigidConstraint
**Nickname:** `GSARigidConstraint`
**Description:** Creates a Speckle structural rigid restraint (a set of nodes constrained to move as a rigid body) for GSA
**GUID:** `fd5845ec-2b73-db4d-8c8f-01d9c7c7d0bb`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAStorey
**Nickname:** `GSAStorey`
**Description:** Creates a Speckle structural storey (to describe floor levels/storeys in the structural model) for GSA
**GUID:** `24bd70e1-024d-538c-8132-d02c4c101e5d`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 GSA > Loading

### GSALoadBeam
**Nickname:** `GSALoadBeam`
**Description:** Creates a Speckle structural beam (1D elem/member) load for GSA
**GUID:** `eb5a5098-d189-58ab-d032-60dfdd6e5495`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSALoadBeam (user-defined axis)
**Nickname:** `GSALoadBeam (user-defined axis)`
**Description:** Creates a Speckle structural beam (1D elem/member) load (specified for a user-defined axis) for GSA
**GUID:** `29927efe-6612-a3f7-a0c7-49ef97bea3ae`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSALoadCase
**Nickname:** `GSALoadCase`
**Description:** Creates a Speckle structural load case for GSA
**GUID:** `3d862f90-6804-d75c-a0e2-8e90c9b190db`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSALoadCombination
**Nickname:** `GSALoadCombination`
**Description:** Creates a Speckle load combination for GSA
**GUID:** `a79c8825-221a-d44f-5faa-b257f3f6c98e`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSALoadFace
**Nickname:** `GSALoadFace`
**Description:** Creates a Speckle structural face (2D elem/member) load for GSA
**GUID:** `abc889bd-7235-5b08-9f91-124a4dd94c7a`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSALoadGravity
**Nickname:** `GSALoadGravity`
**Description:** Creates a Speckle structural gravity load (applied to all nodes and elements) for GSA
**GUID:** `a49dd14b-f073-b628-f175-030c5cee8d3b`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSALoadGravity (specified elements and nodes)
**Nickname:** `GSALoadGravity (specified elements and nodes)`
**Description:** Creates a Speckle structural gravity load (applied to specified nodes and elements) for GSA
**GUID:** `05096aa4-f73a-01d0-5613-1184349cb0ea`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSALoadGravity (specified elements)
**Nickname:** `GSALoadGravity (specified elements)`
**Description:** Creates a Speckle structural gravity load (applied to specified elements) for GSA
**GUID:** `6b27dc40-c384-1058-d7ab-eaf6bcd19587`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSALoadNode
**Nickname:** `GSALoadNode`
**Description:** Creates a Speckle node load for GSA
**GUID:** `8a591a6c-207c-f42a-d2f4-596594a536a7`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSALoadNode (user-defined axis)
**Nickname:** `GSALoadNode (user-defined axis)`
**Description:** Creates a Speckle node load (user-defined axis) for GSA
**GUID:** `d641ad56-fa70-fd1f-7066-412a8e15970e`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 GSA > Materials

### GSAConcrete
**Nickname:** `GSAConcrete`
**Description:** Creates a Speckle structural concrete material for GSA
**GUID:** `a86c1d31-6807-f465-c51c-24d5d7a5a728`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAMaterial
**Nickname:** `GSAMaterial`
**Description:** Creates a Speckle structural material for GSA
**GUID:** `6e7d020a-4a4b-9f9a-f573-222476220b2c`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 GSA > Properties

### GSAProperty1D
**Nickname:** `GSAProperty1D`
**Description:** Creates a Speckle structural 1D element property for GSA
**GUID:** `347df789-96b7-21f2-fc2f-5bfd26dfbe6f`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### GSAProperty2D
**Nickname:** `GSAProperty2D`
**Description:** Creates a Speckle structural 2D element property for GSA
**GUID:** `562e2664-bdf3-8b98-6e09-cc6584cf2146`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 Revit > Architecture

### Railing
**Nickname:** `Railing`
**Description:** Creates a Revit railing by base curve.
**GUID:** `a6c3be7a-9e6b-663b-2bc0-dd9fa2ee6552`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Revit Wall Opening
**Nickname:** `Revit Wall Opening`
**Description:** Creates a Speckle Wall opening for revit
**GUID:** `541bfed0-738d-e1bd-1130-de05ec4bbf9e`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitCeiling
**Nickname:** `RevitCeiling`
**Description:** Creates a Revit ceiling
**GUID:** `93e6568e-0dc2-ebd2-64b0-e202eabe49cb`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitColumn Vertical
**Nickname:** `RevitColumn Vertical`
**Description:** Creates a vertical Revit Column by point and levels.
**GUID:** `c243fe91-0103-bea1-34b7-3e8b39c8d0ec`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitExtrusionRoof
**Nickname:** `RevitExtrusionRoof`
**Description:** Creates a Revit roof by extruding a curve
**GUID:** `707428ab-15b4-e7ec-a2cd-21154ff50c1b`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitFloor
**Nickname:** `RevitFloor`
**Description:** Creates a Revit floor by outline and level
**GUID:** `e6f17d4f-6c28-0d0f-2370-7b9c09a14fff`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitFootprintRoof
**Nickname:** `RevitFootprintRoof`
**Description:** Creates a Revit roof by outline
**GUID:** `b2f55d9f-7242-ee7e-c44a-24e34d5f6e3e`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitLevel
**Nickname:** `RevitLevel`
**Description:** Creates a new Revit level unless one with the same elevation already exists
**GUID:** `5ef6e45c-00bd-f3b9-1cbf-6e9a902da7ab`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitLevel by name
**Nickname:** `RevitLevel by name`
**Description:** Gets an existing Revit level by name
**GUID:** `e075a88e-7867-3726-3bb7-15b73b2d17e6`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitMaterial
**Nickname:** `RevitMaterial`
**Description:** Creates a Speckle material
**GUID:** `c291d027-7a6a-8950-a2aa-77e134675750`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitRoom
**Nickname:** `RevitRoom`
**Description:** Creates a Revit room with parameters
**GUID:** `9be891e2-aaf6-1d4e-3d6b-bd7ba1a06563`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitShaft
**Nickname:** `RevitShaft`
**Description:** Creates a Revit shaft from a bottom and top level
**GUID:** `00cdb2fd-ef75-107e-822c-3490cd359380`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitTopography
**Nickname:** `RevitTopography`
**Description:** Creates a Revit topography
**GUID:** `f0840908-039e-b6d4-98de-8ed003dfd357`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitWall by curve and height
**Nickname:** `RevitWall by curve and height`
**Description:** Creates an unconnected Revit wall.
**GUID:** `bd2a0bb1-14f7-cd0a-76c4-2429412a5128`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitWall by curve and levels
**Nickname:** `RevitWall by curve and levels`
**Description:** Creates a Revit wall with a top and base level.
**GUID:** `fa1aef22-ddd5-01f4-887e-145ce21da247`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitWall by face
**Nickname:** `RevitWall by face`
**Description:** Creates a Revit wall from a surface.
**GUID:** `fc3927a7-0877-8137-a34e-ecd19a6f688c`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitWall by profile
**Nickname:** `RevitWall by profile`
**Description:** Creates a Revit wall from a profile.
**GUID:** `b3962fc0-69b0-e766-22b4-b08404650c8a`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 Revit > Curves

### DetailCurve
**Nickname:** `DetailCurve`
**Description:** Creates a Revit detail curve
**GUID:** `4752d321-22cc-2d9e-dc6d-e3cf8e70c612`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ModelCurve
**Nickname:** `ModelCurve`
**Description:** Creates a Revit model curve
**GUID:** `7aa6e073-6783-8e7b-eec2-7b7bb0420db2`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RoomBoundaryLine
**Nickname:** `RoomBoundaryLine`
**Description:** Creates a Revit room boundary line
**GUID:** `2edade8a-5139-09be-4273-551f3ac476e2`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### SpaceSeparationLine
**Nickname:** `SpaceSeparationLine`
**Description:** Creates a Revit space separation line
**GUID:** `0bba13ce-5758-8513-42fd-9e0b3702a654`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 Revit > Families

### AdaptiveComponent
**Nickname:** `AdaptiveComponent`
**Description:** Creates a Revit adaptive component by points
**GUID:** `71420d27-62d1-f158-edab-a89e54604d76`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### DirectShape by base geometries
**Nickname:** `DirectShape by base geometries`
**Description:** Creates a Revit DirectShape using a list of base geometry objects.
**GUID:** `870d9670-cbf5-06d2-f371-e1e49212b063`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### FamilyInstance
**Nickname:** `FamilyInstance`
**Description:** Creates a Revit family instance
**GUID:** `266c4d84-3f2a-9129-565b-0ddb1e5bdac4`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Freeform element
**Nickname:** `Freeform element`
**Description:** Creates a Revit Freeform element using a list of Brep or Meshes. Category defaults to Generic Models
**GUID:** `b24dc861-1c3c-a509-bc8b-560e9f7d503e`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Parameter
**Nickname:** `Parameter`
**Description:** A Revit instance parameter to set on an element
**GUID:** `706f3fe9-f499-b07f-b682-febedbe38c9c`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ParameterUpdater
**Nickname:** `ParameterUpdater`
**Description:** Updates parameters on a Revit element by id
**GUID:** `c4f5fc69-58e1-59f6-4dac-e31b738f7254`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 Revit > MEP

### RevitDuct
**Nickname:** `RevitDuct`
**Description:** Creates a Revit duct
**GUID:** `7bb86598-9cd2-8d29-a1dc-7500c4b4ed4b`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitFlexDuct
**Nickname:** `RevitFlexDuct`
**Description:** Creates a Revit flex duct
**GUID:** `f350f9a2-06ca-6118-a4e6-88e721bb7f52`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitFlexPipe
**Nickname:** `RevitFlexPipe`
**Description:** Creates a Revit flex pipe
**GUID:** `219bfacc-9c41-441a-210c-c2cfb877929b`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitPipe
**Nickname:** `RevitPipe`
**Description:** Creates a Revit pipe
**GUID:** `19700cd2-6310-c8b3-7ad5-954033702e52`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitWire
**Nickname:** `RevitWire`
**Description:** Creates a Revit wire from points and level
**GUID:** `4045436b-0804-f0e1-a9f2-6217f4d8a45b`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 Revit > Structure

### RevitBeam
**Nickname:** `RevitBeam`
**Description:** Creates a Revit beam by curve and base level.
**GUID:** `6aba19f5-1b1c-8e0c-f063-2a7c91816b1c`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitBrace
**Nickname:** `RevitBrace`
**Description:** Creates a Revit brace by curve and base level.
**GUID:** `a3a689dc-2ca5-d5be-a225-99a144768e7e`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### RevitColumn Slanted
**Nickname:** `RevitColumn Slanted`
**Description:** Creates a slanted Revit Column by curve.
**GUID:** `1600415c-b327-870c-7cd4-bb9c1b1a82fc`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 Structural > Analysis

### Model
**Nickname:** `Model`
**Description:** Creates a Speckle structural model object
**GUID:** `af7f27db-7897-fcad-1839-3b5213188ef8`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ModelInfo
**Nickname:** `ModelInfo`
**Description:** Creates a Speckle object which describes basic model and project information for a structural model
**GUID:** `f9da0acf-e2ee-8d25-662f-f5b9928ff8aa`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ModelSettings
**Nickname:** `ModelSettings`
**Description:** Creates a Speckle object which describes design and analysis settings for the structural model
**GUID:** `2f8c73cc-0692-3fd9-a825-7e0677164975`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ModelUnits
**Nickname:** `ModelUnits`
**Description:** Creates a Speckle object which specifies the units associated with the model
**GUID:** `6c3340f9-3493-5e35-7272-e6acd0eefa85`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ModelUnits (custom)
**Nickname:** `ModelUnits (custom)`
**Description:** Creates a Speckle object which specifies the units associated with the model
**GUID:** `162c2a99-e4c9-314f-1833-f0e4a5c7451d`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 Structural > Geometry

### Axis
**Nickname:** `Axis`
**Description:** Creates a Speckle structural axis (a user-defined axis)
**GUID:** `38fdc896-0404-4961-120f-6e373d19edbc`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Element1D (from local axis)
**Nickname:** `Element1D (from local axis)`
**Description:** Creates a Speckle structural 1D element (from local axis)
**GUID:** `9fffb53b-3465-7a5b-4839-91cfdcb86f63`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Element1D (from orientation node and angle)
**Nickname:** `Element1D (from orientation node and angle)`
**Description:** Creates a Speckle structural 1D element (from orientation node and angle)
**GUID:** `6cb2d683-3116-0246-18b0-1bd35ed8fcc6`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Element2D
**Nickname:** `Element2D`
**Description:** Creates a Speckle structural 2D element (based on a list of edge ie. external, geometry defining nodes)
**GUID:** `0927879c-d28c-1c35-0d3f-4ba8e324ec39`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Element3D
**Nickname:** `Element3D`
**Description:** Creates a Speckle structural 3D element
**GUID:** `54b79bd6-7a50-2107-afd5-f9b18346f8ea`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Node with properties
**Nickname:** `Node with properties`
**Description:** Creates a Speckle structural node with spring, mass and/or damper properties
**GUID:** `dacc1582-c084-4685-981a-6f8f8d8663c8`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Restraint (by code and stiffness)
**Nickname:** `Restraint (by code and stiffness)`
**Description:** Creates a Speckle restraint object (to describe support conditions with an explicit stiffness)
**GUID:** `a57df1f7-6fbd-4c84-a9d6-bd2d84f73811`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Restraint (by code)
**Nickname:** `Restraint (by code)`
**Description:** Creates a Speckle restraint object
**GUID:** `4a117edf-50f0-9c11-6a80-e9692f15771b`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Restraint (by enum)
**Nickname:** `Restraint (by enum)`
**Description:** Creates a Speckle restraint object (for pinned condition or fixed condition)
**GUID:** `f85b9d32-e383-56a2-e6fa-1da0d28febe9`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Storey
**Nickname:** `Storey`
**Description:** Creates a Speckle structural storey (to describe floor levels/storeys in the structural model)
**GUID:** `a3985ed4-fff8-47c1-bb0e-d63699e263e9`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 Structural > Loading

### Beam Load
**Nickname:** `Beam Load`
**Description:** Creates a Speckle structural beam (1D elem/member) load
**GUID:** `5aa7c096-d596-e901-49cd-94df21f0f4c9`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Beam Load (user-defined axis)
**Nickname:** `Beam Load (user-defined axis)`
**Description:** Creates a Speckle structural beam (1D elem/member) load (specified using a user-defined axis)
**GUID:** `a84bb64f-5fdc-13b4-bd37-99fa6ee8260a`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Face Load
**Nickname:** `Face Load`
**Description:** Creates a Speckle structural face (2D elem/member) load
**GUID:** `9bc9c37f-a304-15dc-76ce-17fced07fa46`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Face Load (user-defined axis)
**Nickname:** `Face Load (user-defined axis)`
**Description:** Creates a Speckle structural face (2D elem/member) load (specified using a user-defined axis)
**GUID:** `ad3f7cf4-8c06-10ce-39a2-895ab8a9a475`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Gravity Load (all elements)
**Nickname:** `Gravity Load (all elements)`
**Description:** Creates a Speckle structural gravity load (applied to all nodes and elements)
**GUID:** `f29ce365-1d94-af6d-cf2d-455043fba7a4`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Gravity Load (specified elements and nodes)
**Nickname:** `Gravity Load (specified elements and nodes)`
**Description:** Creates a Speckle structural gravity load (applied to specified nodes and elements)
**GUID:** `0a4e16ba-52e5-38d9-dce6-630e15528828`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Gravity Load (specified elements)
**Nickname:** `Gravity Load (specified elements)`
**Description:** Creates a Speckle structural gravity load (applied to specified elements)
**GUID:** `a916973a-2052-a4b5-9184-2e76e0059e65`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Load Case
**Nickname:** `Load Case`
**Description:** Creates a Speckle structural load case
**GUID:** `6436c6fd-e4e3-b78a-75f5-d967dc2550fc`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Load Combination
**Nickname:** `Load Combination`
**Description:** Creates a Speckle load combination
**GUID:** `fdbef7a9-adba-eeed-cb4f-9d9799e16da7`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Node Load
**Nickname:** `Node Load`
**Description:** Creates a Speckle node load
**GUID:** `3d5a37ee-3ce8-8dc6-0efb-7c81bb9d4588`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Node Load (user-defined axis)
**Nickname:** `Node Load (user-defined axis)`
**Description:** Creates a Speckle node load (specifed using a user-defined axis)
**GUID:** `cbbfa332-f0f7-0470-a9f7-7a81813075ad`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 Structural > Materials

### Concrete
**Nickname:** `Concrete`
**Description:** Creates a Speckle structural material for concrete (to be used in structural analysis models)
**GUID:** `104f1e8d-a551-bb84-e671-3394bc6a4c2b`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Steel
**Nickname:** `Steel`
**Description:** Creates a Speckle structural material for steel (to be used in structural analysis models)
**GUID:** `073f9f26-2cfb-9f2d-fbcd-67ce9904872e`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Steel
**Nickname:** `Steel`
**Description:** Creates a Speckle structural material for steel (to be used in structural analysis models)
**GUID:** `6756df31-1e5c-0c80-2047-f4b6557c2e3f`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Structural Material
**Nickname:** `Structural Material`
**Description:** Creates a Speckle structural material
**GUID:** `3e877a75-b3fb-0111-2128-1432ab15c4cf`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Structural Material (with properties)
**Nickname:** `Structural Material (with properties)`
**Description:** Creates a Speckle structural material with (isotropic) properties
**GUID:** `ef78155b-0786-9846-38cd-41ce70911972`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Timber
**Nickname:** `Timber`
**Description:** Creates a Speckle structural material for timber (to be used in structural analysis models)
**GUID:** `f11d278f-6a36-fd7c-409d-fb39f52c73f5`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 Structural > Properties

### Property
**Nickname:** `Property`
**Description:** Creates a Speckle structural property
**GUID:** `8f7a7ef0-dbe1-4085-a1e8-f602612698a5`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Property1D
**Nickname:** `Property1D`
**Description:** Creates a Speckle structural 1D element property
**GUID:** `301fb47d-9a12-ed72-4dbf-55d23ac5c432`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Property1D (by name)
**Nickname:** `Property1D (by name)`
**Description:** Creates a Speckle structural 1D element property
**GUID:** `fa29bbb6-ab8f-a235-67da-c10fe9daa077`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Property2D
**Nickname:** `Property2D`
**Description:** Creates a Speckle structural 2D element property
**GUID:** `a1f72576-5106-26da-625e-6c5dfe798b4f`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Property2D (by name)
**Nickname:** `Property2D (by name)`
**Description:** Creates a Speckle structural 2D element property
**GUID:** `b637985b-c4b8-0bbd-109b-7caf9fea829f`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Property3D
**Nickname:** `Property3D`
**Description:** Creates a Speckle structural 3D element property
**GUID:** `5cc8c1d0-c3a7-0c95-f2b6-f8f7b4afdc95`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Property3D (by name)
**Nickname:** `Property3D (by name)`
**Description:** Creates a Speckle structural 3D element property
**GUID:** `a1644434-1c43-113c-786e-c1942f56d205`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### PropertyDamper
**Nickname:** `PropertyDamper`
**Description:** Creates a Speckle structural damper property
**GUID:** `3d966901-7bcc-b5d0-c5c9-060ae5a2caff`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### PropertyDamper (general)
**Nickname:** `PropertyDamper (general)`
**Description:** Creates a Speckle structural damper property (for 6 degrees of freedom)
**GUID:** `10534d96-587f-e36f-3a97-db6b3fae6b53`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### PropertyMass
**Nickname:** `PropertyMass`
**Description:** Creates a Speckle structural mass property
**GUID:** `2ab5d65b-d4d7-85fa-01bf-2384c5ce5666`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### PropertyMass (general)
**Nickname:** `PropertyMass (general)`
**Description:** Creates a Speckle structural mass property
**GUID:** `66fb8c7a-804c-06d2-a6e0-5da60241dc48`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### PropertySpring
**Nickname:** `PropertySpring`
**Description:** Creates a Speckle structural spring property
**GUID:** `c83d3807-3ee9-9eb6-d6d3-ae472e5fce01`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### PropertySpring (linear/elastic)
**Nickname:** `PropertySpring (linear/elastic)`
**Description:** Creates a Speckle structural spring property (linear/elastic spring)
**GUID:** `03b67483-b251-b9f3-900a-e70c331314bb`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### PropertySpring (non-linear)
**Nickname:** `PropertySpring (non-linear)`
**Description:** Creates a Speckle structural spring property (non-linear spring)
**GUID:** `761c5a65-bec6-b6fb-1df5-c49cc427631b`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 Structural > Results

### Result1D (load case)
**Nickname:** `Result1D (load case)`
**Description:** Creates a Speckle 1D element result object (for load case)
**GUID:** `62b6e9c3-13b6-9dbd-b222-a0b6a978750e`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Result1D (load combination)
**Nickname:** `Result1D (load combination)`
**Description:** Creates a Speckle 1D element result object (for load combination)
**GUID:** `1151871b-42cc-e3f5-5e08-454f9733ef08`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Result2D (load case)
**Nickname:** `Result2D (load case)`
**Description:** Creates a Speckle 2D element result object (for load case)
**GUID:** `4d551fc5-fc7b-b2b8-5bba-63e48aeee645`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Result2D (load combination)
**Nickname:** `Result2D (load combination)`
**Description:** Creates a Speckle 2D element result object (for load combination)
**GUID:** `29194017-21da-96ee-56c4-273cc84ff951`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Result3D (load case)
**Nickname:** `Result3D (load case)`
**Description:** Creates a Speckle 3D element result object (for load case)
**GUID:** `3a15c6fa-36cd-1da9-e410-928a62b940a8`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Result3D (load combination)
**Nickname:** `Result3D (load combination)`
**Description:** Creates a Speckle 3D element result object (for load combination)
**GUID:** `1aa4dd1e-d845-7760-0e58-a3744255f0a1`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ResultGlobal (load case)
**Nickname:** `ResultGlobal (load case)`
**Description:** Creates a Speckle global result object (for load case)
**GUID:** `6e742681-a159-d811-8d7c-4ac42682872f`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ResultGlobal (load combination)
**Nickname:** `ResultGlobal (load combination)`
**Description:** Creates a Speckle global result object (for load combination)
**GUID:** `cd0af8ae-e8d9-b1d9-fce1-63d137a8f69c`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ResultNode (load case)
**Nickname:** `ResultNode (load case)`
**Description:** Creates a Speckle structural nodal result object
**GUID:** `5bf05a45-f397-00ae-0cf5-d89191042d21`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ResultNode (load combination)
**Nickname:** `ResultNode (load combination)`
**Description:** Creates a Speckle structural nodal result object
**GUID:** `c219b902-4ffd-8d03-7de0-2264c8ad6030`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ResultSet1D
**Nickname:** `ResultSet1D`
**Description:** Creates a Speckle 1D element result set object
**GUID:** `7928905d-5fad-53c8-8d44-0eec0c5478ba`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ResultSet2D
**Nickname:** `ResultSet2D`
**Description:** Creates a Speckle 2D element result set object
**GUID:** `ff5bdc35-b72a-a0be-066f-5ad08fbb047d`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ResultSet3D
**Nickname:** `ResultSet3D`
**Description:** Creates a Speckle 3D element result set object
**GUID:** `7cde5263-7dd0-a1f7-535b-e9856769bc39`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ResultSetAll
**Nickname:** `ResultSetAll`
**Description:** Creates a Speckle result set object for 1d element, 2d element, 3d element global and nodal results
**GUID:** `440aefda-79ff-55f5-4571-1a7ef57239e8`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ResultSetNode
**Nickname:** `ResultSetNode`
**Description:** Creates a Speckle node result set object
**GUID:** `07d3aa5f-55e8-f0c6-96da-d9599a8da233`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 Structural > Section Profile

### Angle
**Nickname:** `Angle`
**Description:** Creates a Speckle structural angle section profile
**GUID:** `91df837b-3162-a0de-724d-ea182e77e68c`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Catalogue
**Nickname:** `Catalogue`
**Description:** Creates a Speckle structural section profile
**GUID:** `1b5a50a5-4b3d-1018-8e3f-bb34ad0af7ff`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Catalogue (by description)
**Nickname:** `Catalogue (by description)`
**Description:** Creates a Speckle structural section profile based on a catalogue section description
**GUID:** `7e0f97be-7297-64f8-fc85-f43623186129`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Channel
**Nickname:** `Channel`
**Description:** Creates a Speckle structural channel section profile
**GUID:** `40336db1-decb-2ad6-6680-01c457f0f31d`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Circular
**Nickname:** `Circular`
**Description:** Creates a Speckle structural circular section profile
**GUID:** `fbf190e3-c085-dfc9-3b49-bcda58ab931f`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Explicit
**Nickname:** `Explicit`
**Description:** Creates a Speckle structural section profile based on explicitly defining geometric properties
**GUID:** `e15a7edd-4559-0bb6-3559-48b72c43da2e`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### ISection
**Nickname:** `ISection`
**Description:** Creates a Speckle structural I section profile
**GUID:** `321c4075-d631-8957-9daf-244e6374d73e`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Perimeter
**Nickname:** `Perimeter`
**Description:** Creates a Speckle structural section profile defined by a perimeter curve and, if applicable, a list of void curves
**GUID:** `63b41dcc-8f2e-b900-be8a-82a661e56f19`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Rectangular
**Nickname:** `Rectangular`
**Description:** Creates a Speckle structural rectangular section profile
**GUID:** `2f4dce06-42d9-fe1e-5096-24debfd2fd4b`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### Tee
**Nickname:** `Tee`
**Description:** Creates a Speckle structural Tee section profile
**GUID:** `7832cac3-92e9-9083-df97-0d4296b457c3`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: Speckle 2 Tekla > Structure

### ContourPlate
**Nickname:** `ContourPlate`
**Description:** Creates a TeklaStructures contour plate.
**GUID:** `3b092935-3c2f-c084-eea5-077630507a49`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

### TeklaBeam
**Nickname:** `TeklaBeam`
**Description:** Creates a Tekla Structures beam by curve.
**GUID:** `5a4187bc-05d8-2447-7238-cdbc4b2fae45`

**Inputs:**
- *This component has no inputs.*

**Outputs:**
- **`O` (Untyped):** Created speckle object

***

## Category: StudioAvw > Polyline

### Polyline Boolean
**Nickname:** `PolyBoolean`
**Description:** Boolean operation between 2 sets of curves
**GUID:** `80ab1de3-d9e2-4c5c-8dc8-9edd5ff30fc9`

**Inputs:**
- **`A` (Curve):** The first polyline
- **`B` (Curve):** The first polyline
- **`BT` (Integer):** Type: (0: intersection, 1: union, 2: difference, 3: xor)
- **`Pln` (Plane):** Plane to project the polylines to
- **`T` (Number):** Tolerance: all floating point data beyond this precision will be discarded.

**Outputs:**
- **`R` (Generic Data):** Simple result

### Polyline Containment
**Nickname:** `PolyContain`
**Description:** Tests if a point is inside a Polyline
**GUID:** `889bb614-57f1-4c3b-a826-f3ca904391ee`

**Inputs:**
- **`Pl` (Curve):** A list of polylines to offset
- **`P` (Point):** Offset Distance
- **`Pln` (Plane):** Plane to project the polylines to
- **`T` (Number):** Tolerance: all floating point data beyond this precision will be discarded.

**Outputs:**
- **`I` (Integer):** -1 if the point is on the boundary, +1 if inside, 0 if outside

***

## Category: Studioavw > Polyline

### Minkowski Difference
**Nickname:** `MinkowskiDiff`
**Description:** Calculate the minkowski difference of two Polylines
**GUID:** `c7a39f41-798c-43c3-86cd-8e06547ba4cb`

**Inputs:**
- **`A` (Curve):** The first polyline
- **`B` (Curve):** The second polyline
- **`Pln` (Plane):** Plane to project the polylines to
- **`T` (Number):** Tolerance: all floating point data beyond this precision will be discarded.

**Outputs:**
- **`D` (Curve):** Minkowski difference placed relative to A

### Minkowski Sum
**Nickname:** `MinkowskiSum`
**Description:** Calculate the minkowski sum of two polygons
**GUID:** `9c15d429-8249-4d36-94df-5552e21b2ba1`

**Inputs:**
- **`A` (Curve):** The first polyline
- **`B` (Curve):** The second polyline
- **`Pln` (Plane):** Plane to project the polylines to
- **`T` (Number):** Tolerance: all floating point data beyond this precision will be discarded.

**Outputs:**
- **`S` (Curve):** Minkowski sum placed relative to A
- **`D` (Curve):** Minkowski sum curves with displacements of B

### Polyline Offset
**Nickname:** `PolyOffset`
**Description:** Offset a polyline curve
**GUID:** `f7e8dd63-a9aa-4ee6-b292-0160ac10755b`

**Inputs:**
- **`P` (Curve):** A list of polylines to offset
- **`D` (Number):** Offset Distance
- **`Pln` (Plane):** Plane to project the polylines to
- **`T` (Number):** Tolerance: all floating point data beyond this precision will be discarded.
- **`CF` (Integer):** Closed fillet type (0 = Round, 1 = Square, 2 = Miter)
- **`OF` (Integer):** Open fillet type (0 = Round, 1 = Square, 2 = Butt)
- **`M` (Number):** If closed fillet type of Miter is selected: the maximum extension of a curve is Distance * Miter

**Outputs:**
- **`C` (Curve):** Contour polylines
- **`H` (Curve):** Holes polylines

***

## Category: Surface > Analysis

### Area
**Nickname:** `Area`
**Description:** Solve area properties for breps, meshes and planar closed curves.
**GUID:** `2e205f24-9279-47b2-b414-d06dcd0b21a7`

**Inputs:**
- **`G` (Geometry):** Brep, mesh or planar closed curve for area computation

**Outputs:**
- **`A` (Number):** Area of geometry
- **`C` (Point):** Area centroid of geometry

### Area Moments
**Nickname:** `AMoments`
**Description:** Solve area moments for breps, meshes and planar closed curves.
**GUID:** `c98c1666-5f29-4bb8-aafd-bb5a708e8a95`

**Inputs:**
- **`G` (Geometry):** Brep, mesh or planar closed curve for area computation

**Outputs:**
- **`A` (Number):** Area of geometry
- **`C` (Point):** Area centroid of geometry
- **`I` (Vector):** Moments of inertia around the centroid
- **`I±` (Vector):** Errors on Moments of inertia
- **`S` (Vector):** Secondary moments of inertia around the centroid
- **`S±` (Vector):** Errors on Secondary moments
- **`G` (Vector):** Radii of gyration

### Box Corners
**Nickname:** `Box Corners`
**Description:** Extract all 8 corners of a box.
**GUID:** `a10e8cdf-7c7a-4aac-aa70-ddb7010ab231`

**Inputs:**
- **`B` (Box):** Base box

**Outputs:**
- **`A` (Point):** Corner at {x=min, y=min, z=min}
- **`B` (Point):** Corner at {x=max, y=min, z=min}
- **`C` (Point):** Corner at {x=max, y=max, z=min}
- **`D` (Point):** Corner at {x=min, y=max, z=min}
- **`E` (Point):** Corner at {x=min, y=min, z=max}
- **`F` (Point):** Corner at {x=max, y=min, z=max}
- **`G` (Point):** Corner at {x=max, y=max, z=max}
- **`H` (Point):** Corner at {x=min, y=min, z=max}

### Box Properties
**Nickname:** `BoxProp`
**Description:** Get some properties of a box
**GUID:** `af9cdb9d-9617-4827-bb3c-9efd88c76a70`

**Inputs:**
- **`B` (Box):** Box to analyze

**Outputs:**
- **`C` (Point):** Center point of box
- **`D` (Vector):** Diagonal vector of box
- **`A` (Number):** Area of box
- **`V` (Number):** Volume of box
- **`d` (Integer):** Degeneracy of box

### Brep Closest Point
**Nickname:** `Brep CP`
**Description:** Find the closest point on a brep
**GUID:** `4beead95-8aa2-4613-8bb9-24758a0f5c4c`

**Inputs:**
- **`P` (Point):** Sample point
- **`B` (Brep):** Base Brep

**Outputs:**
- **`P` (Point):** Closest point
- **`N` (Vector):** Normal direction at closest point
- **`D` (Number):** Distance between sample point and Brep

### Brep Edges
**Nickname:** `Edges`
**Description:** Extract the edge curves of a brep.
**GUID:** `0148a65d-6f42-414a-9db7-9a9b2eb78437`

**Inputs:**
- **`B` (Brep):** Base Brep

**Outputs:**
- **`En` (Curve):** Naked edge curves
- **`Ei` (Curve):** Interior edge curves
- **`Em` (Curve):** Non-Manifold edge curves

### Brep Topology
**Nickname:** `Topology`
**Description:** Get and display the topology of a brep.
**GUID:** `866ee39d-9ebf-4e1d-b209-324c56825605`

**Inputs:**
- **`B` (Brep):** Base Brep

**Outputs:**
- **`FF` (Integer):** For each face lists all faces that surround it.
- **`FE` (Integer):** For each face lists all edges that surround it.
- **`EF` (Integer):** for each edge lists all faces that surround it.

### Brep Wireframe
**Nickname:** `Wires`
**Description:** Extract the wireframe curves of a brep.
**GUID:** `ac750e41-2450-4f98-9658-98fef97b01b2`

**Inputs:**
- **`B` (Brep):** Base Brep
- **`D` (Integer):** Wireframe isocurve density

**Outputs:**
- **`W` (Curve):** Wireframe curves

### Deconstruct Box
**Nickname:** `DeBox`
**Description:** Deconstruct a box into its constituent parts.
**GUID:** `db7d83b1-2898-4ef9-9be5-4e94b4e2048d`

**Inputs:**
- **`B` (Box):** Base box

**Outputs:**
- **`P` (Plane):** Box plane
- **`X` (Domain):** {x} dimension of box
- **`Y` (Domain):** {y} dimension of box
- **`Z` (Domain):** {z} dimension of box

### Deconstruct Brep
**Nickname:** `DeBrep`
**Description:** Deconstruct a brep into its constituent parts.
**GUID:** `8d372bdc-9800-45e9-8a26-6e33c5253e21`

**Inputs:**
- **`B` (Brep):** Base Brep

**Outputs:**
- **`F` (Surface):** Faces of Brep
- **`E` (Curve):** Edges of Brep
- **`V` (Point):** Vertices of Brep

### Dimensions
**Nickname:** `Dim`
**Description:** Get the approximate dimensions of a surface
**GUID:** `f241e42e-8983-4ed3-b869-621c07630b00`

**Inputs:**
- **`S` (Surface):** Surface to measure

**Outputs:**
- **`U` (Number):** Approximate dimension in U direction
- **`V` (Number):** Approximate dimension in V direction

### Evaluate Box
**Nickname:** `Box`
**Description:** Evaluate a box in normalised {UVW} space.
**GUID:** `13b40e9c-3aed-4669-b2e8-60bd02091421`

**Inputs:**
- **`B` (Box):** Base box
- **`U` (Number):** {u} parameter (values between 0.0 and 1.0 are inside the box)
- **`V` (Number):** {v} parameter (values between 0.0 and 1.0 are inside the box)
- **`W` (Number):** {w} parameter (values between 0.0 and 1.0 are inside the box)

**Outputs:**
- **`Pl` (Plane):** Plane at {uvw} coordinate
- **`Pt` (Point):** Point at {uvw} coordinate
- **`I` (Boolean):** True if point is inside or on box

### Evaluate Surface
**Nickname:** `EvalSrf`
**Description:** Evaluate local surface properties at a {uv} coordinate.
**GUID:** `353b206e-bde5-4f02-a913-b3b8a977d4b9`

**Inputs:**
- **`S` (Surface):** Base surface
- **`uv` (Point):** {uv} coordinate to evaluate

**Outputs:**
- **`P` (Point):** Point at {uv}
- **`N` (Vector):** Normal at {uv}
- **`U` (Vector):** U direction at {uv}
- **`V` (Vector):** V direction at {uv}
- **`F` (Plane):** Frame at {uv}

### Is Planar
**Nickname:** `Planar`
**Description:** Test whether a surface is planar
**GUID:** `d4bc9653-c770-4bee-a31d-d120cbb75b39`

**Inputs:**
- **`S` (Surface):** Surface to test for planarity
- **`I` (Boolean):** Limit planarity test to the interior of trimmed surfaces

**Outputs:**
- **`F` (Boolean):** Planarity flag of surface
- **`P` (Plane):** Surface plane

### Osculating Circles
**Nickname:** `Osc`
**Description:** Calculate the principal osculating circles of a surface at a {uv} coordinate.
**GUID:** `b799b7c0-76df-4bdb-b3cc-401b1d021aa5`

**Inputs:**
- **`S` (Surface):** Base surface
- **`uv` (Point):** {uv} coordinate to evaluate

**Outputs:**
- **`P` (Point):** Surface point at {uv} coordinate
- **`C1` (Curve):** First osculating circle
- **`C2` (Curve):** Second osculating circle

### Point In Brep
**Nickname:** `BrepInc`
**Description:** Test whether a point is inside a closed brep
**GUID:** `e03561f8-0e66-41d3-afde-62049f152443`

**Inputs:**
- **`B` (Brep):** Brep for inclusion test
- **`P` (Point):** Point for inclusion test
- **`S` (Boolean):** If true, then the inclusion is strict

**Outputs:**
- **`I` (Boolean):** True if point is on the inside of the Brep.

### Point In Breps
**Nickname:** `BrepsInc`
**Description:** Test whether a point is inside a collection of closed breps
**GUID:** `859daa86-3ab7-49cb-9eda-f2811c984070`

**Inputs:**
- **`B` (Brep):** Breps for inclusion test
- **`P` (Point):** Point for inclusion test
- **`S` (Boolean):** If true, then the inclusion is strict

**Outputs:**
- **`I` (Boolean):** True if point is on the inside at least one of the Breps.
- **`i` (Integer):** Index of first brep that contains the point, or -1

### Point In Trim
**Nickname:** `TrimInc`
**Description:** Test whether a {uv} coordinate is inside the trimmed portion of a surface
**GUID:** `f881810b-96de-4668-a95a-f9a6d683e65c`

**Inputs:**
- **`S` (Surface):** Base surface
- **`P` (Point):** UV point to test for trim inclusion

**Outputs:**
- **`I` (Boolean):** Inclusion flag. TRUE if point is inside the trim boundaries.

### Principal Curvature
**Nickname:** `Curvature`
**Description:** Evaluate the principal curvature of a surface at a {uv} coordinate.
**GUID:** `404f75ac-5594-4c48-ad8a-7d0f472bbf8a`

**Inputs:**
- **`S` (Surface):** Base surface
- **`uv` (Point):** {uv} coordinate to evaluate

**Outputs:**
- **`F` (Plane):** Surface frame at (uv) coordinate
- **`C¹` (Number):** Maximum (absolute) principal curvature
- **`C²` (Number):** Minimum (absolute) principal curvature
- **`K¹` (Vector):** Principal curvature direction corresponding to C¹.
- **`K²` (Vector):** Principal curvature direction corresponding to C².

### Shape In Brep
**Nickname:** `ShapeIn`
**Description:** Tests whether a shape is inside a brep
**GUID:** `2ba64356-be21-4c12-bbd4-ced54f04c8ef`

**Inputs:**
- **`B` (Brep):** Closed brep for inside/outside testing
- **`S` (Geometry):** Shape for inside/outside testing

**Outputs:**
- **`R` (Integer):** Relationship of shape to brep (0=inside, 1=intersecting, 2=outside)

### Surface Closest Point
**Nickname:** `Srf CP`
**Description:** Find the closest point on a surface.
**GUID:** `4a9e9a8e-0943-4438-b360-129c30f2bb0f`

**Inputs:**
- **`P` (Point):** Sample point
- **`S` (Surface):** Base surface

**Outputs:**
- **`P` (Point):** Closest point
- **`uvP` (Point):** {uv} coordinates of closest point
- **`D` (Number):** Distance between sample point and surface

### Surface Curvature
**Nickname:** `Curvature`
**Description:** Evaluate the surface curvature at a {uv} coordinate.
**GUID:** `4139f3a3-cf93-4fc0-b5e0-18a3acd0b003`

**Inputs:**
- **`S` (Surface):** Base surface
- **`uv` (Point):** {uv} coordinate to evaluate

**Outputs:**
- **`F` (Plane):** Surface frame at {uv} coordinate
- **`G` (Number):** Gaussian curvature
- **`M` (Number):** Mean curvature

### Surface Inflection
**Nickname:** `SInf`
**Description:** Compute the inflection curves for a surface
**GUID:** `0efd7f0c-f63d-446d-970e-9fb0e636ea41`

**Inputs:**
- **`S` (Surface):** Surface to analyse
- **`T` (Number):** Sampling tolerance

**Outputs:**
- **`C` (Line):** Inflection curves

### Surface Points
**Nickname:** `SrfPt`
**Description:** Get the control-points of a Nurbs Surface
**GUID:** `15128198-399d-4d6c-9586-1f65db3ce7bf`

**Inputs:**
- **`S` (Surface):** Surface for control-point extraction

**Outputs:**
- **`P` (Point):** Control point locations
- **`W` (Number):** Control point weights
- **`G` (Point):** Greville uv points
- **`U` (Integer):** Number of points along U direction
- **`V` (Integer):** Number of points along V direction

### Volume
**Nickname:** `Volume`
**Description:** Solve volume properties for closed breps and meshes.
**GUID:** `224f7648-5956-4b26-80d9-8d771f3dfd5d`

**Inputs:**
- **`G` (Geometry):** Closed brep or mesh for volume computation

**Outputs:**
- **`V` (Number):** Volume of geometry
- **`C` (Point):** Volume centroid of geometry

### Volume Moments
**Nickname:** `VMoments`
**Description:** Solve volume properties for closed breps and meshes.
**GUID:** `4b5f79e1-c2b3-4b9c-b97d-470145a3ca74`

**Inputs:**
- **`G` (Geometry):** Closed brep or mesh for volume computation

**Outputs:**
- **`V` (Number):** Volume of geometry
- **`C` (Point):** Volume centroid of geometry
- **`I` (Vector):** Moments of inertia around the centroid
- **`I±` (Vector):** Errors on Moments of inertia
- **`S` (Vector):** Secondary moments of inertia around the centroid
- **`S±` (Vector):** Errors on Secondary moments
- **`G` (Vector):** Radii of gyration

***

## Category: Surface > Freeform

### 4Point Surface
**Nickname:** `Srf4Pt`
**Description:** Create a surface connecting three or four corner points.
**GUID:** `c77a8b3b-c569-4d81-9b59-1c27299a1c45`

**Inputs:**
- **`A` (Point):** First corner
- **`B` (Point):** Second corner
- **`C` (Point):** Third corner
- **`D` (Point):** Optional fourth corner

**Outputs:**
- **`S` (Surface):** Resulting surface

### Boundary Surfaces
**Nickname:** `Boundary`
**Description:** Create planar surfaces from a collection of boundary edge curves.
**GUID:** `d51e9b65-aa4e-4fd6-976c-cef35d421d05`

**Inputs:**
- **`E` (Curve):** Boundary curves

**Outputs:**
- **`S` (Surface):** Resulting boundary surfaces

### Control Point Loft
**Nickname:** `CPLoft`
**Description:** Create a loft through curve control points.
**GUID:** `5c270622-ee80-45a4-b07a-bd8ffede92a2`

**Inputs:**
- **`C` (Curve):** Section curves
- **`D` (Integer):** Degree perpendicular to curve direction

**Outputs:**
- **`S` (Surface):** Loft result

### Edge Surface
**Nickname:** `EdgeSrf`
**Description:** Create a surface from two, three or four edge curves.
**GUID:** `36132830-e2ef-4476-8ea1-6a43922344f0`

**Inputs:**
- **`A` (Curve):** First curve
- **`B` (Curve):** Second curve
- **`C` (Curve):** Optional Third curve
- **`D` (Curve):** Optional Fourth curve

**Outputs:**
- **`S` (Brep):** Brep representing the edge-surface

### Extrude
**Nickname:** `Extr`
**Description:** Extrude curves and surfaces along a vector.
**GUID:** `962034e9-cc27-4394-afc4-5c16e3447cf9`

**Inputs:**
- **`B` (Geometry):** Profile curve or surface
- **`D` (Vector):** Extrusion direction

**Outputs:**
- **`E` (Brep):** Extrusion result

### Extrude Along
**Nickname:** `ExtrCrv`
**Description:** Extrude curves and surfaces along a curve.
**GUID:** `38a5638b-6d01-4417-bf11-976d925f8a71`

**Inputs:**
- **`B` (Geometry):** Profile curve or surface
- **`C` (Curve):** Extrusion curve

**Outputs:**
- **`E` (Brep):** Extrusion result

### Extrude Angled
**Nickname:** `ExtrAng`
**Description:** Extrude a planar polyline at angles
**GUID:** `ae57e09b-a1e4-4d05-8491-abd232213bc9`

**Inputs:**
- **`P` (Curve):** Polyline base curve
- **`Hb` (Number):** Height of vertical portion.
- **`Ht` (Number):** Height of top surface.
- **`A` (Number):** Angles per polyline edge.

**Outputs:**
- **`S` (Brep):** Extruded shape

### Extrude Linear
**Nickname:** `Extrude`
**Description:** Extrude curves and surfaces along a straight path.
**GUID:** `8efd5eb9-a896-486e-9f98-d8d1a07a49f3`

**Inputs:**
- **`P` (Geometry):** Profile curve or surface
- **`Po` (Plane):** Plane indicating orientation of profile shape
- **`A` (Line):** Extrusion axis
- **`Ao` (Plane):** Optional orientational plane for the axis

**Outputs:**
- **`E` (Brep):** Extrusion result

### Extrude Point
**Nickname:** `Extr`
**Description:** Extrude curves and surfaces to a point.
**GUID:** `be6636b2-2f1a-4d42-897b-fdef429b6f17`

**Inputs:**
- **`B` (Geometry):** Profile curve or surface
- **`P` (Point):** Extrusion tip

**Outputs:**
- **`E` (Brep):** Extrusion result

### Fit Loft
**Nickname:** `FitLoft`
**Description:** Create a loft fitted through a set of curves.
**GUID:** `342aa574-1327-4bc2-8daf-203da2a45676`

**Inputs:**
- **`C` (Curve):** Section curves
- **`Nu` (Integer):** Number of points along curve direction
- **`Du` (Integer):** Degree along curve direction
- **`Dv` (Integer):** Degree perpendicular to curve direction

**Outputs:**
- **`S` (Surface):** Loft result

### Fragment Patch
**Nickname:** `FPatch`
**Description:** Create a fragmented patch from a polyline boundary
**GUID:** `cb56b26c-2595-4d03-bdb2-eb2e6aeba82d`

**Inputs:**
- **`B` (Curve):** Fragment polyline boundary

**Outputs:**
- **`P` (Brep):** Fragmented patch

### Loft
**Nickname:** `Loft`
**Description:** Create a lofted surface through a set of section curves.
**GUID:** `a7a41d0a-2188-4f7a-82cc-1a2c4e4ec850`

**Inputs:**
- **`C` (Curve):** Section curves
- **`O` (Loft Options):** Loft options

**Outputs:**
- **`L` (Brep):** Resulting Loft surfaces

### Loft Options
**Nickname:** `Loft Opt`
**Description:** Create loft options from atomic inputs
**GUID:** `45f19d16-1c9f-4b0f-a9a6-45a77f3d206c`

**Inputs:**
- **`Cls` (Boolean):** Closed loft
- **`Adj` (Boolean):** Adjust seams
- **`Rbd` (Integer):** Rebuild count (zero = no rebuild)
- **`Rft` (Number):** Refit tolerance (zero = no refit)
- **`T` (Integer):** Loft type (0=Normal, 1=Loose, 2=Tight, 3=Straight, 5=Uniform)

**Outputs:**
- **`O` (Loft Options):** Loft options

### Network Surface
**Nickname:** `NetSurf`
**Description:** Create a surface from curve networks
**GUID:** `71506fa8-9bf0-432d-b897-b2e0c5ac316c`

**Inputs:**
- **`U` (Curve):** Curves in U direction
- **`V` (Curve):** Curves in V direction
- **`C` (Integer):** Surface continuity (0=loose, 1=position, 2=tangency, 3=curvature)

**Outputs:**
- **`S` (Surface):** Network surface

### Patch
**Nickname:** `Patch`
**Description:** Create a patch surface
**GUID:** `57b2184c-8931-4e70-9220-612ec5b3809a`

**Inputs:**
- **`C` (Curve):** Curves to patch
- **`P` (Point):** Points to patch
- **`S` (Integer):** Number of spans
- **`F` (Number):** Patch flexibility (low number; less flexibility)
- **`T` (Boolean):** Attempt to trim the result

**Outputs:**
- **`P` (Surface):** Patch result

### Pipe
**Nickname:** `Pipe`
**Description:** Create a pipe surface around a rail curve.
**GUID:** `c277f778-6fdf-4890-8f78-347efb23c406`

**Inputs:**
- **`C` (Curve):** Base curve
- **`R` (Number):** Pipe radius
- **`E` (Integer):** Specifies the type of caps (0=None, 1=Flat, 2=Round)

**Outputs:**
- **`P` (Brep):** Resulting Pipe

### Pipe Variable
**Nickname:** `VPipe`
**Description:** Create a pipe surface with variable radii around a rail curve.
**GUID:** `888f9c3c-f1e1-4344-94b0-5ee6a45aee11`

**Inputs:**
- **`C` (Curve):** Base curve
- **`t` (Number):** Curve parameters for radii
- **`R` (Number):** A list of radii for every defined parameter
- **`E` (Integer):** Specifies the type of caps (0=None, 1=Flat, 2=Round)

**Outputs:**
- **`P` (Brep):** Resulting Pipe

### Rail Revolution
**Nickname:** `RailRev`
**Description:** Create a surface of revolution using a sweep rail.
**GUID:** `d8d68c35-f869-486d-adf3-69ee3cc2d501`

**Inputs:**
- **`P` (Curve):** Profile curve
- **`R` (Curve):** Rail curve
- **`A` (Line):** Revolution axis
- **`S` (Boolean):** Scale height of profile curve

**Outputs:**
- **`S` (Brep):** Brep representing the Rail-Revolve result.

### Revolution
**Nickname:** `RevSrf`
**Description:** Create a surface of revolution.
**GUID:** `cdee962f-4202-456b-a1b4-f3ed9aa0dc29`

**Inputs:**
- **`P` (Curve):** Profile curve
- **`A` (Line):** Revolution axis
- **`D` (Domain):** Angle domain (in radians)

**Outputs:**
- **`S` (Brep):** Brep representing the revolution result.

### Ruled Surface
**Nickname:** `RuleSrf`
**Description:** Create a surface between two curves.
**GUID:** `6e5de495-ba76-42d0-9985-a5c265e9aeca`

**Inputs:**
- **`A` (Curve):** First curve
- **`B` (Curve):** Second curve

**Outputs:**
- **`S` (Surface):** Ruled surface between A and B

### Sum Surface
**Nickname:** `SumSrf`
**Description:** Create a sum surface from two edge curves.
**GUID:** `5e33c760-adcd-4235-b1dd-05cf72eb7a38`

**Inputs:**
- **`A` (Curve):** First curve
- **`B` (Curve):** Second curve

**Outputs:**
- **`S` (Brep):** BRep representing the sum-surface

### Surface From Points
**Nickname:** `SrfGrid`
**Description:** Create a nurbs surface from a grid of points.
**GUID:** `4b04a1e1-cddf-405d-a7db-335aaa940541`

**Inputs:**
- **`P` (Point):** Grid of points
- **`U` (Integer):** Number of points in {u} direction
- **`I` (Boolean):** Interpolate samples

**Outputs:**
- **`S` (Surface):** Resulting surface

### Sweep1
**Nickname:** `Swp1`
**Description:** Create a sweep surface with one rail curve.
**GUID:** `bb6666e7-d0f4-41ec-a257-df2371619f13`

**Inputs:**
- **`R` (Curve):** Rail curve
- **`S` (Curve):** Section curves
- **`M` (Integer):** Kink miter type (0=None, 1=Trim, 2=Rotate)

**Outputs:**
- **`S` (Brep):** Resulting Brep

### Sweep2
**Nickname:** `Swp2`
**Description:** Create a sweep surface with two rail curves.
**GUID:** `75164624-395a-4d24-b60b-6bf91cab0194`

**Inputs:**
- **`R¹` (Curve):** First rail curve
- **`R²` (Curve):** Second rail curve
- **`S` (Curve):** Section curves
- **`H` (Boolean):** Create a sweep with same-height properties.

**Outputs:**
- **`S` (Brep):** Resulting Brep

***

## Category: Surface > Primitive

### Bounding Box
**Nickname:** `BBox`
**Description:** Solve oriented geometry bounding boxes.
**GUID:** `0bb3d234-9097-45db-9998-621639c87d3b`

**Inputs:**
- **`C` (Geometry):** Geometry to contain
- **`P` (Plane):** BoundingBox orientation plane

**Outputs:**
- **`B` (Box):** Aligned bounding box in world coordinates
- **`B` (Box):** Bounding box in orientation plane coordinates

### Box 2Pt
**Nickname:** `Box`
**Description:** Create a box defined by two points.
**GUID:** `2a43ef96-8f87-4892-8b94-237a47e8d3cf`

**Inputs:**
- **`A` (Point):** First corner
- **`B` (Point):** Second corner
- **`P` (Plane):** Base plane

**Outputs:**
- **`B` (Box):** Resulting box

### Box Rectangle
**Nickname:** `BoxRec`
**Description:** Create a box defined by a rectangle and a height.
**GUID:** `d0a56c9e-2483-45e7-ab98-a450b97f1bc0`

**Inputs:**
- **`R` (Rectangle):** Base rectangle
- **`H` (Domain):** Box height

**Outputs:**
- **`B` (Box):** Resulting box

### Center Box
**Nickname:** `Box`
**Description:** Create a box centered on a plane.
**GUID:** `28061aae-04fb-4cb5-ac45-16f3b66bc0a4`

**Inputs:**
- **`B` (Plane):** Base plane
- **`X` (Number):** Size of box in {x} direction.
- **`Y` (Number):** Size of box in {y} direction.
- **`Z` (Number):** Size of box in {z} direction.

**Outputs:**
- **`B` (Box):** Resulting box

### Cone
**Nickname:** `Cone`
**Description:** Create a conical surface
**GUID:** `03e331ed-c4d1-4a23-afa2-f57b87d2043c`

**Inputs:**
- **`B` (Plane):** Base plane
- **`R` (Number):** Radius at cone base
- **`L` (Number):** Cone height

**Outputs:**
- **`C` (Surface):** Resulting cone
- **`T` (Point):** Tip of cone

### Cylinder
**Nickname:** `Cyl`
**Description:** Create a cylindrical surface.
**GUID:** `0373008a-80ee-45be-887d-ab5a244afc29`

**Inputs:**
- **`B` (Plane):** Base plane
- **`R` (Number):** Cylinder radius
- **`L` (Number):** Cylinder height

**Outputs:**
- **`C` (Surface):** Resulting cylinder

### Domain Box
**Nickname:** `Box`
**Description:** Create a box defined by a base plane and size domains.
**GUID:** `79aa7f47-397c-4d3f-9761-aaf421bb7f5f`

**Inputs:**
- **`B` (Plane):** Base plane
- **`X` (Domain):** Domain of the box in the {x} direction.
- **`Y` (Domain):** Domain of the box in the {y} direction.
- **`Z` (Domain):** Domain of the box in the {z} direction.

**Outputs:**
- **`B` (Box):** Resulting box

### Plane Surface
**Nickname:** `PlaneSrf`
**Description:** Create a plane surface
**GUID:** `439a55a5-2f9e-4f66-9de2-32f24fec2ef5`

**Inputs:**
- **`P` (Plane):** Surface base plane
- **`X` (Domain):** Dimensions in X direction
- **`Y` (Domain):** Dimensions in Y direction

**Outputs:**
- **`P` (Surface):** Resulting plane surface

### Plane Through Shape
**Nickname:** `PxS`
**Description:** Make a rectangular surface that is larger than a given shape.
**GUID:** `d8698126-0e91-4ae7-ba05-2490258573ea`

**Inputs:**
- **`P` (Plane):** Surface plane
- **`S` (Geometry):** Shape to exceed
- **`I` (Number):** Boundary inflation amount

**Outputs:**
- **`S` (Surface):** Resulting planar surface

### Quad Sphere
**Nickname:** `QSph`
**Description:** Create a spherical brep made from quad nurbs patches.
**GUID:** `361790d6-9d66-4808-8c5a-8de9c218c227`

**Inputs:**
- **`B` (Plane):** Base plane
- **`R` (Number):** Sphere radius

**Outputs:**
- **`S` (Brep):** Resulting quad sphere

### Sphere
**Nickname:** `Sph`
**Description:** Create a spherical surface.
**GUID:** `dabc854d-f50e-408a-b001-d043c7de151d`

**Inputs:**
- **`B` (Plane):** Base plane
- **`R` (Number):** Sphere radius

**Outputs:**
- **`S` (Surface):** Resulting sphere

### Sphere 4Pt
**Nickname:** `Sph4Pt`
**Description:** Create a spherical surface from 4 points.
**GUID:** `b083c06d-9a71-4f40-b354-1d80bba1e858`

**Inputs:**
- **`P1` (Point):** First point
- **`P2` (Point):** Second point (cannot be coincident with P1)
- **`P3` (Point):** Third point (cannot be colinear with P1 & P2)
- **`P4` (Point):** Fourth point (cannot be coplanar with P1, P2 & P3)

**Outputs:**
- **`C` (Point):** Center of sphere
- **`R` (Number):** Radius of sphere
- **`S` (Surface):** Sphere fitted to P1~P4

### Sphere Fit
**Nickname:** `SFit`
**Description:** Fit a sphere to a 3D collection of points
**GUID:** `e7ffb3af-2d77-4804-a260-755308bf8285`

**Inputs:**
- **`P` (Point):** Points to fit

**Outputs:**
- **`C` (Point):** Center of fitted sphere
- **`R` (Number):** Radius of fitted sphere
- **`S` (Surface):** Sphere surface

***

## Category: Surface > SubD

### Mesh from SubD
**Nickname:** `MeshSubD`
**Description:** Get the approximation mesh of a SubD.
**GUID:** `c0b3c6e9-d05d-4c51-a0df-1ce2678c7a33`

**Inputs:**
- **`S` (SubD):** SubD
- **`D` (Integer):** Subdivision density

**Outputs:**
- **`M` (Mesh):** Mesh approximation

### MultiPipe
**Nickname:** `MP`
**Description:** Create a branching pipe around a network of lines/curves
**GUID:** `4bfe1bf6-fbc9-4ad2-bf28-a7402e1392ee`

**Inputs:**
- **`Curves` (Generic Data):** The curves to pipe. Also accepts meshes
- **`NodeSize` (Number):** Pipe radius. If one value given, it is applied to all. Alternatively, provide a list of radii corresponding to each point in SizePoints
- **`SizePoints` (Point):** If you are supplying multiple radii for NodeSize, these points identify which node to set as which radius. If only some of the nodes have their radius set this way, the values will be interpolated across the shape
- **`EndOffset` (Number):** The distance of the first edge loop away from the node as a multiplier of NodeSize. If this is set to zero, no intermediate edge loop is added, to give a smoother shape.
- **`StrutSize` (Number):** The size of the struts between nodes as a multiplier of NodeSize. <1 gives tapering struts, >1 gives bulging struts
- **`Segment` (Number):** Approximate spacing of edge loops along each strut. If set to zero, no additional edge loops are added
- **`KinkAngle` (Number):** When the input to 'Curves' are smooth curves, this sets the maximum angle between consecutive segments when discretizing
- **`CubeFit` (Number):** If >0 this attempts to fit a cube at each node. Should be a value between 0 and 1, where 0 = never, and 1 = always, depending on how close to orthogonal its connected lines are.
- **`Caps` (Integer):** Cap option - 0:None, 1:Round, 2:Flat

**Outputs:**
- **`P` (SubD):** Resulting Pipe SubD

### MultiPipe
**Nickname:** `MP`
**Description:** Create a branching pipe around a network of lines/curves
**GUID:** `f1b75016-5818-4ece-be56-065253a2357d`

**Inputs:**
- **`C` (Generic Data):** The curves to pipe. Also accepts meshes
- **`N` (Number):** Pipe radius. If one value given, it is applied to all. Alternatively, provide a list of radii corresponding to each point in SizePoints
- **`SP` (Point):** If you are supplying multiple radii for NodeSize, these points identify which node to set as which radius. If only some of the nodes have their radius set this way, the values will be interpolated across the shape
- **`E` (Number):** The distance of the first edge loop away from the node as a multiplier of NodeSize. If this is set to zero, no intermediate edge loop is added, to give a smoother shape.
- **`SS` (Number):** The size of the struts between nodes as a multiplier of NodeSize. <1 gives tapering struts, >1 gives bulging struts
- **`S` (Number):** Approximate spacing of edge loops along each strut. If set to zero, no additional edge loops are added
- **`KA` (Number):** When the input to 'Curves' are smooth curves, this sets the maximum angle between consecutive segments when discretizing
- **`CF` (Number):** If >0 this attempts to fit a cube at each node. Should be a value between 0 and 1, where 0 = never, and 1 = always, depending on how close to orthogonal its connected lines are.

**Outputs:**
- **`P` (SubD):** Resulting Pipe SubD

### SubD Box
**Nickname:** `SubDBox`
**Description:** Create a subdivision box
**GUID:** `10487e4e-a405-48b5-b188-5a8a6328418b`

**Inputs:**
- **`B` (Box):** Box
- **`D` (Integer):** Subdivision density
- **`C` (Boolean):** Sharp box creases

**Outputs:**
- **`S` (SubD):** SubD

### SubD Control Polygon
**Nickname:** `SubDPoly`
**Description:** Extract the control polygon from a SubD.
**GUID:** `c1a57c2a-11c5-4f77-851e-0a7dffef848e`

**Inputs:**
- **`S` (SubD):** SubD

**Outputs:**
- **`M` (Mesh):** Control mesh

### SubD Edge Tags
**Nickname:** `SubDTags`
**Description:** Set the edge tags of a SubD shape.
**GUID:** `048b219e-284a-49f2-ae40-a60465b08447`

**Inputs:**
- **`S` (SubD):** SubD to modify.
- **`T` (Text):** Edge tag descriptor.
- **`E` (Integer):** Edge identifiers.

**Outputs:**
- **`S` (SubD):** Modified SuD shape.

### SubD Edges
**Nickname:** `SubDEdges`
**Description:** Extract all edge data from a SubD.
**GUID:** `2183c4c6-b5b3-45d2-9261-2096c9357f92`

**Inputs:**
- **`S` (SubD):** SubD

**Outputs:**
- **`L` (Line):** Edge line
- **`E` (Curve):** Edge curve
- **`T` (Text):** Edge tag
- **`I` (Text):** Edge identifier

### SubD Faces
**Nickname:** `SubDFaces`
**Description:** Extract all face data from a SubD.
**GUID:** `83c81431-17bc-4bff-bb85-be0a846bd044`

**Inputs:**
- **`S` (SubD):** SubD

**Outputs:**
- **`P` (Point):** Face centre point
- **`C` (Integer):** Number of edges (and vertices) which surround this face.
- **`E` (Text):** Edge identifiers
- **`V` (Text):** Vertex identifiers

### SubD Fuse
**Nickname:** `Fuse`
**Description:** Combine 2 SubD objects
**GUID:** `264b4aa6-4915-4a67-86a7-22a5c4acf565`

**Inputs:**
- **`A` (Mesh):** First SubD or Mesh object to be fused
- **`B` (Mesh):** Second SubD or Mesh object to be fused
- **`O` (Integer):** Boolean type: 0=Union, 1=Intersection, 2=A-B, 3=B-A
- **`S` (Integer):** Number of smoothing steps to perform on the join

**Outputs:**
- **`F` (SubD):** Fused result

### SubD Vertex Tags
**Nickname:** `SubDVTags`
**Description:** Set the vertex tags of a SubD shape.
**GUID:** `954a8963-bb2c-4847-9012-69ff34acddd5`

**Inputs:**
- **`S` (SubD):** SubD to modify.
- **`T` (Text):** Vertex tag descriptor. (S=smooth, C=crease, L=corner, D=dart)
- **`V` (Integer):** Vertex identifiers.

**Outputs:**
- **`S` (SubD):** Modified SuD shape.

### SubD Vertices
**Nickname:** `SubDVerts`
**Description:** Extract all vertex data from a SubD.
**GUID:** `fc8ad805-2cbf-4447-b41b-50c0be591fcd`

**Inputs:**
- **`S` (SubD):** SubD

**Outputs:**
- **`P` (Point):** Vertex location on control net.
- **`I` (Text):** Vertex identifier.
- **`T` (Text):** Vertex tag type.

### SubD from Mesh
**Nickname:** `SubDMesh`
**Description:** Create a SubD from a control mesh
**GUID:** `855a2c73-31c0-41d2-b061-57d54229d11b`

**Inputs:**
- **`M` (Mesh):** Control Mesh
- **`Cr` (Integer):** Subdivision crease option
- **`Co` (Integer):** Subdivision corner option
- **`I` (Boolean):** Interpolate mesh vertices

**Outputs:**
- **`S` (SubD):** SubD

***

## Category: Surface > Util

### Brep Join
**Nickname:** `Join`
**Description:** Join a number of Breps together
**GUID:** `1addcc85-b04e-46e6-bd4a-6f6c93bf7efd`

**Inputs:**
- **`B` (Brep):** Breps to join

**Outputs:**
- **`B` (Brep):** Joined Breps
- **`C` (Boolean):** Closed flag for each resulting Brep

### Cap Holes
**Nickname:** `Cap`
**Description:** Cap all planar holes in a Brep.
**GUID:** `b648d933-ddea-4e75-834c-8f6f3793e311`

**Inputs:**
- **`B` (Brep):** Brep to cap

**Outputs:**
- **`B` (Brep):** Capped Brep

### Cap Holes Ex
**Nickname:** `CapEx`
**Description:** Cap as many holes as possible in a Brep.
**GUID:** `f6409a9c-3d2a-4b14-9f2c-e3c3f2cb72f8`

**Inputs:**
- **`B` (Brep):** Brep to cap

**Outputs:**
- **`B` (Brep):** Capped Brep
- **`C` (Integer):** Number of caps added
- **`S` (Boolean):** Value indicating whether capped brep is solid

### Closed Edges
**Nickname:** `EdgesCls`
**Description:** Select closed edges.
**GUID:** `70905be1-e22f-4fa8-b9ae-e119d417904f`

**Inputs:**
- **`B` (Brep):** Brep for edge extraction
- **`T` (Boolean):** If true, consecutive tangent edges will be taken into account.

**Outputs:**
- **`C` (Curve):** Closed edge curves
- **`Ci` (Integer):** Closed edge indices.
- **`O` (Curve):** Open edge curves.
- **`Oi` (Integer):** Open edge indices.

### Convex Edges
**Nickname:** `EdgesCvx`
**Description:** Select concave or convex brep edges.
**GUID:** `8248da39-0729-4e04-8395-267b3259bc2f`

**Inputs:**
- **`B` (Brep):** Brep for edge extraction

**Outputs:**
- **`Cv` (Integer):** Fully convex edge indices
- **`Cc` (Integer):** Fully concave edge indices
- **`Mx` (Integer):** Mixed concavity edge indices

### Copy Trim
**Nickname:** `Trim`
**Description:** Copy UV trim data from one surface to another.
**GUID:** `5d192b90-1ae3-4439-bbde-b05976fc4ac3`

**Inputs:**
- **`S` (Surface):** Source surface
- **`T` (Surface):** Target surface

**Outputs:**
- **`S` (Surface):** Retrimmed surface

### Divide Surface
**Nickname:** `SDivide`
**Description:** Generate a grid of {uv} points on a surface.
**GUID:** `5106bafc-d5d4-4983-83e7-7be3ed07f502`

**Inputs:**
- **`S` (Surface):** Surface to divide
- **`U` (Integer):** Number of segments in {u} direction
- **`V` (Integer):** Number of segments in {v} direction

**Outputs:**
- **`P` (Point):** Division points
- **`N` (Vector):** Normal vectors at division points
- **`uv` (Point):** Parameter coordinates at division points

### Edges from Directions
**Nickname:** `EdgesDir`
**Description:** Select brep edges based on edge direction
**GUID:** `64ff9813-8fe8-4708-ac9f-61b825213e83`

**Inputs:**
- **`B` (Brep):** Brep for edge extraction
- **`D` (Vector):** Directions to filter
- **`R` (Boolean):** If true, angle test includes the reflex angle
- **`A` (Number):** Direction angle tolerance.

**Outputs:**
- **`E` (Curve):** Found edges
- **`I` (Integer):** Edge indices
- **`M` (Text):** Direction map per edge

### Edges from Faces
**Nickname:** `EdgesFaces`
**Description:** Select all brep edges that delineate certain faces
**GUID:** `71e99dbb-2d79-4f02-a8a6-e87a09d54f47`

**Inputs:**
- **`B` (Brep):** Brep for edge extraction
- **`P` (Point):** Points for face coincidence check

**Outputs:**
- **`E` (Curve):** Found edges
- **`I` (Integer):** Edge indices

### Edges from Length
**Nickname:** `EdgesLen`
**Description:** Select brep edges based on length
**GUID:** `ff187e6a-84bc-4bb9-a572-b39006a0576d`

**Inputs:**
- **`B` (Brep):** Brep for edge extraction
- **`L-` (Number):** Minimum edge length for inclusion.
- **`L+` (Number):** Maximum edge length for inclusion.

**Outputs:**
- **`E` (Curve):** Found edges
- **`I` (Integer):** Edge indices

### Edges from Linearity
**Nickname:** `EdgesLin`
**Description:** Select brep edges based on linearity
**GUID:** `e4ff8101-73c9-4802-8c5d-704d8721b909`

**Inputs:**
- **`B` (Brep):** Brep for edge extraction
- **`L-` (Number):** Minimum linearity deviation for edge inclusion.
- **`L+` (Number):** Maximum linearity deviation for edge inclusion.

**Outputs:**
- **`E` (Curve):** Found edges
- **`I` (Integer):** Edge indices

### Edges from Points
**Nickname:** `EdgesPt`
**Description:** Select brep edges based on point coincidence
**GUID:** `73269f6a-9645-4638-8d5e-88064dd289bd`

**Inputs:**
- **`B` (Brep):** Brep for edge extraction
- **`P` (Point):** Points for coincidence check
- **`V` (Integer):** Minimum valence of points per edge
- **`T` (Number):** Optional coincidence tolerance.

**Outputs:**
- **`E` (Curve):** Found edges
- **`I` (Integer):** Edge indices
- **`M` (Text):** Point map per edge

### Fillet Edge
**Nickname:** `FilEdge`
**Description:** Fillet some edges of a brep.
**GUID:** `4b87eb13-f87c-4ff1-ae0e-6c9f1f2aecbd`

**Inputs:**
- **`S` (Brep):** Shape to fillet
- **`B` (Integer):** Fillet blend type
- **`M` (Integer):** Fillet metric type
- **`E` (Integer):** Edge indices to fillet
- **`R` (Number):** Fillet radii/measures per edge

**Outputs:**
- **`B` (Brep):** Filleted Brep

### Flip
**Nickname:** `Flip`
**Description:** Flip the normals of a surface based on local or remote geometry
**GUID:** `c3d1f2b8-8596-4e8d-8861-c28ba8ffb4f4`

**Inputs:**
- **`S` (Surface):** Surface to flip
- **`G` (Surface):** Optional guide surface to match

**Outputs:**
- **`S` (Surface):** Flipped surface
- **`R` (Boolean):** Result: True if surface was flipped

### Isotrim
**Nickname:** `SubSrf`
**Description:** Extract an isoparametric subset of a surface.
**GUID:** `6a9ccaab-1b03-484e-bbda-be9c81584a66`

**Inputs:**
- **`S` (Surface):** Base surface
- **`D` (Domain²):** Domain of subset

**Outputs:**
- **`S` (Surface):** Subset of base surface

### Merge Faces
**Nickname:** `FMerge`
**Description:** Merge all adjacent co-planar faces in a brep
**GUID:** `d6b43673-55dd-4e2f-95c4-6c69a14513a6`

**Inputs:**
- **`B` (Brep):** Brep to simplify

**Outputs:**
- **`B` (Brep):** Simplified Brep
- **`N0` (Integer):** Number of faces before simplification
- **`N1` (Integer):** Number of faces after simplification

### Offset Surface
**Nickname:** `Offset`
**Description:** Offset a surface by a fixed amount.
**GUID:** `b25c5762-f90e-4839-9fc5-74b74ab42b1e`

**Inputs:**
- **`S` (Surface):** Base surface
- **`D` (Number):** Offset distance
- **`T` (Boolean):** Retrim offset

**Outputs:**
- **`S` (Surface):** Offset result

### Offset Surface Loose
**Nickname:** `Offset (L)`
**Description:** Offset a surface by moving the control points.
**GUID:** `e7e43403-f913-4d83-8aff-5b1c7a7f9fbc`

**Inputs:**
- **`S` (Surface):** Base surface
- **`D` (Number):** Offset distance
- **`T` (Boolean):** Retrim offset

**Outputs:**
- **`S` (Surface):** Offset result

### Retrim
**Nickname:** `Retrim`
**Description:** Retrim a surface based on 3D trim data from another surface.
**GUID:** `a1da39b7-6387-4522-bf2b-2eaee6b14072`

**Inputs:**
- **`S` (Surface):** Source surface providing the UV trim data.
- **`T` (Surface):** Target surface to be trimmed

**Outputs:**
- **`S` (Surface):** Retrimmed surface

### Surface Frames
**Nickname:** `SFrames`
**Description:** Generate a grid of {uv} frames on a surface
**GUID:** `332378f4-acb2-43fe-8593-ed22bfeb2721`

**Inputs:**
- **`S` (Surface):** Surface to divide
- **`U` (Integer):** Number of segments in U-direction
- **`V` (Integer):** Number of segments in V-direction

**Outputs:**
- **`F` (Plane):** Surface Frames
- **`uv` (Point):** Parameter coordinates at division points

### Untrim
**Nickname:** `Untrim`
**Description:** Remove all trim curves from a surface.
**GUID:** `fa92858a-a180-4545-ad4d-0dc644b3a2a8`

**Inputs:**
- **`S` (Surface):** Base surface

**Outputs:**
- **`S` (Surface):** Untrimmed surface

***

## Category: Transform > Affine

### Box Mapping
**Nickname:** `BoxMap`
**Description:** Transform geometry from one box into another.
**GUID:** `8465bcce-9e0a-4cf4-bbda-1a7ce5681e10`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`S` (Box):** Box to map from
- **`T` (Box):** Box to map into

**Outputs:**
- **`G` (Geometry):** Mapped geometry
- **`X` (Transform):** Transformation data

### Camera Obscura
**Nickname:** `CO`
**Description:** Camera Obscura (point mirror) transformation.
**GUID:** `407e35c6-7c40-4652-bd80-fde1eb7ec034`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`P` (Point):** Mirror point
- **`F` (Number):** Scaling factor

**Outputs:**
- **`G` (Geometry):** Mirrored geometry
- **`X` (Transform):** Transformation data

### Orient Direction
**Nickname:** `Orient`
**Description:** Orient an object using directional constraints only.
**GUID:** `1602b2cc-007c-4b79-8926-0067c6184e44`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`pA` (Point):** Reference point
- **`dA` (Vector):** Reference direction
- **`pB` (Point):** Target point
- **`dB` (Vector):** Target direction

**Outputs:**
- **`G` (Geometry):** Reoriented geometry
- **`X` (Transform):** Transformation data

### Project
**Nickname:** `Project`
**Description:** Project an object onto a plane.
**GUID:** `23285717-156c-468f-a691-b242488c06a6`

**Inputs:**
- **`G` (Generic Data):** Geometry to project
- **`P` (Plane):** Projection plane

**Outputs:**
- **`G` (Generic Data):** Projected geometry
- **`X` (Transform):** Transformation data

### Project Along
**Nickname:** `ProjectA`
**Description:** Project an object onto a plane along a direction.
**GUID:** `06d7bc4a-ba3e-4445-8ab5-079613b52f28`

**Inputs:**
- **`G` (Generic Data):** Geometry to project
- **`P` (Plane):** Projection plane
- **`D` (Vector):** Projection direction

**Outputs:**
- **`G` (Generic Data):** Projected geometry
- **`X` (Transform):** Transformation data

### Rectangle Mapping
**Nickname:** `RecMap`
**Description:** Transform geometry from one rectangle into another.
**GUID:** `17d40004-489e-42d9-ad10-857f7b436801`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`S` (Rectangle):** Rectangle to map from
- **`T` (Rectangle):** Rectangle to map into

**Outputs:**
- **`G` (Geometry):** Mapped geometry
- **`X` (Transform):** Transformation data

### Scale
**Nickname:** `Scale`
**Description:** Scale an object uniformly in all directions.
**GUID:** `4d2a06bd-4b0f-4c65-9ee0-4220e4c01703`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`C` (Point):** Center of scaling
- **`F` (Number):** Scaling factor

**Outputs:**
- **`G` (Geometry):** Scaled geometry
- **`X` (Transform):** Transformation data

### Scale NU
**Nickname:** `Scale NU`
**Description:** Scale an object with non-uniform factors.
**GUID:** `290f418a-65ee-406a-a9d0-35699815b512`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`P` (Plane):** Base plane
- **`X` (Number):** Scaling factor in {x} direction
- **`Y` (Number):** Scaling factor in {y} direction
- **`Z` (Number):** Scaling factor in {z} direction

**Outputs:**
- **`G` (Geometry):** Scaled geometry
- **`X` (Transform):** Transformation data

### Shear
**Nickname:** `Shear`
**Description:** Shear an object based on a shearing vector.
**GUID:** `5a27203a-e05f-4eea-b80f-a5f29a00fdf2`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`P` (Plane):** Base plane
- **`G` (Point):** Reference point
- **`T` (Point):** Target point

**Outputs:**
- **`G` (Geometry):** Sheared geometry
- **`X` (Transform):** Transformatio data

### Shear Angle
**Nickname:** `Shear`
**Description:** Shear an object based on tilt angles.
**GUID:** `f19ee36c-f21f-4e25-be4c-4ca4b30eda0d`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`P` (Plane):** Base plane
- **`Ax` (Number):** Rotation around {x} axis in radians
- **`Ay` (Number):** Rotation around {y} axis in radians

**Outputs:**
- **`G` (Geometry):** Sheared geometry
- **`X` (Transform):** Transformation data

### Triangle Mapping
**Nickname:** `TriMap`
**Description:** Transform geometry from one triangle into another.
**GUID:** `61d81100-c4d3-462d-8b51-d951c0ae32db`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`S` (Curve):** Triangle to map from
- **`T` (Curve):** Triangle to map into

**Outputs:**
- **`G` (Geometry):** Mapped geometry
- **`X` (Transform):** Transformation data

***

## Category: Transform > Array

### Box Array
**Nickname:** `ArrBox`
**Description:** Create a box array of geometry.
**GUID:** `9f6f954c-ba7b-4428-bf1e-1768cdff666c`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`C` (Box):** 3D Box array cell
- **`X` (Integer):** Number of elements in the array x-direction.
- **`Y` (Integer):** Number of elements in the array y-direction.
- **`Z` (Integer):** Number of elements in the array z-direction.

**Outputs:**
- **`G` (Geometry):** Arrayed geometry
- **`X` (Transform):** Transformation data

### Curve Array
**Nickname:** `ArrCurve`
**Description:** Create an array of geometry along a curve.
**GUID:** `c6f23658-617f-4ac8-916d-d0d9e7241b25`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`C` (Curve):** Array rail curve
- **`N` (Integer):** Number of elements in the array.

**Outputs:**
- **`G` (Geometry):** Arrayed geometry
- **`X` (Transform):** Transformation data

### Kaleidoscope
**Nickname:** `KScope`
**Description:** Apply a kaleidoscope transformation to an object.
**GUID:** `b90eaa92-6e38-4054-a915-afcf486224b3`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`P` (Plane):** Kaleidoscope plane
- **`S` (Integer):** Kaleidoscope segments.

**Outputs:**
- **`G` (Geometry):** Mirrored geometry
- **`X` (Transform):** Transformation data

### Linear Array
**Nickname:** `ArrLinear`
**Description:** Create a linear array of geometry.
**GUID:** `e87db220-a0a0-4d67-a405-f97fd14b2d7a`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`D` (Vector):** Linear array direction and interval
- **`N` (Integer):** Number of elements in array.

**Outputs:**
- **`G` (Geometry):** Arrayed geometry
- **`X` (Transform):** Transformation data

### Polar Array
**Nickname:** `ArrPolar`
**Description:** Create a polar array of geometry.
**GUID:** `fca5ad7e-ecac-401d-a357-edda0a251cbc`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`P` (Plane):** Polar array plane
- **`N` (Integer):** Number of elements in array.
- **`A` (Number):** Sweep angle in radians (counter-clockwise, starting from plane x-axis)

**Outputs:**
- **`G` (Geometry):** Arrayed geometry
- **`X` (Transform):** Transformation data

### Rectangular Array
**Nickname:** `ArrRec`
**Description:** Create a rectangular array of geometry.
**GUID:** `e521f7c8-92f4-481c-888b-eea109e3d6e9`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`C` (Rectangle):** Rectangular array cell
- **`X` (Integer):** Number of elements in the array x-direction.
- **`Y` (Integer):** Number of elements in the array y-direction.

**Outputs:**
- **`G` (Geometry):** Arrayed geometry
- **`X` (Transform):** Transformation data

***

## Category: Transform > Euclidean

### Mirror
**Nickname:** `Mirror`
**Description:** Mirror an object.
**GUID:** `f12daa2f-4fd5-48c1-8ac3-5dea476912ca`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`P` (Plane):** Mirror plane

**Outputs:**
- **`G` (Geometry):** Mirrored geometry
- **`X` (Transform):** Transformation data

### Move
**Nickname:** `Move`
**Description:** Translate (move) an object along a vector.
**GUID:** `e9eb1dcf-92f6-4d4d-84ae-96222d60f56b`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`T` (Vector):** Translation vector

**Outputs:**
- **`G` (Geometry):** Translated geometry
- **`X` (Transform):** Transformation data

### Move Away From
**Nickname:** `MoveAway`
**Description:** Translate (move) an object away from another object.
**GUID:** `dd9f597a-4db0-42b1-9cb2-5607ec97db09`

**Inputs:**
- **`G` (Geometry):** Geometry to move
- **`E` (Geometry):** Geometry to move away from
- **`D` (Number):** Distance to move (negative values move towards)

**Outputs:**
- **`G` (Geometry):** Translated geometry
- **`X` (Transform):** Transformation data

### Move To Plane
**Nickname:** `MoveToPlane`
**Description:** Translate (move) an object onto a plane.
**GUID:** `4fe87ef8-49e4-4605-9859-87940d62e1de`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`P` (Plane):** Target plane
- **`A` (Boolean):** Move when above plane
- **`B` (Boolean):** Move when below plane

**Outputs:**
- **`G` (Geometry):** Translated geometry
- **`X` (Transform):** Transformation data

### Orient
**Nickname:** `Orient`
**Description:** Orient an object. Orientation is sometimes called a 'ChangeBasis tranformation'. It allows for remapping of geometry from one axis-system to another.
**GUID:** `378d0690-9da0-4dd1-ab16-1d15246e7c22`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`A` (Plane):** Initial plane
- **`B` (Plane):** Final plane

**Outputs:**
- **`G` (Geometry):** Reoriented geometry
- **`X` (Transform):** Transformation data

### Rotate
**Nickname:** `Rotate`
**Description:** Rotate an object in a plane.
**GUID:** `b7798b74-037e-4f0c-8ac7-dc1043d093e0`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`A` (Number):** Rotation angle in radians
- **`P` (Plane):** Rotation plane

**Outputs:**
- **`G` (Geometry):** Rotated geometry
- **`X` (Transform):** Transformation data

### Rotate 3D
**Nickname:** `Rot3D`
**Description:** Rotate an object around a center point and an axis vector.
**GUID:** `3dfb9a77-6e05-4016-9f20-94f78607d672`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`A` (Number):** Rotation angle in radians
- **`C` (Point):** Center of rotation
- **`X` (Vector):** Axis of rotation

**Outputs:**
- **`G` (Geometry):** Rotated geometry
- **`X` (Transform):** Transformation data

### Rotate Axis
**Nickname:** `RotAx`
**Description:** Rotate an object around an axis.
**GUID:** `3ac8e589-37f5-477d-aa61-6699702c5728`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`A` (Number):** Rotation angle in radians
- **`X` (Line):** Rotation axis

**Outputs:**
- **`G` (Geometry):** Rotated geometry
- **`X` (Transform):** Transformation data

### Rotate Direction
**Nickname:** `Rotate`
**Description:** Rotate an object from one direction to another.
**GUID:** `5edaea74-32cb-4586-bd72-66694eb73160`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`C` (Point):** Rotation center point
- **`F` (Vector):** Initial direction
- **`T` (Vector):** Final direction

**Outputs:**
- **`G` (Geometry):** Rotated geometry
- **`X` (Transform):** Transformation data

### Sanity XForm
**Nickname:** `MWHAHAHA!!`
**Description:** Apply a sanity transformation to f a r - a w a y, tiny or HUGE geometry
**GUID:** `03b3db66-d7e8-4d2d-bc0c-122913317254`

**Inputs:**
- **`G` (Geometry):** Geometry to transform

**Outputs:**
- **`G` (Geometry):** Sane geometry
- **`W` (Geometry):** Reinstated insane geometry

***

## Category: Transform > Morph

### Bend Deform
**Nickname:** `Bend`
**Description:** Deform a shape by bending it
**GUID:** `539f5564-4fc0-4fc1-a7d3-b802fa2ef072`

**Inputs:**
- **`G` (Geometry):** Geometry to deform
- **`B` (Arc):** Bending arc segment

**Outputs:**
- **`G` (Geometry):** Deformed geometry

### Blend Box
**Nickname:** `BlendBox`
**Description:** Create a twisted box between two surfaces.
**GUID:** `6283fb37-e273-4eb2-8d2a-e347881e3928`

**Inputs:**
- **`Sa` (Surface):** First surface
- **`Da` (Domain²):** Domain on first surface
- **`Sb` (Surface):** Second surface
- **`Db` (Domain²):** Domain on second surface

**Outputs:**
- **`B` (Twisted Box):** Resulting blend box

### Box Morph
**Nickname:** `Morph`
**Description:** Morph an object into a twisted box.
**GUID:** `d8940ff0-dd4a-4e74-9361-54df537b50db`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`R` (Box):** Reference box
- **`T` (Twisted Box):** Target box

**Outputs:**
- **`G` (Geometry):** Translated geometry

### Flow
**Nickname:** `Flow`
**Description:** Re-aligns objects from a base curve to a target curve.
**GUID:** `c3249da4-3f8e-4400-833e-e4e984d28657`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`C0` (Curve):** Base curve
- **`C1` (Curve):** Target curve
- **`R0` (Boolean):** If true, then direction of the base curve is reversed.
- **`R1` (Boolean):** If true, then direction of the target curve is reversed.
- **`S` (Boolean):** If true, the length of objects along the curve directions is changed to reflect the curve dimensions.
- **`R` (Boolean):** Geometry will not be deformed as it is transformed

**Outputs:**
- **`G` (Geometry):** Morphed geometry

### Maelstrom
**Nickname:** `Maelstrom`
**Description:** Spirally deforms objects as if they were caught in a whirlpool
**GUID:** `134a849b-0ff4-4f36-bdd5-95e3996bae8b`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`P` (Plane):** Spiral base plane.
- **`R0` (Number):** First radius
- **`R1` (Number):** Second radius
- **`A` (Number):** Coil angle in radians
- **`R` (Boolean):** Geometry will not be deformed as it is transformed

**Outputs:**
- **`G` (Geometry):** Morphed geometry

### Map to Surface
**Nickname:** `Map Srf`
**Description:** Map a curve onto a surface via control points.
**GUID:** `fc5b7d12-7247-4de0-81bc-9b2c2f8f72f6`

**Inputs:**
- **`C` (Curve):** Curve to map
- **`S` (Surface):** Base surface for initial coordinate space
- **`T` (Surface):** Surface for target coordinate space

**Outputs:**
- **`C` (Curve):** Mapped curve

### Mirror Curve
**Nickname:** `Mirror`
**Description:** Mirror a shape in a freeform curve.
**GUID:** `9c9f8219-ae88-4d29-ba1b-3433ed713639`

**Inputs:**
- **`G` (Geometry):** Geometry to mirror
- **`C` (Curve):** Mirror curve
- **`T` (Boolean):** Mirror tangent (if true, mirror behaviour extends beyond curve ends)

**Outputs:**
- **`G` (Geometry):** Mirrored geometry

### Mirror Surface
**Nickname:** `Mirror`
**Description:** Mirror geometry in a freeform surface.
**GUID:** `6ce1aa3c-626b-4db7-8b5b-bf74c78f8c5e`

**Inputs:**
- **`G` (Geometry):** Geometry to mirror
- **`S` (Surface):** Mirror surface
- **`F` (Boolean):** Mirror frame (if true, mirror behaviour extends beyond surface edge)

**Outputs:**
- **`G` (Geometry):** Mirrored geometry

### Point Deform
**Nickname:** `PDeform`
**Description:** Deform a shape by moving control-points individually
**GUID:** `4dbd15c7-ebcb-4af6-b3bd-32e80502520c`

**Inputs:**
- **`G` (Geometry):** Geometry to deform
- **`P` (Point):** Control-point locations to deform.
- **`M` (Vector):** Motion vector for each control-point

**Outputs:**
- **`G` (Geometry):** Deformed geometry

### Spatial Deform
**Nickname:** `Deform`
**Description:** Perform spatial deformation based on custom space syntax.
**GUID:** `66e6596f-6c8f-4ac3-99e0-0c4b7a59a7f7`

**Inputs:**
- **`G` (Geometry):** Geometry to deform
- **`S` (Point):** Points describing space syntax.
- **`F` (Vector):** Forces (one for each point in space

**Outputs:**
- **`G` (Geometry):** Deformed geometry

### Spatial Deform (custom)
**Nickname:** `Deform`
**Description:** Perform spatial deformation based on custom space syntax.
**GUID:** `331b74f1-1f1f-4f37-b253-24fcdada29e3`

**Inputs:**
- **`G` (Geometry):** Geometry to deform
- **`S` (Point):** Points describing space syntax.
- **`F` (Vector):** Forces (one for each point in space
- **`f` (Text):** Falloff function (for variable 'x')

**Outputs:**
- **`G` (Geometry):** Deformed geometry

### Splop
**Nickname:** `Splop`
**Description:** Wraps geometry onto a surface.
**GUID:** `ff4e6ccd-47ba-4c8c-8287-2a1f2cb1fa5e`

**Inputs:**
- **`G` (Geometry):** Geometry to deform
- **`P` (Plane):** Source plane of deformation
- **`S` (Surface):** Surface to wrap geometry onto
- **`uv` (Point):** U,V parameter on surface used for orienting
- **`A` (Number):** Rotation angle in radians
- **`R` (Boolean):** Geometry will not be deformed as it is transformed

**Outputs:**
- **`G` (Geometry):** Morphed geometry

### Sporph
**Nickname:** `Sporph`
**Description:** Deforms an object from a source surface to a target surface
**GUID:** `9cacad37-b09f-4b54-b2b1-1ccdc2e3ffea`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`S0` (Surface):** Base surface
- **`P0` (Point):** U,V parameter on base surface used for orienting.
- **`S1` (Surface):** Target surface
- **`P1` (Point):** U,V parameter on target surface used for orienting.
- **`R` (Boolean):** Geometry will not be deformed as it is transformed

**Outputs:**
- **`G` (Geometry):** Morphed geometry

### Stretch
**Nickname:** `Stretch`
**Description:** Deforms objects by stretching them along a finite axis.
**GUID:** `2a27f87c-61c5-47c2-a0b7-7863f31a3594`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`X` (Line):** Stretch axis
- **`L` (Number):** Length of new stretch axis.
- **`R` (Boolean):** Geometry will not be deformed as it is transformed

**Outputs:**
- **`G` (Geometry):** Morphed geometry

### Surface Box
**Nickname:** `SBox`
**Description:** Create a twisted box on a surface patch.
**GUID:** `4f65c681-9331-4818-9d54-6290cae686c3`

**Inputs:**
- **`S` (Surface):** Base surface
- **`D` (Domain²):** Surface domain
- **`H` (Number):** Height of surface box

**Outputs:**
- **`B` (Twisted Box):** Resulting surface box

### Surface Morph
**Nickname:** `SrfMorph`
**Description:** Morph geometry into surface UVW coordinates
**GUID:** `5889b68f-fd88-4032-860f-869fb69654dd`

**Inputs:**
- **`G` (Geometry):** Geometry to deform
- **`R` (Box):** Reference box to map from
- **`S` (Surface):** Surface to map onto
- **`U` (Domain):** Surface space U extents
- **`V` (Domain):** Surface space V extents
- **`W` (Domain):** Surface space W extents

**Outputs:**
- **`G` (Geometry):** Deformed geometry

### Taper
**Nickname:** `Taper`
**Description:** Deforms objects toward or away from an axis
**GUID:** `ad0ee51e-c86f-4668-8de5-b55b850f6001`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`X` (Line):** Taper axis
- **`R0` (Number):** Radius at start of taper axis
- **`R1` (Number):** Radius at end of taper axis
- **`F` (Boolean):** If true, then a one-directional, one-dimensional taper is created.
- **`I` (Boolean):** If true, the deformation happens throughout the geometry, even if the axis is shorter. If false, the deformation takes place only the length of the axis.
- **`R` (Boolean):** Geometry will not be deformed as it is transformed

**Outputs:**
- **`G` (Geometry):** Morphed geometry

### Twist
**Nickname:** `Twist`
**Description:** Deforms objects by twisting them around an axis.
**GUID:** `9509cb30-d24f-4f55-a5ac-bf0b12a06cfa`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`X` (Line):** Twist axis
- **`A` (Number):** Twist angle in radians
- **`I` (Boolean):** If true, the deformation is constant throughout the object, even if the axis is shorter than the object.
- **`R` (Boolean):** Geometry will not be deformed as it is transformed

**Outputs:**
- **`G` (Geometry):** Morphed geometry

### Twisted Box
**Nickname:** `TBox`
**Description:** Create a twisted box from corner points.
**GUID:** `124de0f5-65f8-4ae0-8f61-8fb066e2ba02`

**Inputs:**
- **`A` (Point):** First corner (0,0,0)
- **`B` (Point):** Second corner (1,0,0)
- **`C` (Point):** Third corner (1,1,0)
- **`D` (Point):** Fourth corner (0,1,0)
- **`E` (Point):** Fifth corner (0,0,1)
- **`F` (Point):** Sixth corner (1,0,1)
- **`G` (Point):** Seventh corner (1,1,1)
- **`H` (Point):** Last corner (0,1,1)

**Outputs:**
- **`B` (Twisted Box):** Twisted box connecting all corners

***

## Category: Transform > Util

### Compound
**Nickname:** `Comp`
**Description:** Compound two transformations.
**GUID:** `ca80054a-cde0-4f69-a132-10502b24866d`

**Inputs:**
- **`T` (Transform):** Transformations to compound

**Outputs:**
- **`X` (Transform):** Compound transformation

### Group
**Nickname:** `Group`
**Description:** Group a set of objects
**GUID:** `874eebe7-835b-4f4f-9811-97e031c41597`

**Inputs:**
- **`O` (Geometry):** Objects to group

**Outputs:**
- **`G` (Group):** Grouped objects

### Inverse Transform
**Nickname:** `Inverse`
**Description:** Invert a transformation.
**GUID:** `51f61166-7202-45aa-9126-3d83055b269e`

**Inputs:**
- **`T` (Transform):** Transformation to inverse

**Outputs:**
- **`T` (Transform):** Inversed transformation

### Merge Group
**Nickname:** `GMerge`
**Description:** Merge two groups
**GUID:** `15204c6d-bba8-403d-9e8f-6660ab8e0df5`

**Inputs:**
- **`A` (Group):** First group
- **`B` (Group):** Second group

**Outputs:**
- **`G` (Group):** Merged group

### Split
**Nickname:** `Split`
**Description:** Split a compound transformation into fragments.
**GUID:** `915f8f93-f5d1-4a7b-aecb-c327bab88ffb`

**Inputs:**
- **`T` (Transform):** Compound transformation

**Outputs:**
- **`F` (Transform):** Fragments making up the compound transformation

### Split Group
**Nickname:** `GSplit`
**Description:** Split a group
**GUID:** `fd03419e-e1cc-4603-8a57-6dfa56ed5dec`

**Inputs:**
- **`G` (Group):** Group to split
- **`I` (Integer):** Split indices
- **`W` (Boolean):** Wrap indices

**Outputs:**
- **`A` (Group):** Group including all the indices
- **`B` (Group):** Group excluding all the indices (hidden)

### Transform
**Nickname:** `Transform`
**Description:** Transform an object.
**GUID:** `610e689b-5adc-47b3-af8f-e3a32b7ea341`

**Inputs:**
- **`G` (Geometry):** Base geometry
- **`T` (Transform):** Transformation

**Outputs:**
- **`G` (Geometry):** Transformed geometry

### Ungroup
**Nickname:** `Ungroup`
**Description:** Ungroup a set of objects
**GUID:** `a45f59c8-11c1-4ea7-9e10-847061b80d75`

**Inputs:**
- **`G` (Group):** Group to break up

**Outputs:**
- **`O` (Geometry):** Objects inside group

***

## Category: V-Ray

***

## Category: V-Ray > Geometry

### V-Ray Clipper
**Nickname:** `Clipper`
**Description:** The V-Ray Clipper is a special object that can be used to clip away parts of the scene with a simple plane or a custom mesh shape.
It is a render-time effect and does not modify the actual scene geometry in any way.
Use a standard Grasshopper plane object as an input to create a render-time section plane.
Use any other closed mesh as an input to create a mesh clipper (boolean modifier).
**GUID:** `0992854d-09ac-453c-ae97-d94efa08a20f`

**Inputs:**
- **`Clip Mode` (Integer):** When set to Subtract (1) everything inside the specified mesh is clipped away (only for mesh clippers).
When set to Intersect (0) everything outside the specified mesh is clipped away.
- **`Geo` (Generic Data):** Expects either a plane, mesh or any other geometric object input (including V-Ray Geometry).
A closed mesh should be used for best results.
- **`Use Object Mtl` (Boolean):** When enabled, the clipper will use the material of each clipped object to fill the resulting cuts.
When disabled, the material applied to the clipper object itself will be used.
If no material is specified in this state, the clipped gaps remain empty.
- **`• Mtl` (Generic Data):** V-Ray Material input expected.
- **`Excl. Mode` (Integer):** When set to Exclude(1) all scene objects will be clipped except for those in the Exclusion List.
When set to Include (0) only the listed objects will be clipped.
- **`• Exclude` (Generic Data):** When set to Exclude(1) all scene objects will be clipped except for those in the Exclusion List.
When set to Include (0) only the listed objects will be clipped.
- **`Affect Light` (Boolean):** When enabled, light can pass through openings created by the clipper.
- **`Cam. Rays Only` (Boolean):** When enabled, clipped objects will appear unaffected in reflections, refractions and GI.

**Outputs:**
- **`• V Geo` (Generic Data):** A V-Ray Geometry output that can be connected to the V-Ray Render component.

### V-Ray Cosmos Asset
**Nickname:** `Cosmos`
**Description:** Loads a Chaos Cosmos asset. The asset has to be downloaded to the local Cosmos database before it becomes visible in V-Ray for Grasshopper. Right-click to Download or Update the asset package or to open the Chaos Cosmos browser.
**GUID:** `6dfaf74e-23be-4972-aac5-01fd49612f26`

**Inputs:**
- **`Package` (Asset ID):** A Cosmos asset package name or ID and optionally a revision number. The ID is a GUID, the name is the string that is shown in the Cosmos Browser, and the revision is the publish date. The acceptable format is "id-or-name[/revision]"
Examples:
• Toaster 001
• cda5a22d-e0f7-48eb-a0d5-1e9631dedbb2
• Toaster 001 / 1614018486
• cda5a22d-e0f7-48eb-a0d5-1e9631dedbb2 / 1614018486
- **`Plane` (Plane):** Plane transformation for the Proxy.
A list of Plane inputs will add multiple instances of the same Proxy.
- **`Scale` (Number):** Scale factor for the Proxy.
A value of 1.0 is used by default.
Multiple Scale factors can be used.
- **`Visible` (Boolean):** Controls the proxy visibility
- **`Lights` (Boolean):** Enables or disables all light sources in the Cosmos asset
- **`Intensity` (Number):** Multiplies the intensity of all light sources in the Cosmos asset
- **`Color` (Colour):** Multiplies the color of all light sources in the Cosmos asset

**Outputs:**
- **`• V Geo` (Generic Data):** V-Ray Geometry output.
- **`Box` (Brep):** Bounding Box of the proxy

### V-Ray Geometry
**Nickname:** `VGeo`
**Description:** Translates GH meshes to V-Ray geometry that can be used by the Renderer.
A V-Ray Material can be applied to all input objects.
If multiple objects and multiple materials are connected to the node V-Ray will distribute the materials between the geometries based on their list index.
If there is no input material a default gray material will be automatically used.
If the materials count is smaller than the objects count the last material will be applied to geometries indexed higher in the list.
If the materials count is bigger than the objects count overlapping geometry will be produced. This should be avoided.
Note: To keep track of the objects and materials list order a standard Grasshopper Merge node can be utilized.
**GUID:** `ce60a7d7-6561-450f-9218-a266005d230b`

**Inputs:**
- **`Geo` (Generic Data):** Geometries input expected.
- **`• Mtl` (Generic Data):** V-Ray Material input expected.
- **`Visible` (Boolean):** Controls the geometry visibility

**Outputs:**
- **`• V Geo` (Generic Data):** V-Ray Geometry output.
Can be connected to the V-Ray Render / Geometry slot.

### V-Ray Infinite Plane
**Nickname:** `Inf Plane`
**Description:** The V-Ray Infinite Plane is a geometric object that generates an infinitely big procedural surface.
**GUID:** `54fa8c67-bd39-4a5d-8c46-0b391756c842`

**Inputs:**
- **`Geo` (Generic Data):** Geometries input expected.
By default the Infinite Plane will be placed at the scene origin.
When an object or group of objects is connected here the plane will be automatically placed underneath the objects bounding-box as long as the ‘From Geo’ (Position from Geometry) input is set to True.
- **`• Mtl` (Generic Data):** V-Ray Material input expected.
- **`Sh. Catch On` (Boolean):** V-Ray Material input expected.
- **`Z Offset` (Number):** Offsets the position of the Infinite Plane along the Z axis.
Negative values can also be used here.
Note: While a Geometry input is present the Z offset value will be ignored.
- **`From Geo` (Boolean):** Calculates the Z position as the lowest most point of the plugged in geometry

**Outputs:**
- **`• V Geo` (Generic Data):** V-Ray Geometry output.
Can be connected to the V-Ray Render / Geometry slot.

### V-Ray Instancer
**Nickname:** `Instancer`
**Description:** Creates instances of the input V-Ray Geometry at the Move input positions.
The number of Move transforms will determine the number of instances that will be created.
Note: Duplicated transforms will lead to overlapping geometries which should be avoided.
**GUID:** `5a7187dc-b8de-49f3-8e11-8269b23f4f86`

**Inputs:**
- **`• V Geo` (Generic Data):** V-Ray Geometry input expected.
Multiple geometries can be used here.
V-Ray will randomly distribute the inputs between the Move positions.
- **`Move` (Transform):** List of Move (position) transformations used for instance positioning.
Usually the Transformation (X) output of a Move component is used here.
The number of input transformations will determine the number of instances.
- **`Rotate` (Transform):** List of Rotate transformations used for instance orientation.
Usually the Transformation (X) output of a Rotate 3D / Rotate / ... component is used here.
- **`Scale` (Transform):** List of Scale transformations used for instance scaling.
Usually the Transformation (X) output of a Scale / Scale NU component is used here.
- **`Group` (Boolean):** When enabled, all input objects will be treated as a group that is instanced at each point.
When disabled, input objects will be treated as separate items. A single object will be positioned at each point.

**Outputs:**
- **`• V Geo` (Generic Data):** V-Ray Geometry output.

### V-Ray Proxy Mesh
**Nickname:** `Proxy Mesh`
**Description:** Loads a V-Ray Proxy file (.vrmesh). Alembic (.abc) files are also supported.
The V-Ray Geometry output can be connected to a Renderer node.
A list of Plane or Scale factor inputs will generate multiple instances of the same Proxy.
**GUID:** `cb811b2f-9b7e-471f-9208-21ebc4e192cc`

**Inputs:**
- **`File Path` (Path):** Specifies the path to the .vrmesh or .abc file.
- **`Plane` (Plane):** Plane transformation for the Proxy.
A list of Plane inputs will add multiple instances of the same Proxy.
- **`Scale` (Number):** Scale factor for the Proxy.
A value of 1.0 is used by default.
Multiple Scale factors can be used.
- **`• Mtl` (Generic Data):** V-Ray Material input expected.

**Outputs:**
- **`• V Geo` (Generic Data):** V-Ray Geometry output.
- **`Box` (Brep):** Bounding Box of the proxy

### V-Ray Proxy Scene
**Nickname:** `Proxy Scene`
**Description:** Loads a V-Ray Scene file (.vrscene).
The V-Ray Geometry output can be connected to a Renderer node.
A list of Plane or Scale factor inputs will add multiple instances of the same Proxy.
Note: Changing any of the  inputs will not cause an update during Interactive Rendering. Make sure to restart the render process to see your changes.
**GUID:** `b9203c11-0603-4e0c-8561-1fe7e300eb2f`

**Inputs:**
- **`File Path` (Path):** Specifies the path to the .vrscene file.
When switching the file with another one make sure to restart the render process to see your changes.
- **`Lights On` (Boolean):** Enables scene light sources.
If there are no lights in the specified .vrscene the option will make no difference.
Make sure to restart the render process to see your changes.
- **`Plane` (Plane):** Plane transformation for the VRScene.
A list of Plane inputs will add multiple instances of the same VRScene.
Note: The number of input Planes will determine the instances count.
Note: This parameter will not update during Interactive Rendering.
Make sure to restart the render process to see your changes.
- **`Scale` (Number):** Scale factor for the VRScene.
A value of 1.0 is used by default.
Multiple Scale factors can be used.
Note: the number of Scale values will affect the scene instances count.
Note: This parameter will not update during Interactive Rendering.
Make sure to restart the render process to see your changes.

**Outputs:**
- **`• V Geo` (Generic Data):** V-Ray Geometry output.
- **`Box` (Brep):** Bounding Box of the proxy

### V-Ray Scatter
**Nickname:** `Scatter`
**Description:** Creates instances of the input V-Ray Geometry with random transformations, optionally with collision avoidance. The number of scattered instances depends on the density which is number of instances per square unit
**GUID:** `6e833b62-b250-4228-a43f-dce06536f3ec`

**Inputs:**
- **`Seed` (Integer):** Controls the random seed of the scatter
Change this integer value and refresh to get a different random distribution.
- **`Collisions` (Boolean):** If turned on, bounding boxes of instances that overlap any other instance bounding box will be skipped
- **`Density` (Number):** Determines the approximate count of instances in a square unit.
When a texture is used the density value can still be used.
Black color in the texture discards all instances in the area.
Areas colored with white will receive maximum density.
- **`Axis Filter` (Integer):** Filters the faces that will be used for instance positioning.
All Faces - The points/instances will be generated uniformly on all object faces.
Facing Up - the points/instances will only be placed on object faces oriented upwards in the scene.
Note that host component transformations will be ignored.
- **`Orientation` (Integer):** The initial orientation of the instances.
World Up - All instances will be positioned upright independent of the base/host surface face normals.
Along Normals - The instances will be oriented based on the base surface face normals.
- **`Rotation` (Domain):** An interval of minimum and maximum angle for the random instance rotation around its up axis.
- **`Scale` (Domain):** An interval of minimum and maximum factor for the random instance scaling.
- **`Origin` (Integer):** Determines how objects will be positioned relative to the random Scatter points.
Bounding box bottom center - the bounding box bottom center of the object will match the Scatter point.
Bounding box volume center - the bounding box volume center will snap to the Scatter point.
Object origin - the original object origin point will snap to the Scatter point.
- **`Weight` (Number):** A list of factors determining the relative probability of each guest to appear.
- **`• V Geo` (Generic Data):** A list of V Geo objects to scatter
- **`Host` (Generic Data):** A list of meshable geometric objects to scatter the guests over

**Outputs:**
- **`• V Geo` (Generic Data):** V-Ray Geometry output.
Can be connected to the V-Ray Render / Geometry slot.
- **`X` (Transform):** A data tree of transformations comprising the guests distribution over the hosts

***

## Category: V-Ray > Lighting

### V-Ray IES Light
**Nickname:** `LightIES`
**Description:** V-Ray IES Light
**GUID:** `1ed8ade2-fab0-4826-ba29-fd4c07eb5147`

**Inputs:**
- **`On` (Boolean):** Enables or disables the light source.
- **`Position` (Point):** Light source location (point position).
If a list of input Positions is connected multiple lights will be generated.
Note: The number of input positions will determine the lights count.
- **`Target` (Point):** The light Position and Target combined determine the targeted light orientation vector.
- **`File` (Path):** Specifies an .ies file to use for the current light.
- **`Color` (Colour):** Light source color.
- **`Power` (Number):** Specifies the strength of the light to override the intensity specified in the .ies file. If the value is set to 0 then the power from the IES profile is used.
- **`Shape` (Integer):** Determines the shape of the light when calculating Soft Shadows.
By default, VRayLightIES will use the shape information stored in the .ies file.
- **`Diameter` (Number):** The diameter of the light shape.

**Outputs:**
- **`• Light` (Generic Data):** Light output that can be connected to a Renderer

### V-Ray Light Directional
**Nickname:** `Light Directional`
**Description:** V-Ray Directional light source.
This light source can be connected to any Light Rig which will automatically add it to the rendered scene.
**GUID:** `e96f8c4d-efbd-4ecf-b586-d9b598779d78`

**Inputs:**
- **`On` (Boolean):** Enables or disables the light source.
- **`Position` (Point):** Light source location (point position).
If a list of input Positions is connected multiple lights will be generated.
Note: The number of input positions will determine the lights count.
- **`Target` (Point):** The light Position and Target combined determine the targeted light orientation vector.
- **`Color` (Colour):** Light source color.
- **`Intensity` (Number):** Light source intensity. Calculated in Default (Scalar) units.
- **`Shadow Softness` (Number):** Sets the shadow softness. Zero (0.0) makes the shadows perfectly sharp, larger values produce blurrier shadows.

**Outputs:**
- **`• Light` (Generic Data):** Light output that can be connected to a Renderer

### V-Ray Light Omni
**Nickname:** `LightOmni`
**Description:** V-Ray Point light source.
**GUID:** `38012330-05d3-43c8-ba99-62fecc0cbb84`

**Inputs:**
- **`On` (Boolean):** Enables or disables the light source.
- **`Position` (Point):** Light source location (point position).
If a list of input Positions is connected multiple lights will be generated.
Note: The number of input positions will determine the lights count.
- **`Color` (Colour):** Light source color.
- **`Intensity` (Number):** Light source intensity. Calculated in Default (Scalar) units.
- **`Shadow Softness` (Number):** Sets the shadow softness. Zero (0.0) makes the shadows perfectly sharp, larger values produce blurrier shadows.

**Outputs:**
- **`• Light` (Generic Data):** Light output that can be connected to a Renderer

### V-Ray Light Rectangle
**Nickname:** `Light Rectangle`
**Description:** V-Ray Rectangle light source.
This light source can be connected to any Light Rig which will automatically add it to the rendered scene.
If a list of inputs is connected to this component multiple lights will be generated.
**GUID:** `e246e7d8-0efa-416d-9d8c-c241828f1aee`

**Inputs:**
- **`On` (Boolean):** Enables or disables the light source.
- **`Position` (Point):** Light source location (point position).
If a list of input Positions is connected multiple lights will be generated.
Note: The number of input positions will determine the lights count.
- **`Target` (Point):** The Rectangle light Position and Target combined determine the light orientation vector.
- **`Color` (Colour):** Light source color.
- **`Intensity` (Number):** Light source intensity. Calculated in Default (Scalar) units.
- **`Invisible` (Boolean):** Controls the Light source visibility. Does not affect its illuminance.
- **`Shape` (Integer):** Specifies the shape of the light object.
- **`U Size` (Number):** Determines the U size of the light measured in scene units.
- **`V Size` (Number):** Determines the V size of the light measured in scene units.
- **`Dir` (Number):** Specifies the spread of the light beam. Value of 0 will emit light equally in all directions. Increasing the value makes the light beam more narrow and concentrates it in one direction

**Outputs:**
- **`• Light` (Generic Data):** Light output that can be connected to a Renderer

### V-Ray Light Rig Dome
**Nickname:** `Rig Dome`
**Description:** This rig consists of a Dome light source and a background texture. It is ideal for image-based lighting.
Loading a spherical texture will automatically give you direct light, global illumination and reflections based on the image.
**GUID:** `f73f219b-7dc6-4939-ae72-093a7e09cb7c`

**Inputs:**
- **`Light On` (Boolean):** Enables or disables the light source.
- **`Visible` (Boolean):** Enables dome texture camera visibility.
When disabled the light will still illuminate the scene but will not be visible in the background.
- **`Texture` (Path):** File Path to the Dome Light texture map.
Spherical Panorama high-dynamic range images (hdr or exr) will best fit this light source.
- **`Intensity` (Number):** Intensity of the Dome Light. Calculated in Default (Scalar) units.
- **`Rotation` (Number):** Horizontally rotates the Dome Light.
- **`Bg Intensity` (Number):** Multiplies the background texture intensity.
The option only has an effect if the rig’s ‘Visible’ parameter is enabled.

**Outputs:**
- **`• Light Rig` (Generic Data):** The rig should be connected to the V-Ray Render / Light Rig input slot.

### V-Ray Light Rig Simple
**Nickname:** `Rig Simple`
**Description:** This rig consists of a Directional light, a Reflection environment and a background texture.
Global Illumination is enabled by default and the color of the GI environment can be controlled.
**GUID:** `74300155-08e8-418e-b11f-df963b66cfe0`

**Inputs:**
- **`Gradient On` (Boolean):** Enables the use of a screen-mapped gradient texture for background. When disabled a black background color is used.
- **`Reflect Env. On` (Boolean):** Enables a default reflection environment texture. When disabled a black reflection environment color is used.
- **`GI On` (Boolean):** Enables Global Illumination (GI).
- **`GI Env. Color` (Colour):** GI environment color.
- **`Light On` (Boolean):** Enables the Directional Light.
- **`Light Color` (Colour):** Directional Light color.
- **`Light Angle` (Number):** Directional Light azimuth angle.
The V-Ray Camera output angle can be used here to orient the light based on the camera.
- **`Light Intensity` (Number):** Intensity multiplier of the Directional Light.

**Outputs:**
- **`• Light Rig` (Generic Data):** The rig should be connected to the V-Ray Render / Light Rig input slot.

### V-Ray Light Rig Sun System
**Nickname:** `Rig Sun`
**Description:** This rig consists of a V-Ray Sun light and a Sky texture plugged in all environment slots.
**GUID:** `3f6ac4ae-5be1-4a27-8899-7641bed97677`

**Inputs:**
- **`Sun On` (Boolean):** Enables the Sun Light. Note that disabling the Sun will not disable the background Sky texture and the set will still be illuminated.
- **`Sun Position` (Point):** Controls the point position of the Sun. Keep in mind that the Sun will always be infinitely far away (it is a directional light source).
The Position combined with the Target will determine the Sun direction vector.
Note: If there is no target specified the world origin will be used instead.
- **`Sun Target` (Point):** Controls the point position of the Sun target.
- **`Sun Intensity` (Number):** Controls the intensity multiplier of the Sun light.
- **`Sun Filter Color` (Colour):** Tints the automatic Sun light color. Note that the light color also depends on the Sun's altitude.
- **`Ground Color` (Colour):** The Ground Albedo color.

**Outputs:**
- **`• Light Rig` (Generic Data):** The rig should be connected to the V-Ray Render / Light Rig input slot.

### V-Ray Light Sphere
**Nickname:** `Light Sphere`
**Description:** V-Ray Sphere light source.
This light source can be connected to any Light Rig which will automatically add it to the rendered scene.
If a list of inputs is connected to this component multiple lights will be generated.
**GUID:** `fdcc22db-83c2-4cd7-933c-8a6793c8aa49`

**Inputs:**
- **`On` (Boolean):** Enables or disables the light source.
- **`Position` (Point):** Light source location (point position).
If a list of input Positions is connected multiple lights will be generated.
Note: The number of input positions will determine the lights count.
- **`Color` (Colour):** Light source color.
- **`Intensity` (Number):** Light source intensity. Calculated in Default (Scalar) units.
- **`Invisible` (Boolean):** Controls the Light source visibility. Does not affect its illuminance.
- **`Radius` (Number):** Controls the size of the light source.
Light intensity and shadow softness depends on the size.
Bigger size leads to softer shadows and stronger illumination.

**Outputs:**
- **`• Light` (Generic Data):** Light output that can be connected to a Renderer

### V-Ray Light Spot
**Nickname:** `Light Spot`
**Description:** V-Ray Spot light source.
This light source can be connected to any V-Ray Light which will automatically add it to the rendered scene.
If a list of inputs is connected to this component multiple lights will be generated.
**GUID:** `5be2e3cb-ec93-483c-83c0-5fda45a19df8`

**Inputs:**
- **`On` (Boolean):** Enables or disables the light source.
- **`Position` (Point):** Light source location (point position).
If a list of input Positions is connected multiple lights will be generated.
Note: The number of input positions will determine the lights count.
- **`Target` (Point):** The light Position and Target combined determine the targeted light orientation vector.
- **`Color` (Colour):** Light source color.
- **`Intensity` (Number):** Light source intensity. Calculated in Default (Scalar) units.
- **`Cone` (Number):** Specifies the angle of the light cone formed by the light.
The value should be specified in degrees.
- **`Penumbra` (Number):** Specifies the angle within the light cone at which the light begins to transform from full strength to no lighting.
When set to 0, there is no transition and the light produces a harsh edge.
The value should be specified in degrees.
- **`Shadow Softness` (Number):** Sets the shadow softness. Zero (0.0) makes the shadows perfectly sharp, larger values produce blurrier shadows.

**Outputs:**
- **`• Light` (Generic Data):** Light output that can be connected to a Renderer

***

## Category: V-Ray > Materials

### V-Ray Bitmap
**Nickname:** `Bitmap`
**Description:** Loads an image from the file system to be used in a material component.
Alternatively this component can access Vertex Color data that can then be used for shading.
**GUID:** `2d1fe940-309b-494c-ac5b-891b4aba2168`

**Inputs:**
- **`Mode` (Integer):** Switches between a Bitmap Texture and Vertex Color mode.
- **`File` (Path):** File Path to the texture map.
- **`Color Space` (Integer):** Specifies the type of color space used by the bitmap.
Use sRGB for standard 8bit images.
Use Linear when a linear image (in most cases high dynamic range 32 bit image) is loaded.
- **`Channel` (Integer):** Specifies the index of the mapping channel data to use.
A value of 1 will take the first available channel.
- **`Repeat` (Vector):** Determines how many times the texture will be repeated in the 0 to 1 UV square.
- **`Offset` (Vector):** Controls the texture offset in the U and V direction.
- **`Rotation` (Number):** Rotates the texture (in degrees).

**Outputs:**
- **`• V Tex` (Generic Data):** Texture

### V-Ray Material Preset
**Nickname:** `Mtl Preset`
**Description:** The V-Ray Preset Material allows for quick material setup using a color and a material type.
It can be used for quick setup of Diffuse, Plastic, Paint, Metal or Glass shaders.
A list of inputs will produce multiple materials.
Right-click and select Save as VRmat to generate a .vrmat file based on the current settings.
**GUID:** `da29591e-9443-4558-ab51-10719ba107fe`

**Inputs:**
- **`Preset` (Integer):** Choose one of the following presets: 
Generic, Plastic, Paint, Metal, Glass
- **`Color` (AColorTex):** The V-Ray Preset Material allows for quick material setup using a color and a material type.
It can be used for quick setup of Diffuse, Plastic, Paint, Metal or Glass shaders.
A list of inputs will produce multiple materials.
Right-click and select Save as VRmat to generate a .vrmat file based on the current settings.

**Outputs:**
- **`• Mtl` (Generic Data):** V-Ray material output that can be connected to V-Ray Geometries.

### V-Ray Material Simple
**Nickname:** `Mtl Simple`
**Description:** The V-Ray Simple Material allows for quick material setup using a core set of parameters.
It can be used for creating basic paint, plastic or metal shaders.
Stylized transparent or self-illuminated materials can also be created.
A list of inputs will produce multiple materials.
Right-click and select Save as VRmat to generate a .vrmat file based on the current settings.
**GUID:** `8991ba2f-3099-480c-928d-b8db658287dc`

**Inputs:**
- **`Diffuse` (AColorTex):** Diffuse Color of the material.
- **`Reflection` (AColorTex):** Reflection Color of the material.
Black color disables the reflections.
- **`Glossiness` (AColorTex):** Reflection Glossiness value.
A value of 1.0 means perfect mirror-like reflection.
Lower values produce blurry reflections.
- **`IOR` (Number):** Reflection IOR value.
The reflection strength of this material depends on the viewing angle of the surface.
Bigger IOR values will make perpendicular(to the camera ray) surfaces reflect stronger.
- **`Opacity` (AColorTex):** Opacity Color of the material.
White color makes the material 100% opaque.
Darker color values will make it transparent.
- **`Emission` (AColorTex):** Emission Color of the material.

**Outputs:**
- **`• Mtl` (Generic Data):** V-Ray material output that can be connected to V-Ray Geometries.

***

## Category: V-Ray > Render

### V-Ray Camera
**Nickname:** `Camera`
**Description:** The V-Ray Camera node can be used to set a specific camera position and field of view angle.
It should be connected to a V-Ray Render / Camera slot.
Right-click and select Get from Rhino Viewport to match the current active view camera.
**GUID:** `3bd87142-1ca3-42a0-a988-920eb5212a92`

**Inputs:**
- **`Type` (Integer):** Switches the camera type.
Standard and VR cameras ignore Orthographic Zoom Factor parameter.
Orthographic cameras ignore FOV and Tilt parameters.
- **`Stereo` (Integer):** Enable Stereoscopic rendering mode.
The images for the left and right eyes will be rendered in "side by side" or in "top-bottom" layout
- **`Position` (Point):** Specifies the camera point position.
- **`Target` (Point):** Specifies the camera target point position.
- **`FOV` (Number):** Camera field of view angle measured in degrees.
- **`Tilt` (Number):** Tilts the camera around its aim vector.
The value is specified in degrees.
- **`Ortho Zoom` (Number):** This parameter specifies the inverse of the orthographic scene width.
In orthographic mode the actual distance between the position and the target of the camera is meaningless and the field-of-view angle is set to 180 degrees. 
This parameter only works if the camera type is Orthographic.
- **`Exposure On` (Boolean):** Enables the Physical Camera Exposure.
When enabled, the Exposure Value, F-Number, Shutter speed and ISO settings will affect the image brightness.
- **`Wh. Balance` (Colour):** Objects in the scene that have the specified color will appear white in the image.
Note that only the color hue is taken into consideration; the brightness of the color is ignored.
This parameter is ignored when Exposure is disabled.
- **`F-Number` (Number):** The aperture (f-number) parameter determines the lens speed and consequently the brightness of the image.
Additionally, the f-number will affect the Depth of Field of the camera.
The smaller the f-number is, the more narrow the depth of field will be.
- **`Shutter` (Number):** The shutter speed parameter determines the exposure time for the virtual camera.
The longer this time is (small shutter speed value), the brighter the image would be.
In reverse - if the exposure time is shorter (high Shutter speed value), the image would get darker.
- **`ISO` (Number):** The film speed (ISO) parameter determines the sensitivity of the film and consequently the brightness of the image.
If the ISO value is high (film is more sensitive to the light), the image is brighter.
Lower ISO values mean that the film is less sensitive and produces a darker image.
- **`Auto EV` (Boolean):** Automatically determines an appropriate exposure value for the render.
Note that this option only works in the Production rendering mode.
- **`Auto Wh. Balance` (Boolean):** Automatically determines a suitable white balance value for the image.
Note that this option only works in the Production rendering mode.
When enabled, the camera's White Balance color is ignored.
- **`DOF Focus` (Number):** Setting this value to anything different than zero will enable depth of field (DOF).
The value also determines the focus distance.

**Outputs:**
- **`• Camera` (Generic Data):** Camera output that can be connected to a V-Ray Render / Camera slot.
- **`Angle` (Number):** The XY angle to which the camera vector is rotated around the Z axis.
Can be connected to a Light Rig / Light Angle parameter to dynamically control the light position based on the camera location.
- **`EV` (Number):** The exposure value based on the ISO, shutter speed and the F-number

### V-Ray Exporter
**Nickname:** `Exporter`
**Description:** Exports the Renderer content (scene) to a vrscene or vrmesh file.
 
Right-click on the component to choose the action you want to perform:
Auto-Export - when enabled, an export is triggered on any change to the scene.
Export - Exports a Proxy Mesh (vrmesh) or V-Ray Scene (vrscene).
Export Animation - Exports a single animated Proxy Mesh or V-Ray Scene file. This function is disabled when there is no animation in the scene.
Export Sequence - Exports an animation sequence of V-Ray Scene (vrscene) files. This function is disabled when there is no animation in the scene or if the Output File is a vrmesh.
Open - Opens the specified output file at its designated location.
 
Note: vrmesh files exported by this component will not store lights, camera, render settings or material data.
Note: The Export Animation function can not be completed if there is animated object creation or deletion. Every animated object should exist throughout the entire sequence. The mesh faces on the other hand can be modified, deleted or created dynamically (vrscene export only).
**GUID:** `203846f0-2859-44dc-bbef-4d16620a485e`

**Inputs:**
- **`• Scene` (Generic Data):** Scene input.
The V-Ray Render / Scene is expected.
- **`Output File` (Path):** Specifies the output file location and type.
Select .vrscene for a scene export and .vrmesh for proxy mesh export.

**Outputs:**
- *This component has no outputs.*

### V-Ray Exposure Value
**Nickname:** `EV`
**Description:** Calculates Exposure Value based on ISO, F-Number and Shutter Speed inputs.
**GUID:** `5e006914-ccfa-4fb2-af79-20cbfeb57ca9`

**Inputs:**
- **`ISO` (Number):** The film speed (ISO) parameter determines the sensitivity of the film and consequently the brightness of the image.
If the ISO value is high (film is more sensitive to the light), the image is brighter.
Lower ISO values mean that the film is less sensitive and produces a darker image.
- **`F` (Number):** The aperture (f-number) parameter determines the lens speed and consequently the brightness of the image.
Additionally, the f-number will affect the Depth of Field of the camera.
The smaller the f-number is, the more narrow the depth of field will be.
- **`SS` (Number):** The shutter speed parameter determines the exposure time for the virtual camera.
The longer this time is (small shutter speed value), the brighter the image would be.
In reverse - if the exposure time is shorter (high Shutter speed value), the image would get darker.

**Outputs:**
- **`EV` (Number):** The exposure value based on the ISO, shutter speed and the F-number

### V-Ray F-Number
**Nickname:** `F`
**Description:** Calculates a F-Number value for a given Defocus value.
**GUID:** `777036a4-ed6f-4a45-ac6f-d79dbaf92a9e`

**Inputs:**
- **`D` (Number):** Determines how sharp or de-focused the image might look outside a plane determining by the focus point. Also known as Focus Range

**Outputs:**
- **`F` (Number):** The aperture (f-number) parameter determines the lens speed and consequently the brightness of the image.
Additionally, the f-number will affect the Depth of Field of the camera.
The smaller the f-number is, the more narrow the depth of field will be.

### V-Ray Film Sensitivity
**Nickname:** `ISO`
**Description:** Calculates an ISO value based on EV, F-Number and Shutter Speed inputs.
**GUID:** `717bbfda-bba8-4280-a09a-e1d7721dfbd7`

**Inputs:**
- **`EV` (Number):** The exposure value
- **`F` (Number):** The aperture (f-number) parameter determines the lens speed and consequently the brightness of the image.
Additionally, the f-number will affect the Depth of Field of the camera.
The smaller the f-number is, the more narrow the depth of field will be.
- **`SS` (Number):** The shutter speed parameter determines the exposure time for the virtual camera.
The longer this time is (small shutter speed value), the brighter the image would be.
In reverse - if the exposure time is shorter (high Shutter speed value), the image would get darker.

**Outputs:**
- **`ISO` (Number):** The film speed (ISO) parameter determines the sensitivity of the film and consequently the brightness of the image.
If the ISO value is high (film is more sensitive to the light), the image is brighter.
Lower ISO values mean that the film is less sensitive and produces a darker image.

### V-Ray Graph
**Nickname:** `VGraph`
**Description:** Remaps the numeric input values to an output based on an advanced curve function.
This component can be combined with the V-Ray Timeline for a powerful animation workflow.
Unlike the standard Graph Mapper in Grasshopper this curve editor allows for using multiple bezier point controls with custom tangents.

Mouse click shortcuts:
Double Click - Add new key
Ctrl + Double Click - Add new linear key (no tangents)
Right Click - Delete the key under the mouse pointer
Hold Left mouse button - drag a key/tangent point.
Modifieir keys used while dragging:
    Ctrl - Unifies the tangents and lets one move them in a unified way
    Shift - Restricts main point movement in the Y direction and limits their position to the existing graph range
    Shift - Snaps the tangent angle to either X, Y, its current angle or its pair angle
**GUID:** `6b30c365-2690-4d61-b2ca-8ec5f2118665`

**Inputs:**
- **`` (Number):** No description.

**Outputs:**
- **`` (Number):** No description.

### V-Ray Live Link
**Nickname:** `Live Link`
**Description:** While this component is running it interactively shares the input V-Ray scene on the port specified. V-Ray instances running in other applications can make use of the data. This component is most commonly used for V-Ray Vision sessions inside Grasshopper. Right click and select 'Start V-Ray Vision' to do so.
**GUID:** `3bd749ee-2d13-450f-a17f-4666f920bd0d`

**Inputs:**
- **`On` (Boolean):** Specifies whether the scene changes are sent to the V-Ray server or not
- **`Address` (Text):** Specifies an IPv4 address where a V-Ray server instance is or will be running
- **`Port` (Integer):** Specifies a TCP port on which the V-Ray server instance is or will be connected on
- **`• Scene` (Generic Data):** The scene the V-Ray server will be rendering

**Outputs:**
- *This component has no outputs.*

### V-Ray Render
**Nickname:** `Render`
**Description:** The main V-Ray component.
It builds the scene and initiates the render process.
Right-click to Start or Stop the render process or show the V-Ray Frame Buffer window.
**GUID:** `435b7b09-e1aa-4df8-8f02-7f1a1ec264a9`

**Inputs:**
- **`Engine` (Integer):** Switches between the CPU, CUDA and the RTX render engines.
Make sure to specify devices to be used by the CUDA and RTX engines using V-Ray's GPU Device Selection tool (V-Ray / Tools / GPU Device Selection). 
Note that the RTX engine can only run on GPU devices with Compute Capability 5.2 or higher.
- **`Mode` (Integer):** Switches between Interactive and Production rendering modes.
- **`Sampler` (Integer):** Switches between Progressive and Bucket sampling methods.
- **`Quality` (Integer):** Controls the rendered image quality.
The option will only affect Production rendering.
- **`Out Img` (Path):** Specifies the output image file location and type.
- **`Output Res` (Integer):** The resolution of the rendered image.
A pair of integers for width and height is expected.
- **`• Camera` (Generic Data):** Expects a V-Ray Camera input.
If there is no input the current active camera position will be used as render view.
Note: Make sure that there is no more than a single input for this parameter.
- **`• Light Rig` (Generic Data):** Expects a V-Ray Light Rig input.
If there is no input a simple predefined light rig will be created.
Note: Make sure that there is a single input for this parameter.
- **`• Light` (Generic Data):** Expected V-Ray Light input.
The V-Ray Directional, Rectangle or Sphere lights can be connected here.
Multiple inputs are accepted.
- **`• V Geo` (Generic Data):** Expects a V-Ray Geometries input.
If there is no input a simple background color/gradient/image will be rendered.
Note: The input might have to be Flattened depending on the input data.
- **`• Timeline` (Generic Data):** Expects the input of a V-Ray Timeline component.
Initiating the render process will render a number of consecutive frames based on the Timeline’s Frames Count parameter.
Note: The Grasshopper definition will be evaluated for each frame.
- **`• Elements` (Generic Data):** V-Ray Render Elements
- **`Update Fx` (Integer):** Controls the regularity of post effects updates during progressive rendering - Denoiser, Lens Effects, Lighting Analysis.
It sets the approximate percentage of render time that is allotted to the effects evaluation.
A value between 0 and 100 should be used here.
Larger values cause the effect to be updated more frequently.
100 - Rapid - 100% of maximum frequency. Will cause updates as often as possible.
0 - At the End - 0% of maximum frequency. This disables progressive updates. Instead, effects will be applied after the render process has finished (but not if it is manually cancelled).

**Outputs:**
- **`• Scene` (Generic Data):** V-Ray scene output.
Can be connected to a VRScene node in order for the scene to be exported to disk.

### V-Ray Render in Project
**Nickname:** `Render in Project`
**Description:** Adds the input scene geometries and lights to the active Rhino scene. Materials applied to the objects will be included. Note that geometries with no input materials will not be rendered.
Right-click on the component to choose an additional action you want to perform: 
Export Camera Animation - Sends only the Camera animation from the current definition to Rhino. The animation can then be rendered in Rhino and will be stored with the Rhino file. To render the recording navigate to Asset Editor/ Settings/ Animation and make sure that Grasshopper is selected as the Animation Source
Export Sun Animation - Sends only the Sun animation from the current definition to Rhino. The animation can then be rendered in Rhino and will be stored with the Rhino file. To render the recording navigate to Asset Editor/ Settings/ Animation and make sure that Grasshopper is selected as the Animation Source
Render in Rhino - Starts a render in Rhino with the current state of the Grasshopper definition included. Note that the Rhino render settings, environment and Sun light will be used.
Render Animation in Rhino - Executes a render in Rhino for every frame of the current Grasshopper animation. The definition objects in their corresponding state are rendered too. Note that the Rhino render settings, environment and Sun light will be used.
**GUID:** `5ddc15a0-55e9-4462-9f6e-fa4eb1ae67e4`

**Inputs:**
- **`• Scene` (Generic Data):** V-Ray Render / Scene input expected.
Only objects and their materials will be included.

**Outputs:**
- *This component has no outputs.*

### V-Ray Timeline
**Nickname:** `Timeline`
**Description:** The V-Ray Timeline component enables animation rendering once connected to a V-Ray Renderer.
When it's connected initiating the render process will render a number of consecutive frames based on the Frames Count parameter.
Note: The Grasshopper definition will be evaluated for each frame.
**GUID:** `8f67f2f3-b16b-4358-8644-3a383a9ff926`

**Inputs:**
- **`Frames` (Integer):** Number of timeline frames.
Controls the animation lenght.
- **`Start` (Integer):** Specifies the first frame from a range of frames to be rendered
- **`End` (Integer):** Specifies the last frame from a range of frames to be rendered

**Outputs:**
- **`• Timeline` (Generic Data):** V-Ray Timeline output.
Can be connected to the V-Ray Render / Timeline slot.
- **`Frame` (Integer):** Outputs the current animation frame as an integer value.
This output can be used for animating different definition parameters
- **`Fraction` (Number):** Outputs the current animation frame as a fraction of the slider length - a value in the range 0.0 to 1.0 (inclusive).
Example: If the timeline frames count is set to 11 and the slider position is at 5, the fraction float output will be 0.5
This output can be used for animating different definition parameters.

***

## Category: V-Ray > Render Elements

### V-Ray Element Denoiser
**Nickname:** `Denoiser`
**Description:** The V-Ray Denoiser detects areas where noise is present in the rendered image and smooths it out.
**GUID:** `c916207a-ce3e-4f5b-93dc-c63271bc714f`

**Inputs:**
- **`Engine` (Integer):** Specifies the denoising engine to use.
The standard V-Ray Denoiser is slower but may be more accurate and can denoise multiple render elements.
The NVIDIA AI denoiser is fast but less accurate. Nvidia GPU is required.
The Intel Open Image denoise is fast and runs on the CPU.
- **`Preset` (Integer):** Offers presets to automatically set the strength of the effect.
This parameter is ignored by the NVIDIA AI engine.
- **`Mode` (Integer):** Specifies how the results of the Denoiser are saved and presented in the VFB
Show Denoiser Channel – The VRayDenoiser and effectsResult channels are generated
Hide Denoiser Channel – The VRayDenoiser channel is not present separately in the VFB. The effectsResult channel is generated with the denoised image
Only Render Elements – All render elements required for denoising are generated but a denoised version of the image is not computed. Use this option if you plan to denoise a sequence of animation frames using the standalone Denoiser tool. This provides better smoothing between the frames and eliminates any potential flickering.

**Outputs:**
- **`• Element` (Generic Data):** V-Ray Denoiser render element

### V-Ray Element Lighting Analysis
**Nickname:** `Lighting Analysis`
**Description:** Provides visual representation of the lighting intensity in the rendered frame.
It maps Illuminance and Luminance information as color gradient or a grid of measured values onto the frame.
**GUID:** `b637225c-5c40-462f-96a7-a80be522334a`

**Inputs:**
- **`Units` (Integer):** Choose which lighting information to be analysed.
Luminance (cd) - Uses the Luminance of the rendered frame in candelas.
Illuminance (lx) - Uses the Illuminance of the rendered frame in lux.
- **`Range` (Domain):** Determines the value range on which the temperature gradient will be mapped to.
- **`Scale` (Integer):** Specifies how values are mapped to colors onto the frame.
Linear - The colors are mapped in linear scale.
Logarithmic - The colors are mapped in logarithmic scale.
- **`Display` (Integer):** Specifies the analysed data display mode.
False Colors - Fills the frame with a gradient ranging from blue (low values) to red (high values). For the out of range values uses respectively black and white.
Grid Overlay - Displays the values at distinct grid points over the frame. They use the same grading colors.
- **`Grid` (Integer):** Specifies the horizontal and vertical space in pixels between two numeric points on the grid.
- **`Fade` (Boolean):** When enabled, it fades the rendered image, so that the grid values would be more visible.
- **`Legend` (Boolean):** When enabled, shows a legend of the false colors at the bottom of the render.

**Outputs:**
- **`• Element` (Generic Data):** V-Ray Lighting Analysis render element

***

## Category: Vector > Colour

### Blend Colours
**Nickname:** `BlendCol`
**Description:** Interpolate (blend) between two colours.
**GUID:** `8b4da37d-1124-436a-9de2-952e4224a220`

**Inputs:**
- **`A` (Colour):** First colour
- **`B` (Colour):** Second colour
- **`F` (Number):** Interpolation factor

**Outputs:**
- **`C` (Colour):** Interpolated colour

***

## Category: Vector > Field

### Break Field
**Nickname:** `BreakF`
**Description:** Break a field into individual elements
**GUID:** `b27d53bc-e713-475d-81fd-71cdd8de2e58`

**Inputs:**
- **`F` (Field):** Field to break

**Outputs:**
- **`F` (Field):** Elemental fields

### Direction Display
**Nickname:** `FDir`
**Description:** Display the force directions of a field section
**GUID:** `5ba20fab-6d71-48ea-a98f-cb034db6bbdc`

**Inputs:**
- **`F` (Field):** Field to evaluate
- **`S` (Rectangle):** Rectangle describing section
- **`N` (Integer):** Section sample count indicator

**Outputs:**
- **`D` (Mesh):** Section display mesh

### Evaluate Field
**Nickname:** `EvF`
**Description:** Evaluate a field at a point
**GUID:** `a7c9f738-f8bd-4f64-8e7f-33341183e493`

**Inputs:**
- **`F` (Field):** Field to evaluate
- **`P` (Point):** Point to evaluate at

**Outputs:**
- **`T` (Vector):** Field tensor at sample location
- **`S` (Number):** Field strength at sample location

### Field Line
**Nickname:** `FLine`
**Description:** Compute the field line through a certain point
**GUID:** `add6be3e-c57f-4740-96e4-5680abaa9169`

**Inputs:**
- **`F` (Field):** Field to evaluate
- **`P` (Point):** Point to start from
- **`N` (Integer):** Number of samples
- **`A` (Number):** Accuracy hint (will only be loosely obeyed)
- **`M` (Integer):** Solver (1=Euler, 2=RK2, 3=RK3, 4=RK4)

**Outputs:**
- **`C` (Curve):** Curve approximation of field line through P

### Line Charge
**Nickname:** `LCharge`
**Description:** Create a field due to a line charge
**GUID:** `8cc9eb88-26a7-4baa-a896-13e5fc12416a`

**Inputs:**
- **`L` (Line):** Geometry of line segment charge
- **`C` (Number):** Charge of point object
- **`B` (Box):** Optional bounds for the field

**Outputs:**
- **`F` (Field):** Field due to line charge

### Merge Fields
**Nickname:** `MergeF`
**Description:** Merge a collection of fields into one
**GUID:** `d9a6fbd2-2e9f-472e-8147-33bf0233a115`

**Inputs:**
- **`F` (Field):** Fields to merge

**Outputs:**
- **`F` (Field):** Merged field

### Perpendicular Display
**Nickname:** `FPerp`
**Description:** Display the perpendicularity of a field through a section
**GUID:** `bf106e4c-68f4-476f-b05b-9c15fb50e078`

**Inputs:**
- **`F` (Field):** Field to evaluate
- **`S` (Rectangle):** Rectangle describing section
- **`N` (Integer):** Section sample count indicator
- **`C+` (Colour):** Colour for positive (straight up) forces
- **`C-` (Colour):** Colour for negative (straight down) forces

**Outputs:**
- **`D` (Mesh):** Section display mesh

### Point Charge
**Nickname:** `PCharge`
**Description:** Create a field due to a point charge
**GUID:** `cffdbaf3-8d33-4b38-9cad-c264af9fc3f4`

**Inputs:**
- **`P` (Point):** Location of point charge
- **`C` (Number):** Charge of point object
- **`D` (Number):** Decay of charge potential
- **`B` (Box):** Optional bounds for the field

**Outputs:**
- **`F` (Field):** Field due to point charge

### Scalar Display
**Nickname:** `FScalar`
**Description:** Display the scalar values of a field section
**GUID:** `55f9ce6a-490c-4f25-a536-a3d47b794752`

**Inputs:**
- **`F` (Field):** Field to evaluate
- **`S` (Rectangle):** Rectangle describing section
- **`N` (Integer):** Section sample count indicator

**Outputs:**
- **`D` (Mesh):** Section display mesh

### Spin Force
**Nickname:** `FSpin`
**Description:** Create a field due to a spin force
**GUID:** `4b59e893-d4ee-4e31-ae24-a489611d1088`

**Inputs:**
- **`P` (Plane):** Center and orientation of spin disc
- **`S` (Number):** Strength of spin force at center of disc
- **`R` (Number):** Radius unit of spin disc
- **`D` (Number):** Decay of spin force
- **`B` (Box):** Optional bounds for the field

**Outputs:**
- **`F` (Field):** Field due to vector force

### Tensor Display
**Nickname:** `FTensor`
**Description:** Display the tensor vectors of a field section
**GUID:** `08619b6d-f9c4-4cb2-adcd-90959f08dc0d`

**Inputs:**
- **`F` (Field):** Field to evaluate
- **`S` (Rectangle):** Rectangle describing section
- **`N` (Integer):** Section sample count indicator

**Outputs:**
- *This component has no outputs.*

### Vector Force
**Nickname:** `FVector`
**Description:** Create a field due to a vector force
**GUID:** `d27cc1ea-9ef7-47bf-8ee2-c6662da0e3d9`

**Inputs:**
- **`L` (Line):** Geometry of line segment charge
- **`B` (Box):** Optional bounds for the field

**Outputs:**
- **`F` (Field):** Field due to vector force

***

## Category: Vector > Grid

### Hexagonal
**Nickname:** `HexGrid`
**Description:** 2D grid with hexagonal cells
**GUID:** `125dc122-8544-4617-945e-bb9a0c101c50`

**Inputs:**
- **`P` (Plane):** Base plane for grid
- **`S` (Number):** Size of hexagon radius
- **`Ex` (Integer):** Number of grid cells in base plane x directions
- **`Ey` (Integer):** Number of grid cells in base plane y directions

**Outputs:**
- **`C` (Curve):** Grid cell outlines
- **`P` (Point):** Points at grid centers

### Populate 2D
**Nickname:** `Pop2D`
**Description:** Populate a 2-Dimensional region with points
**GUID:** `e2d958e8-9f08-44f7-bf47-a684882d0b2a`

**Inputs:**
- **`R` (Rectangle):** Rectangle that defines the 2D region for point insertion
- **`N` (Integer):** Number of points to add
- **`S` (Integer):** Random seed for insertion
- **`P` (Point):** Optional pre-existing population

**Outputs:**
- **`P` (Point):** Population of inserted points

### Populate 3D
**Nickname:** `Pop3D`
**Description:** Populate a 3-Dimensional region with points
**GUID:** `e202025b-dc8e-4c51-ae19-4415b172886f`

**Inputs:**
- **`R` (Box):** Box that defines the 3D region for point insertion
- **`N` (Integer):** Number of points to add
- **`S` (Integer):** Random seed for insertion
- **`P` (Point):** Optional pre-existing population

**Outputs:**
- **`P` (Point):** Population of inserted points

### Populate Geometry
**Nickname:** `PopGeo`
**Description:** Populate generic geometry with points
**GUID:** `c8cb6a5c-2ffd-4095-ba2a-5c35015e09e4`

**Inputs:**
- **`G` (Geometry):** Geometry to populate (curves, surfaces, breps and meshes only)
- **`N` (Integer):** Number of points to add
- **`S` (Integer):** Random seed for insertion
- **`P` (Point):** Optional pre-existing population

**Outputs:**
- **`P` (Point):** Population of inserted points

### Radial
**Nickname:** `RadGrid`
**Description:** 2D radial grid
**GUID:** `66eedc35-187d-4dab-b49b-408491b1255f`

**Inputs:**
- **`P` (Plane):** Base plane for grid
- **`S` (Number):** Distance between concentric grid loops
- **`Er` (Integer):** Number of grid cells in radial direction
- **`Ep` (Integer):** Number of grid cells in polar direction

**Outputs:**
- **`C` (Curve):** Grid cell outlines
- **`P` (Point):** Points at grid nodes

### Rectangular
**Nickname:** `RecGrid`
**Description:** 2D grid with rectangular cells
**GUID:** `1a25aae0-0b56-497a-85b2-cc5bf7e4b96b`

**Inputs:**
- **`P` (Plane):** Base plane for grid
- **`Sx` (Number):** Size of grid cells in base plane x-direction
- **`Sy` (Number):** Size of grid cells in base plane y-direction
- **`Ex` (Integer):** Number of grid cells in base plane x direction
- **`Ey` (Integer):** Number of grid cells in base plane y direction

**Outputs:**
- **`C` (Rectangle):** Grid cell outlines
- **`P` (Point):** Points at grid corners

### Square
**Nickname:** `SqGrid`
**Description:** 2D grid with square cells
**GUID:** `717a1e25-a075-4530-bc80-d43ecc2500d9`

**Inputs:**
- **`P` (Plane):** Base plane for grid
- **`S` (Number):** Size of grid cells
- **`Ex` (Integer):** Number of grid cells in base plane x direction
- **`Ey` (Integer):** Number of grid cells in base plane y direction

**Outputs:**
- **`C` (Rectangle):** Grid cell outlines
- **`P` (Point):** Points at grid corners

### Triangular
**Nickname:** `TriGrid`
**Description:** 2D grid with triangular cells
**GUID:** `86a9944b-dea5-4126-9433-9e95ff07927a`

**Inputs:**
- **`P` (Plane):** Base plane for grid
- **`S` (Number):** Size of triangle edges
- **`Ex` (Integer):** Number of grid cells in base plane x directions
- **`Ey` (Integer):** Number of grid cells in base plane y directions

**Outputs:**
- **`C` (Curve):** Grid cell outlines
- **`P` (Point):** Points at grid centers

***

## Category: Vector > Plane

### Adjust Plane
**Nickname:** `PAdjust`
**Description:** Adjust a plane to match a new normal direction
**GUID:** `9ce34996-d8c6-40d3-b442-1a7c8c093614`

**Inputs:**
- **`P` (Plane):** Plane to adjust
- **`N` (Vector):** New plane z-axis direction

**Outputs:**
- **`P` (Plane):** Adjusted plane

### Align Plane
**Nickname:** `Align`
**Description:** Perform minimal rotation to align a plane with a guide vector
**GUID:** `e76040ec-3b91-41e1-8e00-c74c23b89391`

**Inputs:**
- **`P` (Plane):** Plane to straighten
- **`D` (Vector):** Straightening guide direction

**Outputs:**
- **`P` (Plane):** Straightened plane
- **`A` (Number):** Rotation angle

### Align Planes
**Nickname:** `Align`
**Description:** Align planes by minimizing their serial rotation.
**GUID:** `2318aee8-01fe-4ea8-9524-6966023fc622`

**Inputs:**
- **`P` (Plane):** Planes to align
- **`M` (Plane):** Optional master plane (if omitted the first plane in P is the master plane).

**Outputs:**
- **`P` (Plane):** Aligned planes

### Construct Plane
**Nickname:** `Pl`
**Description:** Construct a plane from an origin point and {x}, {y} axes.
**GUID:** `bc3e379e-7206-4e7b-b63a-ff61f4b38a3e`

**Inputs:**
- **`O` (Point):** Origin of plane
- **`X` (Vector):** X-Axis direction of plane
- **`Y` (Vector):** Y-Axis direction of plane

**Outputs:**
- **`Pl` (Plane):** Constructed plane

### Deconstruct Plane
**Nickname:** `DePlane`
**Description:** Deconstruct a plane into its component parts.
**GUID:** `3cd2949b-4ea8-4ffb-a70c-5c380f9f46ea`

**Inputs:**
- **`P` (Plane):** Plane to deconstruct

**Outputs:**
- **`O` (Point):** Origin point
- **`X` (Vector):** X-Axis vector
- **`Y` (Vector):** Y-Axis vector
- **`Z` (Vector):** Z-Axis vector

### Flip Plane
**Nickname:** `PFlip`
**Description:** Flip or swap the axes of a plane
**GUID:** `c73e1ed0-82a2-40b0-b4df-8f10e445d60b`

**Inputs:**
- **`P` (Plane):** Plane to adjust
- **`X` (Boolean):** Reverse the x-axis direction
- **`Y` (Boolean):** Reverse the y-axis direction
- **`S` (Boolean):** Swap the x and y axis directions

**Outputs:**
- **`P` (Plane):** Flipped plane

### Line + Line
**Nickname:** `LnLn`
**Description:** Create a plane from two line segments.
**GUID:** `d788ad7f-6d68-4106-8b2f-9e55e6e107c0`

**Inputs:**
- **`A` (Line):** First line constraint. Plane origin will be at line start.
- **`B` (Line):** Second line constraint. Line B should be co-planar with but not parallel to Line A.

**Outputs:**
- **`Pl` (Plane):** Plane definition

### Line + Pt
**Nickname:** `LnPt`
**Description:** Create a plane from a line and a point.
**GUID:** `ccc3f2ff-c9f6-45f8-aa30-8a924a9bda36`

**Inputs:**
- **`L` (Line):** Line constraint. Plane origin will be at line startpoint. Plane x-axis will be parallel to line direction.
- **`P` (Point):** Point on plane. Point must not be co-linear with line.

**Outputs:**
- **`Pl` (Plane):** Plane definition

### Plane 3Pt
**Nickname:** `Pl 3Pt`
**Description:** Create a plane through three points.
**GUID:** `c98a6015-7a2f-423c-bc66-bdc505249b45`

**Inputs:**
- **`A` (Point):** Origin point
- **`B` (Point):** X-direction point
- **`C` (Point):** Orientation point

**Outputs:**
- **`Pl` (Plane):** Plane definition

### Plane Closest Point
**Nickname:** `CP`
**Description:** Find the closest point on a plane.
**GUID:** `b075c065-efda-4c9f-9cc9-288362b1b4b9`

**Inputs:**
- **`S` (Point):** Sample point
- **`P` (Plane):** Projection plane

**Outputs:**
- **`P` (Point):** Projected point
- **`uv` (Point):** {uv} coordinates of projected point
- **`D` (Number):** Signed distance between point and plane

### Plane Coordinates
**Nickname:** `PlCoord`
**Description:** Get the coordinates of a point in a plane axis system.
**GUID:** `5f127fa4-ca61-418e-bb2d-e3739d900f1f`

**Inputs:**
- **`P` (Point):** Input point
- **`S` (Plane):** Local coordinate system

**Outputs:**
- **`X` (Number):** Point {x} coordinate
- **`Y` (Number):** Point {y} coordinate
- **`Z` (Number):** Point {z} coordinate

### Plane Fit
**Nickname:** `PlFit`
**Description:** Fit a plane through a set of points.
**GUID:** `33bfc73c-19b2-480b-81e6-f3523a012ea6`

**Inputs:**
- **`P` (Point):** Points to fit

**Outputs:**
- **`Pl` (Plane):** Plane definition
- **`dx` (Number):** Maximum deviation between points and plane

### Plane Normal
**Nickname:** `Pl`
**Description:** Create a plane perpendicular to a vector.
**GUID:** `cfb6b17f-ca82-4f5d-b604-d4f69f569de3`

**Inputs:**
- **`O` (Point):** Origin of plane
- **`Z` (Vector):** Z-Axis direction of plane

**Outputs:**
- **`P` (Plane):** Plane definition

### Plane Offset
**Nickname:** `Pl Offset`
**Description:** Offset a plane.
**GUID:** `3a0c7bda-3d22-4588-8bab-03f57a52a6ea`

**Inputs:**
- **`P` (Plane):** Base plane for offset
- **`O` (Number):** Offset distance (along base plane z-axis

**Outputs:**
- **`Pl` (Plane):** Offset plane

### Plane Origin
**Nickname:** `Pl Origin`
**Description:** Change the origin point of a plane
**GUID:** `75eec078-a905-47a1-b0d2-0934182b1e3d`

**Inputs:**
- **`B` (Plane):** Base plane
- **`O` (Point):** New origin point of plane

**Outputs:**
- **`Pl` (Plane):** Plane definition

### Rotate Plane
**Nickname:** `PRot`
**Description:** Perform plane rotation around plane z-axis
**GUID:** `f6f14b09-6497-4564-8403-09e4eb5a6b82`

**Inputs:**
- **`P` (Plane):** Plane to rotate
- **`A` (Number):** Rotation (counter clockwise) around plane z-axis in radians

**Outputs:**
- **`P` (Plane):** Rotated plane

### XY Plane
**Nickname:** `XY`
**Description:** World XY plane.
**GUID:** `17b7152b-d30d-4d50-b9ef-c9fe25576fc2`

**Inputs:**
- **`O` (Point):** Origin of plane

**Outputs:**
- **`P` (Plane):** World XY plane

### XZ Plane
**Nickname:** `XZ`
**Description:** World XZ plane.
**GUID:** `8cc3a196-f6a0-49ea-9ed9-0cb343a3ae64`

**Inputs:**
- **`O` (Point):** Origin of plane

**Outputs:**
- **`P` (Plane):** World XZ plane

### YZ Plane
**Nickname:** `YZ`
**Description:** World YZ plane.
**GUID:** `fad344bc-09b1-4855-a2e6-437ef5715fe3`

**Inputs:**
- **`O` (Point):** Origin of plane

**Outputs:**
- **`P` (Plane):** World YZ plane

***

## Category: Vector > Point

### Barycentric
**Nickname:** `BCentric`
**Description:** Create a point from barycentric {u,v,w} coordinates
**GUID:** `9adffd61-f5d1-4e9e-9572-e8d9145730dc`

**Inputs:**
- **`A` (Point):** First anchor point
- **`B` (Point):** Second anchor point
- **`C` (Point):** Third anchor point
- **`U` (Number):** First barycentric coordinate
- **`V` (Number):** Second barycentric coordinate
- **`W` (Number):** Third barycentric coordinate

**Outputs:**
- **`P` (Point):** Barycentric point coordinate

### Closest Point
**Nickname:** `CP`
**Description:** Find closest point in a point collection.
**GUID:** `571ca323-6e55-425a-bf9e-ee103c7ba4b9`

**Inputs:**
- **`P` (Point):** Point to search from
- **`C` (Point):** Cloud of points to search

**Outputs:**
- **`P` (Point):** Point in [C] closest to [P]
- **`i` (Integer):** Index of closest point
- **`D` (Number):** Distance between [P] and [C](i)

### Closest Points
**Nickname:** `CPs`
**Description:** Find closest points in a point collection.
**GUID:** `446014c4-c11c-45a7-8839-c45dc60950d6`

**Inputs:**
- **`P` (Point):** Point to search from
- **`C` (Point):** Cloud of points to search
- **`N` (Integer):** Number of closest points to find

**Outputs:**
- **`P` (Point):** Point in [C] closest to [P]
- **`i` (Integer):** Index of closest point
- **`D` (Number):** Distance between [P] and [C](i)

### Construct Point
**Nickname:** `Pt`
**Description:** Construct a point from {xyz} coordinates.
**GUID:** `3581f42a-9592-4549-bd6b-1c0fc39d067b`

**Inputs:**
- **`X` (Number):** {x} coordinate
- **`Y` (Number):** {y} coordinate
- **`Z` (Number):** {z} coordinate

**Outputs:**
- **`Pt` (Point):** Point coordinate

### Cull Duplicates
**Nickname:** `CullPt`
**Description:** Cull points that are coincident within tolerance
**GUID:** `6eaffbb2-3392-441a-8556-2dc126aa8910`

**Inputs:**
- **`P` (Point):** Points to operate on
- **`T` (Number):** Proximity tolerance distance

**Outputs:**
- **`P` (Point):** Culled points
- **`I` (Integer):** Index map of culled points
- **`V` (Integer):** Number of input points represented by this output point

### Deconstruct
**Nickname:** `pDecon`
**Description:** Deconstruct a point into its component parts.
**GUID:** `9abae6b7-fa1d-448c-9209-4a8155345841`

**Inputs:**
- **`P` (Point):** Input point

**Outputs:**
- **`X` (Number):** Point {x} component
- **`Y` (Number):** Point {y} component
- **`Z` (Number):** Point {z} component

### Distance
**Nickname:** `Dist`
**Description:** Compute Euclidean distance between two point coordinates.
**GUID:** `93b8e93d-f932-402c-b435-84be04d87666`

**Inputs:**
- **`A` (Point):** First point
- **`B` (Point):** Second point

**Outputs:**
- **`D` (Number):** Distance between A and B

### Numbers to Points
**Nickname:** `Num2Pt`
**Description:** Convert a list of numbers to a list of points
**GUID:** `0ae07da9-951b-4b9b-98ca-d312c252374d`

**Inputs:**
- **`N` (Number):** Numbers to merge into points
- **`M` (Coordinate Mask):** Mask for coordinate composition

**Outputs:**
- **`P` (Point):** Ordered list of points

### Point Cylindrical
**Nickname:** `Pt`
**Description:** Create a point from cylindrical {angle,radius,elevation} coordinates.
**GUID:** `23603075-be64-4d86-9294-c3c125a12104`

**Inputs:**
- **`P` (Plane):** Plane defining cylindrical coordinate space
- **`A` (Number):** Angle in radians for P(x,y) rotation
- **`R` (Number):** Radius of cylinder
- **`E` (Number):** Elevation of point

**Outputs:**
- **`Pt` (Point):** Cylindrical point coordinate

### Point Groups
**Nickname:** `PGroups`
**Description:** Create groups from nearby points
**GUID:** `81f6afc9-22d9-49f0-8579-1fd7e0df6fa6`

**Inputs:**
- **`P` (Point):** Points to group
- **`D` (Number):** Distance threshold for group inclusion

**Outputs:**
- **`G` (Point):** Point groups
- **`I` (Integer):** Group indices

### Point Oriented
**Nickname:** `Pt`
**Description:** Create a point from plane {u,v,w} coordinates.
**GUID:** `aa333235-5922-424c-9002-1e0b866a854b`

**Inputs:**
- **`P` (Plane):** Plane defining coordinate space
- **`U` (Number):** U parameter on plane
- **`V` (Number):** V parameter on plane
- **`W` (Number):** W parameter on plane (elevation)

**Outputs:**
- **`Pt` (Point):** Oriented point coordinate

### Point Polar
**Nickname:** `Pt`
**Description:** Create a point from polar {phi,theta,offset} coordinates.
**GUID:** `a435f5c8-28a2-43e8-a52a-0b6e73c2e300`

**Inputs:**
- **`P` (Plane):** Plane defining polar coordinate space
- **`xy` (Number):** Angle in radians for P(x,y) rotation
- **`z` (Number):** Angle in radians for P(z) rotation
- **`d` (Number):** Offset distance for point

**Outputs:**
- **`Pt` (Point):** Polar point coordinate

### Points to Numbers
**Nickname:** `Pt2Num`
**Description:** Convert a list of points to a list of numbers
**GUID:** `d24169cc-9922-4923-92bc-b9222efc413f`

**Inputs:**
- **`P` (Point):** Points to parse
- **`M` (Coordinate Mask):** Mask for coordinate extraction

**Outputs:**
- **`N` (Number):** Ordered list of coordinates

### Project Point
**Nickname:** `Project`
**Description:** Project a point onto a collection of shapes
**GUID:** `5184b8cb-b71e-4def-a590-cd2c9bc58906`

**Inputs:**
- **`P` (Point):** Point to project
- **`D` (Vector):** Projection direction
- **`G` (Geometry):** Geometry to project onto

**Outputs:**
- **`P` (Point):** Projected point
- **`I` (Integer):** Index of object that was projected onto

### Pull Point
**Nickname:** `Pull`
**Description:** Pull a point to a variety of geometry.
**GUID:** `902289da-28dc-454b-98d4-b8f8aa234516`

**Inputs:**
- **`P` (Point):** Point to search from
- **`G` (Geometry):** Geometry that pulls

**Outputs:**
- **`P` (Point):** Point on [G] closest to [P]
- **`D` (Number):** Distance between [P] and its projection onto [G]

### Sort Along Curve
**Nickname:** `AlongCrv`
**Description:** Sort points along a curve
**GUID:** `59aaebf8-6654-46b7-8386-89223c773978`

**Inputs:**
- **`P` (Point):** Points to sort
- **`C` (Curve):** Curve to sort along

**Outputs:**
- **`P` (Point):** Sorted points
- **`I` (Integer):** Point index map

### Sort Points
**Nickname:** `Sort Pt`
**Description:** Sort points by Euclidean coordinates (first x, then y, then z)
**GUID:** `4e86ba36-05e2-4cc0-a0f5-3ad57c91f04e`

**Inputs:**
- **`P` (Point):** Points to sort

**Outputs:**
- **`P` (Point):** Sorted points
- **`I` (Integer):** Point index map

### To Polar
**Nickname:** `Polar`
**Description:** Convert a 3D point to plane polar coordinates.
**GUID:** `61647ba2-31eb-4921-9632-df81e3286f7d`

**Inputs:**
- **`P` (Point):** 3D point to transcribe
- **`S` (Plane):** Plane defining polar coordinate space

**Outputs:**
- **`P` (Number):** Planar angle in radians (counter-clockwise starting at the plane X-axis)
- **`T` (Number):** Vertical angle in radians
- **`R` (Number):** Distance from system origin to point

***

## Category: Vector > Vector

### Addition
**Nickname:** `VAdd`
**Description:** Perform vector-vector addition.
**GUID:** `fb012ef9-4734-4049-84a0-b92b85bb09da`

**Inputs:**
- **`A` (Vector):** First vector
- **`B` (Vector):** Second vector
- **`U` (Boolean):** Unitize output

**Outputs:**
- **`V` (Vector):** Sum vector
- **`L` (Number):** Sum vector length

### Amplitude
**Nickname:** `Amp`
**Description:** Set the amplitude (length) of a vector.
**GUID:** `6ec39468-dae7-4ffa-a766-f2ab22a2c62e`

**Inputs:**
- **`V` (Vector):** Base vector
- **`A` (Number):** Amplitude (length) value

**Outputs:**
- **`V` (Vector):** Resulting vector

### Angle
**Nickname:** `Angle`
**Description:** Compute the angle between two vectors.
**GUID:** `b464fccb-50e7-41bd-9789-8438db9bea9f`

**Inputs:**
- **`A` (Vector):** First vector
- **`B` (Vector):** Second vector
- **`P` (Plane):** Optional plane for 2D angle

**Outputs:**
- **`A` (Number):** Angle (in radians) between vectors
- **`R` (Number):** Reflex angle (in radians) between vectors

### Cross Product
**Nickname:** `XProd`
**Description:** Compute vector cross product.
**GUID:** `2a5cfb31-028a-4b34-b4e1-9b20ae15312e`

**Inputs:**
- **`A` (Vector):** First vector
- **`B` (Vector):** Second vector
- **`U` (Boolean):** Unitize output

**Outputs:**
- **`V` (Vector):** Cross product vector
- **`L` (Number):** Vector length

### Deconstruct Vector
**Nickname:** `DeVec`
**Description:** Deconstruct a vector into its component parts.
**GUID:** `a50fcd4a-cf42-4c3f-8616-022761e6cc93`

**Inputs:**
- **`V` (Vector):** Input vector

**Outputs:**
- **`X` (Number):** Vector {x} component
- **`Y` (Number):** Vector {y} component
- **`Z` (Number):** Vector {z} component

### Divide
**Nickname:** `VDiv`
**Description:** Perform vector-scalar division.
**GUID:** `310e1065-d03a-4858-bcd1-809d39c042af`

**Inputs:**
- **`V` (Vector):** Base vector
- **`F` (Number):** Denominator

**Outputs:**
- **`V` (Vector):** Divided vector
- **`L` (Number):** Vector length

### Dot Product
**Nickname:** `DProd`
**Description:** Compute vector dot product.
**GUID:** `43b9ea8f-f772-40f2-9880-011a9c3cbbb0`

**Inputs:**
- **`A` (Vector):** First vector
- **`B` (Vector):** Second vector
- **`U` (Boolean):** Unitize input

**Outputs:**
- **`D` (Number):** Vector dot product

### Multiply
**Nickname:** `VMul`
**Description:** Perform vector-scalar multiplication.
**GUID:** `63fff845-7c61-4dfb-ba12-44d481b4bf0f`

**Inputs:**
- **`V` (Vector):** Base vector
- **`F` (Number):** Multiplication factor

**Outputs:**
- **`V` (Vector):** Multiplied vector
- **`L` (Number):** Vector length

### Reverse
**Nickname:** `Rev`
**Description:** Reverse a vector (multiply by -1).
**GUID:** `d5788074-d75d-4021-b1a3-0bf992928584`

**Inputs:**
- **`V` (Vector):** Base vector

**Outputs:**
- **`V` (Vector):** Reversed vector

### Rotate
**Nickname:** `VRot`
**Description:** Rotate a vector around an axis.
**GUID:** `b6d7ba20-cf74-4191-a756-2216a36e30a7`

**Inputs:**
- **`V` (Vector):** Vector to rotate
- **`X` (Vector):** Rotation axis
- **`A` (Number):** Rotation angle (in radians)

**Outputs:**
- **`V` (Vector):** Rotated vector

### Solar Incidence
**Nickname:** `Solar`
**Description:** Gets the solar incidence vector for a certain time and place
**GUID:** `59e1f848-38d4-4cbf-ad7f-40ffc52acdf5`

**Inputs:**
- **`L` (Location):** Location on Earth
- **`T` (Time):** Time and date for solar incidence computation
- **`P` (Plane):** Local plane (X=East, Y=North)

**Outputs:**
- **`D` (Vector):** Solar incidence vector
- **`E` (Number):** Angle between horizon and solar vector
- **`H` (Boolean):** True if sun is above the horizon
- **`C` (Colour):** Colour suggestion

### Unit Vector
**Nickname:** `Unit`
**Description:** Unitize vector.
**GUID:** `d2da1306-259a-4994-85a4-672d8a4c7805`

**Inputs:**
- **`V` (Vector):** Base vector

**Outputs:**
- **`V` (Vector):** Unit vector

### Unit X
**Nickname:** `X`
**Description:** Unit vector parallel to the world {x} axis.
**GUID:** `79f9fbb3-8f1d-4d9a-88a9-f7961b1012cd`

**Inputs:**
- **`F` (Number):** Unit multiplication

**Outputs:**
- **`V` (Vector):** World {x} vector

### Unit Y
**Nickname:** `Y`
**Description:** Unit vector parallel to the world {y} axis.
**GUID:** `d3d195ea-2d59-4ffa-90b1-8b7ff3369f69`

**Inputs:**
- **`F` (Number):** Unit multiplication

**Outputs:**
- **`V` (Vector):** World {y} vector

### Unit Z
**Nickname:** `Z`
**Description:** Unit vector parallel to the world {z} axis.
**GUID:** `9103c240-a6a9-4223-9b42-dbd19bf38e2b`

**Inputs:**
- **`F` (Number):** Unit multiplication

**Outputs:**
- **`V` (Vector):** World {z} vector

### Vector 2Pt
**Nickname:** `Vec2Pt`
**Description:** Create a vector between two points.
**GUID:** `934ede4a-924a-4973-bb05-0dc4b36fae75`

**Inputs:**
- **`A` (Point):** Base point
- **`B` (Point):** Tip point
- **`U` (Boolean):** Unitize output

**Outputs:**
- **`V` (Vector):** Vector
- **`L` (Number):** Vector length

### Vector Length
**Nickname:** `VLen`
**Description:** Compute the length (amplitude) of a vector.
**GUID:** `675e31bf-1775-48d7-bb8d-76b77786dd53`

**Inputs:**
- **`V` (Vector):** Vector to measure

**Outputs:**
- **`L` (Number):** Vector length

### Vector XYZ
**Nickname:** `Vec`
**Description:** Create a vector from {xyz} components.
**GUID:** `56b92eab-d121-43f7-94d3-6cd8f0ddead8`

**Inputs:**
- **`X` (Number):** Vector {x} component
- **`Y` (Number):** Vector {y} component
- **`Z` (Number):** Vector {z} component

**Outputs:**
- **`V` (Vector):** Vector construct
- **`L` (Number):** Vector length

***

## Category: X > X

### Example
**Nickname:** `X`
**Description:** Example
**GUID:** `d541404d-b806-453e-8351-a954e824ed22`

**Inputs:**
- **`C` (Circle):** The circle to slice
- **`L` (Line):** Slicing line

**Outputs:**
- **`A` (Arc):** First Split result.
- **`B` (Arc):** Second Split result.
