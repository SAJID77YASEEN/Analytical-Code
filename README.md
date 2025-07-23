# Analytical-Code
Electric Vehicle Population Trend Analysis

Project Objective: 
To create a professional, insight-rich Power BI dashboard that showcases the electric vehicle population across regions, identifies patterns in vehicle age, manufacturer trends, model popularity, adoption rate, and vehicle specifications. This dashboard is built to appeal to HRs, data professionals, and green mobility advocates by demonstrating data storytelling, analytical reasoning, and visualization expertise. 

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

Main Takeaways
🔋 Data uncovers where EV incentives be working 📍 High-density zones point to infrastructure needs 🧠 Range gaps indicate cost-performance tradeoffs

🔷 Data Limitations
Doesn’t include owner demographics, charging station data, or usage stats
Could be enhanced with weather, fuel cost, or CO2 savings info

 
