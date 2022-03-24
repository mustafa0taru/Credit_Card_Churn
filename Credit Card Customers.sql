Create Database CreditCardChurn;
Use CreditCardChurn;

/*Age Group Distribution of Attrited Customers*/
Select Case When Customer_Age<20 Then "0-20"
       When Customer_Age Between 20 And 30 Then "20-30" When Customer_Age Between 30 And 40 Then "30-40"
       When Customer_Age Between 40 And 50 Then "40-50" When Customer_Age Between 50 And 60 Then "50-60"
       When Customer_Age Between 60 And 70 Then "60-70" When Customer_Age Between 70 And 80 Then "70-80"
       When Customer_Age>80 Then "Above 80" End As Age_Range, Count(*) 
From bankchurners 
Where Attrition_Flag = "Attrited Customer" 
Group by Age_Range 
Order by Age_Range;

/*Proportion of Male and Female in Attrited and Existing Customers*/
Select SUM(If(Gender="M",1,"NULL")) As MaleExistingCustomers,
	   SUM(If(Gender="F",1,"NULL")) As FemaleExistingCustomers
From bankchurners
Where Attrition_Flag = "Existing Customer";
Select SUM(If(Gender="M",1,"NULL")) As MaleAttritedCustomers,
	   SUM(If(Gender="F",1,"NULL")) As FemaleAttritedCustomers
From bankchurners
Where Attrition_Flag = "Attrited Customer";  

/*Distribution of Attrited and Existing Customers based on Dependent Count*/
Select Dependent_count, Count(*)
From bankchurners
Where Attrition_Flag="Existing Customer" 
Group by Dependent_count
Order by Dependent_count;
Select Dependent_count, Count(*)
From bankchurners
Where Attrition_Flag="Attrited Customer" 
Group by Dependent_count
Order by Dependent_count;

/*Education Level of Existing and Attrited Customers*/
Select Education_level, Count(*)
From bankchurners
Where Attrition_Flag= "Existing Customer" 
Group by Education_Level
Order by Count(*);
Select Education_level, Count(*)
From bankchurners
Where Attrition_Flag= "Attrited Customer" 
Group by Education_Level
Order by Count(*);

/*Marital Status of Existing and Attrited Customers*/
Select Marital_Status, Count(*)
From bankchurners
Where Attrition_Flag= "Existing Customer" 
Group by Marital_Status
Order by Count(*);
Select Marital_Status, Count(*)
From bankchurners
Where Attrition_Flag= "Attrited Customer" 
Group by Marital_Status
Order by Count(*);

/*Distribution of Existing and Attrited Customers Based on Card Category*/
Select Card_Category, Count(*)
From bankchurners
Where Attrition_Flag= "Existing Customer" 
Group by Card_Category
Order by Count(*);
Select Card_Category, Count(*)
From bankchurners
Where Attrition_Flag= "Attrited Customer" 
Group by Card_Category
Order by Count(*);

/*Attrited Customers based on Months on Book*/
Select Case When Months_on_book<20 Then "0-20"
       When Months_on_book Between 20 And 30 Then "20-30" When Months_on_book Between 30 And 40 Then "30-40"
       When Months_on_book Between 40 And 50 Then "40-50" When Months_on_book Between 50 And 60 Then "50-60"
       When Customer_Age>60 Then "Above 60" End As MonthsonBook_Range, Count(*) 
From bankchurners 
Where Attrition_Flag = "Attrited Customer" 
Group by MonthsonBook_Range 
Order by MonthsonBook_Range;

/*Inactive Months of Existing and Attrited Customers*/
Select Months_Inactive_12_mon, Count(*)
From bankchurners
Where Attrition_Flag = "Attrited Customer"
Group by Months_Inactive_12_mon
Order by Count(*);
Select Months_Inactive_12_mon, Count(*)
From bankchurners
Where Attrition_Flag = "Existing Customer"
Group by Months_Inactive_12_mon
Order by Count(*);

/*Average Utilization of Existing and Attrited Customer*/
Select Attrition_Flag, Round(Avg(Avg_Utilization_Ratio)*100,2) As AvgUtilization
From bankchurners
Where Attrition_Flag="Attrited Customer";
Select Attrition_Flag, Round(Avg(Avg_Utilization_Ratio)*100,2) As AvgUtilization
From bankchurners
Where Attrition_Flag="Existing Customer";
