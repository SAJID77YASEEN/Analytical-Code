# Analytical-Codes
1) >>Blueprint : Electric Vehicle Population Trend Analysis 

Key Questions Solved:

 How many total EVs are currently registered? 

Which EV models and makes are most popular? 

What is the trend of EV adoption by year?

 What is the average electric range and MSRP? 

What is the geographical spread of EVs? 

How old are most EVs on the road? 

What type of EVs are most adopted (BEV vs PHEV)? 

What I built: ✅ EV population trend analysis ✅ Model and make popularity ✅ Vehicle age banding & adoption patterns ✅ Price vs range analysis ✅ Geo-mapped EV adoption across cities

Skills Demonstrated: Data modeling | DAX calculated columns & measures mastery | ETL | Regression & interactive analysis | Business Insights | engineering Allied fields Power Query (M) | BI Workspaces | dimensions & metrics | RDBMS | Interactive Visualizations | Advanced filtering | Insight generation | Theory and interactivity | Analytical storytelling for business | Visual branding and presentation

Columns used: VIN (for counting vehicles) Make Model Year EV Type (Battery Electric / Plug-In Hybrid) Electric Range Base MSRP City / Postal Code Data Cleaning & Preparation Steps: Model Year to Numeric: Converted text to whole number. Remove Missing: Filtered out rows with missing or zero VIN, Make, or Model.

 DAX Measures (& Metrics)
Total EVs: Total EVs = COUNTROWS('EV Data')

Average Base MSRP: Avg Base MSRP = AVERAGE('EV Data'[Base MSRP])

Average Electric Range: Avg Electric Range = AVERAGE('EV Data'[Electric Range])

Most Common Model Year : Top Model Year =

CALCULATE(

MAX('EV Data'[Model Year]),

TOPN(1, SUMMARIZE('EV Data', 'EV Data'[Model Year], "Count", COUNTROWS('EV Data')), [Count], DESC)

)

Total Unique Models: Unique Models = DISTINCTCOUNT('EV Data'[Model])

Groupings (DAX Columns)
Vehicle Age Band: Vehicle Age Band =
SWITCH(

TRUE(),

'EV Data'[Vehicle Age] <= 2, "0-2 Years",

'EV Data'[Vehicle Age] <= 5, "3-5 Years",

'EV Data'[Vehicle Age] <= 10, "6-10 Years",

"10+ Years"

)

 Derived Column: 

Vehicle Age : Vehicle Age = YEAR(TODAY()) - 'EV Data'[Model Year] Vehicle Age Band : Vehicle Age Band = SWITCH(TRUE(), 'EV Data'[Vehicle Age]

Relationships:
Only one main flat table is used (EV Data), so relationships were not complex. However, this model is built in a way that it's easy to extend to a star schema (e.g., separate tables for Make, City, Year).

Color Theme:
Background: Neon green automotive theme (high contrast)
Text: White on dark background
Accent: Branded green (matching EV icon), custom fonts/logos applied


Recommended Charts with Full Setup
#TypeVisual Purpose Setup

1️⃣Card (KPI)Show Key Metrics at a glance Fields: • Total EVs (DAX) • Avg Base MSRP (DAX) • Avg Electric Range (DAX) • Top Model Year (DAX)
2️⃣Clustered Column Chart Count of EVs by Model Year-Axis: Model Year Y-Axis: Count of VIN or Total EVs (Measure) Legend: EV Type or Make (optional) Tooltips: Electric Range, Base MSRP
3️⃣Stacked Bar Chart Compare EV distribution by Make Y-Axis: Make X-Axis: Count of VIN Legend: EV Type Tooltips: Avg MSRP, Electric Range
4️⃣Map (Filled or Bubble)Show EV adoption across cities or zip codes Location: City or Postal Code Size: Total EVs Tooltips: Make, Model, Model Year
5️⃣Donut Chart Vehicle Type share Legend: Electric Vehicle Type Values: Count of VIN Tooltips: Make, Model Year, Avg Range
6️⃣Tree map Model Share by Make Group: Make Details: Model Values: Count of VIN Tooltips: Avg Range, Vehicle Age
7️⃣Line Chart (Optional)Trend in EVs over time X-Axis: Model Year Y-Axis: Count of VIN Legend: EV Type or Make
8️⃣Table/Matrix Detailed view by Make + Model + Range Rows: Make, Model Values: Electric Range, Avg Base MSRP, Model Year Conditional Formatting: On Range/MSRP
9️⃣Histogram (Custom visual)Vehicle Age Distribution Axis: Vehicle Age Band Values: Count of VIN

Data Overview: Source: Government datasets 

Main Takeaways
🔋 Data uncovers where EV incentives be working 📍 High-density zones point to infrastructure needs 🧠 Range gaps indicate cost-performance tradeoffs

🔷 Data Limitations
Doesn’t include owner demographics, charging station data, or usage stats
Could be enhanced with weather, fuel cost, or CO2 savings info

2) >>Blueprint: Interactive Heart Disease Risk Analysis  

 Executive Summary:  
