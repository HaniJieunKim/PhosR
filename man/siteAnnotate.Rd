% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kinaseSubstratePrediction.R
\name{siteAnnotate}
\alias{siteAnnotate}
\title{Phosphosite annotation}
\usage{
siteAnnotate(site, phosScoringMatrices, predMatrix)
}
\arguments{
\item{site}{site the ID of a phosphosite}

\item{phosScoringMatrices}{output from function kinaseSubstrateScore()}

\item{predMatrix}{a prediction matrix from kinaseSubstratePred()}
}
\value{
A graphical plot
}
\description{
This function plots the combined scores of each of all kinases
for a given phosphosites
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
phosphoL6.mean <- meanAbundance(phosphoL6,
                                grps = gsub('_.+', '', colnames(phosphoL6)))
aov <- matANOVA(mat=phosphoL6, grps=gsub('_.+', '', colnames(phosphoL6)))
phosphoL6.reg <- phosphoL6[(aov < 0.05) &
                        (rowSums(phosphoL6.mean > 0.5) > 0),,drop = FALSE]
L6.phos.std <- standardise(phosphoL6.reg)
rownames(L6.phos.std) <- sapply(strsplit(rownames(L6.phos.std), '~'),
    function(x){gsub(' ', '', paste(toupper(x[2]), x[3], '', sep=';'))})

L6.phos.seq <- sapply(strsplit(rownames(phosphoL6.reg), '~'),
                    function(x)x[4])

L6.matrices <- kinaseSubstrateScore(PhosphoSite.mouse, L6.phos.std,
    L6.phos.seq, numMotif = 5, numSub = 1)
set.seed(1)
L6.predMat <- kinaseSubstratePred(L6.matrices, top=30)

# We will look at the phosphosite AAK1;S677 for demonstration purpose.
site = "AAK1;S677;"
siteAnnotate(site, L6.matrices, L6.predMat)

}
