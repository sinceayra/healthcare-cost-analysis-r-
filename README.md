# Healthcare Cost Analysis Using R

## Overview

This project performs Exploratory Data Analysis (EDA) on a healthcare patient dataset to identify factors associated with treatment costs, hospital visits, and patient health risk levels.

Using R and statistical analysis techniques, the project investigates relationships between BMI, blood pressure, smoking habits, physical activity, and healthcare expenses. The workflow includes data cleaning, missing value treatment, outlier handling, visualization, hypothesis testing, and predictive modeling.

---

## Objectives

This analysis aims to answer the following questions:

- Does BMI influence treatment cost?
- Are patients with high blood pressure visiting hospitals more frequently?
- Does smoking status affect healthcare expenses?
- Do physically active patients show better health outcomes?
- Which factors contribute most to treatment cost?
- Are there identifiable high-risk patient groups?
- Can patients be categorized into health-risk segments?

---

## Tools & Technologies

- R
- tidyverse
- ggplot2
- GGally

---

## Dataset Features

| Variable | Description |
|-----------|------------|
| Age | Patient age |
| BMI | Body Mass Index |
| Blood_Pressure | Patient blood pressure |
| Cholesterol_Level | Cholesterol measurement |
| Smoking_Status | Smoker / Non-Smoker |
| Physical_Activity | Activity level category |
| Hospital_Visits_Last_Year | Number of hospital visits |
| Treatment_Cost | Annual healthcare expenses |

---

## Data Preprocessing

### Missing Value Treatment

Mean imputation was applied to:

- BMI
- Blood Pressure
- Cholesterol Level

### Outlier Treatment

Treatment cost outliers were detected using the Interquartile Range (IQR) method and capped to reduce their impact on the analysis.

---

# Exploratory Data Analysis

## 1. BMI vs Treatment Cost

### Visualization

![BMI vs Treatment Cost](images/bmi_vs_treatment_cost.png)

### Findings

- A scatter plot and correlation analysis were used to examine the relationship.
- Patients with lower BMI generally exhibited lower treatment costs.
- The overall relationship appears weak, suggesting that treatment cost is influenced by multiple factors beyond BMI alone.

---

## 2. Blood Pressure vs Hospital Visits

### Visualization

![Blood Pressure vs Hospital Visits](images/blood_pressure_vs_visits.png)

### Findings

- Most observations were scattered without a clear trend.
- No strong relationship was observed between blood pressure and hospital visits.
- Additional health indicators may play a larger role in determining hospital utilization.

---

## 3. Smoking Status vs Treatment Cost

### Visualization

![Smoking Status vs Treatment Cost](images/smoking_vs_cost.png)

### Findings

- Treatment cost distributions were compared using boxplots.
- A t-test was performed to evaluate statistical differences.
- Both groups showed similar treatment cost distributions with no substantial visual difference.

---

## 4. Physical Activity vs Treatment Cost

### Visualization

![Physical Activity vs Treatment Cost](images/activity_vs_cost.png)

### Findings

- Patients with higher physical activity levels tended to show slightly lower treatment costs.
- However, differences between groups were relatively small.
- Further investigation with larger datasets may be required.

---

## 5. Multiple Linear Regression

### Model

```r
Treatment_Cost ~
BMI +
Blood_Pressure +
Cholesterol_Level +
Hospital_Visits_Last_Year
```

### Findings

- Multiple predictors were analyzed simultaneously.
- Regression analysis helped identify variables associated with treatment cost.
- Hospital visit frequency appeared to be one of the strongest contributors to treatment expenses.

---

## 6. Pairwise Relationship Analysis

### Visualization

![Pair Plot](images/pairplot.png)

### Findings

- Pairwise comparisons provided an overview of relationships among health indicators.
- The plot helped identify trends, clusters, and potential outliers across variables.

---

## 7. Distribution Analysis

### BMI Distribution

![BMI Distribution](images/bmi_histogram.png)

#### Observation

- Most BMI values were concentrated between 22 and 30.
- The dataset was centered around the overweight range.
- A few extreme BMI values were observed.

---

### Blood Pressure Distribution

![Blood Pressure Distribution](images/blood_pressure_histogram.png)

#### Observation

- Blood pressure values were mainly concentrated between 110 and 130.
- Only a small number of patients appeared at the lower and upper extremes.

---

### Cholesterol Distribution

![Cholesterol Distribution](images/cholesterol_histogram.png)

#### Observation

- Most cholesterol values fell between 170 and 240.
- A small number of unusually high and low observations were present.

---

## High-Risk Patient Identification

The analysis identified potentially high-risk patient groups:

### High BMI & Frequent Hospital Visits

- BMI > 30
- More than 5 hospital visits per year

### Young Patients with High Treatment Costs

- Age < 30
- Treatment Cost > 50,000

These groups may benefit from further investigation and targeted healthcare interventions.

---

## Key Insights

- BMI demonstrated a weak relationship with treatment cost.
- Blood pressure showed little association with hospital visit frequency.
- Smoking status did not exhibit a substantial impact on treatment expenses within this dataset.
- Physical activity was associated with slightly lower treatment costs.
- Hospital visit frequency appeared to be a major contributor to treatment expenses.
- The dataset allowed identification of potentially high-risk patient segments.

---

## Project Structure

```text
healthcare-cost-analysis-r/
│
├── data/
│   └── healthcare_patient_eda.csv
│
├── scripts/
│   └── healthcare_eda.R
│
├── images/
│   ├── bmi_vs_treatment_cost.png
│   ├── blood_pressure_vs_visits.png
│   ├── smoking_vs_cost.png
│   ├── activity_vs_cost.png
│   ├── pairplot.png
│   ├── bmi_histogram.png
│   ├── blood_pressure_histogram.png
│   └── cholesterol_histogram.png
│
├── README.md
│
└── report.pdf
```

---

## How to Run

Clone the repository:

```bash
git clone https://github.com/sinceayra/healthcare-cost-analysis-r.git
```

Install required packages:

```r
install.packages(c(
  "tidyverse",
  "ggplot2",
  "GGally"
))
```

Run the analysis:

```r
source("scripts/healthcare_eda.R")
```

---

## Author

**Ayra Shaikh**

GitHub: https://github.com/sinceayra

LinkedIn: https://www.linkedin.com/in/ira-s/
