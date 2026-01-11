gene_data <- data.frame(
  gene = c("BRCA1", "TP53", "EGFR", "MYC", "KRAS", "CDK2", "VEGFA"),
  log2FoldChange = c(1.8, -2.1, 0.9, 2.5, -1.4, 1.2, -2.0),
  pvalue = c(0.0004, 0.00001, 0.03, 0.0002, 0.004, 0.02, 0.0006),
  padj = c(0.002, 0.0003, 0.06, 0.001, 0.01, 0.04, 0.003)
)
write.csv(gene_data, "data/gene_expression.csv", row.names = FALSE)


