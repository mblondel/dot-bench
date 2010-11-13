import numpy as np
cimport numpy as np

cdef extern void _sparse_dense(double *X_data,
                               int *X_indices,
                               int *X_indptr,
                               int n_samples,
                               double *w,
                               double *out)

cdef extern void _sparse_sparse_binary_search(double *X_data,
                                              int *X_indices,
                                              int *X_indptr,
                                              int n_samples,
                                              double *w_data,
                                              int *w_indices,
                                              int *w_indptr,
                                              double *out)

def sparse_dense(X,
                 np.ndarray[np.float64_t, ndim=1, mode='c']w,
                 np.ndarray[np.float64_t, ndim=1, mode='c']out):


    cdef np.ndarray[np.float64_t, ndim=1, mode='c'] X_data = X.data
    cdef np.ndarray[np.int32_t, ndim=1, mode='c'] X_indices = X.indices
    cdef np.ndarray[np.int32_t, ndim=1, mode='c'] X_indptr = X.indptr

    _sparse_dense(<double *>X_data.data,
                  <int *>X_indices.data,
                  <int *>X_indptr.data,
                  <int>X.shape[0],
                  <double *>w.data,
                  <double *>out.data)

def sparse_sparse_binary_search(X,
                                w,
                                np.ndarray[np.float64_t, ndim=1, mode='c']out):


    cdef np.ndarray[np.float64_t, ndim=1, mode='c'] X_data = X.data
    cdef np.ndarray[np.int32_t, ndim=1, mode='c'] X_indices = X.indices
    cdef np.ndarray[np.int32_t, ndim=1, mode='c'] X_indptr = X.indptr

    cdef np.ndarray[np.float64_t, ndim=1, mode='c'] w_data = w.data
    cdef np.ndarray[np.int32_t, ndim=1, mode='c'] w_indices = w.indices
    cdef np.ndarray[np.int32_t, ndim=1, mode='c'] w_indptr = w.indptr

    _sparse_sparse_binary_search(<double *>X_data.data,
                                 <int *>X_indices.data,
                                 <int *>X_indptr.data,
                                 <int>X.shape[0],
                                 <double *>w_data.data,
                                 <int *>w_indices.data,
                                 <int *>w_indptr.data,
                                 <double *>out.data)
