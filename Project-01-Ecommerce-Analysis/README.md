# Project 1: E-commerce Sales Analysis

## 📊 Project Overview
Analysis of UK-based online retail transactions to identify top-selling products and sales patterns.

## 🎯 Objectives
- Clean and prepare raw transaction data
- Identify best-selling products
- Calculate total revenue per transaction
- Create data visualizations using Pivot Tables

## 🛠️ Tools Used
- **Google Sheets** for data cleaning and analysis
- **Pivot Tables** for aggregation
- **Kaggle** for dataset sourcing

## 📁 Dataset
- **Source:** [E-Commerce Data - Kaggle](https://www.kaggle.com/datasets/carrie1/ecommerce-data)
- **Original Size:** 541,909 transactions
- **Working Sample:** 50,000 transactions (for performance)
- **After Cleaning:** 31,235 valid transactions
- **Time Period:** 2010-2011
- **Country:** United Kingdom

## 🧹 Data Cleaning Process

### Step 1: Data Sampling
- Reduced dataset from 541,909 to 50,000 rows for efficient processing in Google Sheets

### Step 2: Remove Missing Customer IDs
- Removed 17,880 rows (guest purchases without customer information)
- Remaining: 32,120 transactions

### Step 3: Remove Returns/Cancellations
- Removed 880 rows with negative quantities (product returns)
- Remaining: 31,240 transactions

### Step 4: Remove Invalid Prices
- Removed 5 rows with zero or negative prices (data errors)
- **Final Dataset: 31,235 clean transactions**

## 📈 Key Findings

### Top 3 Best-Selling Products:
1. **WORLD WAR 2 GLIDERS ASSTD DESIGNS** - 5,763 units
2. **WHITE HANGING HEART T-LIGHT HOLDER** - 4,577 units
3. **PACK OF 72 RETROSPOT CAKE CASES** - 3,896 units

### Insights:
- Home decor and novelty items are top sellers
- Bulk packages (72-pack) show strong performance
- Vintage/retro themed products have high demand

## 📂 Project Files
- `ecommerce-analysis-cleaned.xlsx` - Cleaned dataset with analysis
- Original dataset available on [Kaggle](https://www.kaggle.com/datasets/carrie1/ecommerce-data)

## 🔍 Analysis Methodology
1. Data import from CSV
2. Data quality assessment
3. Systematic cleaning (missing values, outliers)
4. Feature engineering (TotalPrice calculation)
5. Aggregation using Pivot Tables
6. Insights extraction

## 💡 Skills Demonstrated
- Data cleaning and validation
- Data transformation
- Descriptive statistics
- Data-driven insights extraction
- Technical documentation

## 🚀 Future Improvements
- Time series analysis of sales trends
- Customer segmentation analysis
- Geographic sales distribution
- Product category performance comparison

---

**Date Completed:** 17.12.2025
