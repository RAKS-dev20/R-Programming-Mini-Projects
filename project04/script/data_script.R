## creating csv file for data =>

gene_data <- data.frame(
  Gene = c("TP53", "BRCA1", "EGFR", "MYC", "CDK2"),
  Expression = c(8.5, NA, 6.7, 9.1, NA),
  Condition = c("Tumor", "Normal", "Tumor", "Tumor", "Normal")
)
#gene_data
#str(gene_data)

## ensure a data/ folder is present=>
# getwd()
# dir.create("data" , showWarnings = FALSE)

## write the csv file =>
write.csv(
  gene_data,
  "data/gene_expression.csv",
  row.names = FALSE
)

## verification =>
check_data <- read.csv ("data/gene_expression.csv")
head(check_data)





