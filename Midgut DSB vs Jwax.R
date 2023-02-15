---
title: "Midgut DSB vs Jwax"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# This script will allow us to read in the DESeq data used in the manuscript

```{r}
library(readxl)
library(ggplot2)
library(dplyr)
```

# Import DESeq and annotation data:
```{r}
denovo_DEG_3methods_DSBvsJwax <- read_excel("denovo_DEG_3methods.DSBvsJwax.xlsx")
View(denovo_DEG_3methods_DSBvsJwax)
```

# Basic ggplots:
```{r}
ggplot(denovo_DEG_3methods_DSBvsJwax[1:20,], aes(x = reorder(gene_id, -fc), y = fc, fill = taxonomic_super_kingdom)) + 
  geom_col(stat = "identity")+
  theme(axis.text.x=element_text(angle = 55, hjust=1))+
  ggtitle(paste("Genes most frequently discovered in DSB compared to Jwax"), subtitle = "Taxonomic kingdom ranked by foldchange")

ggplot(denovo_DEG_3methods_DSBvsJwax[1:20,], aes(x = reorder(gene_id, -fc), y = fc, fill = species)) + 
  geom_col(stat = "identity")+
  theme(axis.text.x=element_text(angle = 55, hjust=1))+
  ggtitle(paste("Genes most frequently discovered in DSB compared to Jwax"), subtitle = "Species ranked by foldchange")
```
