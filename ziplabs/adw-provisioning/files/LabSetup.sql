CREATE OR REPLACE ATTRIBUTE DIMENSION sh_times_attr_dim
USING sh.times
ATTRIBUTES
 (time_id,
  calendar_month_desc,
  end_of_cal_month, 
  calendar_quarter_desc,
  end_of_cal_quarter, 
  calendar_year,
  end_of_cal_year,
  fiscal_month_desc,
  end_of_fis_month, 
  fiscal_quarter_desc,
  end_of_fis_quarter,
  fiscal_year,
  end_of_fis_year
    )
  LEVEL day
     KEY time_id
     MEMBER NAME to_char(time_id)
     MEMBER CAPTION to_char(time_id)
     MEMBER DESCRIPTION to_char(time_id)
     ORDER BY time_id
     DETERMINES(calendar_month_desc,fiscal_month_desc)
  LEVEL calendar_month
    KEY calendar_month_desc
    MEMBER NAME calendar_month_desc
    MEMBER CAPTION calendar_month_desc
    MEMBER DESCRIPTION calendar_month_desc
    ORDER BY end_of_cal_month
    DETERMINES(calendar_quarter_desc)
  LEVEL calendar_quarter
    KEY calendar_quarter_desc
    MEMBER NAME calendar_quarter_desc
    MEMBER CAPTION calendar_quarter_desc
    MEMBER DESCRIPTION calendar_quarter_desc
    ORDER BY end_of_cal_quarter
    DETERMINES(calendar_year)
  LEVEL calendar_year
    KEY calendar_year
    MEMBER NAME TO_CHAR(calendar_year)
    MEMBER CAPTION TO_CHAR(calendar_year)
    MEMBER DESCRIPTION TO_CHAR(calendar_year)
  LEVEL fiscal_month
    KEY fiscal_month_desc
    MEMBER NAME fiscal_month_desc
    MEMBER CAPTION fiscal_month_desc
    MEMBER DESCRIPTION fiscal_month_desc
    ORDER BY end_of_fis_month
    DETERMINES(fiscal_quarter_desc)
  LEVEL fiscal_quarter
    KEY fiscal_quarter_desc
    MEMBER NAME fiscal_quarter_desc
    MEMBER CAPTION fiscal_quarter_desc
    MEMBER DESCRIPTION fiscal_quarter_desc
    ORDER BY end_of_fis_quarter
    DETERMINES(fiscal_year)
  LEVEL fiscal_year
    KEY fiscal_year
    MEMBER NAME TO_CHAR(fiscal_year)
    MEMBER CAPTION TO_CHAR(fiscal_year)
    MEMBER DESCRIPTION TO_CHAR(fiscal_year)
    ORDER BY end_of_fis_year
  ALL MEMBER NAME 'ALL YEARS';
  
CREATE OR REPLACE ATTRIBUTE DIMENSION sh_times_attr_dim
  CLASSIFICATION caption VALUE 'Time'
  CLASSIFICATION description VALUE 'Time'
