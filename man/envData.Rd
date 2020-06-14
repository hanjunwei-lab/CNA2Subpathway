\name{envData}
\alias{envData}
\alias{ampGene}
\alias{delGene}
\alias{CNAlabelresult}
\alias{GEP}
\alias{CNAP}
\alias{GoInfo}
\alias{SubPathwayInfo}
\alias{GoSubPconGene}
\alias{Jaccardscore}
\alias{CNADEscore}
\alias{SubpathwayCNAresult}
\alias{SubPathwaymapdata}
\docType{data}

\title{
The variables in the environment include an copy number variation data, amplified genes,deleted genes, an example expression profile, A matrix of subpathway infomation, Biological functions data, Jaccard coefficient of the network point, Overlapping genes of the network point, A list of subpathway map infomation, A binary matrix of CNA profile, A matric of CNADEscor, Optimized subpathway, and the statistical significance p value and FDR for these optimal subpathways
}
\description{
Identification of dysregulated subpathways driven by Copy Number aberrations(CNA). We firstly calculate the CNADEscore by copy number aberration and gene expression. Secondly, we constructing subpathways network that implicitly links subpathways through their common function and weight of the network based on the CNADEscore. Finally, we calculate an eigenvector centrality and the statistical signiﬁcance of these subpathways is assessed using a bootstrap-based randomization method.
}

\details{
The environment variable includes the variable \code{ampGene}, \code{delGene},\code{CNAlabelresult},\code{GEP},\code{CNAP},\code{GoInfo},\code{SubPathwayInfo},\code{GoSubPconGene},\code{Jaccardscore},\code{SubPathwaymapdata},\code{CNAlabelresult},\code{SubpathwayCNAresult},
}

\format{An environment variable}
\author{Junwei Han\email{hanjunwei1981@163.com},Yuqi Sheng\email{sheng_yuqi@163.com}, Baotong Zheng\email{btzheng1116@163.com}}

\keyword{data}
