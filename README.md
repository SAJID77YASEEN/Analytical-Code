# Analytical-Code
Electric Vehicle (EV) Population D - Project Blueprint
 Project Title:
Electric Vehicle Population Trend Analysis
 Project Objective:
To create a professional, insight-rich Power BI dashboard that showcases the electric vehicle population
across regions, identifies patterns in vehicle age, manufacturer trends, model popularity, adoption rate, and
vehicle specifications. This dashboard is built to appeal to HRs, data professionals, and green mobility
advocates by demonstrating data storytelling, analytical reasoning, and visualization expertise.
 Key Questions Solved:
How many total EVs are currently registered?
Which EV models and makes are most popular?
What is the trend of EV adoption by year?
What is the average electric range and MSRP?
What is the geographical spread of EVs?
How old are most EVs on the road?
What type of EVs are most adopted (BEV vs PHEV)?
 Data Overview:
Source: Government open datasets
Columns used:
VIN (for counting vehicles)
Make
Model
Model Year
EV Type (Battery Electric / Plug-In Hybrid)
Electric Range
Base MSRP
City / Postal Code
 Data Cleaning & Preparation Steps:
Model Year to Numeric: Converted text to whole number.
Remove Missing: Filtered out rows with missing or zero VIN, Make, or Model.
Created Derived Columns:
1. 
2. 
3. 
4. 
5. 
6. 
7. 
• 
• 
• 
• 
• 
• 
• 
• 
• 
• 
1. 
2. 
3. 
1
Vehicle Age : 
Vehicle Age = YEAR(TODAY()) - 'EV Data'[Model Year]
Vehicle Age Band : 
Vehicle Age Band =
SWITCH(TRUE(),
'EV Data'[Vehicle Age] <= 2, "0-2 Years",
'EV Data'[Vehicle Age] <= 5, "3-5 Years",
'EV Data'[Vehicle Age] <= 10, "6-10 Years",
"10+ Years")
Created Measures:
Total EVs : 
Total EVs = COUNT('EV Data'[VIN])
Unique Models : 
Unique Models = DISTINCTCOUNT('EV Data'[Model])
Top Model Year : 
Top Model Year = CALCULATE(MAX('EV Data'[Model Year]), FILTER('EV Data', 
'EV Data'[Model Year] = MAX('EV Data'[Model Year])))
Avg Electric Range : 
Avg Electric Range = AVERAGE('EV Data'[Electric Range])
Avg Base MSRP : 
Avg Base MSRP = AVERAGE('EV Data'[Base MSRP])
 Relationships:
Only one main flat table is used ( EV Data ), so relationships were not complex. However, this model is built
in a way that it's easy to extend to a star schema (e.g., separate tables for Make, City, Year).
4. 
5. 
6. 
7. 
8. 
9. 
10. 
11. 
2
 Final Visuals Setup
KPI Tiles (Top Row):
Total EVs
Unique Models
Top Model Year
Avg Electric Range
Avg Base MSRP
Line Chart – EV Growth by Model Year and Type
X-Axis: Model Year
Y-Axis: Count of VIN
Legend: EV Type (BEV, PHEV)
Bar Chart – EV Distribution by Manufacturer & Type
X-Axis: Total EVs
Y-Axis: Make
Legend: EV Type
Sunburst (Custom Visual) – EV Population by Make & Model
Groups: Make
Details: Model
Tooltip: Avg Range, Vehicle Age
Histogram – EVs by Age Band
Axis: Vehicle Age Band
Values: Total EVs
Tooltip: Model Year, Type
Filled Map – EV Deployment by Make, Model Year & Location
Location: City / Postal Code
1. 
2. 
3. 
4. 
5. 
6. 
7. 
8. 
9. 
10. 
11. 
12. 
13. 
14. 
15. 
16. 
17. 
18. 
19. 
20. 
21. 
22. 
23. 
24. 
3
Size: Total EVs
Tooltip: Make, Model, Model Year
Donut Chart – EV Type Breakdown
Legend: EV Type
Values: Total EVs
 Color Theme:
Background: Neon green automotive theme (high contrast)
Text: White on dark background
Accent: Branded green (matching EV icon), custom fonts/logos applied
 Highlights of the Dashboard:
Branded Design with personalized watermark ( webworksajid.site )
Real-time KPIs
Rich tooltips in every visual
Balanced layout for storytelling
Custom visuals used (Sunburst, Histogram)
Context-aware visuals with vehicle range and type filters
Geographical spread helps demonstrate practical EV penetration insights

