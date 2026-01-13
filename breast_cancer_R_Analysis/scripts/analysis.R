# Breast Cancer Data Analysis using R
# Author: Raksha Devi
# Project Type: R Programming Capstone

# install.packages(c("tidyverse", "ggpubr"))  # run once if needed

library(tidyverse)   # includes ggplot2, dplyr, readr, etc.


#load dataset=>
cancer <- read.csv("data/breast_cancer_data.csv")

# check dimensions =>
dim(cancer)

# Initial Data Exploration =>

head(cancer)
str(cancer)
summary(cancer)
class(cancer)

# REmove non-informative column(ID)
cancer <- cancer[, -1] # kept all rows , remove 1st column
colnames(cancer)

# check Missing values=>

sum(is.na(cancer))

# Target Variable Inspection =>

table(cancer$diagnosis)

# convert diagnosis to another labels=>

cancer$cancer_type <- ifelse(cancer$diagnosis == "M",
                             "Malignant",
                             "Benign")
table(cancer$cancer_type)

# basic statistics =>

radius_mean <- cancer$radius_mean
mean(radius_mean)
median(radius_mean)
sd(radius_mean)
min(radius_mean)
max(radius_mean)

# Matrices=>
feature_matrix <- as.matrix(cancer[,2:31])

#column-wise mean and sd=>
apply(feature_matrix,2,mean)
apply(feature_matrix,2,sd)

##APPLY FAMILY FUNCTIONS=>
# check data types of each column=>
lapply(cancer, class)

#feature mean=>
feature_means <- apply(feature_matrix,2,mean)

# function=>

feature_stats <- function(x){
  c(
    Mean = mean(x),
    SD = sd(x),
    Min = min(x),
    Max = max(x)
  )
}
# Apply function to a feature =>
feature_stats(cancer$area_mean)

#conditional Statements=>

cancer$performance <- ifelse(cancer$radius_mean > 15,
                             "High Risk",
                             "Low Risk")

table( cancer$performance)

#  LOOPS (Step-wise Logic)=>


risk_level <- c()

for (i in cancer$radius_mean) {
  if (i >= 18) {
    risk_level <- c(risk_level, "Very High")
  } else if (i >= 14) {
    risk_level <- c(risk_level, "Moderate")
  } else {
    risk_level <- c(risk_level, "Low")
  }
}

cancer$risk_category <- risk_level
table(cancer$risk_category )

#STATISTICAL TESTS (t-test)=>
# Compare radius_mean between Benign and Malignant
t_test_radius <- t.test(radius_mean ~ cancer_type, data = cancer)
t_test_radius

# Compare area_mean between Benign and Malignant
t_test_area <- t.test(area_mean ~ cancer_type, data = cancer)
t_test_area

# DATA MANIPULATION USING dplyr=>
summary_stats <- cancer %>%
  group_by(cancer_type) %>%
  summarise(
    mean_radius = mean(radius_mean),
    sd_radius   = sd(radius_mean),
    mean_area   = mean(area_mean)
  )


# statistical Analysis=>
cor(cancer$radius_mean,cancer$area_mean)
cor(cancer$radius_mean,cancer$perimeter_mean)

## data visualization using ggplot2 not BaseR=>
library("ggplot2")

# histogram=>
p1 <-ggplot(cancer, aes(x=radius_mean)) +
  geom_histogram(binwidth = 1, fill = "steelblue", color = "black") +
  labs(
    title = "Distribution of Mean Tumor Radius",
    x = "Radius Mean",
    y = "Count"
  ) +
  theme_minimal()

# Boxplot
p2 <- ggplot(cancer, aes(x = cancer_type, y = radius_mean, fill = cancer_type)) +
  geom_boxplot(alpha = 0.7) +
  labs(
    title = "Tumor Radius by Cancer Type",
    x = "Cancer Type",
    y = "Radius Mean"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# Scatter plot
p3 <- ggplot(cancer, aes(x = radius_mean, y = area_mean, color = cancer_type)) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Radius Mean vs Area Mean",
    x = "Radius Mean",
    y = "Area Mean"
  ) +
  theme_minimal()
# Bar plot
p4 <- ggplot(cancer, aes(x = cancer_type, fill = cancer_type)) +
  geom_bar() +
  labs(
    title = "Distribution of Cancer Types",
    x = "Cancer Type",
    y = "Number of Samples"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# Display plots
print(p1)
print(p2)
print(p3)
print(p4)

# save plot=>
ggsave("outputs/plots/faceted_histogram.png", p1)
ggsave("outputs/plots/boxplot_ttest.png", p2)
ggsave("outputs/plots/scatter_radius_area.png", p3)
ggsave("outputs/plots/cancer_type_barplot.png", p4)

# save clean data =>
write.csv(cancer,
          "outputs/cleaned_breast_cancer_data.csv",
          row.names = FALSE)

# FINAL CHECK =>
head(cancer)
dim(cancer)


#conclusion=>
#Statistical hypothesis testing (t-test) and visualization were used to compare tumor characteristics between malignant and benign samples, revealing significant differences in key diagnostic features.




























