This project is directed to transform a raw, clinical dataset on cardiac events into a dynamic and 
insightful Analysis using a Power Tool such as Power BI . The primary objective was to move 
beyond simple data points to uncover the underlying story of heart disease risk. By analyzing 
demographic and clinical factors, we aimed to answer a critical question: Who is most at risk, 
and why? The resulting dashboard serves as a powerful tool for exploratory analysis, capable of 
delivering clear, actionable insights to both technical and non-technical audiences, from 
healthcare analysts to HR recruiters assessing analytical skills. 

2. The Initial Challenge: Finding the Signal in the Noise 
Started with a dataset containing over 1,000 patient records. While rich with potential, the raw 
data presented several problems: 
• Data Redundancy: The dataset was inflated with over 700 duplicate entries, which 
would have severely skewed any analysis and led to inaccurate conclusions. 
• Lack of Clarity: Column names were abbreviated (e.g., cp, trestbps), and key data points 
were purely numerical, making them difficult for a general audience to interpret. 
• Unstructured Insights: The relationships between factors like age, cholesterol, chest 
pain, and heart disease were hidden within the raw numbers, requiring a structured 
approach to uncover and visualize them. 
The mission was to solve these issues by building a robust, user-friendly dashboard that could 
clearly communicate risk factors and patient profiles. 

3. Phase 1: Building a Solid Foundation with Data Cleaning (Power Query) 
Before any analysis, I used Power BI's Power Query Editor to meticulously clean and prepare the 
data. This was the most critical step for ensuring the reliability of our insights. 
• Problem Solved: Data Inaccuracy 
• Action: I performed de-duplication by selecting all columns and using the 
"Remove Duplicates" function. This reduced the dataset from 1,025 to 302 
unique and valid patient records, ensuring our KPIs reflect the true population. 
• Problem Solved: Poor Readability 
• Action:  Executed column formatting by renaming technical headers to be 
descriptive. For example, cp became Chest Pain 
Type and trestbps became Resting Blood Pressure. This made the final dashboard 
intuitive. 
• Problem Solved: Enabling Deeper Analysis 
• Action: Created derived columns to segment the data. Using M language, we 
engineered an Age Group column (Young, Middle, Senior) and a Risk 
Level column (High, Low) based on cholesterol and blood pressure, allowing for 
more granular comparisons. 

4. Phase 2: The Engine Room - Data Modeling and DAX 
With clean data, I moved to the modeling phase. Because I consolidated everything into one 
clean table, no complex model relationships were needed. The focus was on writing powerful 
DAX (Data Analysis Expressions) formulas to create the metrics that would drive our visuals. 
DAX Calculated Columns (Creating User-Friendly Labels): 
These columns were added to translate numerical codes into plain English for use in filters and 
legends. 
• Disease Status = IF('heart_disease'[heart_disease] = 1, "Present", "Absent") 
• Gender = IF('heart_disease'[sex] = 1, "Male", "Female") 
• Chest Pain Label = SWITCH(TRUE(), 'heart_disease'[chest_pain_type] = 0, "Typical 
Angina", 'heart_disease'[chest_pain_type] = 1, "Atypical Angina", 
'heart_disease'[chest_pain_type] = 2, "Non-Anginal Pain", "Asymptomatic") 
DAX Measures (The Core KPIs): 
These measures perform the crucial calculations that quantify our insights. 
• Overall Prevalence: Heart Disease Prevalence = 
DIVIDE(CALCULATE(COUNTROWS('heart_disease'), 'heart_disease'[heart_disease]=1), 
COUNTROWS('heart_disease')) 
• Gender-Specific Risk: Male Disease Ratio = CALCULATE([Heart Disease Prevalence], 
'heart_disease'[sex]=1) 
• Age-Related Risk: Avg Age with Disease = CALCULATE(AVERAGE('heart_disease'[age]), 
'heart_disease'[heart_disease]=1) 
• Clinical Indicators: High Cholesterol Rate = 
DIVIDE(CALCULATE(COUNTROWS('heart_disease'), 'heart_disease'[cholesterol] > 240), 
COUNTROWS('heart_disease')) 

