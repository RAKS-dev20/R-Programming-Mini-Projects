# Gene Expression Data Cleaning
# Author: Raksha Devi

## Read data=>
gene_data <- read.csv("data/gene_expression.csv")

## Inspect data=>
str(gene_data)
summary(gene_data)

## handling missing values=>
gene_data$Expression <- as.numeric(gene_data$Expression)
gene_data$Expression[is.na(gene_data$Expression)] <-
  mean(gene_data$Expression, na.rm = TRUE)

## Convert Condition to factor
gene_data$Condition <- as.factor(gene_data$Condition)

## Filter highly expressed genes
high_exp <- gene_data[gene_data$Expression > 7, ]

##: Save cleaned data into result folder
write.csv(
  high_exp,
  "result/high_expression_genes.csv",
  row.names = FALSE
)

## Output=>
print("Cleaned and filtered data:")
print(high_exp)





