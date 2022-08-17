library("phyloseq")
library("ggplot2")      # graphics
library("readxl")       # necessary to import the data from Excel file
library("dplyr")        # filter and reformat data frames
library("tibble")       # Needed for converting column to row names

otu_mat<- read_excel("phyloseq_ITS_spacial.xlsx", sheet = "OTU")
tax_mat<- read_excel("phyloseq_ITS_spacial.xlsx", sheet = "Taxonomy")
samples_df <- read_excel("phyloseq_ITS_spacial.xlsx", sheet = "Samples")

#define row names from OTU columns
otu_mat <- otu_mat %>%
  tibble::column_to_rownames("OTU") 

tax_mat <- tax_mat %>% 
  tibble::column_to_rownames("OTU")

samples_df <- samples_df %>% 
  tibble::column_to_rownames("sample") 

#transform into matrixes
otu_mat <- as.matrix(otu_mat)
tax_mat <- as.matrix(tax_mat)

#transform into phyloseq objects
OTU = otu_table(otu_mat, taxa_are_rows = TRUE)
TAX = tax_table(tax_mat)
Samples = sample_data(samples_df)

carbom <- phyloseq(OTU, TAX, Samples)
carbom

carbom.ord <- ordinate(carbom, "NMDS", "bray")
plot_ordination(carbom, carbom.ord, color="Site", label = "Site",
                title="OTU") +  
  geom_point(size=3)

plot_ordination(carbom, carbom.ord, type="split", color="Genus", 
                title="biplot", label = "Site") +  
  geom_point(size=3)

plot_net(carbom, distance = "(A+B-2*J)/(A+B)", type = "taxa", 
         maxdist = 0.7, color="Phylum", point_label="Phylum")