5. Phase 3: The Story - Visuals and Insights 
Each visual was carefully chosen to answer a specific question and prove a point. 
• KPI Cards (Top Banner) 
• Reasoning: To provide an immediate, high-level summary of the most critical 
metrics. This gives any viewer an instant understanding of the dataset's key 
f
 igures before they dive deeper. 
• Insights: Showcases the overall disease count, the average age of afflicted 
patients, and the male/female risk ratio immediately. 

• Bar Chart: Age Impact on Heart Disease 
• Visual: Clustered Bar Chart 
• Axis: X-Axis: Age Group, Y-Axis: Count of Patients, Legend: Disease Status 
• Reasoning: This is the best visual for comparing a metric across distinct 
categories. It was deployed to directly address the hypothesis that age is a major 
risk factor. 
• Problem Solved: It visually proves that the prevalence of heart disease increases 
dramatically with age, with the "Senior" group showing the highest proportion of 
cases. 

• Donut Chart: Gender Risk Breakdown 
• Visual: Donut Chart 
• Fields: Legend: Gender, Values: Disease Count 
• Reasoning: A donut or pie chart is perfect for showing the proportional 
breakdown of a single metric. We used it to highlight gender disparity within the 
diseased population. 
• Problem Solved: It instantly communicates that among patients with heart 
disease, males represent a significantly larger portion than females, guiding 
further investigation into gender-specific risks. 

• Scatter Plot: Cholesterol vs. Age 
• Visual: Standard Scatter Chart 
• Axes: X-Axis: age, Y-Axis: cholesterol, Legend: Disease Status 
• Reasoning: A scatter plot is the ultimate tool for visualizing the relationship and 
correlation between two numerical variables. 
• Problem Solved: This chart was the centerpiece for revealing multi-factor risk. It 
clearly shows a cluster of data points in the upper-right quadrant (representing 
older patients with high cholesterol) that are almost exclusively colored for 
"Disease Present," providing powerful, undeniable evidence of combined risk 
factors. 

• Line Chart: BP Spikes by Pain Type 
• Visual: Line Chart 
• Axes: X-Axis: Chest Pain Label, Y-Axis: Average Resting BP 
• Reasoning: A line chart excels at showing trends across an ordered category. 
Here, we use it to see if blood pressure trends differed across types of chest pain. 
• Problem Solved: It helps identify if certain symptoms (pain types) are associated 
with higher clinical indicators like blood pressure, adding another layer to the 
diagnostic picture.

3) >>Blueprint : Breast Cancer Diagnosis Interactive Dashboard (Tableau) 

1. Project Context & Objective 
In the age of data-driven healthcare, early detection is crucial for diseases like breast cancer. 
With a dataset of 569 patients and 32 tumor features (radius, texture, symmetry, etc.), I set out 
to build an interactive Tableau dashboard that transforms complex raw data into clear, 
actionable narratives. The goal: help analysts and healthcare professionals quickly spot risk 
factors, explore diagnostic patterns, and make informed recommendations. 

2. The Challenges Solved 
• Data Clarity: Original column names were cryptic and not user-friendly. 
• Missing Context: No pre-defined groupings for size/risk, which are crucial for segmenting 
cases. 
• Insight Extraction: Relationship between tumor features and malignant/benign diagnosis 
hidden in numbers. 
• Redundancy & Cleanliness: Need to ensure one patient per record, no missing values or 
mis-typed entries. 
• Visual Storytelling: Typical dashboards stagger on basic bar charts—needed advanced, 
more revealing visuals. 

3. Data Preparation Solutions 
(a) Column Formatting & Data Types: 
• Renamed headers (ex: concave points_mean → “Concave Points Mean”) for clinical 
clarity. 
• Corrected types (e.g., forced “id” to String/Dimension, numerical fields as Measure). 
(b) De-duplication & Cleaning: 
• Confirmed unique "id" per patient; verified data integrity (no null/duplicate records). 
(c) Engineered Fields: 
• Tumor Size Group: IF [radius_mean] < 10 THEN "Small" ELSEIF [radius_mean] <= 15 
THEN "Medium" ELSE "Large" END 
• Risk Level: IF [radius_mean] > 15 AND [compactness_mean] > 0.1 THEN "High" ELSE 
"Low" END 
• Diagnosis Label: IF [diagnosis]="M" THEN "Malignant" ELSE "Benign" END 

