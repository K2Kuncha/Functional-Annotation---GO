# 🧬 Functional Annotation & Gene Ontology (GO) Mining

### 📌 About This Repository
Identifying differentially expressed genes or genomic variants is only the first step in a bioinformatics pipeline. To derive true biological meaning, researchers must map these identifiers to functional databases to understand their molecular mechanisms, cellular localization, and evolutionary conservation.

This repository demonstrates data mining and text normalization techniques used to query Gene Ontology (GO) and InterPro databases, transforming abstract Ensembl and UniProt IDs into actionable biological insights.

### 🎯 Objective
To establish reproducible R scripts for mapping gene identifiers to functional annotations, analyzing domain enrichment, and extracting chromosome-specific functional features.

### 🛠️ Core Technologies & Libraries
* **Data Wrangling:** `tidyverse` (`dplyr`, `stringr`)
* **Functional Databases (Concepts Applied):** Gene Ontology (GO), InterPro, UniProt, Ensembl

### 📂 Modules Included
1. **Ensembl to GO Mapping:** Extracting Cellular Component (CC) and Molecular Function (MF) terms for specific Ensembl gene IDs to determine intracellular localization.
2. **InterPro Domain Mining:** Normalizing text and analyzing protein domains (e.g., Phosphatases, Zinc Fingers, SH2 domains) to infer signal transduction and transcriptional regulation roles.
3. **GO Enrichment Analysis:** Evaluating statistical enrichment of broad functional categories like "Catalytic Activity" or "DNA Binding" within a target gene set.
4. **Chromosomal Feature Extraction:** Cross-referencing functional descriptions (e.g., "transferase activity") with genomic coordinates to map specific enzyme families to individual chromosomes.
