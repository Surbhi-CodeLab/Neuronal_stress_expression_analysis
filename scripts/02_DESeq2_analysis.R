#################################################
# RNA-seq Differential Expression Analysis of Neurons Under Stress
# Tool: DESeq2
# Project: neuronal_stress_expression
# Author: Surbhi Yadav
#################################################

rm(list = ls())
graphics.off()

cat("DESeq2 Analysis Started\n")
#setwd
cat("Working directory:", getwd(), "\n")

# Path setup
RAW_DATA <- "data/raw"
PROCESSED_DATA <- "data/processed"
RESULTS <- "results"
FIGURES <- file.path(RESULTS, "figures")
TABLES <- file.path(RESULTS, "tables")

dir.create(RESULTS, showWarnings = FALSE)
dir.create(FIGURES, showWarnings = FALSE)
dir.create(TABLES, showWarnings = FALSE)

cat("Directories checked\n")


# Load libraries
library(DESeq2)
library(ggplot2)
library(pheatmap)
library(EnhancedVolcano)

cat("Libraries loaded successfully\n")


# Load count data
counts <- read.csv(
  file.path(PROCESSED_DATA, "counts_for_DESeq2.csv"),
  row.names = 1,
  check.names = FALSE
)

cat("Counts matrix loaded\n")
print(dim(counts))
print(head(counts)[,1:3])


# Sample metadata
sample_info <- data.frame(
  row.names = colnames(counts),
  condition = c(rep("sleep", 3), rep("stress", 3))
)

print(sample_info)

# DESeq2 object
dds <- DESeqDataSetFromMatrix(
  countData = counts,
  colData = sample_info,
  design = ~ condition
)

dds <- dds[rowSums(counts(dds)) > 10, ]
dds <- DESeq(dds)

cat("DESeq2 model done\n")

res <- results(dds, contrast = c("condition", "stress", "sleep"))
print(summary(res))

# log2FC-based filtering
res_df <- as.data.frame(res)
res_df$gene <- rownames(res_df)

log2fc_sig <- res_df[
  abs(res_df$log2FoldChange) >= 1 & res_df$padj < 0.05,
]

log2fc_sig <- log2fc_sig[
  order(log2fc_sig$log2FoldChange, decreasing = TRUE),
]

cat("Significant genes identified:", nrow(log2fc_sig), "\n")

# Save DE results
write.csv(
  log2fc_sig,
  file.path(TABLES, "log2FC_DESeq2_stress_genes.csv"),
  row.names = FALSE
)

cat("DESeq2 results saved\n")

# Volcano plot 
volcano <- ggplot(res_df, aes(x = log2FoldChange, y = -log10(padj))) +
  geom_point(alpha = 0.5) +
  geom_vline(xintercept = c(-1,1), linetype = "dashed", color = "red") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "red") +
  theme_minimal() +
  labs(
    title = "Volcano Plot: Stress vs Sleep Neurons",
    x = "log2 Fold Change",
    y = "-log10 Adjusted P-value"
  )

ggsave(
  filename = file.path(FIGURES, "volcano_plot_DESeq2.png"),
  plot = volcano,
  width = 6,
  height = 5
)

cat("Volcano plot saved\n")

# MA plot
png(file.path(FIGURES, "MA_plot_DESeq2.png"), width = 800, height = 600)
plotMA(res, ylim = c(-4,4))
dev.off()

cat("MA plot saved\n")

# Heatmap
top_genes <- head(log2fc_sig$gene, 30)

vsd <- vst(dds)
mat <- assay(vsd)[top_genes, ]

png(file.path(FIGURES, "heatmap_top_genes_DESeq2.png"), width = 900, height = 800)
pheatmap(
  mat,
  scale = "row",
  clustering_distance_rows = "correlation",
  main = "Top Stress-Responsive Genes (DESeq2)"
)
dev.off()

cat("Heatmap saved\n")

# log2FC distribution
fc_plot <- ggplot(log2fc_sig, aes(x = log2FoldChange)) +
  geom_histogram(bins = 50, fill = "steelblue") +
  theme_minimal() +
  labs(
    title = "Distribution of Significant log2 Fold Changes",
    x = "log2 Fold Change",
    y = "Gene Count"
  )

ggsave(
  filename = file.path(FIGURES, "log2FC_distribution_R.png"),
  plot = fc_plot,
  width = 6,
  height = 5
)

cat("log2FC distribution plot saved\n")

cat("DESeq2 Analysis Completed Successfully\n")