4. The Analytical Model (Calculated Fields/Measures) 
Key Calculated Fields (by script): 
• Total Patients: COUNTD([id]) 
• Malignant Count: SUM(IF [diagnosis] = "M" THEN 1 ELSE 0 END) 
• Cancer Prevalence Rate: SUM(IF [diagnosis] = "M" THEN 1 ELSE 0 END) / COUNTD([id]) 
• Avg Radius (Malignant): AVG(IF [diagnosis]="M" THEN [radius_mean] ELSE NULL END) 
• High Risk Count: SUM(IF [Risk Level]="High" THEN 1 ELSE 0 END) 
• Diagnosis Ratio (Malignant): SUM(IF [diagnosis]="M" THEN 1 ELSE 0 END) / 
COUNTD([id]) 
No relationships/models needed—single-table data sufficed! 

5. KPI Choices & Rationale 
• Malignant/Benign Counts/Prevalence: Instant sense of dataset baseline and risk 
proportions. 
• Average Size/Texture/Perimeter by Diagnosis: Surfaced key physical differences between 
malignant and benign cases, giving actionable features to clinicians. 
• High Risk Segment Counts: Identified how many patients warrant close 
monitoring/screening. 
• Diagnosis Ratios: Quantitatively track improvement or change over data updates/time. 

6. Visuals Deployed – Every Chart & Why 
Chart 1: Column Chart – Size Impact on Diagnosis 
• Axis: X–Tumor Size Group, Y–Count (SUM([Number of Records])), Color–Diagnosis 
• Why: Clear, vertical orientation highlights which tumor sizes are likeliest to be malignant. 
• Problem Answered: Demonstrates size risk for clinicians; provides urgency to investigate 
"Large" tumors. 

Chart 2: Treemap – Diagnosis Distribution 
• Axis: Rectangle area–Count, Color–Diagnosis 
• Why: Replaces the pie (for variation), instantly communicates relative prevalence, 
making outliers easy to spot. 
• Problem Answered: Visualizes the dominant class, showing that benign tumors are more 
prevalent but malignant cases require focus. 

Chart 3: Scatter Plot – Radius vs. Texture (Colored by Diagnosis) 
• Axis: X–radius_mean, Y–texture_mean, Color–Diagnosis, Size–Count if needed 
• Why: Shows how multiple features interact; clusters reveal which measurements 
coincide with higher malignancy risk. 
• Problem Answered: Exposes high-risk feature zones, aiding both EDA and clinical insight. 

Chart 4: Area Chart – Perimeter by Smoothness 
• Axis: X–Smoothness Binned, Y–AVG(perimeter_mean), Color–Diagnosis 
• Why: Area conveys cumulative perimeter risk over smoothness spectrum. 
• Problem Answered: Answers whether less smooth tumors with higher size indicate 
malignancy. 

Chart 5: Crosstab (Heat Matrix) – Compactness by Size & Diagnosis 
• Axis: Rows–Tumor Size Group, Columns–Diagnosis, Color/Text–AVG(compactness_mean) 
• Why: Pinpoints “hot” cells—where size and feature combos flag highest concern. 
• Problem Answered: Allows targeting of at-risk subgroups for further study. 

Chart 6: Bullet Graph – Overall Malignant Risk 
• Axis: Horizontal Bar–Malignant Prevalence, Reference–50%, Color–benchmark alert 
• Why: Quantifies dataset risk; easy to spot if group exceeds “danger” threshold. 
• Problem Answered: Instantly communicates whether the cohort is high/low risk to non
specialist viewers. 

7. Impact: Problems Solved, Insights Unlocked 
• Translated cryptic, hard-to-read raw data into high-impact visuals and KPIs 
• Surface at-risk patient profiles by size, compactness, and texture—empowering targeted 
investigation 
• Showed clinicians/statisticians which feature intersections to focus on for screening 
• Provided an intuitive, interactive platform for HRs/data scientists to test hypothesis 
• Enabled benchmarking: future data can be compared and updated against this analytical 
baseline 
• Introduced novel visualization types (treemap, heat matrix, bullet graph) to go beyond 
textbook dashboards

4) >>Blueprint  Global Airport Analysis Dashboard 
      Featuring Custom DAX KPIs, Time Zone Mapping, Hemisphere Logic & Country Ranking 
Tools Used: Power BI, Power Query, DAX 
 
      1. Project Context 
