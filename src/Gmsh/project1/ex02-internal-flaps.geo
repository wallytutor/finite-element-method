// Experimentation with internal flaps.
SetFactory("OpenCASCADE");
General.Axes = 3;

Point(1) = {0.00, 0.00, 0};
Point(2) = {2.00, 0.20, 0};
Point(3) = {2.00, 0.80, 0};
Point(4) = {0.00, 1.00, 0};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Circle(5) = {0.5, 0.5, 0, 0.1, 0, 2*Pi};

c0 = newl; Curve Loop(c0) = {1, 2, 3, 4};
c1 = newl; Curve Loop(c1) = {5};
theloops[0] = c0;
theloops[1] = c1;

NEXTFIELD = 0;
NEXTFLAP = #theloops[];

Macro AddInternalFlap
    // Arguments:
    // - x0    : (x, y) coordinates of lowest point [m] (0, 1)
    // - dims  : thickness, width [m] (2, 3)
    // - angle : clockwise angle with horizontal [°] (4)
    x0[] = {pars[0], pars[1]};
    dims[] = {pars[2], pars[3]};
    angle = pars[4];
    
    Printf("NEXTFIELD = %g | NEXTFLAP = %g", NEXTFIELD, NEXTFLAP);

    theta = Pi/2 * (1 - angle/90);
    gamma = Pi/2 - theta;

    x1[] = {x0[0] + dims[0] * Cos(theta), x0[1] + dims[0] * Sin(theta)};
    x2[] = {x1[0] - dims[1] * Cos(gamma), x1[1] + dims[1] * Sin(gamma)};
    x3[] = {x2[0] - dims[0] * Cos(theta), x2[1] - dims[0] * Sin(theta)};

    xc[] = {(x1[0]+x3[0])/2, (x1[1]+x3[1])/2, 0};

    p0 = newp; Point(p0) = {x0[0], x0[1], 0};
    p1 = newp; Point(p1) = {x1[0], x1[1], 0};
    p2 = newp; Point(p2) = {x2[0], x2[1], 0};
    p3 = newp; Point(p3) = {x3[0], x3[1], 0};

    l0 = newl; Line(l0) = {p0, p1};
    l1 = newl; Line(l1) = {p1, p2};
    l2 = newl; Line(l2) = {p2, p3};
    l3 = newl; Line(l3) = {p3, p0};

    ck = newl; Curve Loop(ck) = {l0, l1, l2, l3};
    theloops[NEXTFLAP++] = ck;

    idf = NEXTFIELD;
    
    Field[idf+0] = BoundaryLayer;
    Field[idf+0].CurvesList = {l0, l1, l2, l3};
    Field[idf+0].AnisoMax = 1.0e+10;
    Field[idf+0].Quads = 1;
    Field[idf+0].IntersectMetrics = 1;
    Field[idf+0].Ratio = 1.2;
    Field[idf+0].Size = 0.001;
    Field[idf+0].SizeFar = 0.05;
    Field[idf+0].Thickness = 0.05;
    
    // Field[idf+1] = Ball;
    // Field[idf+1].Radius = dims[1]*3/2;
    // Field[idf+1].Thickness = 0.01;
    // Field[idf+1].VIn = 0.01;
    // Field[idf+1].VOut = 0.05;
    // Field[idf+1].XCenter = xc[0];
    // Field[idf+1].YCenter = xc[1];
    // Field[idf+1].ZCenter = xc[2];

    // Field[idf+1] = Distance;
    // Field[idf+1].CurvesList = {l0, l1, l2, l3};
    // Field[idf+1].PointsList = {p0, p1, p2, p3};
    // Field[idf+1].Sampling = 10;
    
    // Field[idf+2] = Threshold;
    // Field[idf+2].InField = 2;
    // Field[idf+2].SizeMin = 0.010;
    // Field[idf+2].SizeMax = 0.050;
    // Field[idf+2].DistMin = 0.10;
    // Field[idf+2].DistMax = 0.25;
    // Printf("Threshold Field [%g]", idf+2);

    NEXTFIELD += 3;

    BoundaryLayer Field = idf+0;
Return

pars[] = {1.5, 0.375, 0.01, 0.25, 90.0};
Call AddInternalFlap;

pars[] = {1.0, 0.375, 0.01, 0.25, 90.0};
Call AddInternalFlap;

Plane Surface(1) = {theloops[]};

Transfinite Curve {1, 3} = 40;
Transfinite Curve {2, 4} = 40;
Transfinite Curve {5} = 40;
Recombine Surface {1};

Field[666] = BoundaryLayer;
Field[666].CurvesList = {1, 3, 5};
Field[666].PointsList = {1, 2, 3, 4};
Field[666].AnisoMax = 1.0e+10;
Field[666].Quads = 1;
Field[666].IntersectMetrics = 1;
Field[666].Ratio = 1.2;
Field[666].Size = 0.005;
Field[666].SizeFar = 0.05;
Field[666].Thickness = 0.05;
BoundaryLayer Field = 666;

// Field[999] = Min;
// Field[999].FieldsList = {2, 5, 666};
// Background Field = 999;

Mesh.Algorithm = 8;
Mesh.MeshSizeMax = 0.05;
Mesh.MeshSizeFromPoints = 0;
Mesh.MeshSizeExtendFromBoundary = 1;
Mesh.MeshSizeFromCurvature = 0;
Mesh.Smoothing = 100;

// Mesh 2;
// RefineMesh;
    