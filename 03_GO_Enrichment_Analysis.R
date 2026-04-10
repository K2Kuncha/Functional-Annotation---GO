# =========================================================================
# MODULE 3: GO Enrichment Evaluation
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: Summary statistical outputs from enrichment tools (e.g., clusterProfiler)
# Description: Evaluates whether a specific functional category (like 
#              "DNA Binding") appears in a gene list more frequently than 
#              would be expected by random chance (indicated by p-value).
# 
# 🔍 REAL WORLD APPLICATION:
# Interpreting pathway enrichment. For example, high enrichment in "Catalytic 
# Activity" indicates the target genes are heavily involved in facilitating 
# biochemical reactions.
# =========================================================================

library(dplyr)

cat("\n--- Evaluating GO Pathway Enrichment ---\n")

# Mock output from a GO Enrichment Analysis
enrichment_results <- data.frame(
  GO_Category = c("Catalytic Activity", "DNA Binding", "Extracellular Region", "Apoptosis"),
  Gene_Count = c(145, 89, 42, 12),
  P_Value = c(0.0001, 0.008, 0.045, 0.35)
)

# Filter for statistically significant pathways (p < 0.01)
significant_pathways <- enrichment_results %>%
  filter(P_Value < 0.01) %>%
  arrange(P_Value)

cat("\nHighly Enriched Pathways (p < 0.01):\n")
print(significant_pathways)
