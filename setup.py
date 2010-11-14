# -*- coding: utf-8 -*-
from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

import numpy as np

setup(
    name="dotbench",
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("dotbench", ["dotbench.pyx", "dot.cpp"],
                             include_dirs = [np.get_include(),'.'],
                             extra_compile_args=['-O3'])],
    py_modules = ['dotbench',],
)

