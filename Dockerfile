FROM rocker/rstudio

RUN apt-get update && apt-get install -y libpng* libjpeg* libhdf5-dev libxml2-dev

RUN install2.r R.utils
RUN R -e "install.packages('https://cran.rstudio.com//src/contrib/Archive/SDMTools/SDMTools_1.1-221.2.tar.gz', repos = NULL)"

RUN install2.r BiocManager
RUN R -e "BiocManager::install('multtest')"

# installs Seurat 2.3.4
RUN R -e "source('https://z.umn.edu/archived-seurat')"

RUN install2.r roxygen2 rversions devtools
RUN R -e "BiocManager::install(c('SingleCellExperiment', 'scater', 'scmap'), update=FALSE)"
RUN R -e "devtools::install_github('pcantalupo/sct', upgrade = 'never')"

