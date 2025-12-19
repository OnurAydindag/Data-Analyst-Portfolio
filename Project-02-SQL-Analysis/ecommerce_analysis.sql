-- ===================================
-- Project 2: E-commerce SQL Analysis
-- Data Analyst Portfolio
-- Tool: PostgreSQL 18
-- Database: ecommerce_db
-- ===================================

-- Author: Onur Aydındağ
-- Date: 19.12.2025
-- Dataset: UK-based online retail transactions (2010-2011)
-- Records: 31,235 cleaned transactions

-- ===================================
-- DATA VALIDATION
-- ===================================

-- Query 1: Verify Data Import
-- Purpose: Check total record count after import
-- Expected: 31,235 records
SELECT COUNT(*) as total_records 
FROM sales;

-- Query 2: Preview Sample Data
-- Purpose: Visual inspection of first 10 rows
-- Use: Quick data quality check
SELECT * 
FROM sales 
LIMIT 10;

-- ===================================
-- PRODUCT ANALYSIS
-- ===================================

-- Query 3: Top 5 Best-Selling Products
-- Business Question: Which products have highest sales volume?
-- Insight: Prioritize inventory and marketing for top sellers
SELECT 
    description,
    SUM(quantity) as total_quantity
FROM sales
GROUP BY description
ORDER BY total_quantity DESC
LIMIT 5;

-- ===================================
-- GEOGRAPHIC ANALYSIS
-- ===================================

-- Query 4: Sales by Country (Top 10)
-- Business Question: Which markets generate most revenue?
-- Insight: Focus marketing budget on high-revenue countries
SELECT 
    country,
    COUNT(*) as order_count,
    ROUND(SUM(total_price), 2) as total_revenue
FROM sales
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 10;

-- ===================================
-- ORDER VALUE ANALYSIS
-- ===================================

-- Query 5: Order Statistics
-- Business Question: What are typical order values?
-- Insight: Set pricing strategies and shipping thresholds
SELECT 
    ROUND(AVG(total_price), 2) as avg_order_value,
    ROUND(MIN(total_price), 2) as min_order,
    ROUND(MAX(total_price), 2) as max_order,
    COUNT(*) as total_orders
FROM sales;

-- ===================================
-- CUSTOMER ANALYSIS
-- ===================================

-- Query 6: Top 10 Customers by Spending
-- Business Question: Who are our most valuable customers?
-- Insight: Identify VIP customers for loyalty programs
SELECT 
    customer_id,
    COUNT(*) as order_count,
    ROUND(SUM(total_price), 2) as total_spent
FROM sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Query 7: Monthly Sales Trend
-- Business Question: How do sales vary over time?
-- Insight: Identify seasonal patterns and growth trends
SELECT 
    SPLIT_PART(invoice_date, '/', 1) || '/' || 
    SPLIT_PART(invoice_date, '/', 3) as month_year,
    COUNT(*) as orders,
    ROUND(SUM(total_price), 2) as revenue
FROM sales
GROUP BY month_year
ORDER BY month_year;

-- Query 8: Top Revenue-Generating Products
-- Business Question: Which products drive most revenue?
-- Insight: Focus on high-revenue products for profitability
SELECT 
    description,
    COUNT(*) as times_sold,
    ROUND(AVG(unit_price), 2) as avg_price,
    ROUND(SUM(total_price), 2) as total_revenue
FROM sales
GROUP BY description
ORDER BY total_revenue DESC
LIMIT 10;

-- Query 9: Order Value Distribution
-- Business Question: How are orders distributed across value ranges?
-- Insight: Customer segmentation by spending patterns
SELECT 
    CASE 
        WHEN total_price < 100 THEN 'Low (<£100)'
        WHEN total_price BETWEEN 100 AND 500 THEN 'Medium (£100-500)'
        WHEN total_price BETWEEN 500 AND 1000 THEN 'High (£500-1000)'
        ELSE 'Premium (>£1000)'
    END as order_segment,
    COUNT(*) as order_count,
    ROUND(SUM(total_price), 2) as total_revenue
FROM sales
GROUP BY order_segment
ORDER BY order_count DESC;

-- ===================================
-- KEY BUSINESS METRICS
-- ===================================

-- Query 10: Overall Business Summary
-- Purpose: Executive dashboard - key metrics at a glance
SELECT 
    COUNT(DISTINCT customer_id) as total_customers,
    COUNT(DISTINCT invoice_no) as total_invoices,
    COUNT(DISTINCT description) as unique_products,
    COUNT(DISTINCT country) as countries_served,
    ROUND(SUM(total_price), 2) as total_revenue,
    ROUND(AVG(total_price), 2) as avg_order_value,
    SUM(quantity) as total_units_sold
FROM sales;