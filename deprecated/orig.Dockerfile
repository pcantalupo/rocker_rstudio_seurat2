FROM rocker/rstudio

# SDMTools depends on R.utils
RUN R -e "install.packages('R.utils');\
          packageurl = 'https://cran.r-project.org/src/contrib/Archive/SDMTools/SDMTools_1.1-221.tar.gz';\
          install.packages(packageurl, repos=NULL, type='source')"

# Bioconductor prereq          
RUN R -e "install.packages('BiocManager'); BiocManager::install('multtest')"

# General packages prereqs
RUN R -e "install.packages(c('ggplot2', 'cowplot', 'ROCR', 'mixtools', 'lars', 'ica', 'tsne', 'Rtsne'))"

RUN R -e "install.packages(c('fpc', 'ape', 'pbapply', 'igraph', 'RANN', 'dplyr', 'RColorBrewer'))"

RUN R -e "install.packages(c('irlba', 'reshape2','gplots', 'Rcpp', 'dtw', 'plotly', 'Hmisc', 'httr'))"

RUN R -e "install.packages(c('tidyr', 'ggridges','metap', 'lmtest', 'fitdistrplus', 'png', 'doSNOW'))"

RUN R -e "install.packages(c('reticulate', 'foreach', 'hdf5r','RcppEigen', 'RcppProgress'))"

# Install devtools and its dependencies
RUN apt-get update && apt-get install -y libxml2-dev
#RUN R -e "install.packages('xml2')"

RUN R -e 'library(hdf5r)'

# Finally install Seurat2
#RUN R -e "packageurl = 'https://cran.r-project.org/src/contrib/Archive/Seurat/Seurat_2.3.4.tar.gz';\
#          install.packages(packageurl, repos=NULL, type='source')"

# others
#RUN R -e "install.packages(c('openxlsx', 'boxr'))"


#RUN R -e "library(openxlsx); install.packages('devtools')"
#RUN R -e "install.packages(c('usethis', 'git2r', 'roxygen2', 'rversions', 'devtools'))"

#RUN R -e "library(devtools); install_github('pcantalupo/sct')"

#BiocManager::install("SingleCellExperiment")

