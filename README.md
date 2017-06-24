# axosc

## Initial QC of matrix

    % plot_scMatrix_QCinfo.R  sc_counts.matrix

This step creates a pdf file summarizing QC statistics, and a .RData file that will be used below.


## Pruning of numbers of cells, creating Seurat object

This is done from within R.

    %  R

    >  source("prune_n_cluster_cells.Rlib")

    Define your minimum and maximum number of genes per cell based on the QC plots generated above and set below.
    >  run_seurat("file.RData", min_complexity=500, max_complexity=8000)

Examine the code for this method, as there are other parameters that may be of interest. For exploratory purposes, consider running the various steps in this method separately.

Running the full method will generate a pdf file containing various plots and a seurat.obj file that will be used below.



## Axo-specific plotting of data with markers and signatures

This is also done within R:

    % R

    > source("axo_Seurat_plotter.Rscript")

    > plot_axo_seurat("file.seurat.obj")

This will generate a pdf file containing summary plots - tSNE painted in various ways and violin plots for marker genes.  Also, consider running the steps in this method separately for exploration purposes.


