# =========================================================================
# MODULE 2: InterPro Domain Mining & Text Normalization
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: R Dataframes / InterPro Database Exports
# Description: InterPro provides functional analysis of proteins by classifying 
#              them into families and predicting the presence of domains 
#              (e.g., Kinase, Zinc Finger, Phosphatase).
# 
# 🔍 REAL WORLD APPLICATION:
# Normalizing annotation text to accurately count the recurrence of kinase 
# or SH2 domains across a gene list, indicating a heavy involvement in 
# cellular phosphorylation and signal transduction pathways.
# =========================================================================

library(dplyr)
library(stringr)

cat("\n--- Mining Conserved Protein Domains ---\n")

# Mock dataset of raw, unnormalized InterPro annotations
domain_data <- data.frame(
  Gene = c("GeneA", "GeneB", "GeneC", "GeneD", "GeneE"),
  Interpro_Description = c("Protein-tyrosine phosphatase ", 
                           "  Zinc finger, C2H2 type", 
                           "protein-tyrosine phosphatase", 
                           "SH2 domain", 
                           "  zinc finger, c2h2 type  ")
)

# Phase 1: Text Normalization (Critical for accurate grouping)
clean_domains <- domain_data %>%
  mutate(
    Clean_Description = str_trim(Interpro_Description),
    Clean_Description = str_to_title(Clean_Description) # Capitalize first letters consistently
  )

cat("\nNormalized Domain Data:\n")
print(clean_domains)

# Phase 2: Counting Domain Frequency
domain_counts <- clean_domains %>%
  count(Clean_Description, name = "Frequency") %>%
  arrange(desc(Frequency))

cat("\nMost Common Functional Domains:\n")
print(domain_counts)
