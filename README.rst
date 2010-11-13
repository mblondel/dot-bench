.. -*- mode: rst -*-

dot-bench
=========

This is an ongoing project which aims to benchmark different implementations for
sparse-sparse and sparse-dense dot products, especially in the context of
Machine Learning algorithms.

Python: Generate data, plots and reports.
C: Perform computations.
Cython: Wrap C code.

Note: Cython is not used for computations to allow more people to read the code
(the benchmark is intended for a broad audience, not only Python programmers).
Moreover, handwritten C may be more efficient.

ToDO
====

- Plots and reports for different matrix and weight sparsities
- Merge, B-tree, Hash-table based sparse-sparse implementations
- Comparison of different scenarios: training vs prediction
                                     real vs binary features