USING sh.times
ATTRIBUTES
 (time_id
    CLASSIFICATION caption VALUE 'Day'
    CLASSIFICATION description VALUE 'Day',
  calendar_month_desc
    CLASSIFICATION caption VALUE 'Calendar Month'
    CLASSIFICATION description VALUE 'Calendar Month',
  end_of_cal_month
    CLASSIFICATION caption VALUE 'End of Calendar Month'
    CLASSIFICATION description VALUE 'End of Calendar Month', 
  calendar_quarter_desc
    CLASSIFICATION caption VALUE 'Calendar Quarter'
    CLASSIFICATION description VALUE 'Calendar Quarter',
  end_of_cal_quarter
    CLASSIFICATION caption VALUE 'End of Calendar Quarter'
    CLASSIFICATION description VALUE 'End of Calendar Quarter', 
  calendar_year
    CLASSIFICATION caption VALUE 'Calendar Year'
    CLASSIFICATION description VALUE 'Calendar Year',
  end_of_cal_year
    CLASSIFICATION caption VALUE 'End of Calendar Year'
    CLASSIFICATION description VALUE 'End of Calendar Year', 
  fiscal_month_desc
    CLASSIFICATION caption VALUE 'Fiscal Month'
    CLASSIFICATION description VALUE 'Fiscal Month',
  end_of_fis_month
    CLASSIFICATION caption VALUE 'End of Fiscal Month'
    CLASSIFICATION description VALUE 'End of Fiscal Month', 
  fiscal_quarter_desc
    CLASSIFICATION caption VALUE 'Fiscal Quarter'
    CLASSIFICATION description VALUE 'Calendar Quarter',
  end_of_fis_quarter
    CLASSIFICATION caption VALUE 'End of Fiscal Quarter'
    CLASSIFICATION description VALUE 'End of Fiscal Quarter', 
  fiscal_year
    CLASSIFICATION caption VALUE 'Fiscal Year'
    CLASSIFICATION description VALUE 'Fiscal Year',
  end_of_fis_year
    CLASSIFICATION caption VALUE 'End of Fiscal Year'
    CLASSIFICATION description VALUE 'End of Fiscal Year' 
    )
  LEVEL day
    CLASSIFICATION caption VALUE 'Day'
    CLASSIFICATION description VALUE 'Day'
     KEY time_id
     MEMBER NAME to_char(time_id)
     MEMBER CAPTION to_char(time_id)
     MEMBER DESCRIPTION to_char(time_id)
     ORDER BY time_id
     DETERMINES(calendar_month_desc,fiscal_month_desc)
  LEVEL calendar_month
    CLASSIFICATION caption VALUE 'Calendar Month'
    CLASSIFICATION description VALUE 'Calendar Month'
    KEY calendar_month_desc
    MEMBER NAME calendar_month_desc
    MEMBER CAPTION calendar_month_desc
    MEMBER DESCRIPTION calendar_month_desc
    ORDER BY end_of_cal_month
    DETERMINES(calendar_quarter_desc)
  LEVEL calendar_quarter
    CLASSIFICATION caption VALUE 'Calendar Quarter'
    CLASSIFICATION description VALUE 'Calendar Quarter'
    KEY calendar_quarter_desc
    MEMBER NAME calendar_quarter_desc
    MEMBER CAPTION calendar_quarter_desc
    MEMBER DESCRIPTION calendar_quarter_desc
    ORDER BY end_of_cal_quarter
    DETERMINES(calendar_year)
  LEVEL calendar_year
    CLASSIFICATION caption VALUE 'Calendar Year'
    CLASSIFICATION description VALUE 'Calendar Year'
    KEY calendar_year
    MEMBER NAME TO_CHAR(calendar_year)
    MEMBER CAPTION TO_CHAR(calendar_year)
    MEMBER DESCRIPTION TO_CHAR(calendar_year)
  LEVEL fiscal_month
    CLASSIFICATION caption VALUE 'Fiscal Month'
    CLASSIFICATION description VALUE 'Fiscal Month'
    KEY fiscal_month_desc
    MEMBER NAME fiscal_month_desc
    MEMBER CAPTION fiscal_month_desc
    MEMBER DESCRIPTION fiscal_month_desc
    ORDER BY end_of_fis_month
    DETERMINES(fiscal_quarter_desc)
  LEVEL fiscal_quarter
    CLASSIFICATION caption VALUE 'Fiscal Quarter'
    CLASSIFICATION description VALUE 'Fiscal Quarter'
    KEY fiscal_quarter_desc
    MEMBER NAME fiscal_quarter_desc
    MEMBER CAPTION fiscal_quarter_desc
    MEMBER DESCRIPTION fiscal_quarter_desc
    ORDER BY end_of_fis_quarter
    DETERMINES(fiscal_year)
  LEVEL fiscal_year
    CLASSIFICATION caption VALUE 'Fiscal Year'
    CLASSIFICATION description VALUE 'Fiscal Year'
    KEY fiscal_year
    MEMBER NAME TO_CHAR(fiscal_year)
    MEMBER CAPTION TO_CHAR(fiscal_year)
    MEMBER DESCRIPTION TO_CHAR(fiscal_year)
    ORDER BY end_of_fis_year
  ALL MEMBER NAME 'ALL YEARS';

