# CNA2Subpathway
<<<<<<< HEAD
Identify dysfunctional subpathways driven by somatic copy number alterations (CNAs). we first construct a weighted subpathway crosstalk network. the weights of the network consider both the crosstalk relationship of the biological functions performed among those subpathways and the differential expression extent of genes influenced by the CNAs. Next, we calculate the centrality scores of subpathways by a random walk algorithm on the network, which reflect the extent of subpathways influenced by the somatic CNAs and subpathways crosstalk. Finally, a bootstrap-based randomization method is used to calculate the statistical significance of the scores.
=======
> Identification of dysregulated subpathway driven by Copy Number Alterations(CNA).We first integrated CNA and gene expression data to calculate CNADEscore for each gene in cancer.Secondly,we construct a subpathway network based on the biological function relationship between subpathways,and the weight of this network regulated by the CNADEscore.Finally,we use an eigenvector centrality measure to determine the significance of a subpathway,and the statistical significance of these subpathways is assessed using a bootstrap-based randomization method.



### how to install

Install the **development version** from Github:

```R
Installation method：

1. library(devtools); 
   install_github("hanjunwei-lab/CNA2Subpathway")
2. install.packages("CNA2Subpathway")

Use：
library(CNA2Subpathway)
```

Please cite the following article when using `CNA2Subpathway`:

> Waiting for publication......
>>>>>>> e8dc07579b12b301197d5e711961ae3fe2c42afb
