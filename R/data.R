#' @title KinaseFamily
#'
#' @description A summary table of kinase family
#'
#' @usage data(KinaseFamily)
#'
#' @format An object of class \code{matrix} (inherits from \code{array})
#' with 425 rows and 6 columns.
#'
#' @name KinaseFamily
#' @docType data
#'
"KinaseFamily"


#' @title List of human kinase motifs
#'
#' @description A list of human kinase motifs and their sequence probability
#' matrix.
#'
#' @usage data(KinaseMotifs)
#'
#' @name motif.human.list
#' @docType data
#'
#'
"motif.human.list"

#' @title List of mouse kinase motifs
#'
#' @description A list of mouse kinase motifs and their sequence probability
#' matrix.
#'
#' @usage data(KinaseMotifs)
#'
#'
#'
#' @name motif.mouse.list
#' @docType data
#'
#'
"motif.mouse.list"


#' @title List of rat kinase motifs
#'
#' @description A list of rat kinase motifs and their sequence probability
#' matrix.
#'
#' @usage data(KinaseMotifs)
#'
#' @name motif.rat.list
#' @docType data
#'
#'
"motif.rat.list"



#' @title phospho.cells.Ins
#'
#' @description A subset of phosphoproteomics dataset generated by 
#' Humphrey et al., [doi:10.1038/nbt.3327] from two mouse liver cell lines 
#' (Hepa1.6 and FL38B) that were treated with either PBS (mock) or insulin.
#'
#' @usage data(phospho.cells.Ins.sample)
#'
#' @source doi: 10.1038/nbt.3327 (PXD001792)
#'
#' @references Humphrey et al., 2015, doi: 10.1038/nbt.3327
#'
#' @name phospho.cells.Ins
#'
#' @format An object of class \code{matrix} (inherits from \code{array})
#' with 49617 rows and 24 columns.
#'
#' @docType data
"phospho.cells.Ins"




#' @title phospho_liverInsTC_RUV_sample
#'
#' @description A subset of phosphoproteomics dataset integrated from two
#' time-course datasets of early and intermediate insulin signalling in mouse
#' liver upon insulin stimulation.
#'
#'
#' @usage data(phospho_liverInsTC_RUV_sample)
#'
#' @source PRIDE accesion number: PXD001792
#'
#' @references Humphrey et al., 2015
#'
#' @format An object of class \code{matrix} (inherits from \code{array})
#' with 5000 rows and 90 columns.
#'
#' @name phospho.liver.Ins.TC.ratio.RUV
#' @docType data
"phospho.liver.Ins.TC.ratio.RUV"



#' @title phospho.L6.ratio
#'
#' @description An L6 myotube phosphoproteome dataset
#' (accession number: PXD019127).
#'
#' @usage data(phospho_L6_ratio)
#'
#' @source PRIDE accesion number: PXD001792
#'
#' @format An object of class \code{matrix} (inherits from \code{array})
#' with 6660 rows and 12 columns.
#'
#' @name phospho.L6.ratio
#' @docType data
"phospho.L6.ratio"


#' @title PhosphoSitePlus annotations for human
#'
#' @description The data object contains the annotations of kinases and their
#' conrresponding substrates as phosphorylation sites in human.
#' It is extracted from the PhosphoSitePlus database.
#' For details of PhosphoSitePlus, please refer to the article:
#' Hornbeck et al. Nucleic Acids Res. 40:D261-70, 2012
#'
#'
#' @usage data(PhosphoSitePlus)
#'
#' @source \url{https://www.phosphosite.org}
#'
#' @name PhosphoSite.human
#' @docType data
"PhosphoSite.human"


#' @title PhosphoSitePlus annotations for mouse
#'
#' @description The data object contains the annotations of kinases and their
#' conrresponding substrates as phosphorylation sites in mouse.
#' It is extracted from the PhosphoSitePlus database.
#' For details of PhosphoSitePlus, please refer to the article:
#' Hornbeck et al. Nucleic Acids Res. 40:D261-70, 2012
#'
#' @usage data(PhosphoSitePlus)
#'
#' @source \url{https://www.phosphosite.org}
#'
#' @name PhosphoSite.mouse
#' @docType data
"PhosphoSite.mouse"


#' @title PhosphoSitePlus annotations for rat
#'
#' @description The data object contains the annotations of kinases and their
#' conrresponding substrates as phosphorylation sites in rat.
#' It is extracted from the PhosphoSitePlus database.
#' For details of PhosphoSitePlus, please refer to the article:
#' Hornbeck et al. Nucleic Acids Res. 40:D261-70, 2012
#'
#' @usage data(PhosphoSitePlus)
#'
#' @source \url{https://www.phosphosite.org}
#'
#' @name PhosphoSite.rat
#' @docType data
"PhosphoSite.rat"



#' @title A list of Stably Phosphorylated Sites (SPSs)
#'
#' @description A list of stably phosphoryalted sites defined from a panel of
#' phosphoproteomics datasets. For full list of the datasets used,
#' please refer to our preprint for the full list.
#'
#' @usage data(SPSs)
#'
#' @name SPSs
#' @docType data
"SPSs"
