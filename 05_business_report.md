# Nike Shorts & TikTok Insights 2025 — Business Report

## Executive Summary

The supplied main dataset contains **48,079 video records** across
**2 platforms, 30 countries,
19 categories and 6 regions**.

### Platform
- TikTok total views: **2,878,625,796 (2.88B)**
- YouTube total views: **1,895,270,855 (1.90B)**
- TikTok average engagement rate: **9.18%**
- YouTube average engagement rate: **5.09%**

**Interpretation:** TikTok provides substantially greater reach in this supplied
dataset and also has the higher average engagement rate.

## Regional Hotspots

### TikTok — Top 5 countries by views
country  total_views
     Pl    104027786
     Kr    102835042
     Ke    102219088
     Nl    101151851
     Es    100814252

### YouTube — Top 5 countries by views
country  total_views
     Ru     69669553
     Id     69548514
     Mx     69411185
     Gb     69301389
     Br     69228673

## Category Performance

For Sports, Lifestyle and Fashion:
           avg_completion_rate  avg_watch_time_sec
category                                          
Sports                0.637742           21.348863
Lifestyle             0.635037           22.066273
Fashion               0.634028           21.714019

**Interpretation:** Sports has the highest average completion rate among these
three categories in the supplied dataset.

## Creator Impact

Top creators by average views:
   author_handle creator_tier  video_count     avg_views
         TVFatma          Mid           34 222935.441176
    TechieOlivia          Mid           27 209272.851852
     OfficialAli          Mid           46 172046.630435
        GuruOmar          Mid           38 171204.578947
  DailyVlogsMaya          Mid           39 162966.794872
    ChannelLeila          Mid           31 155567.064516
         MrJames          Mid           45 154971.955556
GamingWithOlivia          Mid           37 153908.729730
 CookingWithOmar          Mid           40 153905.650000
 DailyVlogsFatma          Mid           46 153090.152174

**Important data note:** the supplied data has only two observed creator tiers
(`Mid` and `Micro`), so do not claim that Star/Macro tiers are present in the
actual data.

## Hashtag Performance

Top hashtags by total views:
        hashtag  total_views  video_count  avg_engagement_rate
           #FYP   1183328006        11902             0.075391
          #GRWM    169284504         1654             0.074659
         #Music    126266286         1244             0.074343
     #Lifestyle    123870251         1238             0.075814
     #Relatable    123550931         1254             0.076943
        #Comedy    122338553         1220             0.076412
         #Dance    120338073         1230             0.075574
#DanceChallenge    118139016         1226             0.075530
         #Cover    117436369         1231             0.074368
#MorningRoutine    114783885         1138             0.077719
          #OOTD    101723953          947             0.074894
            #AI    101070466          972             0.074979
        #Sports     99160941          962             0.075170
   #StudyWithMe     97914947          941             0.075125
        #DogTok     95007710          927             0.075507
       #Fashion     94201317          913             0.073934
       #BookTok     93365318          935             0.076782
        #Travel     93006677          928             0.074255
      #Football     92628122          960             0.074500
          #Tech     92273237          920             0.073852

**ROI note:** The supplied dataset has no spend/cost field. Therefore hashtag
"ROI" cannot be calculated as financial ROI. The SQL project uses total views
and engagement rate as a **performance proxy**.

## Emoji Effect

           video_count  median_engagement_per_1k
has_emoji                                       
0                25944                    65.149
1                22135                    78.992

**Interpretation:** Videos with emojis have a higher median engagement-per-1K
than videos without emojis in this dataset.

## Trend Momentum

            video_count  median_engagement_velocity  median_trend_duration_days
trend_type                                                                     
Evergreen          7229                    1488.060                        41.0
Medium            16762                    4328.735                        14.0
Short             24088                   12472.300                         5.0

**Interpretation:** Short trends have the highest median engagement velocity,
while Evergreen trends last much longer. This means short-lived trends can
generate fast engagement even when their lifespan is brief.

## Traffic Sources

                video_count  median_completion_rate
traffic_source                                     
Following              4378                   0.681
ForYou                17497                   0.677
External               4764                   0.635
Search                 7990                   0.624
Suggested              5801                   0.575
Home                   7649                   0.574

**Interpretation:** Following and ForYou have the strongest median completion
rates among the supplied traffic sources.

## Seasonality

               video_count  total_views  avg_engagement_rate
event_season                                                
Regular              26137   2606254522             0.075569
SummerBreak          13092   1300722731             0.075401
HolidaySeason         4143    401286848             0.074666
BackToSchool          3750    370824824             0.075154
Ramadan                957     94807726             0.075680

**Interpretation:** Regular content has the largest total view volume, followed
by SummerBreak. Total views here are influenced by the number of videos in each
season, so compare per-video metrics as well before making budget decisions.

## Data Quality

Engagement validation found **0 mismatched rows** for:

`engagement_total = likes + comments + shares + saves`

A zero mismatch count means the supplied engagement totals are internally
consistent.

## ML Scope

The supplied ML file contains the target `trend_label` with four classes:
**stable, rising, declining, seasonal**.

Because the supplied ML data does **not** contain a direct `viral` target, the
model should be described as a **trend-label prediction model**, not as a
validated viral/not-viral model.

## Strategic Recommendations

1. Prioritize TikTok when the objective is broad reach and engagement in this
   dataset.
2. Localize campaigns around the strongest country-platform combinations rather
   than treating every market equally.
3. Test Sports content formats for stronger completion performance.
4. Use high-performing hashtags as a discovery/reach signal, but do not call it
   financial ROI without campaign spend data.
5. Test emojis as a creative element because emoji videos show higher median
   engagement-per-1K in this dataset.
6. Use fast-moving Short trends for rapid reach tests and Evergreen trends for
   longer-lived content planning.
7. Treat the ML model as a trend classification tool; collect real campaign
   outcomes/costs if Nike needs a true ROI or viral-probability model.
