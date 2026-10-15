# Phase 2 — Power BI Report Blueprint

## Data
Use `youtube_shorts_tiktok_trends_2025.csv` as the main table.
Do not modify the source file.

Recommended table name in Power BI: `nike_trends`.

## Core measures (DAX)

Total Views =
SUM(nike_trends[views])

Total Videos =
COUNTROWS(nike_trends)

Average Engagement Rate =
AVERAGE(nike_trends[engagement_rate])

Average Completion Rate =
AVERAGE(nike_trends[completion_rate])

Average Watch Time =
AVERAGE(nike_trends[avg_watch_time_sec])

Engagement Total =
SUM(nike_trends[engagement_total])

Average Engagement per 1K =
AVERAGE(nike_trends[engagement_per_1k])

## Page 1 — Executive Overview
KPI cards:
- Total Views
- Total Videos
- Average Engagement Rate
- Average Completion Rate

Slicers:
- Platform
- Region
- Country
- Category

Visuals:
- Clustered column: Total Views by Platform
- Bar: Total Views by Region
- Line: Total Views by Year-Month
- Matrix: Platform × Category with Views and Engagement Rate

## Page 2 — Content Insights
Visuals:
- Bar: Views by Category
- Column: Completion Rate by Category
- Scatter: Duration vs Average Watch Time, bubble size = Views
- Bar: Top Hashtags by Views
- Column: Emoji vs Engagement per 1K

## Page 3 — Creator Insights
Visuals:
- Bar: Top 10 Creators by Average Views
- Column: Creator Tier vs Views
- Heatmap/matrix: Upload Hour × Publish Day
- Stacked/clustered columns: Like Rate, Share Rate, Save Rate

## Page 4 — Market & Device
Visuals:
- Filled map or bar: Views by Country
- Bar: Views by Region
- Column: Completion Rate by Device Type
- Bar: Completion Rate by Device Brand
- Column: Completion Rate by Traffic Source

## Page 5 — Trend & Seasonality (optional)
Visuals:
- Line: Views by Year-Month
- Column: Engagement Velocity by Trend Type
- Column: Trend Duration by Trend Type
- Column: Views by Event Season
- Line/column: Engagement Rate by Event Season

## Design
Keep the report executive-friendly:
- consistent Nike-style branding
- limited visual clutter
- clear KPI cards
- slicers in one consistent area
- titles that state the business question
- show percentages as percentages, not decimals
- use K/M/B number formatting for large views
