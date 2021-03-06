% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/toolBox.R
\name{meanAbundance}
\alias{meanAbundance}
\title{Obtain average expression from replicates}
\usage{
meanAbundance(mat, grps)
}
\arguments{
\item{mat}{a matrix with rows correspond to phosphosites and columns
correspond to samples.}

\item{grps}{a string specifying the grouping (replciates).}
}
\value{
a matrix with mean expression from replicates
}
\description{
Obtain average expression from replicates
}
\examples{
data('phospho_L6_ratio')
data('SPSs')

grps = gsub('_.+', '', colnames(phospho.L6.ratio))

# Cleaning phosphosite label
phospho.site.names = rownames(phospho.L6.ratio)
L6.sites = gsub(' ', '', sapply(strsplit(rownames(phospho.L6.ratio), '~'),
                                function(x){paste(toupper(x[2]), x[3], '',
                                                sep=';')}))
phospho.L6.ratio = t(sapply(split(data.frame(phospho.L6.ratio), L6.sites),
                            colMeans))
phospho.site.names = split(phospho.site.names, L6.sites)

# Construct a design matrix by condition
design = model.matrix(~ grps - 1)

# phosphoproteomics data normalisation using RUV
ctl = which(rownames(phospho.L6.ratio) \%in\% SPSs)
phospho.L6.ratio.RUV = RUVphospho(phospho.L6.ratio, M = design, k = 3,
                                ctl = ctl)


phosphoL6 = phospho.L6.ratio.RUV
rownames(phosphoL6) = phospho.site.names

# filter for up-regulated phosphosites
phosphoL6.mean <- meanAbundance(phosphoL6, grps = gsub('_.+', '',
                                colnames(phosphoL6)))

}
