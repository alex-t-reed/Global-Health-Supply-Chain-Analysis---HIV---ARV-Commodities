# Global Health Supply Chain Analysis (2022)

Welcome to the Global Health Supply Chain Analysis repository! This SQL data analysis project provides a comprehensive analysis of supply chain health commodity shipments and pricing data, with a specific focus on Antiretroviral (ARV) and HIV lab shipments to supported countries in the year 2022.

## Table of Contents

1. [Objective](#objective)
2. [Data Source](#data-source)
3. [Key Insights](#key-insights)
4. [Data Analysis](#data-analysis)
5. [Strategies and Findings](#strategies-and-findings)
6. [Skills Gained from This Project](#skills-gained-from-this-project)
7. [Getting Started](#getting-started)
8. [Contributing](#contributing)
9. [Feedback](#feedback)
10. [Disclaimer](#disclaimer)

## Objective

The primary objective of this project is to provide stakeholders with a comprehensive understanding of global spending on specific health commodities, particularly ARV and HIV lab shipments, in 2022. This analysis enables data-driven decision-making in the global health sector.

## Data Source

The data for this project was sourced from the U.S. Agency for International Development (USAID) and can be found at [US Agency for International Development](https://catalog.data.gov/dataset/supply-chain-shipment-pricing-data-07d29).

## Key Insights

This section provides a summary of the key insights derived from the data analysis:

- Analysis of pricing ranges and trends for health commodities.
- Volumes of commodities delivered by country, offering insights into distribution patterns.
- Support for data-driven decision-making in the global health sector.

## Data Analysis

Here are some key findings from the data analysis:

1. **Data Trimming:**
   - The data was trimmed to eliminate potential errors and inconsistencies.

2. **Shipment Methods:**
   - Four shipment methods were identified: air, truck, air charter, and ocean.
   - 360 records had null shipment modes.

3. **Most Used Shipment Method:**
   - Air shipment was the most popular method, followed by truck.

4. **Shipment Method by Country:**
   - Different countries had varying preferences for shipment methods.

5. **Common Countries:**
   - The top five most common countries in the dataset were South Africa, Nigeria, Côte d'Ivoire, Uganda, and Vietnam.

6. **Product Group Distribution:**
   - Antiretroviral (ARVs) was the most common product group.

7. **Average Line Item Value by Product Group:**
   - ARVs had the highest average line item value.

8. **Average Weight by Shipment Mode:**
   - Air charter had the highest average weight.

9. **Average Freight Cost by Shipment Mode:**
   - Air charter had the highest average freight cost.

10. **Total Line Item Value and Freight Cost by Country:**
    - Nigeria had the highest total line item value and freight cost.

11. **Average Unit Price by Product Group and Shipment Mode:**
    - Significant variations in unit prices were observed.

12. **Dosage Form Distribution:**
    - Different dosage forms were associated with various product groups.

13. **High/Low Unit Prices for Product Groups:**
    - HRDT had the highest and lowest unit prices.

14. **Most Profitable Vendors and Countries:**
    - Identified the most profitable vendors and their countries.

15. **Common Brand/Molecule Combinations:**
    - Explored the top three common brand/molecule combinations.

16. **Common Brand/Molecule/Vendor Combinations:**
    - Identified the most common brand/molecule/vendor combinations.

17. **Top Product Descriptions by Line Item Quantity:**
    - Highlighted the top product descriptions by quantity.

18. **Product Groups and Shipment Modes:**
    - Examined which shipment modes were typically used by different product groups.

## Strategies and Findings

Based on the analysis, the following strategies and findings can be implemented:

- Optimize shipment methods based on cost-effectiveness and delivery times.
- Negotiate with vendors to improve pricing, especially for high-value product groups.
- Monitor and manage inventory levels in countries with high demand.
- Focus on improving data accuracy and completeness for better decision-making.
- Explore opportunities for collaboration with profitable vendors.
- Promote the use of cost-effective dosage forms.

## Skills Gained from This Project

Throughout the Global Health Supply Chain Analysis project, I acquired and demonstrated a diverse set of skills relevant to the role of a data analyst:

1. **Data Cleaning and Preprocessing:** Proficiently cleaned and preprocessed data using SQL, ensuring data accuracy and consistency by employing commands like TRIM to remove leading and trailing spaces.
2. **SQL Data Analysis:** Conducted in-depth data analysis using SQL, involving tasks such as aggregations, filtering, and sorting tables to derive actionable insights from the dataset.
3. **Statistical Analysis:** Performed statistical analyses, including calculating averages, counts, and percentages, to uncover key trends and patterns within the dataset.
4. **Data Interpretation:** Effectively interpreted data analysis results, enabling the formulation of data-driven recommendations and informed decision-making.
6. **Critical Thinking:** Applied critical thinking skills to identify patterns, outliers, and anomalies within the data, leading to more robust and insightful analyses.
7. **Version Control:** Employed Git and GitHub for version control, facilitating collaborative work and tracking changes throughout the project's development.

## Getting Started

To get started with this project, follow these steps:

1. Clone this repository to your local machine.
   ```bash
   git clone https://github.com/alex-t-reed/Global-Health-Supply-Chain-Analysis-2022
   ```
2. Review the SQL analysis script in analysis.sql to explore the insights and findings.
3. Access the raw data in CSV format via `Supply_Chain_Shipment_Pricing_Data.csv` or use the SQLite database version in `Supply_Chain_Shipment_Pricing_Data.db` for running SQL queries.

## Contributing

Contributions to this project are welcome! If you have insights, improvements, or additional analyses to share, please submit a pull request.

## Feedback

For questions, suggestions, or collaboration opportunities, please don't hesitate to reach out me.
- **Email**: [Alex Reed](mailto:alexreed@ucsb.edu)
- **LinkedIn**: [Alex Reed on LinkedIn](https://www.linkedin.com/in/alextreed)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alextreed)

## Disclaimer

This project is for informational and analytical purposes only. The data and conclusions presented here may not reflect real-world circumstances accurately, and users should exercise due diligence when making decisions based on the provided analysis.