In a world that thrives on connectivity, understanding the global spread and characteristics of 
airports is vital for businesses, logistics, travel, and infrastructure planning. This project 
analyzes a dataset of airports from around the world to extract insights based on geography, 
timezone, and frequency of distribution. 
 
       2. Define the Problem / Business Question 
    How are airports distributed globally by country, city, and time zone? 
    Which countries dominate airspace infrastructure? 
    Can we derive custom metrics like time zone regions or hemispheric classification? 
 
      3. Tools Used 
Tool Purpose 
Power BI Data visualization and storytelling 
Power Query Data cleaning, transformation 
DAX Custom KPIs, calculations, ranking logic 
 
          4. Walk Through Process 
     A. Power Query (Data Cleaning Steps) 
• Loaded dataset airports.csv 
• Verified original column names like AirportName, IATA, GeoPointLat, Country_Name, 
etc. 
• Ensured correct data types: 
o Decimal: GeoPointLat, GeoPointLong, UTC_Offset_Hours 
o Text: all others 
• No renaming of columns 
• Removed duplicates using: 
o AirportName, IATA, Country_Name (as composite keys) 
 
        B. Data Modeling 
No additional relationships were required as data was flat. However, calculated columns were 
created for categorization and advanced filtering. 
 
              5. DAX: Custom KPIs & Ranking Logic 
       Measures: 
dax 
CopyEdit 
Total Airports = COUNTROWS(airports) 
 
Total Countries = DISTINCTCOUNT(airports[Country_Name]) 
 
Total Cities = DISTINCTCOUNT(airports[City_Name]) 
 
Avg UTC Offset (Hrs) = AVERAGE(airports[UTC_Offset_Hours]) 
 
Airports per Country = COUNT(airports[AirportName]) 
 
Airports per TimeZone = COUNT(airports[AirportName]) 
 
      Calculated Columns: 
dax 
CopyEdit -- TimeZone Region Bucketing 
TimeZone Region =  
SWITCH( 
    TRUE(), 
    airports[UTC_Offset_Hours] <= -6, "Americas (West)", 
    airports[UTC_Offset_Hours] > -6 && airports[UTC_Offset_Hours] <= 0, 
"Europe/Africa", 
airports[UTC_Offset_Hours] > 0 && airports[UTC_Offset_Hours] <= 6, 
"Asia", 
airports[UTC_Offset_Hours] > 6, "Oceania", 
"Other" 
) 
dax 
CopyEdit -- Hemisphere Classification 
Hemisphere =  
IF(airports[GeoPointLat] >= 0, "Northern Hemisphere", "Southern Hemisphere") 

6. Visualizations Built 
Visual Type 
Description 
KPI Cards Total Airports, Countries, Cities, Avg. UTC 
Bar Chart Top Countries by Airport Count 
Donut Chart Airports by TimeZone Region 
Map Visual Airport locations using Lat/Long 
Table 
Detailed airport list 
Slicers 
Filter by Country, City, Hemisphere, Region 

7. Main Takeaways 
• The majority of airports are clustered in the Northern Hemisphere, especially in 
Americas & Europe/Africa time zones. 
• Some countries like the USA, Canada, Brazil, India, and Australia have higher airport 
densities. 
• Airports span diverse time zones, revealing complexity in global coordination. 

8. Use Visuals to Make My Points 
• Dark theme dashboard to enhance readability 
• Custom KPIs and slicers enabled dynamic filtering 
• Geospatial mapping highlighted global spread intuitively 
• Category columns like “TimeZone Region” gave structure to otherwise numeric offsets 

9. Reflections 
This dashboard proves how even a relatively flat dataset can be turned into rich insights with: 
• Custom DAX logic 
• Smart grouping (TimeZone & Hemisphere) 
• Clean visuals and interactivity 

10. Limitations of Data 
• No elevation data (elevation_ft) 
• No airport types (small_airport, heliport, etc.) 
• No flight volume, passengers, or operational data 

11. What Could Have Been Achieved With More Data 
• Runway elevation analysis for aviation safety 
• Airport type breakdown for infrastructure classification 
• Passenger or cargo flow heatmaps 
• Airline-wise airport frequency 
• Temporal patterns with flight schedules

5) >>Blueprint HDFC Bank Stock Analysis Dashboard  

1. Project Context 
HDFC Bank is one of India’s largest private banks and a key component of the stock market. 
The objective of this project was to analyze long-term (daily/monthly)  & short-term (intraday)  
stock data to uncover price patterns, volatility, and trading insights, and to build a Power BI 
dashboard that can be used by analysts, traders, and decision-makers. 

