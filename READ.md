# Breast Cancer Data Analysis Using R

## Project Overview
This project focuses on the statistical analysis and visualization of breast cancer diagnostic data using R. The main goal is to demonstrate my understanding of core and intermediate R programming concepts by applying them to a real-world cancer dataset.

The analysis includes data cleaning, exploratory analysis, statistical testing, and visualization using widely used R packages.

---

## Dataset Information
- Dataset Name: Breast Cancer Wisconsin (Diagnostic) Dataset  
- Source: Kaggle  
- Dataset Link: https://www.kaggle.com/datasets/uciml/breast-cancer-wisconsin-data  
- Original Source: UCI Machine Learning Repository  

The dataset contains diagnostic features computed from digitized images of fine needle aspirates of breast masses.

- Number of samples: 569  
- Number of features: 30 numerical features  
- Target variable: Diagnosis  
  - M = Malignant  
  - B = Benign  

---

## Concepts Covered
This project combines all major R programming concepts in a single workflow:

- Data structures: vectors, matrices, data frames, lists  
- Control structures: conditional statements and loops  
- Functional programming: apply family and user-defined functions  
- Statistical analysis: summary statistics, correlation analysis, t-tests  
- Data manipulation using tidyverse (dplyr)  
- Data visualization using ggplot2, ggpubr, and faceting  
- File handling and project organization  

---

## Analysis Performed
- Exploration of feature distributions  
- Comparison of malignant and benign tumor characteristics  
- Correlation analysis between tumor size-related features  
- Hypothesis testing using independent t-tests  
- Risk categorization based on tumor radius  

---

## Tools and Packages Used
- R  
- RStudio  
- tidyverse  
- ggplot2  
- ggpubr  

---

## Key Findings
- Malignant tumors generally have higher mean radius and area compared to benign tumors  
- Tumor radius and area show a strong positive correlation  
- t-test results indicate statistically significant differences between malignant and benign samples  

---

## Future Scope
This project can be extended by integrating biological sequence or structural data. Such datasets can be preprocessed using Biopython and further analyzed in R. Machine learning models can also be applied for cancer classification tasks.

---

## Project Structure
Breast-Cancer-R-Analysis/
├── data/
├── scripts/
├── outputs/
│ └── plots/
├── README.md
└── conclusions.md

## Author
Raksha Devi  
MSc Bioinformatics  
Savitribai Phule Pune University
