/* TRIM the data to avoid errors
UPDATE supply_chain_pricing
SET
  id = TRIM(id),
  project_code = TRIM(project_code),
  pq_number = TRIM(pq_number),
  po_so_number = TRIM(po_so_number),
  asn_dn_number = TRIM(asn_dn_number),
  country = TRIM(country),
  managed_by = TRIM(managed_by),
  fulfill_via = TRIM(fulfill_via),
  vendor_inco_term = TRIM(vendor_inco_term),
  shipment_mode = TRIM(shipment_mode),
  pq_first_sent_to_client_date = TRIM(pq_first_sent_to_client_date),
  po_sent_to_vendor_date = TRIM(po_sent_to_vendor_date),
  scheduled_delivery_date = TRIM(scheduled_delivery_date),
  delivered_to_client_date = TRIM(delivered_to_client_date),
  delivery_recorded_date = TRIM(delivery_recorded_date),
  product_group = TRIM(product_group),
  sub_classification = TRIM(sub_classification),
  vendor = TRIM(vendor),
  item_description = TRIM(item_description),
  molecule_test_type = TRIM(molecule_test_type),
  brand = TRIM(brand),
  dosage = TRIM(dosage),
  dosage_form = TRIM(dosage_form),
  unit_of_measure_per_pack = TRIM(unit_of_measure_per_pack),
  line_item_quantity = TRIM(line_item_quantity),
  line_item_value = TRIM(line_item_value),
  pack_price = TRIM(pack_price),
  unit_price = TRIM(unit_price),
  manufacturing_site = TRIM(manufacturing_site),
  first_line_designation = TRIM(first_line_designation),
  weight_kilograms = TRIM(weight_kilograms),
  freight_cost_usd = TRIM(freight_cost_usd),
  line_item_insurance_usd = TRIM(line_item_insurance_usd); 
  */
-- What shipment methods are used?
SELECT 
  DISTINCT shipment_mode 
FROM 
  supply_chain_pricing 
WHERE 
  shipment_mode IS NOT NULL;
-- Four methods:air truck, air charter, and ocean.
-- How many null shipment modes are there?
SELECT 
  COUNT(*) AS null_shipment_mode_count 
FROM 
  supply_chain_pricing 
WHERE 
  shipment_mode IS NULL;
-- 360 records where the shipment mode is null/unknown.
-- Which shipment method is most used?
SELECT 
  shipment_mode, 
  COUNT(shipment_mode) AS mode_count 
FROM 
  supply_chain_pricing 
WHERE 
  shipment_mode IS NOT NULL 
GROUP BY 
  shipment_mode 
ORDER BY 
  mode_count DESC;
-- Air shipment is most popular with a mode_count of 6113, trucking comes in second  compared to ocean which has a mode_count of 371.
-- Mode country counts?
SELECT 
  shipment_mode, 
  country, 
  COUNT(*) AS mode_country_count 
FROM 
  supply_chain_pricing 
WHERE 
  shipment_mode IN (
    'Air', 'Truck', 'Air Charter', 'Ocean'
  ) 
GROUP BY 
  shipment_mode, 
  country 
ORDER BY 
  shipment_mode, 
  mode_country_count DESC;
--Air is highest in Vietnam, air charter is highest in Nigeria, ocean is highest in South Africa, and truck is highest in South Africa.
-- What are the most common countries in the dataset?
SELECT 
  country, 
  COUNT(country) AS country_count 
FROM 
  supply_chain_pricing 
GROUP BY 
  country 
ORDER BY 
  country_count DESC;
-- South Africa (1406), Nigeria (1194),  Côte d'Ivoire (1083), Uganda (779), and Vietnam (688) are the top five most common countries in the dataset.
-- What is the distribution of product groups in the dataset?
SELECT 
  product_group, 
  COUNT(*) AS group_count 
FROM 
  supply_chain_pricing 
GROUP BY 
  product_group 
ORDER BY 
  group_count DESC;
-- Antiretroviral (ARVs) (8550) is the most common product group followed by HRDTs (1728).
-- What is the average line item value by product group?
SELECT 
  product_group, 
  ROUND(
    AVG(line_item_value), 
    2
  ) AS avg_line_item_value 
FROM 
  supply_chain_pricing 
GROUP BY 
  product_group 
ORDER BY 
  avg_line_item_value DESC;
-- The average line item value for ARV and HRDT are 165288.9 and 123463.4 respectively.
-- What is the average weight in kilograms by shipment mode?
SELECT 
  shipment_mode, 
  ROUND(
    AVG(weight_kilograms), 
    2
  ) AS avg_weight 