2. Problem Statement 

The client wanted a dashboard to: 
• Track daily, monthly, and intraday stock performance 
• Identify volatility patterns across multiple timeframes (1d, 1m, 5m, 15m datasets) 
• Measure returns, trading volume trends, and intraday behaviors 
• Provide KPIs for quick decision-making 
• Enable visual storytelling with comparisons between daily vs intraday movements 

3. Datasets Used 
• HDFC_1d.csv → Daily OHLC + Volume 
• HDFC_1m.csv → Monthly OHLC + Volume 
• HDFC_5m.csv → 5-minute OHLC + Volume (Intraday) 
• HDFC_15m.csv → 15-minute OHLC + Volume (Intraday) 
Columns included: 
t
 imestamp, Open, High, Low, Close, Volume 

4. Data Cleaning & Preparation (Power Query) 
 
Step-by-step cleaning checklist: 
• Converted timestamp → Date/Time type 
• Derived columns: Year, Month Name, Month Number, Quarter, Day Name, Hour 
• Ensured numeric formatting for Open, High, Low, Close, Volume 
• Removed nulls and duplicates 
• Standardized text fields (if any) 

5. Data Modeling 
• 4 fact tables (HDFC_1d, HDFC_1m, HDFC_5m, HDFC_15m) kept separate 
• Calendar table (if needed) for proper time intelligence 
• Relationships established only where required (mainly by timestamp granularity) 

6. Key KPIs (DAX Measures) 
• Daily KPIs (from HDFC_1d): 
o Average Daily Volatility = AVERAGEX(HDFC_1d, HDFC_1d[High] - HDFC_1d[Low]) 
o Max Daily Close, Min Daily Close, Avg Daily Volume 
• Monthly KPIs (from HDFC_1m): 
o Monthly Return % = DIVIDE((MAX([Close]) - MIN([Open])), MIN([Open]), 0) * 100 
o Average Monthly Return % using AVERAGEX + SUMMARIZE 
o Highest Monthly Close, Lowest Monthly Close 
• 5-Min Intraday KPIs (HDFC_5m): 
o Avg Price Move 5m = AVERAGEX(HDFC_5m, ABS(HDFC_5m[Close] - 
HDFC_5m[Open])) 
o Max/Min Intraday Price (5m), Avg Intraday Volume 
• 15-Min Intraday KPIs (HDFC_15m): 
o Volatility 15m = AVERAGEX(HDFC_15m, HDFC_15m[High] - HDFC_15m[Low]) 
o Volatility % as ratio of Open price 
o Max/Min Intraday Price (15m), Avg Volatility % 

7. Visuals & Titles 
Page 1 — Market Overview (Daily & Monthly) 
• Cards (Top Row): Max Close, Min Close, Avg Volume, Avg Daily Volatility 
• Line Chart: HDFC Daily Closing Price Trend (HDFC_1d, timestamp vs Close) 
• Column Chart: Daily Trading Volume (HDFC_1d, timestamp vs Volume) 
• Area Chart: Daily Price Volatility (High-Low) (HDFC_1d) 
• Column Chart: Average Volume by Day of Week (HDFC_1d, Day Name) 
• Column Chart: Monthly Return % (HDFC_1m, Month Name) 
• Line Chart: Monthly Closing Price Trend (HDFC_1m, Month Name vs Close) 
• Bar Chart: Average Monthly Volume by Quarter (HDFC_1m, Quarter) 
Page 2 — Intraday Analysis (5m & 15m) 
• Cards (Top Row): Max 5m Price, Min 5m Price, Avg Price Move 5m, Avg Volume 15m 
• Line Chart: Intraday Price Movement (5m) (Hour vs Close) 
• Column Chart: Trading Volume by Hour (5m) (Hour vs Volume) 
• Scatter Chart: Price vs Volume (5m) (Close vs Volume) 
• Line Chart: Intraday Price Movement (15m) (Hour vs Close) 
• Column Chart: Trading Volume by Hour (15m) (Hour vs Volume) 
• Area Chart: Volatility per 15-Min Interval (Hour vs Volatility 15m DAX) 

8. Insights & Takeaways 
• HDFC shows clear volatility patterns intraday, with spikes during opening and closing 
market hours. 
• Daily volatility stays within a predictable range, but 5m & 15m intervals capture micro
movements critical for traders.
 