CREATE OR REPLACE HIERARCHY sh_times_calendar_hier
  CLASSIFICATION caption VALUE 'Calendar Year'
  CLASSIFICATION description VALUE 'Calendar Year'
  USING sh_times_attr_dim
    (day CHILD OF
     calendar_month CHILD OF
     calendar_quarter CHILD OF
     calendar_year);  

CREATE OR REPLACE HIERARCHY sh_times_fiscal_hier
  CLASSIFICATION caption VALUE 'Fiscal Year'
  CLASSIFICATION description VALUE 'Fiscal Year'
  USING sh_times_attr_dim
    (day CHILD OF
     fiscal_month CHILD OF
     fiscal_quarter CHILD OF
     fiscal_year);
     
CREATE OR REPLACE ATTRIBUTE DIMENSION sh_products_attr_dim
USING sh.products
ATTRIBUTES (
  prod_id
    CLASSIFICATION caption VALUE 'Product'
    CLASSIFICATION description VALUE 'Product',
  prod_name
    CLASSIFICATION caption VALUE 'Product'
    CLASSIFICATION description VALUE 'Product',
  prod_subcategory
    CLASSIFICATION caption VALUE 'Subcategory'
    CLASSIFICATION description VALUE 'Subcategory',
  prod_category
    CLASSIFICATION caption VALUE 'Category'
    CLASSIFICATION description VALUE 'Category'
    )
  LEVEL PRODUCT
    CLASSIFICATION caption VALUE 'Product'
    CLASSIFICATION description VALUE 'Product'
    KEY prod_id
    MEMBER NAME prod_name
    MEMBER CAPTION prod_name
    MEMBER DESCRIPTION prod_name
    ORDER BY prod_name
    DETERMINES (prod_subcategory)
  LEVEL SUBCATEGORY
    CLASSIFICATION caption VALUE 'Subcategory'
    CLASSIFICATION description VALUE 'Subcategory'
    KEY prod_subcategory
    MEMBER NAME prod_subcategory
    MEMBER CAPTION prod_subcategory
    MEMBER DESCRIPTION prod_subcategory
    ORDER BY prod_subcategory
    DETERMINES (prod_category)
  LEVEL CATEGORY
    CLASSIFICATION caption VALUE 'Category'
    CLASSIFICATION description VALUE 'Category'
    KEY prod_category
    MEMBER NAME prod_category
    MEMBER CAPTION prod_category
    MEMBER DESCRIPTION prod_category
    ORDER BY prod_category
  ALL MEMBER NAME 'ALL PRODUCTS';
  
CREATE OR REPLACE HIERARCHY sh_products_hier
  CLASSIFICATION caption VALUE 'Products'
  CLASSIFICATION description VALUE 'Products'
USING sh_products_attr_dim
 (product CHILD OF
  subcategory CHILD OF
  category);  
  
CREATE OR REPLACE VIEW sh_customers_dim_view AS
SELECT
  a.cust_id,
  a.cust_last_name || ', ' || a.cust_first_name as customer_name,
  a.cust_city || ', ' || a.cust_state_province || ', ' || a.country_id as city_id,
  a.cust_city as city_name,
  a.cust_state_province || ', ' || a.country_id as state_province_id,
  a.cust_state_province as state_province_name,
  b.country_id,
  b.country_name,
  b.country_subregion as subregion,
  b.country_region as region
FROM sh.customers a, sh.countries b
where a.country_id = b.country_id;  


