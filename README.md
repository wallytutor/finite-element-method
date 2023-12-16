# Finite Element Method

Personal path towards mastering finite element method (FEM).

The goal of this repository is to track my learning path of finite element method. As a secondary goal, all tools included in the study must be open source with a permissive license. Finally, I will study again some subjects related to the physics of applied problems that will be solved through FEM.

It is not my first time trying this and I learned a few things in the past failures. Below I expose my reasoning about the choices I make today for structuring this repository and its future.

1. During my college years I almost neglected solid mechanics and statics. It happens that most quality materials for learning FEM are applied to structural analysis (because that is the most import numerical method in that field). Because my applied work is mostly related to fluids and heat transfer, doing some bibliographic research I found the books by [Lewis et al.](https://www.wiley.com/en-fr/Fundamentals+of+the+Finite+Element+Method+for+Heat+and+Fluid+Flow-p-9780470014165) and its newer edition by [Nithiarasu et al.](https://www.wiley.com/en-fr/Fundamentals+of+the+Finite+Element+Method+for+Heat+and+Mass+Transfer%2C+2nd+Edition-p-9781118535431) adapted to my expertise level.

1. From a mathematical standpoint the most accessible material I have studied so far is the draft book by [H. P. Langtangen and K.-A. Mardal](https://hplgit.github.io/fem-book/doc/web/). Unfortunatelly the main author deceased just after the release of the final draft and the material remained unfinished. That is not really a blocking point because the content is pretty much finished from a non-specialist standpoint. Furthermore, its exercises where converted into notebooks by [Mojtaba Barzegari](https://github.com/mbarzegary/finite-element-intro) and the material is quite accessible.

1. During the years I have tested several FEM packages and libraries. The most promissing FEM package in the open source world is certainly [FEniCSx](https://fenicsproject.org/), but it comes with the disadvantage of requiring Linux/WSL and having an unclear documentation. In terms of power I couldn't find anything comparable to [MOOSE](https://mooseframework.inl.gov/index.html) - if you see the list of developer labs it becomes pretty clear why - but it is something to experienced FEM users since it requires low level implementation of the problems in C++. [Elmer](https://www.csc.fi/web/elmer) could be a candidate package for learning the practice, but for going into the mathematics of FEM it is not the right tool. Next comes [Kratos](https://github.com/KratosMultiphysics/Kratos) but its documentation is messy and things moved around too much over the years. Finally we have [FreeFEM++](https://freefem.org/). It is a pretty old software what means that it outlived most of the other applications and now is very stable. What is interesting about FreeFEM++ is its portability across operating systems and good documentation. In what follows I will stick with FreeFEM++ and later with FEniCSx.

1. Learning a numerical method for continuum mechanics is essentially useless without the capacity to apply it to real world geometries. Unfortunatelly the field of open source CAD is very poor so we have just a few options. Although [Gmsh](https://gmsh.info/doc/texinfo/gmsh.html) is pretty powerfull with respect to its meshing capabilities, conceiving the geometry with the software can quickly scale to *trigonometry hell* level. I have been using the software for many years for 2D cases but systematically fall back to proprietary software when things become complex. In this study I intend to reach a *sorcerer Gmsh* mastery level. It can be complemented by STL files generation with [Blender](https://www.blender.org/).

## Software version

While doing such an ambitious study, it is important to stick with software versions.

In what follows we will be using exclusivelly the following software:

- Gmsh 4.11.1
- FreeFEM++ 4.13

Processing utilities in Julia and/or Python will have their own versioning so they are not reported here.

## Study planning

