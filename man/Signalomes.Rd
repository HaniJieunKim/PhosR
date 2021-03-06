% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Signalomes.R
\name{Signalomes}
\alias{Signalomes}
\title{PhosR Signalomes}
\usage{
Signalomes(KSR, predMatrix, exprsMat, KOI, threskinaseNetwork=0.9,
signalomeCutoff=0.5, verbose = TRUE)
}
\arguments{
\item{KSR}{kinase-substrate relationship scoring results}

\item{predMatrix}{output of kinaseSubstratePred function}

\item{exprsMat}{a matrix with rows corresponding to phosphosites and columns
corresponding to samples}

\item{KOI}{a character vector that contains kinases of interest for which
expanded signalomes will be generated}

\item{threskinaseNetwork}{threshold used to select interconnected kinases for
the expanded signalomes}

\item{signalomeCutoff}{threshold used to filter kinase-substrate
relationships}

\item{verbose}{Default to \code{TRUE} to show messages during the progress.
All messages will be suppressed if set to \code{FALSE}}
}
\value{
A list of 3 elements.
 \code{Signalomes}, \code{proteinModules} and \code{kinaseSubstrates}
}
\description{
A function to generate signalomes
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

kinaseOI = c('PRKAA1', 'AKT1')

Signalomes_results <- Signalomes(KSR=L6.matrices,
                                predMatrix=L6.predMat,
                                exprsMat=L6.phos.std,
                                KOI=kinaseOI)
}