CREATE OR REPLACE ATTRIBUTE DIMENSION sh_customers_attr_dim
USING sh_customers_dim_view
ATTRIBUTES (
 cust_id
    CLASSIFICATION caption VALUE 'Customer'
    CLASSIFICATION description VALUE 'Customer',
  customer_name
    CLASSIFICATION caption VALUE 'Customer'
    CLASSIFICATION description VALUE 'Customer',
  city_id
    CLASSIFICATION caption VALUE 'City'
    CLASSIFICATION description VALUE 'City',
  city_name
    CLASSIFICATION caption VALUE 'City'
    CLASSIFICATION description VALUE 'City',
  state_province_id
    CLASSIFICATION caption VALUE 'State Province'
    CLASSIFICATION description VALUE 'State Province',
  state_province_name
    CLASSIFICATION caption VALUE 'State Province'
    CLASSIFICATION description VALUE 'State Province',
  country_id
    CLASSIFICATION caption VALUE 'Country'
    CLASSIFICATION description VALUE 'Country',
   country_name
    CLASSIFICATION caption VALUE 'Country'
    CLASSIFICATION description VALUE 'Country',
   subregion
    CLASSIFICATION caption VALUE 'Subregion'
    CLASSIFICATION description VALUE 'Subregion',
    region
    CLASSIFICATION caption VALUE 'Region'
    CLASSIFICATION description VALUE 'Region'
    )
  LEVEL CUSTOMER
    CLASSIFICATION caption VALUE 'Customer'
    CLASSIFICATION description VALUE 'Customer'
    KEY cust_id
    MEMBER NAME customer_name
    MEMBER CAPTION customer_name
    MEMBER DESCRIPTION customer_name
    ORDER BY customer_name
    DETERMINES (city_id)
  LEVEL CITY
    CLASSIFICATION caption VALUE 'City'
    CLASSIFICATION description VALUE 'City'
    KEY city_id
    MEMBER NAME city_name
    MEMBER CAPTION city_name
    MEMBER DESCRIPTION city_name
    ORDER BY city_name
    DETERMINES (state_province_id)
  LEVEL STATE_PROVINCE
    CLASSIFICATION caption VALUE 'State_Province'
    CLASSIFICATION description VALUE 'State Province'
    KEY state_province_id
    MEMBER NAME state_province_name
    MEMBER CAPTION state_province_name
    MEMBER DESCRIPTION state_province_name
    ORDER BY state_province_name
    DETERMINES (country_id)
  LEVEL COUNTRY
    CLASSIFICATION caption VALUE 'Country'
    CLASSIFICATION description VALUE 'Country'
    KEY country_id
    MEMBER NAME country_name
    MEMBER CAPTION country_name
    MEMBER DESCRIPTION country_name
    ORDER BY country_name
    DETERMINES (subregion)
 LEVEL SUBREGION
    CLASSIFICATION caption VALUE 'Subregion'
    CLASSIFICATION description VALUE 'Subregion'
    KEY subregion
    MEMBER NAME subregion
    MEMBER CAPTION subregion
    MEMBER DESCRIPTION subregion
    ORDER BY subregion
    DETERMINES (region)
  LEVEL REGION
    CLASSIFICATION caption VALUE 'Region'
    CLASSIFICATION description VALUE 'Region'
    KEY region
    MEMBER NAME region
    MEMBER CAPTION region
    MEMBER DESCRIPTION region
    ORDER BY region
  ALL MEMBER NAME 'ALL CUSTOMERS';
  
CREATE OR REPLACE HIERARCHY sh_customers_hier
  CLASSIFICATION caption VALUE 'Customers'
  CLASSIFICATION description VALUE 'Customers'
USING sh_customers_attr_dim
 (customer CHILD OF
  city CHILD OF
  state_province CHILD OF
  country CHILD OF
  subregion CHILD OF
  region);
  
CREATE OR REPLACE ATTRIBUTE DIMENSION sh_channels_attr_dim
  CLASSIFICATION caption VALUE 'Channels'
  CLASSIFICATION description VALUE 'Channels'
