# =========================================================================
# MODULE 1: Ensembl to Gene Ontology (GO) Mapping
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: R Dataframes / Tabular Annotation Files
# Description: Databases like Ensembl provide vast annotation tables linking 
#              gene IDs to specific GO terms. GO is divided into three 
#              ontologies: Molecular Function (MF), Cellular Component (CC), 
#              and Biological Process (BP).
# 
# 🔍 REAL WORLD APPLICATION:
# After running DESeq2, you map your significant Ensembl IDs to the CC 
# ontology to discover if your differentially expressed genes are primarily 
# localized to the nucleus, cytoplasm, or extracellular space.
# =========================================================================

library(dplyr)

cat("\n--- Mapping Ensembl IDs to Gene Ontology Terms ---\n")

# Mock dataset representing an Ensembl annotation database
ensembl_annots <- data.frame(
  ENSEMBL = rep("ENSG00000143322", 6),
  GO = c("GO:0005515", "GO:0005524", "GO:0030145", "GO:0051015", "GO:0005829", "GO:0015629"),
  EVIDENCE = c("IPI", "IEA", "IDA", "TAS", "TAS", "TAS"),
  ONTOLOGY = c("MF", "MF", "MF", "MF", "CC", "CC")
)

target_gene <- "ENSG00000143322"

cat("\nExtracting Molecular Function (MF) Terms:\n")
ensembl_mf <- ensembl_annots %>% 
  filter(ENSEMBL == target_gene & ONTOLOGY == "MF")
print(ensembl_mf)

cat("\nExtracting Cellular Component (CC) Terms:\n")
ensembl_cc <- ensembl_annots %>% 
  filter(ENSEMBL == target_gene & ONTOLOGY == "CC")
print(ensembl_cc)
