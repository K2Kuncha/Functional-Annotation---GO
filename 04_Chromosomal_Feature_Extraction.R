# =========================================================================
# MODULE 4: Chromosomal Feature Extraction
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: Genomic mapping datasets.
# Description: Cross-referencing physical genomic coordinates (Chromosomes) 
#              with functional annotations (GO descriptions).
# 
# 🔍 REAL WORLD APPLICATION:
# Identifying spatial clusters of genes with similar functions. For example, 
# extracting all UniProt IDs mapped to Chromosome 16 that specifically 
# possess "transferase activity".
# =========================================================================

library(dplyr)
library(stringr)

cat("\n--- Extracting Chromosome-Specific Functional Features ---\n")

# Mock genome annotation dataset
genome_annots <- data.frame(
  uniprot_gn_id = c("E9PDK2", "A0A0A0MSC7", "Q96N66", "E2QRG9", "P12345"),
  chromosome_name = c("16", "16", "4", "16", "X"),
  goslim_goa_description = c("transferase activity", "Methyltransferase activity", 
                             "kinase activity", "transferase activity, transferring groups",
                             "structural molecule activity")
)

# Filter for Chromosome 16 AND any description containing "transferase activity"
transferase_chr16 <- genome_annots %>%
  filter(chromosome_name == "16") %>%
  filter(str_detect(regex("transferase activity", ignore_case = TRUE), goslim_goa_description) | 
         str_detect(goslim_goa_description, regex("transferase activity", ignore_case = TRUE))) %>%
  filter(!is.na(uniprot_gn_id)) %>%
  distinct(uniprot_gn_id)

cat("\nUniProt IDs of Transferase Genes on Chromosome 16:\n")
print(transferase_chr16)
