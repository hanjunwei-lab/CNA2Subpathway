# CNA2Subpathway

 A software R package for identification of dysfunctional subpathways driven by somatic Copy Number Alterations
 
> A computing tool is developed to identify dysfunctional subpathways driven by somatic copy number alterations (CNAs) in cancer through integrating multi-omics data, pathway topology information, and subpathway crosstalk network. The operation modes including: i) discretize the CNAs profile based on the CNAs status to a binary matrix. ii) evaluation the gene differentially expressed level between CNA labels. iii) construct a weighted subpathway crosstalk network, calculate the centrality scores of subpathways by a random walk algorithm and a bootstrap-based randomization method is used to identify statistical significance dysregulated subpathways driven by CNAs in cancer.


# how to install
> Installation method：
```
1. library(devtools); 
   install_github("hanjunwei-lab/CNA2Subpathway")
2. install.packages("CNA2Subpathway")
Use：
library(CNA2Subpathway)
```

# Please cite the following article when using CNA2Subpathway:
> Waiting for publication