USING sh.channels
ATTRIBUTES (
  channel_id
    CLASSIFICATION caption VALUE 'Channel'
    CLASSIFICATION description VALUE 'Channel',
  channel_desc
    CLASSIFICATION caption VALUE 'Channel'
    CLASSIFICATION description VALUE 'Channel',
  channel_class
    CLASSIFICATION caption VALUE 'Channel Class'
    CLASSIFICATION description VALUE 'Channel Class'
  )   
  LEVEL CHANNEL
    CLASSIFICATION caption VALUE 'Channel'
    CLASSIFICATION description VALUE 'Channel'
    KEY channel_id
    MEMBER NAME channel_desc
    MEMBER CAPTION channel_desc
    ORDER BY channel_desc
    DETERMINES (channel_class)
  LEVEL CHANNEL_CLASS
    CLASSIFICATION caption VALUE 'Channel_Class'
    CLASSIFICATION description VALUE 'Channel Class'
    KEY channel_class
    MEMBER NAME channel_class
    MEMBER CAPTION channel_class
    ORDER BY channel_class 
  ALL MEMBER NAME 'ALL CHANNELS';
  
CREATE OR REPLACE HIERARCHY sh_channels_hier
  CLASSIFICATION caption VALUE 'Channels'
  CLASSIFICATION description VALUE 'Channels'
USING sh_channels_attr_dim
 (channel CHILD OF
  channel_class);
  
CREATE OR REPLACE ATTRIBUTE DIMENSION sh_promotions_attr_dim
  CLASSIFICATION caption VALUE 'Promotions'
  CLASSIFICATION description VALUE 'Promotions'
USING sh.promotions
ATTRIBUTES (
  promo_id
    CLASSIFICATION caption VALUE 'promotion'
    CLASSIFICATION description VALUE 'promotion',
  promo_name
    CLASSIFICATION caption VALUE 'promotion'
    CLASSIFICATION description VALUE 'promotion',
  promo_subcategory
    CLASSIFICATION caption VALUE 'Subcategory'
    CLASSIFICATION description VALUE 'Subcategory',
  promo_category
    CLASSIFICATION caption VALUE 'Category'
    CLASSIFICATION description VALUE 'Category'  
  )
  LEVEL PROMOTION
    CLASSIFICATION caption VALUE 'promotion'
    CLASSIFICATION description VALUE 'promotion'
    KEY promo_id
    MEMBER NAME promo_name
    MEMBER CAPTION promo_name
    ORDER BY promo_name
    DETERMINES (promo_subcategory)
  LEVEL SUBCATEGORY
    CLASSIFICATION caption VALUE 'Subcategory'
    CLASSIFICATION description VALUE 'Subcategory'
    KEY promo_subcategory
    MEMBER NAME promo_subcategory
    MEMBER CAPTION promo_subcategory
    ORDER BY promo_subcategory
    DETERMINES (promo_category)
  LEVEL CATEGORY
    CLASSIFICATION caption VALUE 'Category'
    CLASSIFICATION description VALUE 'Category'
    KEY promo_category
    MEMBER NAME promo_category
    MEMBER CAPTION promo_category
    ORDER BY promo_category
  ALL MEMBER NAME 'ALL PROMOTIONS';
  
CREATE OR REPLACE HIERARCHY sh_promotions_hier
  CLASSIFICATION caption VALUE 'Promotions'
  CLASSIFICATION description VALUE 'Promotions'
USING sh_promotions_attr_dim
 (promotion CHILD OF
  subcategory CHILD OF
  category);  
  

CREATE OR REPLACE ANALYTIC VIEW sh_sales_history_av
 CLASSIFICATION caption VALUE 'Sales History (SH Sample Schema)'
 CLASSIFICATION description VALUE 'Sales History by Time, Product, Customer, Channel and Promotion'
 -- This AV references the SALES fact table.
