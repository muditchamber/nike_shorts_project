-- Nike Shorts & TikTok Insights 2025
-- Phase 1: SQL Analysis
-- MySQL 8+
-- Main table expected: nike_trends

CREATE DATABASE IF NOT EXISTS nike_insights;
USE nike_insights;

-- After loading youtube_shorts_tiktok_trends_2025.csv into table nike_trends,
-- run the 12 analyses below.

-- Q1. Platform Comparison
SELECT
    platform,
    SUM(views) AS total_views,
    AVG(engagement_rate) AS avg_engagement_rate
FROM nike_trends
GROUP BY platform
ORDER BY total_views DESC;

-- Q2. Regional Hotspots: top 5 countries by views for each platform
WITH country_views AS (
    SELECT
        platform,
        country,
        SUM(views) AS total_views,
        ROW_NUMBER() OVER (
            PARTITION BY platform
            ORDER BY SUM(views) DESC
        ) AS rn
    FROM nike_trends
    GROUP BY platform, country
)
SELECT platform, country, total_views
FROM country_views
WHERE rn <= 5
ORDER BY platform, total_views DESC;

-- Q3. Category Performance
SELECT
    category,
    AVG(completion_rate) AS avg_completion_rate,
    AVG(avg_watch_time_sec) AS avg_watch_time_sec
FROM nike_trends
WHERE category IN ('Sports', 'Lifestyle', 'Fashion')
GROUP BY category
ORDER BY avg_completion_rate DESC;

-- Q4. Creator Impact: top 10 creators by average views
SELECT
    author_handle,
    creator_tier,
    COUNT(*) AS video_count,
    AVG(views) AS avg_views
FROM nike_trends
GROUP BY author_handle, creator_tier
ORDER BY avg_views DESC
LIMIT 10;

-- Q5. Hashtag ROI proxy: top 20 hashtags by total views
-- NOTE: the dataset contains no spend/cost field, so this is a reach/engagement
-- proxy, not a financial ROI calculation.
WITH hashtag_metrics AS (
    SELECT
        hashtag,
        SUM(views) AS total_views,
        COUNT(*) AS video_count,
        AVG(engagement_rate) AS avg_engagement_rate
    FROM nike_trends
    GROUP BY hashtag
)
SELECT
    hashtag,
    total_views,
    video_count,
    avg_engagement_rate
FROM hashtag_metrics
ORDER BY total_views DESC
LIMIT 20;

-- Q6. Emoji Effect
SELECT
    has_emoji,
    COUNT(*) AS video_count,
    AVG(engagement_per_1k) AS avg_engagement_per_1k,
    AVG(engagement_rate) AS avg_engagement_rate
FROM nike_trends
GROUP BY has_emoji
ORDER BY has_emoji;

-- Q7. Upload Timing
SELECT
    publish_dayofweek,
    upload_hour,
    COUNT(*) AS video_count,
    AVG(views) AS avg_views,
    AVG(completion_rate) AS avg_completion_rate
FROM nike_trends
GROUP BY publish_dayofweek, upload_hour
ORDER BY avg_views DESC;

-- Q8. Trend Momentum
SELECT
    trend_type,
    COUNT(*) AS video_count,
    AVG(engagement_velocity) AS avg_engagement_velocity,
    AVG(trend_duration_days) AS avg_trend_duration_days,
    (
        SELECT AVG(x.engagement_velocity)
        FROM nike_trends x
        WHERE x.trend_type = t.trend_type
    ) AS check_velocity
FROM nike_trends t
GROUP BY trend_type
ORDER BY avg_engagement_velocity DESC;

-- Q9. Device Analysis
SELECT
    device_type,
    device_brand,
    COUNT(*) AS video_count,
    AVG(completion_rate) AS avg_completion_rate
FROM nike_trends
GROUP BY device_type, device_brand
ORDER BY avg_completion_rate DESC;

-- Q10. Traffic Source
SELECT
    traffic_source,
    COUNT(*) AS video_count,
    AVG(completion_rate) AS avg_completion_rate
FROM nike_trends
GROUP BY traffic_source
ORDER BY avg_completion_rate DESC;

-- Q11. Seasonal Insights
SELECT
    event_season,
    COUNT(*) AS video_count,
    SUM(views) AS total_views,
    AVG(engagement_rate) AS avg_engagement_rate
FROM nike_trends
GROUP BY event_season
ORDER BY total_views DESC;

-- Q12. Data Quality Check
SELECT *
FROM nike_trends
WHERE engagement_total <> (
    COALESCE(likes, 0) +
    COALESCE(comments, 0) +
    COALESCE(shares, 0) +
    COALESCE(saves, 0)
);
