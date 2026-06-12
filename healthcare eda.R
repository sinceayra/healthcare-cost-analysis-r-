library(tidyverse)
library(ggplot2)
library(GGally)

data <- read.csv("healthcare_patient_eda.csv")

summary(data)

#handle missing values
data$BMI[is.na(data$BMI)] <- mean(data$BMI,na.rm=TRUE)
data$Blood_Pressure[is.na(data$Blood_Pressure)] <- mean(data$Blood_Pressure,na.rm=TRUE)
data$Cholesterol_Level[is.na(data$Cholesterol_Level)] <- mean(data$Cholesterol_Level,na.rm=TRUE)

#detect outliers in Treatment Cost
Q1 <- quantile(data$Treatment_Cost,0.25)
Q3 <- quantile(data$Treatment_Cost,0.75)

IQR_val <- Q3-Q1

lower <- Q1-1.5*IQR_val
upper <- Q3+1.5*IQR_val

#treat outliers
data$Treatment_Cost[data$Treatment_Cost < lower] <- lower
data$Treatment_Cost[data$Treatment_Cost > upper] <- upper

#distribution plots
ggplot(data,aes(x=BMI))+
  geom_histogram(bins=10,fill="blue")

ggplot(data,aes(x=Blood_Pressure))+
  geom_histogram(bins=10,fill="orange")

ggplot(data,aes(x=Cholesterol_Level))+
  geom_histogram(bins=10,fill="green")

#Q1 BMI vs Treatment Cost
ggplot(data,aes(x=BMI,y=Treatment_Cost))+
  geom_point()+
  geom_smooth(method="lm")

cor(data$BMI,data$Treatment_Cost)

#Q2 Blood Pressure vs Hospital Visits
ggplot(data,aes(x=Blood_Pressure,y=Hospital_Visits_Last_Year))+
  geom_point()+
  geom_smooth(method="lm")

cor(data$Blood_Pressure,data$Hospital_Visits_Last_Year)

#Q3 Smoking vs Treatment Cost
ggplot(data,aes(x=Smoking_Status,y=Treatment_Cost))+
  geom_boxplot()

t.test(Treatment_Cost~Smoking_Status,data=data)

#Q4 Physical Activity vs Treatment Cost
ggplot(data,aes(x=Physical_Activity,y=Treatment_Cost))+
  geom_boxplot()

t.test(Treatment_Cost~Physical_Activity,data=data)

#Q5 regression
model <- lm(Treatment_Cost~BMI+Blood_Pressure+Cholesterol_Level+Hospital_Visits_Last_Year,data=data)

summary(model)

#pair plot
ggpairs(data[,c("BMI","Blood_Pressure","Cholesterol_Level","Hospital_Visits_Last_Year","Treatment_Cost")])

#high risk patients
high_bmi_visits <- data |> filter(BMI>30 & Hospital_Visits_Last_Year>5)
View(high_bmi_visits)

young_high_cost <- data |> filter(Age<30 & Treatment_Cost>50000)
View(young_high_cost)
