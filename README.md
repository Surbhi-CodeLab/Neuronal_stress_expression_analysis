# Neuronal Stress–Associated Gene Expression Analysis Using Python and R 

## 📌 Project Overview
This project focuses on the **analysis of neuronal stress–associated gene expression changes** using publicly available transcriptomic data. The central aim is to understand how neurons respond at the molecular level under stress conditions that are relevant to **neurodegeneration, neuronal injury, and impaired plasticity**.
Rather than being a purely academic exercise, this project was designed as a **research-oriented, reproducible bioinformatics workflow** that mirrors how real computational neuroscience and molecular biology studies are performed.

---

## 🎯 Why I Created This Project

I created this project for **three interconnected reasons**:

### 1. Alignment with My Research Interests

I am deeply interested in:

* **Neuroscience and neurodegeneration**
* **Stress responses in neurons**
* **Molecular mechanisms underlying neuronal dysfunction**
* **Computational analysis of biological data (bioinformatics)**

Neuronal stress is a **common underlying factor** in disorders such as Alzheimer’s disease, Parkinson’s disease, ALS, and other neurodegenerative conditions. Studying stress-responsive genes provides insight into:

* Early molecular warning signals
* Adaptive vs maladaptive cellular responses
* Potential therapeutic targets

This project acts as a **bridge between wet-lab neuroscience concepts and dry-lab computational analysis**.

---

### 2. Moving Beyond "Student-Level" Projects

Instead of using artificial or toy datasets, I deliberately chose:

* **Real experimental data**
* **Biologically meaningful contrasts**
* The data use here is from a Preprint Journal Article.

The goal was to develop a project that:
* Can be reproduced or validated by others
* Reflects how real scientists analyze transcriptomic data

---

### 3. Skill Development with Scientific Depth

Through this project, I wanted to simultaneously strengthen:

* Biological reasoning
* Data handling and preprocessing
* Statistical thinking
* Visualization and interpretation
* Scientific communication

---

## 🧬 Biological Background

### What Is Neuronal Stress?

Neuronal stress refers to a condition where neurons experience **physiological or pathological challenges** such as:

* Oxidative stress
* ER stress
* Mitochondrial dysfunction
* Excitotoxicity
* Protein misfolding

Because neurons are **post-mitotic cells**, they cannot dilute damage through cell division, making them particularly vulnerable.

---

### Why Study Gene Expression Under Stress?

Gene expression changes:

* Represent the **cell’s immediate response** to stress
* Reveal activation of protective pathways (e.g., heat shock proteins)
* Reveal failure pathways leading to apoptosis or degeneration

By analyzing **differentially expressed genes**, we can infer:

* Which pathways are activated or suppressed
* Whether neurons attempt recovery or enter degeneration

---

## 📊 Dataset Description

### Source of Data

The dataset used in this project was obtained from a **public transcriptomics data (NCBI Gene Expression Omnibus – GEO)**.

* Organism: *Mus musculus* (as per dataset)
* Tissue/Cell type: Neuronal / brain-related samples
* Experimental condition: Stress (Sleep-deprived) vs control (Normal Sleep)
* Data type: RNA-seq / microarray (as applicable)

📎 *Original research article and dataset accession ID are cited below at the end.*
---

### Why This Dataset?

This dataset was selected because:

* It models **neuronal stress conditions relevant to disease**
* It contains **biological replicates**, enabling statistical analysis
* It has been **peer-reviewed and published**, ensuring reliability

---

## 🛠️ Methodology Overview

### 1. Data Organization

* Raw data stored separately from processed data
* Clear directory structure to ensure reproducibility

### 2. Preprocessing

* Quality checking
* Normalization of expression values
* Removal of low-expression genes

### 3. Differential Expression Analysis

* Comparison between stressed vs control neuronal samples
* Statistical testing to identify significantly altered genes

### 4. Visualization

* Volcano plots
* Expression distribution plots
* Heatmaps of key genes

---

## 📈 Example Outputs

Below are representative plots generated during the analysis:

* Differential expression volcano plot
* Expression heatmap of stress-responsive genes
* Boxplots showing expression differences

📷 *(Plots are included in the `results/figures` folder)*

---

## 📂 Project Structure

```text
Neuronal_stress_expression_analysis/
│
├── data/raw/          # Original unmodified dataset
├── data/processed/    # Cleaned and normalized data
├── scripts/           # R scripts used for analysis
├── noteboooks/        # python jupyter notebook used for analysis
├── results/figures/   # Generated figures and visualizations
├── results/table      # Summary tables and outputs
└── README.md          # Project documentation
```

---

## ▶️ How to Use This Project
### Steps to Run

1. Clone the repository
2. Navigate to the main project directory
3. Install dependencies
4. Run analysis scripts in order

```bash
git clone <[https://github.com/Surbhi-CodeLab/Neuronal_stress_expression_analysis/tree/main]>
cd Neuronal_stress_expression_analysis
pip install -r requirements.txt
```

All paths are **relative**, so the project can be run on any system.

---

## 📚 What I Learned from This Project

### Scientific Understanding

* How neurons transcriptionally respond to stress
* Interpretation of stress-induced gene expression patterns
* Biological relevance of upregulated vs downregulated genes

### Technical Skills

* Handling real biological datasets
* Structuring reproducible bioinformatics projects
* Generating publication-quality plots
---

## 📖 References

1. Original dataset source: NCBI GEO (Accession ID:GSE283582)
2. Research article:
   Yamazaki S, Valekunja UK, Chen-Roetling J, Reddy AB. Heat Shock Factor 1 Governs Sleep-Wake Cycles Across Species. bioRxiv [Preprint]. 2024 Nov 17:2024.11.15.623879. doi: 10.1101/2024.11.15.623879. PMID: 39605613; PMCID: PMC11601485.

(All data used complies with public data usage guidelines.)

---

## ✨ Final Note
Thank you for checking out this mini-project!
If you are interested in extending or discussing this work, feel free to connect. 
Feedbacks are always welcome ! 

*Author - Surbhi Yadav* 
