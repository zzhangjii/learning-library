**Proactive Oracle Database Performance Management**
====================================================

In these hands-on lab activities, learn how to identify systemic database and
SQL performance issues, and proactively forecast database resource utilization.
See how to obtain complete and centralized visibility of your Oracle Databases
whether they are on-premises or in the Oracle Cloud using Oracle IT Analytics.

Lab Exercise Persona
--------------------

![](media/996d633af2c76fd6dc904ac63c54ab5e.jpg)

**NOTE**: Use Google Chrome to perform the lab for the best hands on experience

![](media/42fd9c023940860c5ec88869c51498d5.jpg)

First, you need to get logged in to the Oracle Cloud. [Enter the Identity
Domain], then **Click** the Go button.

![](media/74b0295152fd9f70d8bb3a9e36d69c1e.jpg)

[Enter Username and Password], then **Click** the Sign In button

**Lab 1: Identifying Database Performance Bottlenecks**
=======================================================

**Scenario Details**

Users need to identify databases which are degrading or inefficient over a
period of time. Identify the SQL causing performance issues

**Task**

Get insight on performance bottlenecks by performing database performance
analysis.

NOTE: During activities in this lab, data in dashboard may appear differently
than what appears in screenshots. Please focus on the flow and steps, instead of
the actual data values displayed in screenshots.

**Learner Goal**

How performance insights on databases can be obtained starting with the IT
Analytics Database Performance Analytics Dashboard.

**Value Proposition**

“Time is money” for business. Troubleshooting database performance and finding
root cause is complex and takes a lot of time; requiring review and analysis of
a lot of different data. Too often the result is finger pointing, not resolution
because there is no “single source of truth”

**Duration**: 15 mins.

![](media/bf6cb6b2b6ee73dc2b7aeb6ac1a72eb1.jpg)

1.  From the left side services navigation listing, **Click** on the greater
    than arrow to the right of the IT Analytics title

    ![](media/5d8be3dd70660c16409c1beb44fc98ae.jpg)

2.  Then Click on Database Performance Analytics

    ![](media/b156530de99b7dcaedfc11d726034e6b.jpg)

3.  This will open ‘Database Performance Analytics’ dashboard which is an out of
    the box dashboard supplied by OMC for database performance analysis.

    ![](media/6cc51c03beeac5bb8d58273767ebc44e.jpg)

4.  In the global entity selector at the top, type in **ITA** and a drop down
    entry **ITAGSEDBAnalyticsDemogrp** will appear; Select it

    ![](media/bb1005de0cec59e71437f613c5738e4f.jpg)

5.  Now, select a time period to review for the performance analysis. From the
    time selector drop down in the upper right that has the default ‘Last 30
    days’ appearing, **Select Last 90 days** from the menu.

    ![](media/e00984f613b82ae35cb479bef5e66e31.jpg)

6.  **First** within the ITAGSEDBAnalyticsDemogrp group, the dashboard now
    identifies in the Summary section at the top, the Oracle Databases (DBs)
    that have had the following performance issues in the last 90 days: DBs with
    performance degradations, DBs with workload performance variability, and DBs
    with inefficiency. The Performance Degradation section shows change in
    activity (%) vs change in demand (%) for various DBs in
    “ITAGSEDBAnalyticsDemogrp” group and highlights the DBs whose activity has
    increased with decrease in demand or no change in demand. Databases with
    performance degradation are the databases whose performance has degraded
    over time and is correlated with change in demand. Where Demand = Executions
    and Activity = Database Time. Databases with Decrease in Demand are the
    databases having negative correlations between demand and activity. From the
    Performance Degradation section in Database Performance Analytics, you can
    identify the databases that have degraded in performance as follows:
    Degradation with decrease in demand Change in response time greater than 20%
    Change in activity less than -10% Degradation without change in demand
    Change in response time greater than 20% Change in activity between 10% and
    -10%. **Second**: under the ‘Degradation with Decrease in Demand’ heading
    **Click** on the **5 DBs link.**

    ![](media/2f1ff4139f37aff923bc70fbe2bc2b9b.jpg)