USING sh.sales 
-- This is where hierarchies are joined into the analytic view.
DIMENSION BY
 (
  sh_times_attr_dim KEY time_id REFERENCES time_id HIERARCHIES (sh_times_calendar_hier DEFAULT, sh_times_fiscal_hier),
  sh_products_attr_dim KEY prod_id REFERENCES prod_id
 HIERARCHIES (sh_products_hier DEFAULT),
  sh_customers_attr_dim KEY cust_id REFERENCES cust_id HIERARCHIES (sh_customers_hier DEFAULT),
  sh_channels_attr_dim KEY channel_id REFERENCES channel_id HIERARCHIES (sh_channels_hier DEFAULT),
  sh_promotions_attr_dim KEY promo_id REFERENCES promo_id HIERARCHIES (sh_promotions_hier DEFAULT)  
  )
MEASURES (
  -- Amount sold maps to the fact table.
  amount_sold FACT amount_sold
    CLASSIFICATION caption VALUE 'Amount Sold'
    CLASSIFICATION description VALUE 'Amount Sold'
    CLASSIFICATION format_string VALUE '999,999,999,999.99',
  -- Quantity sold maps to the fact table.
  quantity_sold FACT quantity_sold
    CLASSIFICATION caption VALUE 'Quantity Sold'
    CLASSIFICATION description VALUE 'Quantity Sold'
    CLASSIFICATION format_string VALUE '999,999,999,999'
  )
DEFAULT MEASURE amount_sold;

CREATE OR REPLACE ANALYTIC VIEW sh_sales_history_av
 CLASSIFICATION caption VALUE 'Sales History (SH Sample Schema)'
 CLASSIFICATION description VALUE 'Sales History by Time, Product, Customer, Channel and Promotion'
USING sh.sales 
DIMENSION BY
 (
  sh_times_attr_dim KEY time_id REFERENCES time_id HIERARCHIES (sh_times_calendar_hier DEFAULT, sh_times_fiscal_hier),
  sh_products_attr_dim KEY prod_id REFERENCES prod_id HIERARCHIES (sh_products_hier DEFAULT),
  sh_customers_attr_dim KEY cust_id REFERENCES cust_id HIERARCHIES (sh_customers_hier DEFAULT),
  sh_channels_attr_dim KEY channel_id REFERENCES channel_id HIERARCHIES (sh_channels_hier DEFAULT),
  sh_promotions_attr_dim KEY promo_id REFERENCES promo_id HIERARCHIES (sh_promotions_hier DEFAULT)  
  )
