# Gene Expression Analysis Function
# Author: Raksha Devi
# Description:
#   This function analyzes gene expression values
#   and classifies them as High or Low based on mean.

gene_analysis <- function(expr_vector){

# Input validation=>
  if(!is.numeric(expr_vector)){
    stop("Input must be a numeric vector")
  }

# calculate mean expression
mean_expr <- mean(expr_vector)

# classify expression levels=>
status <- ifelse(expr_vector > mean_expr, "High","Low")

#create result data frame =>
result <- data.frame(
  Expression = expr_vector ,
  status = status
)

return(result)
}