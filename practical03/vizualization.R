# loading libraries =>

library(ggplot2)
library(tidyverse)

# loading data=>
data <- read.csv("data/gene_expression.csv")

head(data)
str(data)

# making scatter plot =>
scatter_plot <- ggplot(data, aes(x = log2FoldChange, y= -log10(pvalue)))+
  geom_point(color = "steelblue" , alpha = 0.7 , size = 3) +
  theme_bw()+
  labs(
    title = "Gene Expression scatter Plot",
    x = "Log2 Fold change",
    y = "-Log10(p-value)"
 )
scatter_plot

# Save scatter plot

ggsave("plots/scatter_plot.png", scatter_plot, width =6, height = 5, dpi = 300)

# box plot =>

box_plot <- ggplot(data, aes(y = log2FoldChange)) +
  geom_boxplot(fill = "lightblue") +
  theme_minimal() +
  labs(
    title = "Distribution of Log2 Fold Change",
    y = "Log2 Fold Change"
  )

box_plot
ggsave("plots/boxplot.png", box_plot, width = 5, height = 5, dpi = 300)

# volcano plot=>
data <- data %>%
  mutate(Significant = padj < 0.05)

# create volcano plot =>
volcano_plot <- ggplot(
  data,
  aes(x = log2FoldChange, y = -log10(padj), color = Significant)
) +
  geom_point(alpha = 0.8, size = 3) +
  scale_color_manual(values = c("grey60", "red")) +
  theme_classic() +
  labs(
    title = "Volcano Plot of Differentially Expressed Genes",
    x = "Log2 Fold Change",
    y = "-Log10 Adjusted P-value",
    color = "Significant"
  )

volcano_plot

ggsave("plots/volcano_plot.png", volcano_plot, width = 6, height = 5, dpi = 300)

















  