MEASURES (
  -- Amount sold maps to the fact table.
  amount_sold FACT amount_sold
    CLASSIFICATION caption VALUE 'Amount Sold'
    CLASSIFICATION description VALUE 'Amount Sold'
    CLASSIFICATION format_string VALUE '999,999,999,999.99',
  -- Quantity sold maps to the fact table.
  quantity_sold FACT quantity_sold
    CLASSIFICATION caption VALUE 'Quantity Sold'
    CLASSIFICATION description VALUE 'Quantity Sold'
    CLASSIFICATION format_string VALUE '999,999,999,999',
  -- Ratio of amount sold for the current value to the parent product value. 
  amt_sold_shr_parent_prod AS (SHARE_OF(amount_sold HIERARCHY sh_products_hier PARENT))
    CLASSIFICATION caption VALUE 'Sales Product Share of Parent'
    CLASSIFICATION description VALUE 'Sales Product Share of Parent'
    CLASSIFICATION format_string VALUE '999.99',
  -- Ratio of amount sold for the current value to the parent customer value. 
  sales_shr_parent_cust AS (SHARE_OF(amount_sold HIERARCHY sh_customers_hier PARENT))
    CLASSIFICATION caption VALUE 'Sales Customer Share of Parent'
    CLASSIFICATION description VALUE 'Sales Customer Share of Parent'
    CLASSIFICATION format_string VALUE '999,999,999,999.99',
  --
  -- Calendar Year measures
  --
  -- Sales Calendar Year to Date  
  sales_cal_ytd AS (SUM(amount_sold) OVER (HIERARCHY sh_times_calendar_hier BETWEEN UNBOUNDED PRECEDING AND CURRENT MEMBER WITHIN ANCESTOR AT LEVEL calendar_year))
    CLASSIFICATION caption VALUE 'Sales Calendar YTD'
    CLASSIFICATION description VALUE 'Sales Calendar YTD'
    CLASSIFICATION format_string VALUE '999,999,999,999.99',
   -- Sales same period 1 year ago.
  sales_cal_year_ago as (LAG(amount_sold) OVER (HIERARCHY sh_times_calendar_hier OFFSET 1 ACROSS ANCESTOR AT LEVEL calendar_year))
    CLASSIFICATION caption VALUE 'Sales Calendar Year Ago'
    CLASSIFICATION description VALUE 'Sales Year Ago'
    CLASSIFICATION format_string VALUE '$999,999,999,999.99',
   -- Change in sales for the current period as compared to the same period 1 year ago.
  sales_chg_cal_year_ago as (LAG_DIFF(amount_sold) OVER (HIERARCHY sh_times_calendar_hier OFFSET 1 ACROSS ANCESTOR AT LEVEL calendar_year))
    CLASSIFICATION caption VALUE 'Sales Change Calendar Year Ago'
    CLASSIFICATION description VALUE 'Sales Change Calendar Year Ago'
    CLASSIFICATION format_string VALUE '$999,999,999,999.99',
   -- Percent change in sales for the current period as compared to the same period 1 year ago. 
  sales_pctchg_cal_year_ago as (LAG_DIFF_PERCENT(amount_sold) OVER (HIERARCHY sh_times_calendar_hier OFFSET 1 ACROSS ANCESTOR AT LEVEL calendar_year))
    CLASSIFICATION caption VALUE 'Sales Percent Change Calendar Year Ago'
    CLASSIFICATION description VALUE 'Sales Percent Change Calendar Year Ago'
    CLASSIFICATION format_string VALUE '999.99',
  --
  -- Fiscal Year measures
  --
  sales_fis_ytd AS (SUM(amount_sold) OVER (HIERARCHY sh_times_fiscal_hier BETWEEN UNBOUNDED PRECEDING AND CURRENT MEMBER WITHIN ANCESTOR AT LEVEL fiscal_year))
    CLASSIFICATION caption VALUE 'Sales Fiscal YTD'
    CLASSIFICATION description VALUE 'Sales Fiscal YTD'
    CLASSIFICATION format_string VALUE '999,999,999,999.99',
  sales_fis_year_ago as (LAG(amount_sold) OVER (HIERARCHY sh_times_fiscal_hier OFFSET 1 ACROSS ANCESTOR AT LEVEL fiscal_year))
    CLASSIFICATION caption VALUE 'Sales Fiscal Year Ago'
    CLASSIFICATION description VALUE 'Sales Fiscal Year Ago'
    CLASSIFICATION format_string VALUE '$999,999,999,999.99',
   -- Change in sales for the current period as compared to the same period 1 year ago.
  sales_chg_fis_year_ago as (LAG_DIFF(amount_sold) OVER (HIERARCHY sh_times_fiscal_hier OFFSET 1 ACROSS ANCESTOR AT LEVEL fiscal_year))
    CLASSIFICATION caption VALUE 'Sales Change Fiscal Year Ago'
    CLASSIFICATION description VALUE 'Sales Change Fiscal Year Ago'
    CLASSIFICATION format_string VALUE '$999,999,999,999.99',
   -- Percent change in sales for the current period as compared to the same period 1 year ago. 
  sales_pctchg_fis_year_ago as (LAG_DIFF_PERCENT(amount_sold) OVER (HIERARCHY sh_times_fiscal_hier OFFSET 1 ACROSS ANCESTOR AT LEVEL fiscal_year))
    CLASSIFICATION caption VALUE 'Sales Percent Change Fiscal Year Ago'
    CLASSIFICATION description VALUE 'Sales Percent Change Fiscal Year Ago'
    CLASSIFICATION format_string VALUE '999.99'
  )
DEFAULT MEASURE amount_sold;