7.  Now shown are the details of databases having performance degradation with
    decrease in demand. To further drill down. **Click** one of the Database
    Name links, for example FLGT-XA-AU.

    ![](media/ca7323f71f1aaf648b21ec413288d671.jpg)

8.  It navigates to a page with more performance details on that database.
    **Scroll** down the page

    ![](media/3df163c878ab8f2d6eafe0d7cc7f79e7.jpg)

9.  The **Performance Trend** tab provides details of the activity and demand
    trend for the selected database. First, on the right, under the settings
    header **Click** on Settings. Using this, one can also do activity and
    demand projections using different regression models. **Second**, **Click**
    on the **Workload Performance Variability** tab next as databases with
    variable performance are symptomatic of unpredictable workload and
    application response times. These are the databases with high degree of
    variance in SQL response time.

    ![](media/3d10d5a7f01ecd2fc4c363deb0d48d21.jpg)

10. Under the Workload Performance Variability tab we see databases having a
    high degree of variance in SQL performance responsiveness. Next, **Click**
    on the **Inefficiency** tab

    ![](media/9ba04b9cf65063a5904e7173fab336c1.jpg)

11. The **Inefficiency** tab shows active sessions and their breakdown by CPU,
    I/O and Inefficient Waits. Inefficient databases are those where a large
    percentage of database time in spent waiting on the application and not on
    CPU or I/O. Reduction of Inefficient Waits improves performance of a
    database. Next, **Click** on the **SQL Performance** tab.

    ![](media/512836d6de651328c71e3cc38519cb51.jpg)

12. The **SQL Performance** tab highlights the top degrading and highly variant
    SQLs in this database. Next, Scroll up the page and next to the database
    name on the upper left (FLGT-XA-AU), **Click** on the back button (the
    greater than sign)

    ![](media/83db8771f9f66aad1e88e095fd8c19df.jpg)

13. That will return us back to the **Database Performance Analytics**
    dashboard. **First, Scroll Down** to the **Workload Variability** section
    that displays Workload by Variant SQL on each database and identifies SQLs
    with **Highly Variant Performance** to its right. The **Database
    Inefficiency** section shows a summary of inefficiency for all databases and
    identifies the inefficient databases. **Second,** under Inefficient
    Databases **Click** on the 2 DBs.

    ![](media/ab8aa025c2ac229e457a64c8f4cc438a.jpg)

14. That then displays the percentage of database inefficiency. You can drill
    down into to a specific database further by **Clicking** on one of the names
    listed in the Databases Name column. Now **Click** the Close button to
    return back to the **Database Performance Analytics** dashboard.

    ![](media/013a0453be65c15de40378f3787ebf5b.jpg)

15. From the navigation bar on the far left, now **Click** on **SQL Analytics**

    ![](media/52d57113ef4406ab53966d39442bf5d1.jpg)

16. That then displays another out of box dashboard provided by OMC for
    performing SQL performance analysis. It shows the degrading, highly variant,
    inefficient SQLs and SQLs with plan changes running across all databases in
    the ITAGSEDBAnalyticsDemogrp and also highlights top SQLs by CPU and I/O. At
    the bottom a performance analysis chart for SQL is displayed with filtering
    options. **Note**: Since you’re using a live environment, data displayed in
    the dashboard may differ from what is shown in screenshots. Please pay
    attention to the functionality, rather than the exactness of data on a page.
    **Next**, under the Degrading SQLs heading, **Click** on the count; in this
    case 47.

    ![](media/9f60295615be481186c04f88ae34a4bb.jpg)

17. Here, degrading SQLs are displayed. To further analyze, **Click** on the SQL
    ID – in this case **g3wrkmxkxzhf2**

    ![](media/58e9445c7567658d711ad9e2ef5b3ac2.jpg)

18. From here, you can review statistics, execution plan, trends and activity
    and further drill down and analyze root cause for the slowness.

>   That completes Lab 1 for Proactive Oracle Database Performance Management
>   using Oracle IT Analytics.
