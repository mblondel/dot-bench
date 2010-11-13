
/* Utils */

static double
get_ij_binary_search(double *X_data,
                     int *X_indices,
                     int *X_indptr,
                     int i,
                     int j)
{
    /* Get X[i,j] by binary search */

    int low, high, top, mid;

    low = X_indptr[i];
    high = top = X_indptr[i+1];

    while (low < high)
    {
        mid = low + (high - low) / 2;

        if (X_indices[mid] < j)
            low = mid + 1;
        else
            high = mid;
    }

    if (low < top && X_indices[low] == j)
        return X_data[low];
    else
        return 0.0;

}

/* sparse-dense */

void
_sparse_dense(double *X_data,
              int *X_indices,
              int *X_indptr,
              int n_samples,
              double *w,
              double *out)
{
    /* Dot product between X (CSR) and w (dense) */

    int i, j, k;
    double sum;

    for (i=0; i < n_samples; i++)

    {
        sum = 0.0;

        for (k=X_indptr[i]; k < X_indptr[i+1]; k++)
        {
            j = X_indices[k];
            sum += X_data[k] * w[j];
        }

        out[i] = sum;
    }
}

/* sparse-sparse (binary search) */

void
_sparse_sparse_binary_search(double *X_data,
                             int *X_indices,
                             int *X_indptr,
                             int n_samples,
                             double *w_data,
                             int *w_indices,
                             int *w_indptr,
                             double *out)
{
    /* Dot product between X (CSR) and w (CSR) */

    int i, j, k;
    double sum;

    for (i=0; i < n_samples; i++)

    {
        sum = 0.0;

        for (k=X_indptr[i]; k < X_indptr[i+1]; k++)
        {
            j = X_indices[k];
            sum += X_data[k] * get_ij_binary_search(w_data,
                                                    w_indices,
                                                    w_indptr,
                                                    0, j);
        }

        out[i] = sum;
    }
}
