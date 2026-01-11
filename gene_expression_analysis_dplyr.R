# Gene Expression Analysis using dplyr
# Author: Raksha Devi

library(tidyverse)
expr <- tibble(
  Gene = c("TP53","BRCA1","EGFR","MYC"),
  Expression = c(5.6, 2.1, 8.4, 6.9),
  Length = c(393, 1863, 1210, 439)
)

result <- expr %>%
  mutate(
    status = ifelse(Expression >mean(Expression),"High","Low"),
    Norm_Expr = Expression/ mean(Expression)
  ) %>%
  arrange(desc(Expression))
print(result)

  
  
  
  
  
  
  