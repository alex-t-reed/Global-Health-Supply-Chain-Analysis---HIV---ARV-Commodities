# Global Health Supply Chain Analysis (2022)

Welcome to the Global Health Supply Chain Analysis repository! This project provides a comprehensive analysis of supply chain health commodity shipments and pricing data, with a specific focus on Antiretroviral (ARV) and HIV lab shipments to supported countries in the year 2022.

## Table of Contents

1. [Objective](#objective)
2. [Key Insights](#key-insights)
3. [Data Analysis](#data-analysis)
4. [Data Source](#data-source)
5. [Getting Started](#getting-started)
6. [Contributing](#contributing)
7. [Feedback](#feedback)
8. [Disclaimer](#disclaimer)

## Objective

The primary objective of this project is to provide stakeholders with a comprehensive understanding of global spending on specific health commodities, particularly ARV and HIV lab shipments. When analyzed in conjunction with related data sources such as the Global Fund's Price, Quality, and Reporting (PQR) data, this dataset offers a holistic view of the global health supply chain landscape in 2022.

## Key Insights

This section provides a summary of the key insights derived from the data analysis:

- Analysis of pricing ranges and trends for health commodities.
- Volumes of commodities delivered by country, offering insights into distribution patterns.
- Support for data-driven decision-making in the global health sector.

## Data Analysis

Here are some key findings from the data analysis:
1. **Data Trimming:**
   - Trimmed various columns in the `supply_chain_pricing` table.

2. **Shipment Methods:**
   - Four shipment methods found: air, truck, air charter, and ocean.
   - 360 records with null shipment modes.

3. **Most Used Shipment Method:**
   - Air shipment is most popular (mode_count: 6113), followed by truck (371).

4. **Shipment Method by Country:**
   - Air is highest in Vietnam, air charter in Nigeria, ocean in South Africa, and truck in South Africa.

5. **Common Countries:**
   - Top 5 common countries: South Africa (1406), Nigeria (1194), Côte d'Ivoire (1083), Uganda (779), Vietnam (688).

6. **Product Group Distribution:**
   - Antiretroviral (ARVs) is the most common (8550), followed by HRDTs (1728).

7. **Average Line Item Value by Product Group:**
   - ARV: 165288.9 USD, HRDT: 123463.4 USD.

8. **Average Weight by Shipment Mode:**
   - Air Charter: 5261.74 kg, Ocean: 5227.56 kg, Truck: 2745.23 kg, Air: 1357.94 kg.

9. **Average Freight Cost by Shipment Mode:**
   - Air Charter: 13732.47 USD, Ocean: 9678.51 USD, Truck: 4192.82 USD.

10. **Total Line Item Value and Freight Cost by Country:**
    - Nigeria has the highest total line item value and freight cost.

11. **Average Unit Price by Product Group and Shipment Mode:**
    - Unit prices vary significantly across groups and modes.

12. **Dosage Form Distribution:**
    - ARVs in tablet forms, HRDTs in test kits, ACTs in Tablet - FDC + blister, ANTM in Tablet - FDC.

13. **High/Low Unit Prices for Product Groups:**
    - HRDT: High - 41.68 (BIO-RAD LABORATORIES), Low - 0.67 (Premier Medical Corporation Ltd.).
    - ARV: High - 1.64 (IDIS LIMITED), Low - 0.01 (AUROBINDO PHARAM).
    - ANTM: High - 0.15 (AMSTELFARMA B.V.), Low - 0.01 (THE MEDICAL EXPORT GROUP BV).
    - ACT: High - 0.07 (MISSIONPHARMA A/S), Low - 0.05 (IDA FOUNDATION).
    - MRDT: High - 1.5 (ZEPHYR BIOMEDICALS), Low - 0.39 (ACCESS BIO, INC.).

14. **Most Profitable Vendors and Countries:**
    - SCMS (Zambia), Orgenics (Haiti), Aurobindo Pharma (Vietnam).

15. **Common Brand/Molecule Combinations:**
    - Top 3: Efavirenz (1056), Nevirapine (849), Lamivudine/Nevirapine/Zidovudine (707).

16. **Common Brand/Molecule/Vendor Combinations:**
    - SCMS (RDC) is the vendor for the top 3 combinations.

17. **Top Product Descriptions by Line Item Quantity:**
    - (1) Lamivudine/Nevirapine/Zidovudine 150/200/300mg, tablets, 60 Tabs.
    - (2) Efavirenz 600mg, tablets, 30 Tabs.
    - (3) Efavirenz/Lamivudine/Tenofovir Disoproxil Fumarate 600/300/300mg, tablets, 30 Tabs.
    - (4) Nevirapine 200mg, tablets, 60 Tabs.
    - (5) Lamivudine/Zidovudine 150/300mg, tablets, 60 Tabs.

18. **Product Groups and Shipment Modes:**
    - ARV products primarily shipped via Air, HRDT via Air, ANTM and ACT via Air, MRDT via Air.


## Data Source

The data for this project was sourced from the U.S. Agency for International Development (USAID) and can be found at [US Agency for International Development](https://catalog.data.gov/dataset/supply-chain-shipment-pricing-data-07d29).

## Getting Started

To get started with this project, follow these steps:

1. Clone this repository to your local machine.
   ```bash
   git clone https://github.com/alex-t-reed/Global-Health-Supply-Chain-Analysis-2022
2. Review the SQL analysis script in `analysis.sql` to explore the insights and findings.
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

Thank you for your interest in this analysis!
