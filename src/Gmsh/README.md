# Gmsh

The original files were copied from `share/doc/gmsh/tutorials` directory from
Gmsh installation directory.  During the course of the tutorials I have edited
and most likely cleaned-up/minified the files because that is part of my
learning methodology.

## Topics

1. [Geometry basics, elementary entities, physical groups](t1.geo)

1. [Transformations, extruded geometries, volumes](t2.geo)
    - Getting coordinates of points
    - How to export an unrolled geometry file

1. [Extruded meshes, ONELAB parameters, options](t3.geo)
    - Extrusion with default kernel is limited to `Pi` radians
    - OpenCASCADE kernel allows for any size of rotation
    - Defining constants with ONELAB
    - ONELAB parameters can be overridden through CLI `-setnumber <var> <val>`
    - Setting general parameters in scripts
