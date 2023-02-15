---
title: "Upregulated vs Downregulated Genes and Organisms"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# This script will allow us to plot the transcriptomic data associated with the published manuscript

```{r}
library("primerTree")
library("gridExtra")
library("directlabels")
library("phyloseq")
library("ggplot2")
library("readxl")  
library("dplyr")
library("tibble")
```

# Read in taxonomic summaries:
```{r}
Upregulated_totals <- read_excel("Taxonomic.blast.summary_up&down_mike.xlsx", sheet = "Upregulated Totals")
Downregulated_totals <- read_excel("Taxonomic.blast.summary_up&down_mike.xlsx", sheet = "Downregulated Totals")
Euk_up_totals <- read_excel("Taxonomic.blast.summary_up&down_mike.xlsx", sheet = "Eukaryotic Genus Breakdown Up")
Euk_dn_totals <- read_excel("Taxonomic.blast.summary_up&down_mike.xlsx", sheet = "Eukaryotic Genus Breakdown Down")
```

# Count transcript data by up and downregulation in Genus, Family, and Order:
```{r}
Upregulated_totals <- transform(Upregulated_totals,
                           Upregulated = reorder(Upregulated, -numbers))
Downregulated_totals <- transform(Downregulated_totals,
                           Downregulated = reorder(Downregulated, -numbers))
Euk_up_totals <- transform(Euk_up_totals,
                           Genus = reorder(Genus, -Count))
Euk_up_totals <- transform(Euk_up_totals,
                           Order = reorder(Order, -Count))
Euk_up_totals <- transform(Euk_up_totals,
                           Family = reorder(Family, -Count))
Euk_dn_totals <- transform(Euk_dn_totals,
                           Genus = reorder(Genus, -Count))
Euk_dn_totals <- transform(Euk_dn_totals,
                           Order = reorder(Order, -Count))
Euk_dn_totals <- transform(Euk_dn_totals,
                           Family = reorder(Family, -Count))
```

# Plots:
```{r}
ggplot(Euk_up_totals, aes(x = Genus, y=Percentage, fill = Genus))+
  geom_col(stat="count")+
  theme(axis.text.x=element_text(angle = 55, hjust=1, size = 13))+
  theme(axis.text.y=element_text(size = 13))+
  theme(axis.title.x=element_text(size=14))+
  theme(axis.title.y=element_text(size=14))+
  labs(title = "Percent of Unique Protein Reads (Upregulated) Ranked by Eukaryotic Genus")

ggplot(Euk_up_totals, aes(x = Order, y=Percentage, fill = Order))+
  geom_col(stat="count")+
  theme(axis.text.x=element_text(angle = 55, hjust=1, size = 13))+
  theme(axis.text.y=element_text(size = 13))+
  theme(axis.title.x=element_text(size=14))+
  theme(axis.title.y=element_text(size=14))+
  labs(title = "Percent of Unique Protein Reads (Upregulated) Ranked by Eukaryotic Order")

ggplot(Euk_dn_totals, aes(x = Genus, y=Percentage, fill = Genus))+
  geom_col(stat="count")+
  theme(axis.text.x=element_text(angle = 55, hjust=1, size = 8.5), legend.box.margin = margin(1, 0, 0, 1, "cm"))+
  theme(axis.text.y=element_text(size = 13))+
  theme(axis.title.x=element_text(size=14))+
  theme(axis.title.y=element_text(size=14))+
  labs(title = "Percent of Unique Protein Reads (Downregulated) Ranked by Eukaryotic Genus")

ggplot(Euk_dn_totals, aes(x = Order, y=Percentage, fill = Order))+
  geom_col(stat="count")+
  theme(axis.text.x=element_text(angle = 55, hjust=1))+
  labs(title = "Percent of Unique Protein Reads (Downregulated) Ranked by Eukaryotic Order")

ggplot(Euk_up_totals, aes(x = Family, y=Percentage, fill = Family))+
  geom_col(stat="count")+
  theme(axis.text.x=element_text(angle = 55, hjust=1))+
  labs(title = "Percent of Unique Protein Reads (Upregulated) Ranked by Eukaryotic Family")

ggplot(Euk_dn_totals, aes(x = Family, y=Percentage, fill = Family))+
  geom_col(stat="count")+
  theme(axis.text.x=element_text(angle = 55, hjust=1))+
  labs(title = "Percent of Unique Protein Reads (Downregulated) Ranked by Eukaryotic Family")

ggplot(Upregulated_totals, aes(x = Upregulated, y=numbers, fill = Upregulated))+
  geom_col(stat="count")+
  theme(axis.text.x=element_text(angle = 55, hjust=1, size = 13))+
  theme(axis.text.y=element_text(size = 13))+
  theme(axis.title.x=element_text(size=14))+
  theme(axis.title.y=element_text(size=14))+
  scale_y_continuous(trans='log10')+
  labs(title = "Unique Upregulated Protein Reads Categorized by Domain", size = 20)

ggplot(Downregulated_totals, aes(x = Downregulated, y=numbers, fill = Downregulated))+
  geom_col(stat="count")+
  theme(axis.text.x=element_text(angle = 55, hjust=1, size = 13))+
   theme(axis.text.y=element_text(size = 13))+
  theme(axis.title.x=element_text(size=14))+
  theme(axis.title.y=element_text(size=14))+
  scale_y_continuous(trans='log10')+
  labs(title = "Unique Downregulated Protein Reads Categorized by Domain")
```

