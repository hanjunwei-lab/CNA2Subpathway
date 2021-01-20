# CNA2Subpathway

 A software R package for identification of dysfunctional subpathways driven by somatic Copy Number Alterations
 
> A computing tool is developed to identify dysfunctional subpathways driven by somatic copy number alterations (CNAs) in cancer through integrating multi-omics data, pathway topology information, and subpathway crosstalk network. The operation modes including: i) discretize the CNAs profile based on the CNAs status to a binary matrix. ii) evaluation the gene differentially expressed level between CNA labels. iii) construct a weighted subpathway crosstalk network, calculate the centrality scores of subpathways by a random walk algorithm and a bootstrap-based randomization method is used to identify statistical significance dysregulated subpathways driven by CNAs in cancer.


# how to install
> Installation method：
```
1. library(devtools); 
   install_github("hanjunwei-lab/CNA2Subpathway", build_vignettes = TRUE)
2. ##install dependency package "discover"(https://github.com/NKI-CCB/DISCOVER.git)
   options(repos=c(getOption("repos"), "http://ccb.nki.nl/software/discover/repos/r"));
   install.packages("discover");
3. install.packages("CNA2Subpathway")
Use：
library(CNA2Subpathway)
```

# Please cite the following article when using CNA2Subpathway:
> Sheng Y, Jiang Y, Yang Y, Li X, Qiu J, Wu J, Cheng L, Han J. CNA2Subpathway: identification of dysregulated subpathway driven by copy number alterations in cancer. Brief Bioinform. 2021 Jan 11:bbaa413. doi: 10.1093/bib/bbaa413. Epub ahead of print. PMID: 33423051.

