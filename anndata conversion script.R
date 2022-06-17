# Actual solution: use language agnostic framework "feather" for annotations,
# write data sparse matrix to .mtx file
#install.packages("feather")

library(feather)
library(Matrix)

# Load norm.dat, get gene names (don't need cell IDs since they're in anno.df)
geneNames = data.frame(rownames(norm.dat))

fnAnno = "Data/TH_annotation.feather"
fnGenes = "Data/gene_names.feather"
fnData = "Data/TH_data.mtx"


write_feather(anno.df,fnAnno)
write_feather(geneNames,fnGenes)
# write_feather(norm.dat,fnData) # Feather requires data frame

# Next time look into 32 bit format
writeMM(norm.dat, fnData)


# Previously attempted solutions
# Script to convert .rda files into AnnData objects for use in scanpy
#library(Seurat)
#library(reticulate)
#ad = import("anndata", convert = FALSE)

#load(anno.df)
#load(norm.dat)

# https://satijalab.org/seurat/archive/v2.4/conversion_vignette.html

# https://scanpy.discourse.group/t/read-rdata-in-scanpy/188/5

# https://github.com/LuckyMD/Code_snippets/blob/master/Seurat_to_anndata.ipynb