FROM 
  supply_chain_pricing 
WHERE 
  weight_kilograms IS NOT NULL 
GROUP BY 
  shipment_mode 
ORDER BY 
  avg_weight DESC;
-- Air Charter has an average weight of 5261.74 kilograms, Ocean has an average weight of 5227.56 kilograms, Truck has an average weight of 2745.23 kilograms, Air has an average weight of 1357.94 kilograms, and there are some records with no specified shipment mode, having an average weight of 1085.92 kilograms.
-- What is the average freight cost in USD by shipment mode?
SELECT 
  shipment_mode, 
  ROUND(
    AVG(freight_cost_usd), 
    2
  ) AS avg_freight_cost 
FROM 
  supply_chain_pricing 
WHERE 
  freight_cost_usd IS NOT NULL 
GROUP BY 
  shipment_mode 
ORDER BY 
  avg_freight_cost DESC;
--Air Charter has the highest average freight cost at 13732.47 USD, followed by Ocean at 9678.51 USD. Truck has the lowest average cost among the shipment modes at 4192.82 USD, and records with null shipment modes have an average cost of 3879.72 USD, which is most similar to the Truck shipment mode.
-- What is the total line item value and freight cost by country?
SELECT 
  country, 
  ROUND(
    SUM(line_item_value), 
    2
  ) AS total_line_item_value, 
  ROUND(
    SUM(freight_cost_usd), 
    2
  ) AS total_freight_cost 
FROM 
  supply_chain_pricing 
GROUP BY 
  country 
ORDER BY 
  total_line_item_value DESC;
-- Nigeria the country using air charter the most, which is the most expensive shipping method, has the highest total line item value and total freight cost, followed by Zambia which has a high total line item value and total freight cost despite being the second highest country using the truck shipment mode. 
-- What is the average unit price by product group and shipment mode?
SELECT 
  product_group, 
  shipment_mode, 
  ROUND(
    AVG(unit_price), 
    2
  ) AS avg_unit_price 
FROM 
  supply_chain_pricing 
WHERE 
  unit_price IS NOT NULL 
GROUP BY 
  product_group, 
  shipment_mode 
ORDER BY 
  product_group, 
  shipment_mode, 
  avg_unit_price DESC;
-- The average unit prices vary significantly among different product groups and shipment modes, with 'HRDT' having the highest average unit price of 7.0 USD for the null shipment mode.
-- What is the distribution of dosage forms across different product groups?
SELECT 
  product_group, 
  dosage_form, 
  COUNT(*) AS form_count 
FROM 
  supply_chain_pricing 
WHERE 
  dosage_form IS NOT NULL 
GROUP BY 
  product_group, 
  dosage_form 
ORDER BY 
  product_group, 
  form_count DESC;
-- ARVs are most commonly found in dosage forms of tablet and tablet - FDC, HRDTs are most commonly found in the form of test kits, and ACTs as Tablet - FDC + blister, and ANTM as Tablet - FDC.
-- Identify vendors with the highest and lowest average unit prices for a specific product group : HRDT.
SELECT 
  product_group, 
  vendor, 
  ROUND(
    AVG(unit_price), 
    2
  ) AS avg_unit_price 
FROM 
  supply_chain_pricing 
WHERE 
  product_group = 'HRDT' 
  AND unit_price IS NOT NULL 
GROUP BY 
  product_group, 
  vendor 
ORDER BY 
  avg_unit_price DESC;
-- BIO-RAD LABORATORIES PTY LTD. (SOUTH AFRICA) has the highest average unit price for HRDT of 41.68 and Premier Medical Corporation Ltd. has the lowest average unit price for HRDT of 0.67.
-- Identify vendors with the highest and lowest average unit prices for a specific product group: ARV.
SELECT 
  product_group, 
  vendor, 
  ROUND(
    AVG(unit_price), 
    2
  ) AS avg_unit_price 
FROM 
  supply_chain_pricing 
WHERE 
  product_group = 'ARV' 
  AND unit_price IS NOT NULL 
GROUP BY 
  product_group, 
  vendor 
ORDER BY 
  avg_unit_price DESC;
-- IDIS LIMITED has the highest average unit price for ARV of 1.64 and AUROBINDO PHARAM (SOUTH AFRICA) has the lowest average unit price for ARV of 0.01.
-- Identify vendors with the highest and lowest average unit prices for a specific product group: ANTM
SELECT 
  product_group, 
  vendor, 
  ROUND(
    AVG(unit_price), 
    2
  ) AS avg_unit_price 
FROM 
  supply_chain_pricing 
WHERE 
  product_group = 'ANTM' 
  AND unit_price IS NOT NULL 
