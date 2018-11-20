Introduction
============

The purpose of this **Power BI Custom Data Connector** is to connect to Upwork API and
pull data related to freelance projects. This custom data connector comes pre-packaged with a **Power BI Report** file to analyze your data quickly.

The connector pulls following data from Upwork API:

1.  Teams

2.  Jobs (including sub-teams)

3.  Contracts/Engagements

4.  Freelancers

5.  Billing (pulled at a monthly level from Jan 2018)

Follow steps below to setup and use the Upwork connector.

Step 1: Get access to Upwork REST API
======================================

Go to Upwork API request URL, fill out project details, and submit it
get your key approved. After the key is approved you can start pulling
data. Please find detailed steps:

1.  Go to URL: <https://www.upwork.com/services/api/apply> while logged
    into your Upwork account

2.  Provide project title and description

3.  Select "Web Project"

4.  Provide a call back URL:
    <https://preview.powerbi.com/views/oauthredirect.html>

5.  Provide API Usage, you can select 500+ or 101-500

6.  Select appropriate permissions. For this connector to work
    correctly, you need to select the following permissions:

    ![](docs/img/permissions.png)

7.  Submit for approval

Once the keys are approved you need to update it in the connector.

Step 2: Download and Update Keys in the connector
==============================

Please follow steps below to download and update keys in the connector:

1.  In this GitHub repo, go to "dist" folder and download "Upwork.mez" and "Upwork_Report.pbit" file, and save it in your Desktop.

2.  Rename "Upwork.mez" file "Upwork.zip"

3.  Unzip the contents

4.  Open client\_application file in Notepad or any other text file editor. Update "ClientId" with key or
    consumer key, and "ClientSecret" with the secret of your key. Save the file after updates.

    a.  Note: to obtain your API Key and Secret, navigate to the link below:

        i.  <https://www.upwork.com/services/api/keys>

5.  Zip the contents of the folder and rename zip to
    .mez

    a.  Note: Ensure that you are repackaging only the content files
        (screenshot below) into a new .zip folder, not the parent folder
        and its sub-components.

    ![](docs/img/zipcontents.png)
    
     
Step 3: Place the connector file (.mez)
=========================
After you have updated the connector file above, copy the .mez file and place it under
**C:\Users\\<Your_User_Name>\\Documents\\Microsoft Power BI Desktop\Custom Connectors** folder. 

Create the folders if they do not exist.


Step 4: Enable security options in Power BI
=========================

If you are using Power BI Desktop version Oct 2018 or more, then follow the instructions below:

1. Open a blank Power BI Desktop file
2. Go to File->Options and settings->Options, and select "(Not Recommended)...." under Data Extensions. See screenshot below.

![](docs/img/securityoptions.png)

3. Restart Power BI Desktop to take effect.

However, if you are using an older version (Sep 2018 or less), then follow the instructions below:

1. Open a blank Power BI Desktop file
2. Go to File->Options and settings->Options. Under "Preview features" select "Custom data connectors".

Refer to the screenshot below. 

![](docs/img/options.png)

![](docs/img/enablecustomconnector.png)

3. Restart Power BI Desktop to take effect.

Step 5: Load data
=========

You are now set to pull data from Upwork. If everything is setup correctly, you will see Upwork connector inside Online Services under Get Data. See screenshot below:

![](docs/img/connectoringetdata.png)


Remember, you had saved "Upwork.mez" and "Upwork_Report.pbit" file in your Desktop? It's time to use the pbit file.

Double click on the "Upwork_Report.pbit" file and follow along to load a fully comprehensive report of your freelance projects.   


Power BI Report file
=========
The Power BI Report file that comes packaged with this connector shows a comprehensive view of your freelance projects. The report provides a trend of the amount spent on the platform for your contracts, avg. spend on contracts, and spend by job category and sub category.

It also includes the distribution of hourly and fixed price contracts, active and closed contracts, and avg. contract duration in days.

On freelancers information, the report provides freelancers' geographic distribution, agency vs freelancers proposition, # freelancers and # contracts by job category, and avg. time to hire on this platform for your teams.

The report comes with two filters: Team and Job Category. The report also provides you a timestamp of when the data was last refreshed.

After you have set up the Upwork custom connector as described above, you may publish this report in your Power BI tenant and setup refreshes so you have more visibility in your freelance contracts.

A snippet of this Power BI Report from our test account is attached below.

![](docs/img/upworkpowerbireport.png)

Troubleshoot
=========
1. **I cannot see "Upwork" custom connector in Get Data.**

    The most common cause for this problem is the users have not enabled security options in Power BI. Refer to the above section on how to enable this option.
    
    Another reason could be, you have not zipped the "contents" of the Upwork folder. You need to zip only the contents and not the parent folder after you have added your keys and secret.

2. **I cannot see some of my freelance contracts**

    The data in the connector is pulled based on your Upwork account permissions. You will be seeing only the contracts for teams for which you have permissions.

    If you are an enterprise, you may need to contact your enterprise manager to update your account permissions, or else contact Upwork support.

3. **Which ID should I login with in this connector?**

    You need to login with the Upwork account in which you have access to the Upwork data. 

    Currently, we do not have options to combine data from multiple accounts in this custom connector.

4. **I see billing only from Jan 2018**

    The billing data is currently being pulled only from Jan 2018. 

5. **Whom to contact if I have further questions?**

    The best way is to open an issue in Github. Our developers will respond to you as soon as possible.