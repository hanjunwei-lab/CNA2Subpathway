# CNA2Subpathway
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