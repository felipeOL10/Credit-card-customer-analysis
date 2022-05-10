SELECT * FROM bankchurn.banchurn;

SELECT * FROM bankchurn.banchurn;

SELECT COUNT(CLIENTNUM) AS TotalNumberOfClients
FROM bankchurn.banchurn;
SET @V1 := (SELECT COUNT(CLIENTNUM) FROM bankchurn.banchurn);
SELECT @v1;

#Share of type of costumer
SELECT Attrition_Flag, ROUND(COUNT(CLIENTNUM)/@v1*100, 2) AS RoundedShareOfTypeOfCostumer
FROM bankchurn.banchurn
GROUP BY Attrition_Flag;

# Group income category
SELECT Income_Category, ROUND(COUNT(CLIENTNUM)/@v1*100, 2) AS RoundedShareOfImcomeCategory
FROM bankchurn.banchurn
GROUP BY Income_Category;

# Income category by card category
SELECT Income_Category, ROUND(COUNT(Card_Category)/@v1*100, 2) AS RoundedShareOfCardCategoryByIncome
FROM bankchurn.banchurn
GROUP BY Income_Category;

# Card category and Income category
SELECT Income_Category, count(Card_Category)
FROM bankchurn.banchurn
Where Card_Category = "Blue"
Group by Income_Category;

SELECT Income_Category, count(Card_Category)
FROM bankchurn.banchurn
Where Card_Category = "Gold"
Group by Income_Category;

SELECT Income_Category, count(Card_Category)
FROM bankchurn.banchurn
Where Card_Category = "Silver"
Group by Income_Category;

SELECT Income_Category, count(Card_Category)
FROM bankchurn.banchurn
Where Card_Category = "Platinum"
Group by Income_Category;

# Total transactions amount and count by income category
SELECT Income_Category, COUNT(Total_Trans_Ct), ROUND(AVG(Total_Trans_Amt), 1) AS RoundedTotal_Trans_Amt
FROM bankchurn.banchurn
GROUP BY Income_Category;

# Who uses more the credit cards in average?
SELECT Income_Category, ROUND(AVG(Avg_Utilization_Ratio), 3) AS RoundedAvg_Utilization_Ratio
FROM bankchurn.banchurn
GROUP BY Income_Category;

# Which credit card is associated with more utilization?
SELECT Card_Category, ROUND(AVG(Avg_Utilization_Ratio), 3) AS RoundedAvg_Utilization_Ratio
FROM bankchurn.banchurn
GROUP BY Card_Category;

# Who has more products by income category?
SELECT Income_Category, ROUND(AVG(Total_Relationship_Count), 2) AS RoundedAvgTotal_Relationships_Count
FROM bankchurn.banchurn
GROUP BY Income_Category;

# Which income category has more credit limit and balance left?
SELECT Income_Category, ROUND(AVG(Credit_Limit), 1) AS RoundedAvgCreditCardLimit, ROUND(AVG(Total_Revolving_Bal),1) AS RoundedAvgTotalResolvingBal
FROM bankchurn.banchurn
GROUP BY Income_Category; 

# Which credit card has more cridit limit and more balance left
SELECT Card_Category, ROUND(AVG(Credit_Limit), 1) AS RoundedAvgCreditCardLimit, ROUND(AVG(Total_Revolving_Bal),1) AS RoundedAvgTotalResolvingBal
FROM bankchurn.banchurn
GROUP BY Card_Category; 

# Customer loyalty and months inactive by income category
SELECT Income_Category, ROUND(AVG(Months_on_book), 2) AS RoundedAvgMonthsOnBook, ROUND(AVG(Months_Inactive_12_mon), 2) AS RoundedAvgMonthsInactive
FROM bankchurn.banchurn
GROUP BY Income_Category;

# Customer loyalty and months inactive by card category
SELECT Card_Category, ROUND(AVG(Months_on_book), 2) AS RoundedAvgMonthsOnBook, ROUND(AVG(Months_Inactive_12_mon), 2) AS RoundedAvgMonthsInactive
FROM bankchurn.banchurn
GROUP BY Card_Category;