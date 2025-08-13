# Blinkit Sales Analysis-SQL|Python|PowerBI
# Overview
This project performs end-to-end sales analysis for Blinkit using:
SQL (data cleaning & aggregation)
Python (data processing & visualization)
Power BI (interactive dashboard)
The analysis provides insights into sales trends, category performance, outlet comparisons, and customer preferences, helping in data-driven decision-making.
# Dataset Details
Table Name: blinkit_data
Columns:
Item Fat Content — Low Fat / Regular
Item Identifier — Unique product code
Item Type — Product category
Outlet Establishment Year — Store launch year
Outlet Identifier — Unique outlet code
Outlet Location Type — Tier 1 / Tier 2 / Tier 3
Outlet Size — Small / Medium / High
Outlet Type — Grocery Store / Supermarket
Item Visibility — Product display percentage
Item Weight — Weight in kg
Sales — Total sales value
Rating — Average customer rating
 # 📊 SQL Analysis Performed
# Overall Metrics
Total Sales (in millions)
Average Sales
Average Rating
# Category-Wise Sales
Sales, Average Sales, Ratings, and Item Count by Fat Content
# Year-Wise Trends
Total & average sales by outlet establishment year
Outlet Analysis
Sales percentage by Outlet Size
Sales & ratings by Outlet Location Type
Performance by Outlet Type
# Product Insights
Top & bottom-performing item types in Tier 2 outlets
Fat content contribution by outlet location

#  Python Analysis
# -> Using Pandas, Matplotlib, and Seaborn in Jupyter Notebook:
Imported and cleaned the dataset
Generated exploratory data analysis (EDA) plots
Exported cleaned data for Power BI
# Power BI Dashboard
Key Features:
KPIs: Total Sales, Average Sales, Number of Items, Average Rating
Filters: Outlet Location Type, Outlet Size, Item Type
Visuals:
Pie chart: Fat content share in total sales
Bar chart: Item type sales performance
Line chart: Sales trends over years
Donut chart: Sales by outlet size
Horizontal bar: Sales by outlet location
Table: Outlet type metrics (sales, items, ratings, visibility)
# Insights
Total Sales: $1.20M across all outlets
Fat Content: Regular products dominate sales ($776.32K vs $425.36K Low Fat)
Best Outlet Size: Medium outlets generate the highest revenue ($507.90K)
Top Locations: Tier 3 outlets lead in sales ($472.13K)
Top Outlet Type: Supermarket Type 1 with $787.55K in sales
Top Item Categories: Fruits & Vegetables and Snack Foods