GROUP BY 
  product_group, 
  vendor 
ORDER BY 
  avg_unit_price DESC;
-- AMSTELFARMA B.V. has the highest average unit price for ANTM of 0.15 and THE MEDICAL EXPORT GROUP BV has the lowest average unit price for ANTM of 0.01.
-- Identify vendors with the highest and lowest average unit prices for a specific product group: ACT
SELECT 
  product_group, 
  vendor, 
  ROUND(
    AVG(unit_price), 
    2
  ) AS avg_unit_price 
FROM 
  supply_chain_pricing 
WHERE 
  product_group = 'ACT' 
  AND unit_price IS NOT NULL 
GROUP BY 
  product_group, 
  vendor 
ORDER BY 
  avg_unit_price DESC;
-- MISSIONPHARMA A/S has the highest average unit price for ACT of 0.07 and IDA FOUNDATION has the lowest average unit price for ACT of 0.05.
-- Identify vendors with the highest and lowest average unit prices for a specific product group: MRDT
SELECT 
  product_group, 
  vendor, 
  ROUND(
    AVG(unit_price), 
    2
  ) AS avg_unit_price 
FROM 
  supply_chain_pricing 
WHERE 
  product_group = 'MRDT' 
  AND unit_price IS NOT NULL 
GROUP BY 
  product_group, 
  vendor 
ORDER BY 
  avg_unit_price DESC;
-- ZEPHYR BIOMEDICALS has the highest average unit price for MRDT of 1.5 andACCESS BIO, INC. has the lowest average unit price for MRDT of 0.39.
-- What vendors are most profitable and what country are these vendors from?
SELECT 
  vendor, 
  COUNTRY, 
  ROUND(
    SUM(
      line_item_value - freight_cost_usd
    ), 
    2
  ) AS total_profit 
FROM 
  supply_chain_pricing 
WHERE 
  line_item_value IS NOT NULL 
  AND freight_cost_usd IS NOT NULL 
GROUP BY 
  vendor 
ORDER BY 
  total_profit DESC;
-- SCMS from RDC from Zambia, Orgenics, Ltd from Haiti, and Aurobindo Pharma Limited from Vietnam are the three most portfotable in terms of line item value minus freight costs.
-- Find the 3 most common combination of brand and molecule/test type
SELECT 
  brand, 
  molecule_test_type, 
  COUNT(*) AS combination_count 
FROM 
  supply_chain_pricing 
WHERE 
  brand IS NOT NULL 
  AND molecule_test_type IS NOT NULL 
GROUP BY 
  brand, 
  molecule_test_type 
ORDER BY 
  combination_count DESC 
LIMIT 
  3;
-- Top 3 common brands and molecule/test types combinations are all generic and are Efavirenz (1056), Nevirapine (849), and Lamivudine/Nevirapine/Zidovudine (707).
-- Find the three most common combinations of brand and molecule/test type and their vendors
SELECT 
  brand, 
  molecule_test_type, 
  vendor, 
  COUNT(*) AS combination_count 
FROM 
  supply_chain_pricing 
WHERE 
  brand IS NOT NULL 
  AND molecule_test_type IS NOT NULL 
  AND vendor IS NOT NULL 
GROUP BY 
  brand, 
  molecule_test_type, 
  vendor 
ORDER BY 
  combination_count DESC 
LIMIT 
  3;
-- SCMS from RDC is the vendor for these 3 most common brand/test type combinations and they are also the most profitable, originating from Zambia.
---What are the top 5 product descriptions by Line Item Quantity?
SELECT 
  item_description, 
  SUM(line_item_quantity) AS total_quantity 
FROM 
  supply_chain_pricing 
GROUP BY 
  item_description 
ORDER BY 
  total_quantity DESC 
LIMIT 
  5;
-- (1) Lamivudine/Nevirapine/Zidovudine 150/200/300mg, tablets, 60 Tabs, (2) Efavirenz 600mg, tablets, 30 Tabs, (3) Efavirenz/Lamivudine/Tenofovir Disoproxil Fumarate 600/300/300mg, tablets, 30 Tabs, 4 (Nevirapine 200mg, tablets, 60 Tabs), 5 (Lamivudine/Zidovudine 150/300mg, tablets, 60 Tabs).
-- what shipment modes do product groups typically use?
SELECT 
  product_group, 
  shipment_mode, 
  COUNT(*) AS mode_count 
FROM 
  supply_chain_pricing 
WHERE 
  shipment_mode IS NOT NULL 
GROUP BY 
  product_group, 
  shipment_mode 
ORDER BY 
  product_group, 
  mode_count DESC;
