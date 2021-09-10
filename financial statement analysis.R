# Your task is to calculate the following financial metrics:
#- profit for each month
#- profit after tax for each month (the tax rate is 30%)
#- profit margin for each month - equals to profit a after tax divided by revenue
#- good months - where the profit after tax was greater than the mean for the year
#- bad months - where the profit after tax was less than the mean for the year
#- the best month - where the profit after tax was max for the year
#- the worst month - where the profit after tax was min for the year


#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution

#- profit for each month
profit <- revenue - expenses

#- profit after tax for each month (the tax rate is 30%)
tax <- round(profit * 0.3, digits = 2)
profit_after_taxes <- profit - tax

#- profit margin for each month - equals to profit a after tax divided by revenue
profit_margine <- round (profit_after_taxes / revenue, digits = 2) * 100

#- good months - where the profit after tax was greater than the mean for the year
mean_profit <- mean(profit_after_taxes)
good_months <- profit_after_taxes > mean_profit

#- bad months - where the profit after tax was less than the mean for the year
bad_months <- profit_after_taxes < mean_profit

#- the best month - where the profit after tax was max for the year
max_profit <- max(profit_after_taxes)
best_month <- profit_after_taxes == max_profit

#- the worst month - where the profit after tax was min for the year
min_profit <- min(profit_after_taxes)
worst_month <- profit_after_taxes == min_profit

# units of thousands
revenue.1000 <- round(revenue / 1000)
expenses.1000 <- round(expenses / 1000)
profit.1000 <- round(profit / 1000)
profit_after_taxes.1000 <- round(profit_after_taxes / 1000)

# OUTPUT matrices

m <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit_after_taxes.1000,
  profit_margine,
  good_months,
  bad_months,
  best_month,
  worst_month
  
)


