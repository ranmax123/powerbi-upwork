
// This file contains Upwork connector logic
[version = "2.0.0"]
section Upwork;

windowWidth = 1024;
windowHeight = 720;

clientId = Json.Document(Extension.Contents("client_application.json"))[ClientId];
clientSecret = Json.Document(Extension.Contents("client_application.json"))[ClientSecret];
callbackUrl = Json.Document(Extension.Contents("client_application.json"))[CallbackUrl];
recordsPerPage = Json.Document(Extension.Contents("client_application.json"))[RecordsPerPage];

//TEST
testLimit = recordsPerPage;
contractsPerCall = recordsPerPage;
delayinSec = 1;

//Upwork base Url
baseUrl = "https://www.upwork.com";

//Upwork token Urls
requestTokenUrl = "/api/v3/oauth2/token";
authenticateUrl = "/ab/account-security/oauth2/authorize";

//Upwork GraphQL Url
graphQLUrl = "https://api.upwork.com/graphql";

//Upwork data APIs (relative path)
teamUrl = "/api/hr/v2/teams.json";
contractUrl = "/api/hr/v2/engagements.json";
jobUrl = "/api/hr/v2/jobs.json";
offerUrl = "/api/offers/v1/clients/offers";
jobApplicationUrl = "/api/hr/v4/clients/applications.json";

freelancePrefixUrl = "/api/profiles/v1/providers/";
freelanceSuffixUrl = "/brief.json";

billingPrefixUrl = "/gds/finreports/v2/buyer_teams/";
billingSuffixUrl = "/billings";


//Billing query
billingQuery = "SELECT SUM(amount) WHERE assignment__reference=";
billingQuery2 = "SELECT assignment__reference, SUM(amount) WHERE date>='$sdate$' and date <='$edate$'";

//Upwork public Urls
freelanceProfileUrl = "https://www.upwork.com/freelancers/";
contractProfileUrl = "https://www.upwork.com/ab/c/";

//Upwork columns to be retrieved
teamColumns = {
    "reference",
     "name",
    "company__reference",
    "company_name"   
   };

teamOutputColumns = {
    "team_id",
    "team_name",
    "company_id",
    "company_name"   
   };

teamOutputFinalColumns = {
    "team_id",
    "team_name",
    "company_id",
    "company_name",
    "server_time"
   };

teamMasterColumns = {"auth_user", "teams", "server_time"};

contractColumns = {
    "buyer_team__reference",
     "reference",
    "engagement_title",
    "engagement_job_type",
    "status",
    "cj_job_application_uid",
    "job_application_ref",
    "job_ref_ciphertext",
    "hourly_charge_rate",
    "weekly_hours_limit",
    "created_time",
    "engagement_start_date",
    "engagement_end_date",
    "provider__reference",
    "dev_recno_ciphertext",
    "provider__id",
    "provider__name",
    "provider_team__name",
    "feedback",
    "offer_id"
   };

 contractOutputColumns = {
    "buyer_team_id",
    "contract_id",
    "contract_title",
    "contract_type",
    "contract_status",
    "cj_job_application_uid",
    "job_application_ref",
    "job_text_id",
    "hourly_charge_rate",
    "weekly_hours_limit",
    "accept_date",
    "start_date",
    "end_date",
    "freelancer_id",
    "freelancer_text_id",
    "freelancer_user_id",
    "provider__name",
    "provider_team__name",
    "feedback",
    "offer_id"
   };

contractOutputFinalColumns = {
    "buyer_team_id",
    "contract_id",
    "contract_title",
    "contract_type",
    "contract_status",
    "job_text_id",
    "hourly_charge_rate",
    "weekly_hours_limit",
    "accept_date",
    "start_date",
    "end_date",
    "freelancer_id",
    "freelancer_text_id",
    "freelancer_user_id",
    "feedback_to_client_score",
    "feedback_to_freelancer_score",
    "offer_id"
   };

contractMasterColumns = {"server_time", "auth_user", "engagements"};
contractEnagementColumns = {"engagement", "lister"};


feedbackColumns = {
"feedback_for_buyer",
"feedback_for_provider"
};

jobColumns = {
    "buyer_team__reference",
    "job_ref_ciphertext",
    "reference",
    "title",
    "created_by_name",
    "status",
    "public_url",
    "category2",
    "subcategory2",
    "created_time"
};

jobOutputColumns = {
    "buyer_team__reference",
    "job_text_id",
    "job_id",
    "job_title",
    "job_created_by_name",
    "job_status",
    "job_public_url",
    "category",
    "subcategory",
    "job_created_date"
};

jobOutputFinalColumns = {
    "buyer_team__reference",
    "job_text_id",
    "job_id",
    "job_title",
    "job_created_by_name",
    "job_status",
    "job_public_url",
    "category",
    "subcategory",
    "job_created_date"
};

jobMasterColumns = {"auth_user", "jobs"};
jobMaster2Columns = {"job", "lister"};

freelancerColumns = {

    "dev_recno",
    "dev_short_name",
    "dev_country",
    "dev_city",
    "dev_is_affiliated",
    "dev_ac_agencies",
    "_is_error",
    "_error_code",
    "_error_message"
};

freelancerOutputColumns = {
    
    "freelancer_id",
    "freelancer_name",
    "country",
    "city",
    "is_affiliated_to_agency",
    "dev_ac_agencies",
    "_is_error",
    "_error_code",
    "_error_message"
};

freelancerOutputFinalColumns = {

    "freelancer_text_id",
    "freelancer_id",
    "freelancer_name",
    "country",
    "city",
    "is_affiliated_to_agency",
    "agency_name",
    "freelancer_profile_url",
    "_is_error",
    "_error_code",
    "_error_message"
};

freelancerMasterColumns = {"auth_user", "profile"};

billingMasterColumns = {"auth_user", "table"};

billingOutputFinalColumns = {

    "team_id",
    "contract_id",
    "billing_month",
    "amount_spent"
};

errorColumns = {
    "message",
    "reason"
};

//Enterprise Reporting columns

summaryInsightsTopLevelColumns = {
"avgTimeToHire", "avgTimeToHireOthers", "avgFillRate", "avgFillRateOthers", 
"avgFLRating", "avgFLRatingOthers", "clientUsage"};

summaryInsightsClientUsageColumns = {
    "totalEmployeeCount", "registeredUsers", "registeredUsersLast30Days", "jobPostedUsers", "spentUsers", "inactiveUsers", "projectsLessThan1k", "projects1kTo10k", "projects10kTo25k", "projectsMoreThan25k", "totalCategoriesWithNoSpend", "totalCategoriesWithSpend", "totalCategories", "activeHmCount"};

hiringManagerInsightsTopLevelColumns = {
"totalRegistered", "totalActive", "fillRate", "hiringManagers", "hiringManagersCount", "timePeriod"};

hiringManagerInsightsHiringManagerColumns = 
{"hmId", "email", "spend", "fillRate", "jobsPosted", "registrationDate", "daysSinceRegistration", "firstName", "lastName"};

categoriesInsightsTopLevelColumns = {
"activeCategoriesCount", "avgProjectCost", "jobsPosted"};

categoriesInsightsDetailsColumns = {
"id", "name", "spend", "spendOthers", "avgProjectCost", "jobsPosted", "description", "imageUrl", "avgFlRating",
"avgTimeToHire", "avgProjectDuration","avgProjectDurationOthers"
};

categoriesInsightsDetailsOutputColumns = {
"categoryId", "categoryName", "spend", "spendOthers", "avgProjectCost", "jobsPosted", "description", "imageUrl", "avgFlRating",
"avgTimeToHire", "avgProjectDuration","avgProjectDurationOthers"
};

categoriesInsightsTopServicesColumns = {"id", "name", "flAvailable", "hourlyRateStart", "hourlyRateEnd", "avgProjectCost", "avgProjectDuration", "totalSpend", "fillRate","subcategoryId"};

categoriesInsightsTopServicesOutputColumns = {"serviceId", "serviceName", "flAvailable", "hourlyRateStart", "hourlyRateEnd", "avgProjectCost", "avgProjectDuration", "totalSpend", "fillRate","subcategoryId"};

serviceInsightsColumns = {
 "name", "flAvailable", "hourlyRateStart", "hourlyRateEnd", "avgProjectCost", "avgProjectDuration", "totalSpend", "fillRate", "categoryId", "subcategoryId"};

serviceInsightsOutputColumns = {
"subcategoryName", "flAvailable", "hourlyRateStart", "hourlyRateEnd", "avgProjectCost", "avgProjectDuration", "totalSpend", "fillRate", "categoryId", "subcategoryId"};

companySelectorColumns =  {"title", "organizationId", "organizationEnterpriseType"};

companySelectorOutputColumns = {"companyTitle", "companyOrgId", "organizationEnterpriseType"};

companySelectorOutputColumns2 = {"companyTitle", "companyOrgId"};

entObjectProgramSummaryName = "Program Summary";
entObjectUserMetricsName = "Users Metrics";
entObjectUserName = "Users";
entObjectCategoriesMetricsName = "Categories Metrics";
entObjectCategoriesName = "Categories";
entObjectTopServicesName = "Top Services";
entObjectCustomFields = "Custom Fields";

timePeriodList = {"MTD", "QTD", "YTD", "LAST12M"};

//GRAPHQL Based Calls


querySummaryInsights = "query summaryInsights ($timePeriod: InsightsTimePeriod) {   insights {     organizationInsights {       summaryInsights(timePeriod: $timePeriod) {         avgTimeToHire         avgTimeToHireOthers         avgFillRate         avgFillRateOthers         avgFLRating         avgFLRatingOthers         clientUsage {           totalEmployeeCount           registeredUsers           registeredUsersLast30Days           jobPostedUsers           spentUsers           inactiveUsers           projectsLessThan1k           projects1kTo10k           projects10kTo25k           projectsMoreThan25k           totalCategoriesWithNoSpend           totalCategoriesWithSpend           totalCategories           avgFillRate           activeHmCount         }       }     }   } }";


queryHiringManagerInsights = "query hiringManagersInsights ($timePeriod: InsightsTimePeriod, $limit: Int, $offset: Int) {   insights {     organizationInsights {       hiringManagersInsights(timePeriod: $timePeriod, limit:$limit, offset:$offset) {         totalRegistered         totalActive         fillRate         hiringManagers {           hmId           email           spend           fillRate           jobsPosted           registrationDate           daysSinceRegistration           firstName           lastName         }         hiringManagersCount         timePeriod       }     }   } }";


queryCategoriesInsights = "query categoriesInsights ($timePeriod: InsightsTimePeriod, $limit: Int, $offset: Int) {   insights {     organizationInsights {       categoriesInsights(limit: $limit, timePeriod: $timePeriod, offset: $offset) {         activeCategoriesCount         avgProjectCost         jobsPosted         categories {           id           name           spend           spendOthers           avgProjectCost           jobsPosted           description           imageUrl           avgFlRating           avgTimeToHire           topServices {             id             name             flAvailable             hourlyRateStart             hourlyRateEnd             avgProjectCost             avgProjectDuration             totalSpend             fillRate             categoryId             subcategoryId           }           topProjects {             id             title           }           avgProjectDuration           avgProjectDurationOthers         }       }     }   }  }";


queryServiceInsights = "query  serviceInsights ($timePeriod: InsightsTimePeriod, $limit: Int, $offset: Int) {   insights {     organizationInsights {       servicesInsights(timePeriod: $timePeriod, limit: $limit, offset: $offset) {         servicesCount         services {           id           name           flAvailable           hourlyRateStart           hourlyRateEnd           avgProjectCost           avgProjectDuration           totalSpend           fillRate           categoryId           subcategoryId         }       }     }   } }";


queryCompanySelector = "query  {   companySelector {     items {       title       organizationId       photoUrl       organizationRid       organizationType       organizationLegacyType       organizationEnterpriseType       legacyEnterpriseOrganization     }   } }";


queryCustomFields = "query customFields ($input: CustomFieldsInput!, $limit: Int, $offset: Int)  {  customFields (input: $input, offset: $offset, limit: $limit){     id    itemId    responseId    typeSnap    labelSnap    displayValueSnap    offerId    rollupAssignmentId    jobPostingId    byoInvitationId    buyItNowId    questionnaireResponsesId    stale    termSectionId }}";

[DataSource.Kind="Upwork", Publish="Upwork.Publish"]

// shared Upwork.Contents = () as any =>
//     let
//         source = Upwork.ExecuteEntReporting(entObjectCustomFields, "")
//     in
//         source;

shared Upwork.Contents = Value.ReplaceType(Upwork.NavImpl, Upwork.NavImplType);
Upwork.NavImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.Contents.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.Contents.LongDescription")
        ];

Upwork.NavImpl =  () as table =>
    let
        objects = #table(
            {"Name",       "Key",  "Data", "ItemKind", "ItemName", "IsLeaf"},{
            {"Teams",   "Teams",  Upwork.GetTeams() , "Table",    "Table",    true},
            {"Contracts",   "Contracts",  Upwork.GetContracts() , "Table",    "Table",    true},
            {"Freelancers",   "Freelancers",  Upwork.GetFreelancers() , "Table",    "Table",    true},
            {"Jobs",   "Jobs",  Upwork.GetJobs() , "Table",    "Table",    true},
            {"Billing",   "Billing",  Upwork.GetBilling() , "Table",    "Table",    true},
            {"_Enterprise Reporting Insights", "_Enterprise Reporting Insights", Upwork.GetEntReportingObjects(), "Table", "Table", false}
        }),
        NavTable = Upwork.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        NavTable;

/** Code to support Enterprise reporting endpoints **/

//
// Get Top Level Enterprise objects
// Tested for:
// Enterprise - SUCCESS
// Non Enterprise - SUCCESS
//

Upwork.GetEntReportingObjects = () as table =>
    let 
        entReportingObjectsHeader = {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"}, 
        entReportingObjectsValues =  
          {
            {"Companies", "Companies", Upwork.GetTopLevelEnterprises(), "Table", "Table", true},
             {"Custom Fields",   "Custom Fields",  Upwork.GetCustomFields() , "Table",    "Table",    true},
            {"Program Summary",   "Program Summary",  Upwork.GetEntReportingwithTimePeriod(entObjectProgramSummaryName) , "Table",    "Table",    false},
            {"Users Metrics",   "Users Metrics", Upwork.GetEntReportingwithTimePeriod(entObjectUserMetricsName) , "Table",    "Table",    false},
            {"Users",   "Users",  Upwork.GetEntReportingwithTimePeriod(entObjectUserName) , "Table",    "Table",    false},
            {"Categories Metrics",   "Categories Metrics", Upwork.GetEntReportingwithTimePeriod(entObjectCategoriesMetricsName) , "Table",    "Table",    false},
            {"Categories",   "Categories",  Upwork.GetEntReportingwithTimePeriod(entObjectCategoriesName) , "Table",    "Table",    false},
            {"Top Services",   "Top Services",  Upwork.GetEntReportingwithTimePeriod(entObjectTopServicesName) , "Table",    "Table",    false}
          },

        objects = #table(entReportingObjectsHeader, entReportingObjectsValues),
        table = Upwork.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        table;


//
// Get Enterprise objects as per supported Time Periods
// Tested for:
// Enterprise - SUCCESS
// Non Enterprise - SUCCESS
//

Upwork.GetEntReportingwithTimePeriod = (entObjectName) =>
    let 
        entReportingObjectsHeader = {"Name", "Key", "Data", "ItemKind", "ItemName", "IsLeaf"}, 
    
        entReportingObjectsValues =  List.Accumulate(timePeriodList, {}, 
                    (state, current) => state & 
                     {{ entObjectName & " - " & current, 
                        entObjectName & " - " & current, 
                        Upwork.ExecuteEntReporting(entObjectName, current), 
                        "Table", 
                        "Table", 
                        true}}),

        objects = #table(entReportingObjectsHeader, entReportingObjectsValues),
        table = Upwork.ToNavigationTable(objects, {"Key"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        table;

//
// Get Enterprise Reporting data
// Tested for:
// Enterprise - SUCCESS
// Non Enterprise - SUCCESS
//

Upwork.ExecuteEntReporting = (entObjectName, timePeriod) =>

    let
        data = if entObjectName = entObjectProgramSummaryName then Upwork.GetEntProgramSummary(timePeriod) 
                else if entObjectName = entObjectUserMetricsName then Upwork.GetEntHiringManagersMetrics(timePeriod)
                else if entObjectName = entObjectUserName then Upwork.GetEntHiringManagersSummary(timePeriod)
                else if entObjectName = entObjectCategoriesMetricsName then Upwork.GetEntCategoriesMetrics(timePeriod)
                else if entObjectName = entObjectCategoriesName then Upwork.GetEntCategoriesSummary(timePeriod)
                else if entObjectName = entObjectTopServicesName then Upwork.GetEntTopServicesSummary(timePeriod)
                else if entObjectName = entObjectCustomFields then Upwork.GetCustomFields()
                else null
    in
        data;


//
// Get Summary for Enterprise reporting
// Tested for:
// Enterprise - SUCCESS
// Non Enterprise - SUCCESS
//
Upwork.GetEntProgramSummary = (timePeriod) as any =>

    let
        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetEntProgramSummaryBase([companyOrgId], timePeriod)),

        #"Expanded source" = Table.ExpandRecordColumn(data, "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source", "data", {"insights"}, {"insights"}),
        #"Expanded insights" = Table.ExpandRecordColumn(#"Expanded data", "insights", {"organizationInsights"}, {"organizationInsights"}),
        #"Expanded organizationInsights" = Table.ExpandRecordColumn(#"Expanded insights", "organizationInsights", {"summaryInsights"}, {"summaryInsights"}),
        #"Expanded summaryInsights" = Table.ExpandRecordColumn(#"Expanded organizationInsights", "summaryInsights", summaryInsightsTopLevelColumns),
        #"Expanded clientUsage" = Table.ExpandRecordColumn(#"Expanded summaryInsights", "clientUsage", summaryInsightsClientUsageColumns),

        TimePeriodAdded = Table.AddColumn( #"Expanded clientUsage", "timePeriod", each timePeriod),

        #"Changed Type" = Table.TransformColumnTypes(TimePeriodAdded,
            {{"avgTimeToHire", Int64.Type}, 
            {"avgTimeToHireOthers", Int64.Type}, 
            {"totalEmployeeCount", Int64.Type}, 
            {"registeredUsers", Int64.Type}, 
            {"registeredUsersLast30Days", Int64.Type}, 
            {"jobPostedUsers", Int64.Type}, 
            {"spentUsers", Int64.Type}, 
            {"inactiveUsers", Int64.Type}, 
            {"projectsLessThan1k", Int64.Type}, 
            {"projects1kTo10k", Int64.Type}, 
            {"projects10kTo25k", Int64.Type}, 
            {"projectsMoreThan25k", Int64.Type}, 
            {"totalCategoriesWithNoSpend", Int64.Type}, 
            {"totalCategoriesWithSpend", Int64.Type}, 
            {"totalCategories", Int64.Type}, 
            {"activeHmCount", Int64.Type}, 
            {"avgFillRate", Percentage.Type}, 
            {"avgFillRateOthers", Percentage.Type}, 
            {"avgFLRating", type number}, 
            {"avgFLRatingOthers", type number}})

    in
          #"Changed Type";
 

//
// Get Hiring Manager Metrics
// Tested for:
// Enterprise - SUCCESS
// Non Enterprise - SUCCESS
//
Upwork.GetEntHiringManagersMetrics = (timePeriod) as any =>

    let

        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetEntHiringManagerPagedData(
                                                            [companyOrgId],//orgid
                                                              1, //current page to fetch
                                                              1, //fetch 1 page for metrics 
                                                              0, //offset
                                                             timePeriod, //timeperiod
                                                             queryHiringManagerInsights,//query 
                                                             {})),

        #"Expanded source" = Table.ExpandListColumn(data, "source"),
    
        #"Expanded source1" = Table.ExpandRecordColumn(#"Expanded source", "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source1", "data", {"insights"}, {"insights"}),
        #"Expanded insights" = Table.ExpandRecordColumn(#"Expanded data", "insights", {"organizationInsights"}, {"organizationInsights"}),
        #"Expanded organizationInsights" = Table.ExpandRecordColumn(#"Expanded insights", "organizationInsights", {"hiringManagersInsights"}, {"hiringManagersInsights"}),
        #"Expanded hiringManagersInsights" = Table.ExpandRecordColumn(#"Expanded organizationInsights", "hiringManagersInsights", hiringManagerInsightsTopLevelColumns),

        #"Removed Columns" = Table.RemoveColumns(#"Expanded hiringManagersInsights",{"hiringManagers"}),

        #"Changed Type" = Table.TransformColumnTypes( #"Removed Columns",
            {{"totalRegistered", Int64.Type}, 
             {"totalActive", Int64.Type}, 
             {"hiringManagersCount", Int64.Type}, 
             {"fillRate", Percentage.Type}})
    in
        #"Changed Type";


//
// Get Hiring Manager Summary
// Tested for:
// Enterprise -  SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetEntHiringManagersSummary = (timePeriod) as any =>

    let
        
        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetEntHiringManagerPagedData(
                                                            [companyOrgId],//orgid
                                                              1, //current page to fetch
                                                               -1, //fetch all pages for summary  
                                                              0, //offset
                                                             timePeriod, //timeperiod
                                                             queryHiringManagerInsights,//query 
                                                             {})),

        #"Expanded source" = Table.ExpandListColumn(data, "source"),
    
        #"Expanded source1" = Table.ExpandRecordColumn(#"Expanded source", "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source1", "data", {"insights"}, {"insights"}),

        #"Expanded insights" = Table.ExpandRecordColumn(#"Expanded data", "insights", {"organizationInsights"}, {"organizationInsights"}),
        #"Expanded organizationInsights" = Table.ExpandRecordColumn(#"Expanded insights", "organizationInsights", {"hiringManagersInsights"}, {"hiringManagersInsights"}),
        #"Expanded hiringManagersInsights" = Table.ExpandRecordColumn(#"Expanded organizationInsights", "hiringManagersInsights", hiringManagerInsightsTopLevelColumns),

        #"Removed Other Columns" = Table.SelectColumns(#"Expanded hiringManagersInsights", List.Combine({companySelectorOutputColumns2,  {"hiringManagers", "timePeriod"}})),

        #"Expanded hiringManagers" = Table.ExpandListColumn(#"Removed Other Columns", "hiringManagers"),
        #"Expanded hiringManagers1" = Table.ExpandRecordColumn(#"Expanded hiringManagers", "hiringManagers", hiringManagerInsightsHiringManagerColumns),

         FilterRows = Table.SelectRows(#"Expanded hiringManagers1" , each ([hmId] <> null)),

        #"Changed Type" = Table.TransformColumnTypes(FilterRows,
                    {{"hmId", Int64.Type}, 
                     {"jobsPosted", Int64.Type}, 
                     {"daysSinceRegistration", Int64.Type},
                     {"registrationDate", type date}, 
                     {"spend", Currency.Type}, 
                     {"fillRate", Percentage.Type}
                     })
        in
             #"Changed Type";


//
// Get Top Services Summary
// Tested for:
// Enterprise -  SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetEntTopServicesSummary = (timePeriod) as any =>

    let
        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetEntCategoriesPagedData(
                                                            [companyOrgId],//orgid
                                                              1, //current page to fetch
                                                               -1, //fetch all pages for summary  
                                                              0, //offset
                                                             timePeriod, //timeperiod
                                                             queryCategoriesInsights,//query 
                                                             {})),

        #"Expanded source" = Table.ExpandListColumn(data, "source"),
    
        #"Expanded source1" = Table.ExpandRecordColumn(#"Expanded source", "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source1", "data", {"insights"}, {"insights"}),

        #"Expanded insights" = Table.ExpandRecordColumn(#"Expanded data", "insights", {"organizationInsights"}, {"organizationInsights"}),
        #"Expanded organizationInsights" = Table.ExpandRecordColumn(#"Expanded insights", "organizationInsights", {"categoriesInsights"}, {"categoriesInsights"}),
        #"Expanded categoriesInsights" = Table.ExpandRecordColumn(#"Expanded organizationInsights", "categoriesInsights", {"categories"}),
      
        #"Expanded categories" = Table.ExpandListColumn( #"Expanded categoriesInsights", "categories"),


        #"Expanded categories1" = Table.ExpandRecordColumn(#"Expanded categories", "categories", {"id", "name", "topServices"}, {"categoryId", "categoryName", "topServices"}),
        #"Expanded topServices" = Table.ExpandListColumn(#"Expanded categories1", "topServices"),
        #"Expanded topServices1" = Table.ExpandRecordColumn(#"Expanded topServices", "topServices", categoriesInsightsTopServicesColumns, categoriesInsightsTopServicesOutputColumns),

        TimePeriodAdded = Table.AddColumn( #"Expanded topServices1", "timePeriod", each timePeriod),

        FilterRows = Table.SelectRows(TimePeriodAdded , each ([categoryId] <> null)),

        #"Changed Type" = Table.TransformColumnTypes(FilterRows,
                            {{"flAvailable", Int64.Type}, 
                            {"hourlyRateStart", Currency.Type}, 
                            {"hourlyRateEnd", Currency.Type}, 
                            {"avgProjectCost", Currency.Type}, 
                            {"avgProjectDuration", Int64.Type}, 
                            {"totalSpend", Currency.Type}, 
                            {"fillRate", Percentage.Type}})

        in
             #"Changed Type" ;

//
// Get Categories Summary
// Tested for:
// Enterprise -  SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetEntCategoriesSummary = (timePeriod) as any =>

    let
        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetEntCategoriesPagedData(
                                                            [companyOrgId],//orgid
                                                              1, //current page to fetch
                                                               -1, //fetch all pages for summary  
                                                              0, //offset
                                                            timePeriod, //timeperiod
                                                             queryCategoriesInsights,//query 
                                                             {})),

        #"Expanded source" = Table.ExpandListColumn(data, "source"),
    
        #"Expanded source1" = Table.ExpandRecordColumn(#"Expanded source", "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source1", "data", {"insights"}, {"insights"}),

        #"Expanded insights" = Table.ExpandRecordColumn(#"Expanded data", "insights", {"organizationInsights"}, {"organizationInsights"}),
        #"Expanded organizationInsights" = Table.ExpandRecordColumn(#"Expanded insights", "organizationInsights", {"categoriesInsights"}, {"categoriesInsights"}),
        #"Expanded categoriesInsights" = Table.ExpandRecordColumn(#"Expanded organizationInsights", "categoriesInsights", {"categories"}),
      
        #"Expanded categories" = Table.ExpandListColumn( #"Expanded categoriesInsights", "categories"),
        #"Expanded categories1" = Table.ExpandRecordColumn(#"Expanded categories", "categories", categoriesInsightsDetailsColumns, categoriesInsightsDetailsOutputColumns),

        TimePeriodAdded = Table.AddColumn( #"Expanded categories1", "timePeriod", each timePeriod),
        
        FilterRows = Table.SelectRows(TimePeriodAdded , each ([categoryId] <> null)),

         #"Changed Type" = Table.TransformColumnTypes(FilterRows,
                    {{"spend", Currency.Type}, 
                    {"spendOthers", Currency.Type}, 
                    {"avgProjectCost", Currency.Type}, 
                    {"avgProjectDurationOthers", Int64.Type}, 
                    {"avgProjectDuration", Int64.Type}, 
                    {"avgTimeToHire", Int64.Type}, 
                    {"avgFlRating", type number}, 
                    {"jobsPosted", Int64.Type}})
        in
             #"Changed Type" ;


//
// Get Categories Metrics
// Tested for:
// Enterprise -  SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetEntCategoriesMetrics = (timePeriod) as any =>

    let
        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetEntCategoriesPagedData(
                                                            [companyOrgId],//orgid
                                                              1, //current page to fetch
                                                                 1, //fetch 1 page for metrics 
                                                              0, //offset
                                                             timePeriod, //timeperiod
                                                             queryCategoriesInsights,//query 
                                                             {})),

        #"Expanded source" = Table.ExpandListColumn(data, "source"),
    
        #"Expanded source1" = Table.ExpandRecordColumn(#"Expanded source", "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source1", "data", {"insights"}, {"insights"}),
        #"Expanded insights" = Table.ExpandRecordColumn(#"Expanded data", "insights", {"organizationInsights"}, {"organizationInsights"}),
        #"Expanded organizationInsights" = Table.ExpandRecordColumn(#"Expanded insights", "organizationInsights", {"categoriesInsights"}, {"categoriesInsights"}),
        #"Expanded categoriesInsights" = Table.ExpandRecordColumn(#"Expanded organizationInsights", "categoriesInsights", categoriesInsightsTopLevelColumns),
      

        TimePeriodAdded = Table.AddColumn(#"Expanded categoriesInsights", "timePeriod", each timePeriod),

         #"Changed Type" = Table.TransformColumnTypes( TimePeriodAdded,
                    {{"activeCategoriesCount", Int64.Type}, 
                     {"jobsPosted", Int64.Type}, 
                     {"avgProjectCost", Currency.Type}
                     })
        in
             #"Changed Type" ;


// DO NOT USE
// Get All Services Summary
// Tested for:
// Enterprise -  SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetEntAllServicesSummary = (timePeriod) as any =>

    let
        table = Upwork.GetTopLevelEnterprises(),
        
        data = Table.AddColumn(table, "source", 
                            each Upwork.GetEntServicesPagedData(
                                                            [companyOrgId],//orgid
                                                              1, //current page to fetch
                                                                  -1, //fetch all pages for Summary 
                                                              0, //offset
                                                             timePeriod, //timeperiod
                                                             queryServiceInsights,//query 
                                                             {})),

        #"Expanded source" = Table.ExpandListColumn(data, "source"),
    
        #"Expanded source1" = Table.ExpandRecordColumn(#"Expanded source", "source", {"data"}, {"data"}),
        #"Expanded data" = Table.ExpandRecordColumn(#"Expanded source1", "data", {"insights"}, {"insights"}),

        #"Expanded insights" = Table.ExpandRecordColumn(#"Expanded data", "insights", {"organizationInsights"}, {"organizationInsights"}),
        #"Expanded organizationInsights" = Table.ExpandRecordColumn(#"Expanded insights", "organizationInsights", {"servicesInsights"}, {"servicesInsights"}),
        #"Expanded servicesInsights" = Table.ExpandRecordColumn(#"Expanded organizationInsights", "servicesInsights", {"services"}),
      
        #"Expanded services" = Table.ExpandListColumn( #"Expanded servicesInsights", "services"),


        #"Expanded services1" = Table.ExpandRecordColumn(#"Expanded services", "services",
                                            serviceInsightsColumns,
                                            serviceInsightsOutputColumns),

        TimePeriodAdded = Table.AddColumn( #"Expanded services1", "timePeriod", each timePeriod),

         FilterRows = Table.SelectRows(TimePeriodAdded , each ([subcategoryId] <> null)),

        #"Changed Type" = Table.TransformColumnTypes(FilterRows,
                            {{"flAvailable", Int64.Type}, 
                            {"hourlyRateStart", Currency.Type}, 
                            {"hourlyRateEnd", Currency.Type}, 
                            {"avgProjectCost", Currency.Type}, 
                            {"avgProjectDuration", Int64.Type}, 
                            {"totalSpend", Currency.Type}, 
                            {"fillRate", Percentage.Type}})

        in
             #"Changed Type" ;


//
// Get Custom Fields
// Tested for:
// Enterprise -  
// Non Enterprise -  
//
Upwork.GetCustomFields = () as any =>

    let
        contracts = Upwork.GetContractsPaged(contractUrl),
        
        #"Added Index" = Table.AddIndexColumn(contracts, "Index", 1, 1),
        #"Removed Other Columns" = Table.SelectColumns(#"Added Index",{"Index", "contract_id"}),
        
        total_rows = Table.RowCount(#"Removed Other Columns"),
        contract_groups_orig = Number.Round(total_rows/contractsPerCall, 0),

        contract_groups = if contract_groups_orig = 0 then 1 else contract_groups_orig,

        #"Added Custom" = Table.AddColumn(#"Removed Other Columns", "contract_group", each Number.Mod([Index], contract_groups)),
        #"Grouped Rows" = Table.Group(#"Added Custom", {"contract_group"}, {{"List", each _, type table [Index=number, contract_id=number, contract_group=number]}}),
        #"Added Custom1" = Table.AddColumn(#"Grouped Rows", "contract_ids", each Table.Column([List], "contract_id")),
        #"Extracted Values" = Table.TransformColumns(#"Added Custom1", {"contract_ids", each Text.Combine(List.Transform(_, Text.From), ","), type text}),
       
        #"Removed Columns" = Table.RemoveColumns(#"Added Custom1" ,{"List"}),
      
        data = Table.AddColumn(#"Removed Columns", "source", 
                            each Upwork.GetCustomFieldsPagedData(
                                            null,//orgid
                                            1, //current page to fetch
                                            -1, //fetch all pages
                                            0, //offset
                                            [contract_ids],
                                            queryCustomFields,//query 
                                            {})),

        #"Expanded source" = Table.ExpandListColumn(data, "source"),
        #"Expanded source1" = Table.ExpandRecordColumn(#"Expanded source", "source", {"data"}, {"source.data"}),
        #"Expanded source.data" = Table.ExpandRecordColumn(#"Expanded source1", "source.data", {"customFields"}, {"customFields"}),
        #"Expanded customFields" = Table.ExpandListColumn(#"Expanded source.data", "customFields"),
        #"Expanded customFields1" = Table.ExpandRecordColumn(#"Expanded customFields", "customFields", {"rollupAssignmentId", "labelSnap", "displayValueSnap", "stale"}, {"rollupAssignmentId", "labelSnap", "displayValueSnap", "stale"}),
        #"Renamed Columns" = Table.RenameColumns(#"Expanded customFields1",{{"labelSnap", "custom_field"}, {"displayValueSnap", "custom_field_value"}, {"rollupAssignmentId", "contract_id_toplevel"}}),

        #"Removed Columns2" = Table.RemoveColumns(#"Renamed Columns",{"contract_group", "contract_ids"}),
        
        #"Changed Type" = Table.TransformColumnTypes(#"Removed Columns2",{{"contract_id_toplevel", Int64.Type}}),

        #"Filtered Rows" = Table.SelectRows(#"Changed Type", each ([contract_id_toplevel] <> null))

    in
       #"Filtered Rows";
        

//
// Get Top Level Enterprises
// Tested for:
// Enterprise -  SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetTopLevelEnterprises = () =>

    let
        graphqlRequest = [query = queryCompanySelector],
        source = Json.Document(Upwork.GraphQLRequest(graphqlRequest)),

        data = source[data],
        companySelector = data[companySelector],
        items = companySelector[items],
        #"Converted to Table" = Table.FromList(items, Splitter.SplitByNothing(), null, null, ExtraValues.Error),

        #"Expanded Column1" = Table.ExpandRecordColumn(#"Converted to Table", "Column1",
                        companySelectorColumns, 
                        companySelectorOutputColumns),
       
       #"Filtered Rows" = Table.SelectRows(#"Expanded Column1", each ([organizationEnterpriseType] <> null)),
       
       //#"Filtered Rows" = Table.SelectRows(#"Expanded Column1", each ([companyOrgId] = "927557201719623681")),

        TopLevelEnt = Table.SelectColumns(#"Filtered Rows", {"companyTitle", "companyOrgId"})
    in
        TopLevelEnt;

//
// Get Program Summary
// Tested for:
// Enterprise -  SUCCESS
// Non Enterprise -  SUCCESS
//
Upwork.GetEntProgramSummaryBase = (OrgId, timePeriod) =>
    let
        variable = [timePeriod = timePeriod],
        graphqlRequest = [query = querySummaryInsights, variables = variable],

        source = Json.Document(Upwork.GraphQLRequest(graphqlRequest, OrgId)),

        table = if (Record.HasFields(source, "errors")) then 
              error Error.Record(source[errors]{0}[message], source[errors]{0}[message], source[errors])
                else 
                 source
    in 
        table;

// 
// 
//
// Get Hiring Manager Paged Data
    // pageNumber -> the current page number
    // numPagestoFetch -> number of pages of data to fetch
    // offset -> record offset
    // timePeriod -> the timePeriod of data to fetch
    // query -> query to fire
    // result -> result of the previous query
// Tested for:
// 1 team - SUCCESS
// More than 1 teams - SUCCESS
//

//code reference taken from https://github.com/ranmax123/powerbi-custom-connectors/blob/master/ZendeskSupport/code/ZendeskSupport.pq    

Upwork.GetEntHiringManagerPagedData = (orgId, pageNumber, numPagestoFetch, offset, timePeriod, query, result) =>
    let
        limit = testLimit,
        variable = [limit = limit, offset = offset, timePeriod = timePeriod],
        graphqlRequest = [query = query, variables = variable],
        
        response = Json.Document(Upwork.GraphQLRequest(graphqlRequest, orgId)),

        newResult = List.Combine({result, {response}}),
        hmRecord = try response[data][insights][organizationInsights][hiringManagersInsights][hiringManagers] 
                                otherwise [],
        
        newOffset = offset + limit
    in
       if (Record.HasFields(response, "errors")) then 
            error Error.Record(response[errors]{0}[message], response[errors]{0}[message], response[errors])
        else 
            if pageNumber = numPagestoFetch or 
            (Value.Is(hmRecord, type record ) and Record.FieldCount(hmRecord) = 0)
            or 
            (Value.Is(hmRecord, type list ) and List.Count(hmRecord) = 0)
            then //no more records to fetch or error
              newResult
            else
                Upwork.GetEntHiringManagerPagedData(orgId,
                                                    pageNumber + 1, 
                                                    numPagestoFetch, 
                                                    newOffset, 
                                                    timePeriod, 
                                                    query, 
                                                    newResult);


// 
// 
//
// Get Category Paged Data
    // pageNumber -> the current page number
    // numPagestoFetch -> number of pages of data to fetch
    // offset -> record offset
    // timePeriod -> the timePeriod of data to fetch
    // query -> query to fire
    // result -> result of the previous query
// Tested for:
// 1 team - SUCCESS
// More than 1 teams - SUCCESS
//

Upwork.GetEntCategoriesPagedData = (orgId, pageNumber, numPagestoFetch, offset, timePeriod, query, result) =>
    let
        limit = testLimit,
        variable = [limit = limit, offset = offset, timePeriod = timePeriod],
        graphqlRequest = [query = query, variables = variable],
        
        response = Json.Document(Upwork.GraphQLRequest(graphqlRequest, orgId)),

        newResult = List.Combine({result, {response}}),
        categoryRecord = try response[data][insights][organizationInsights][categoriesInsights][categories] 
                                otherwise [],
        
        newOffset = offset + limit
    in
       if (Record.HasFields(response, "errors")) then 
            error Error.Record(response[errors]{0}[message], response[errors]{0}[message], response[errors])
        else 
            if pageNumber = numPagestoFetch or 
            (Value.Is(categoryRecord, type record ) and Record.FieldCount(categoryRecord) = 0)
            or 
            (Value.Is(categoryRecord, type list ) and List.Count(categoryRecord) = 0)
            
            then //no more records to fetch or error
                newResult
            else
                Upwork.GetEntCategoriesPagedData(orgId, 
                                                pageNumber + 1, 
                                                             numPagestoFetch, 
                                                             newOffset, 
                                                             timePeriod, 
                                                             query, 
                                                             newResult);

 
// 
//
// Get Services Paged Data
    // orgId -> Org Id
    // pageNumber -> the current page number
    // numPagestoFetch -> number of pages of data to fetch
    // offset -> record offset
    // timePeriod -> the timePeriod of data to fetch
    // query -> query to fire
    // result -> result of the previous query
// Tested for:
// 1 team - SUCCESS
// More than 1 teams - SUCCESS
//

Upwork.GetEntServicesPagedData = (orgId, pageNumber, numPagestoFetch, offset, timePeriod, query, result) =>
    let
        limit = testLimit,
        variable = [limit = limit, offset = offset, timePeriod = timePeriod],
        graphqlRequest = [query = query, variables = variable],
        
        response = Json.Document(Upwork.GraphQLRequest(graphqlRequest, orgId)),

        newResult = List.Combine({result, {response}}),
        serviceRecord = try response[data][insights][organizationInsights][servicesInsights][services] 
                                otherwise [],
        
        newOffset = offset + limit
    in
       if (Record.HasFields(response, "errors")) then 
            error Error.Record(response[errors]{0}[message], response[errors]{0}[message], response[errors])
        else 
            if pageNumber = numPagestoFetch or 
            (Value.Is(serviceRecord, type record ) and Record.FieldCount(serviceRecord) = 0)
            or 
            (Value.Is(serviceRecord, type list ) and List.Count(serviceRecord) = 0)
            
            then //no more records to fetch or error
               newResult
            else
                Upwork.GetEntServicesPagedData(orgId,
                                                pageNumber + 1, 
                                                             numPagestoFetch, 
                                                             newOffset, 
                                                             timePeriod, 
                                                             query, 
                                                             newResult);



// 
// 
//
// Get Custom Fields Paged Data
    // pageNumber -> the current page number
    // numPagestoFetch -> number of pages of data to fetch
    // offset -> record offset
    // input -> input for data
    // query -> query to fire
    // result -> result of the previous query
// Tested for:
// 1 team - SUCCESS
// More than 1 teams - SUCCESS
//

Upwork.GetCustomFieldsPagedData = (orgId, pageNumber, numPagestoFetch, offset, input, query, result) =>
    let
        limit = testLimit,
        variable = [limit = limit, offset = offset, input = [rollupAssignmentIds = input]],
        graphqlRequest = [query = query, variables = variable],
        
        response = Json.Document(Upwork.GraphQLRequest(graphqlRequest, orgId)),

        newResult = List.Combine({result, {response}}),
        customFieldsRecord = try response[data][customFields]
                                otherwise [],
        
        newOffset = offset + limit
    in
       if (Record.HasFields(response, "errors")) then 
            error Error.Record(response[errors]{0}[message], response[errors]{0}[message], response[errors])
        else 
            if pageNumber = numPagestoFetch or 
            (Value.Is(customFieldsRecord, type record ) and Record.FieldCount(customFieldsRecord) = 0)
            or 
            (Value.Is(customFieldsRecord, type list ) and List.Count(customFieldsRecord) = 0)
            
            then //no more records to fetch or error
                newResult
            else
                Upwork.GetCustomFieldsPagedData(orgId, 
                                                pageNumber + 1, 
                                                             numPagestoFetch, 
                                                             newOffset, 
                                                             input, 
                                                             query, 
                                                             newResult);

/** Support for Enterprise Reporting Code ends here **/

// 
// 
//
// Get Teams
// Tested for:
// 1 team - SUCCESS
// More than 1 teams - SUCCESS
//

[DataSource.Kind="Upwork"]
shared Upwork.GetTeams = Value.ReplaceType(Upwork.GetTeamsImpl, Upwork.GetTeamsImplType);

Upwork.GetTeamsImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetTeams.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetTeams.LongDescription")
        ];


Upwork.GetTeamsImpl = () =>
    let
        url = teamUrl,
        parameters = [],
        response =  Upwork.Request(false, url, parameters),
        json = Json.Document(response),
        teamMaster = Table.Transpose(Record.ToTable(json)),
        teamMasterTable = Table.PromoteHeaders(teamMaster, [PromoteAllScalars=true]),
        table = Table.ExpandListColumn(teamMasterTable, "teams"),
        expanded = Table.ExpandRecordColumn(table, "teams", teamColumns, teamOutputColumns),

        teams = Table.SelectColumns(expanded, teamOutputFinalColumns),
       
        teamsTable = Table.RenameColumns(teams,{{"server_time", "refreshed_date"}}),

        transformedDate = Table.TransformColumns(teamsTable, 
                                                    {{"refreshed_date", each Upwork.FromTimestampToDate(_)}}),

        transformedTable = Table.TransformColumnTypes(transformedDate,
                    {{"team_id", Int64.Type}, 
                    {"company_id", Int64.Type},
                    {"refreshed_date", type datetime}})
    in
        transformedTable;


//
// Get Contracts per Page
// url -> engagement url
// parameters -> parameters to pass to API, mostly we will pass pagination param
//
Upwork.GetContractsPerPage = (url, parameters) =>
    let
        response =  Json.Document(Upwork.Request(false, url, parameters))
    in
        response;

//
// Get Contracts using pagination
//
Upwork.GetContractsPaged = (url) =>
    
    let
        contractsJsonPaginated = List.Generate( () => 
                        [pageResult = null, total_items = 0, nextOffset = 0, counter = 1],
                         each Number.From([total_items]) <> 0 or [counter] <= 1,
                        each [pageResult = try Upwork.GetContractsPerPage(url, 
                                                       [page=Text.From([nextOffset]) & ";" & Text.From(recordsPerPage)]) 
                                           otherwise null, 
                                total_items = try pageResult[engagements][lister][total_items] otherwise 0,
                                nextOffset = [nextOffset] + recordsPerPage,
                                counter = [counter] + 1],
                        each [pageResult]),
        
        contractsJsonPaginated2 = List.Skip(contractsJsonPaginated, 1),
        table = Table.FromList(contractsJsonPaginated2, Splitter.SplitByNothing(), null, null, ExtraValues.Error),

        //CODE FOR HANDLING NO DATA
        tableWithCheck = if Table.IsEmpty(table) then #table(type table[Column1 = [server_time=any,
                                                                                auth_user=any,
                                                                                engagements=any]], {}) else table,
 

        expanded = Table.ExpandRecordColumn(tableWithCheck, "Column1", contractMasterColumns, contractMasterColumns),
        expanded2 = Table.ExpandRecordColumn(expanded, "engagements", contractEnagementColumns, contractEnagementColumns), 

        //API RETURNS AN ARRAY IF MORE THAN ONE ENTRY, NO ARRAY IF ONE ENTRY
        convertToList = Table.TransformColumns(expanded2, { "engagement", each if Value.Is( _, type record ) then { _ } else _ } ),
        listExpanded = Table.ExpandListColumn(convertToList, "engagement"),
        allEngagements = Table.ExpandRecordColumn(listExpanded, "engagement", contractColumns, contractOutputColumns),
    
        allEngagementsSelectedColumns = Table.SelectColumns(allEngagements, contractOutputColumns)

    in
        allEngagementsSelectedColumns;

//
// Get All Contracts through pagination
// Tested for
// 0 contracts - SUCCESS
// 1 contract - 
// More than 1 contracts - SUCCESS 
//
[DataSource.Kind="Upwork"]
shared Upwork.GetContracts = Value.ReplaceType(Upwork.GetContractsImpl, Upwork.GetContractsImplType);

Upwork.GetContractsImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetContracts.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetContracts.LongDescription")
        ];

Upwork.GetContractsImpl = () =>
    let
        url = contractUrl,

        //Get Contracts base data
        allEngagementsSelectedColumns = Upwork.GetContractsPaged(url),
        
        //FEEDBACK RECORD
        feedbackRecord = Table.TransformColumns(allEngagementsSelectedColumns, {{"feedback", each if _ = "" then [] else _}}),
        expandedFeedbackRecord = Table.ExpandRecordColumn(feedbackRecord, "feedback", feedbackColumns, feedbackColumns),
        expandedSubFeedbackRecord = Table.ExpandRecordColumn(expandedFeedbackRecord, "feedback_for_buyer", {"score"}, {"feedback_to_client_score"}),
        expandedSubFeedbackRecord2 = Table.ExpandRecordColumn(expandedSubFeedbackRecord, "feedback_for_provider", {"score"}, {"feedback_to_freelancer_score"}),

        contractsTable = Table.SelectColumns(expandedSubFeedbackRecord2, contractOutputFinalColumns),
      
        withProfileUrl = Table.AddColumn(contractsTable, "contract_url", 
                                        each contractProfileUrl & [buyer_team_id] & "/contracts/" & [contract_id]),

        transformedDate = Table.TransformColumns(withProfileUrl, 
                                                       {{"accept_date", each Upwork.FromTimestampToDate(_)},
                                                       {"start_date", each Upwork.FromTimestampToDate(_)},
                                                       {"end_date", each Upwork.FromTimestampToDate(_)}                                                                           
                                                       }),

        transformedTable = Table.TransformColumnTypes(transformedDate,
                {
                {"buyer_team_id", Int64.Type}, 
                {"hourly_charge_rate", Currency.Type}, 
                {"weekly_hours_limit", type number}, 
                {"freelancer_id", Int64.Type}, 
                {"offer_id", Int64.Type},
                {"contract_id", Int64.Type},
                {"accept_date", type datetime},
                {"start_date", type datetime},
                {"end_date", type datetime}})
    in
        transformedTable;



//
// Get Contracts per Page
// url -> engagement url
// parameters -> parameters to pass to API, mostly we will pass pagination param
// Note: In some cases you can view a team but may not have access to see jobs in that team,
// so passing true in 4th param of Upwork.Request
//
Upwork.GetJobsPerPage = (url, parameters) =>
    let
        response =  Json.Document(Upwork.Request(false, url, parameters, true))
    in
        response;


//
// Get Jobs per team
// url -> job url
// parameters -> team_reference parameter
Upwork.GetJobsPerTeam = (url, parameters) =>
    let
        jobsJsonPaginated = List.Generate( () => 
                        [pageResult = null, total_items = 0, nextOffset = 0, counter = 1],
                        each Number.From([total_items]) <> 0 or [counter] <= 1,
                        each [pageResult = try Upwork.GetJobsPerPage(url, 
                                                             parameters & [page=Text.From([nextOffset]) & ";" & Text.From(recordsPerPage)]) 
                                            otherwise null, 
                                total_items = try pageResult[jobs][lister][total_items] otherwise 0,
                                nextOffset = [nextOffset] + recordsPerPage,
                                counter = [counter] + 1],
                        each [pageResult]),
        
        jobsJsonPaginated2 = List.Skip(jobsJsonPaginated, 1)
    in 
        jobsJsonPaginated2;

//
// Get Jobs
// Jobs are per team, get teams first and then iterate over each team to get jobs
// Tested for:
// 0 job - SUCCESS
// 1 job - SUCCESS
// More than 1 jobs - SUCCESS
//
[DataSource.Kind="Upwork"]
shared Upwork.GetJobs = Value.ReplaceType(Upwork.GetJobsImpl, Upwork.GetJobsImplType);

Upwork.GetJobsImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetJobs.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetJobs.LongDescription")
        ];


Upwork.GetJobsImpl = () =>
    let
        url = jobUrl,
        teams = Upwork.GetTeams(),
        response = Table.AddColumn(teams, "Jobs", each 
                                                    try Upwork.GetJobsPerTeam(url, 
                                                                        [buyer_team__reference=Text.From([team_id]), 
                                                                        include_sub_teams=Text.From(1)])
                                                    otherwise null),

        table = Table.ExpandListColumn(response, "Jobs"),
       
        //CODE FOR HANDLING NO DATA
        tableWithCheck = if Table.IsEmpty(table) then #table(type table[Jobs = {[server_time=any,
                                                                                auth_user=any,
                                                                                jobs=any]}], {}) else table,
 
        expanded1 = Table.ExpandRecordColumn(tableWithCheck, "Jobs", jobMasterColumns, jobMasterColumns),
        expanded2 = Table.ExpandRecordColumn(expanded1, "jobs", jobMaster2Columns, jobMaster2Columns), 

        //API RETURNS AN ARRAY IF MORE THAN ONE ENTRY, NO ARRAY IF ONE ENTRY
        convertToList = Table.TransformColumns(expanded2, { "job", each if Value.Is( _, type record ) then { _ } else _ } ),
        listExpanded = Table.ExpandListColumn(convertToList, "job"),
        jobs = Table.ExpandRecordColumn(listExpanded, "job", jobColumns, jobOutputColumns),
    
        jobsOutputTable = Table.SelectColumns(jobs, jobOutputFinalColumns),
        
        //rename column since when fetching for say buyer_team__reference A, sometimes in output
        //I see sub team in buyer_team__reference column
        jobsTable = Table.RenameColumns(jobsOutputTable, {{"buyer_team__reference", "team_id"}}),

        //remove duplicates since sometimes subteams information is included when fetching teams information
        jobsUniqueTable = Table.Distinct(jobsTable),

        transformedDate = Table.TransformColumns(jobsUniqueTable, 
                                                       {{"job_created_date", each Upwork.FromTimestampToDate(_)}}),
                                                      
        //remove null jobs
        removeBlankRows = Table.SelectRows(transformedDate, each [job_text_id] <> null),

        transformedTable = Table.TransformColumnTypes(removeBlankRows,
                {{"job_created_date", type datetime},
                {"team_id", Int64.Type}})

    in
        transformedTable;



//
// Get Freelancer's Profile
// Note: sometimes this API fails with 403 error code if profile is disabled
// freelanceRef -> reference freelancer
//
Upwork.GetFreelancerProfile = (freelanceRef) =>
    let 
        freelancerFullUrl = freelancePrefixUrl & freelanceRef & freelanceSuffixUrl,
        parameters = [],
        response = Json.Document(Upwork.Request(false, freelancerFullUrl, parameters, true)),

        errorCode = try response[error][status] otherwise 200,
        output = if errorCode = 403 
                    then [profile=[_is_error=Extension.LoadString("YesString"), 
                                   _error_code=errorCode, 
                                   _error_message=response[error][message]]] else response
    in
        output;

//
// Get Freelancers
// No bulk freelancers API available, hence get contracts first and then query to get freelancer info
// Tested for:
// 0 contracts - SUCCESS
// 1 freelancer - SUCCESS
// more than 1 freelancers - SUCCESS
//
[DataSource.Kind="Upwork"]
shared Upwork.GetFreelancers = Value.ReplaceType(Upwork.GetFreelancersImpl, Upwork.GetFreelancersImplType);

Upwork.GetFreelancersImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetFreelancers.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetFreelancers.LongDescription")
        ];

Upwork.GetFreelancersImpl = () =>
    let
        contracts = Upwork.GetContractsPaged(contractUrl),

        freelancerSelectedColumns = Table.SelectColumns(contracts, {"freelancer_text_id"}),
        uniqueFreelancers = Table.Distinct(freelancerSelectedColumns),
       
                       
        //ADD PROFILE URL
        freelancerTable = Table.AddColumn(uniqueFreelancers, "freelancer_profile_url", each freelanceProfileUrl & [freelancer_text_id]),

        withFreelancerCall = Table.AddColumn(freelancerTable, "freelancer", 
                                             each try 
                                                    Upwork.GetFreelancerProfile([freelancer_text_id])
                                                  otherwise 
                                                    null),
        expandedFreelancerMasterRecord = Table.ExpandRecordColumn(withFreelancerCall, "freelancer", freelancerMasterColumns, freelancerMasterColumns),
        expandedFreelancerRecord = Table.ExpandRecordColumn(expandedFreelancerMasterRecord, "profile", freelancerColumns, freelancerOutputColumns),

        //EXTRACT AGENCY RECORD
        agencyRecord = Table.TransformColumns(expandedFreelancerRecord, {"dev_ac_agencies", 
                                                        each if _ = "" then [] 
                                                             else _ }),

        expanded = Table.ExpandRecordColumn(agencyRecord, "dev_ac_agencies", {"dev_ac_agency"}, {"dev_ac_agency"}), 

         //API RETURNS AN ARRAY IF MORE THAN ONE ENTRY, NO ARRAY IF ONE ENTRY
        agencyNameList = Table.TransformColumns(expanded, { "dev_ac_agency", each if Value.Is( _, type record ) then { _ } else _ } ),

        firstAgencyName = Table.TransformColumns(agencyNameList, { "dev_ac_agency", 
                                                                each if Value.Is(_, type list) then List.First(_) 
                                                                else _}),
        withAgencyName = Table.ExpandRecordColumn(firstAgencyName, "dev_ac_agency", {"ag_name"}, {"agency_name"}),

        freelancerSelectedTable = Table.SelectColumns(withAgencyName, freelancerOutputFinalColumns),

        //UPDATE DATA TYPES
        transformedTable = Table.TransformColumnTypes(freelancerSelectedTable,
                        {{"freelancer_id", Int64.Type}})
    in 
       transformedTable;

//
// Converts unix timestamp to date
// timestamp -> unix timestamp
//
Upwork.FromTimestampToDate = (timestamp as any) as any =>
    let
        extractedTimestamp = if timestamp <> null and Text.Length(timestamp) > 10 then Text.Range(timestamp, 0, 10) else timestamp,
        timestampToNumber = try Number.From(extractedTimestamp) otherwise null,
        date = if timestampToNumber <> null then #datetime(1970, 1, 1, 0, 0, 0) + #duration(0, 0, 0, timestampToNumber) else null
    in 
       date; 
//
// Get first day of month starting from startdate till enddate
// startdate -> start date to generate dates
// enddate -> end date
//
Upwork.GetMonthFirstDates = (startdate as date, enddate as date) =>
    let
         Source = List.Generate(
                () => [Date = startdate],
                each [Date] <= enddate,
                each [Date = Date.AddMonths([Date],1)],
                each [Date])

    in
        Source;

//
// Get Billing details
// teamRef -> reference team
// contractRef -> reference engagement
//
Upwork.GetBillingByTeamByContract = (teamRef, contractRef) =>
    let
        billingFullUrl = billingPrefixUrl & teamRef & billingSuffixUrl,
        parameters = [tq=billingQuery & contractRef],
        response = Json.Document(Upwork.Request(false, billingFullUrl, parameters))
    in
        response;


// 
// Get Billing details
// teamRef -> reference team
// querydate -> date filter for query
//
Upwork.GetBillingByTeam = (teamRef, querydate) =>
    let
        billingFullUrl = billingPrefixUrl & teamRef & billingSuffixUrl,
        billingQuerySDate = Text.Replace(billingQuery2, "$sdate$", Date.ToText(querydate, "yyyy-MM-dd")),
        billingQueryEDate = Text.Replace(billingQuerySDate, 
                                        "$edate$", 
                                        Date.ToText(Date.AddDays(Date.AddMonths(querydate,1),-1), "yyyy-MM-dd")),
        parameters = [tq=billingQueryEDate],
        response = Json.Document(Upwork.Request(false, billingFullUrl, parameters))
    in
        response;

// 
// Get Billing details
// Tested for
// 0 billing records per team - SUCCESS
// 1 billing record per team - SUCCESS
// More than 1 billing records per team - SUCCESS
//
[DataSource.Kind="Upwork"]
shared Upwork.GetBilling = Value.ReplaceType(Upwork.GetBillingImpl, Upwork.GetBillingImplType);

Upwork.GetBillingImplType = type function() as table
        meta [
            Documentation.Name = Extension.LoadString("Upwork.GetBilling.Name"),
            Documentation.LongDescription = Extension.LoadString("Upwork.GetBilling.LongDescription")
        ];

Upwork.GetBillingImpl = () =>
    let
        teams = Upwork.GetTeams(),
        teamsWithMonths = Table.AddColumn(teams, "billing_month", 
                                          each Upwork.GetMonthFirstDates(#date(2018,1,1), 
                                                             DateTime.Date(DateTime.LocalNow())), 
                                          type date),
       
        queryTable = Table.ExpandListColumn(teamsWithMonths, "billing_month"),
      
        //Get billing per team and per month
        response = Table.AddColumn(queryTable, "Billing", each 
                                                    try Upwork.GetBillingByTeam(Text.From([team_id]), [billing_month])
                                                    otherwise null),
        
        expandedMasterBilling = Table.ExpandRecordColumn(response, "Billing", billingMasterColumns, billingMasterColumns),
        expandedRows = Table.ExpandRecordColumn(expandedMasterBilling, "table", {"rows"}, {"rows"}),
        expandedRowsList = Table.ExpandListColumn(expandedRows, "rows"),
        expandedColumns = Table.ExpandRecordColumn(expandedRowsList, "rows", {"c"}, {"c"}),

        //first column is contract_id
        col1 = Table.AddColumn(expandedColumns, "reference", each if Value.Is([c], type list) then List.First([c]) 
                                                             else [c]),
       
        //last column is amount_spent
        col2 = Table.AddColumn(col1, "amount", each if Value.Is([c], type list) then List.Last([c]) else [c]),
        expandedReference = Table.ExpandRecordColumn(col2, "reference", {"v"}, {"contract_id"}),
        expandedAmount = Table.ExpandRecordColumn(expandedReference, "amount", {"v"}, {"amount_spent"}),
        billingTable = Table.SelectColumns(expandedAmount, billingOutputFinalColumns),

        filteredTable = Table.SelectRows(billingTable, each [contract_id] <> null),

        transformedTable = Table.TransformColumnTypes(filteredTable,
                {{"amount_spent", Currency.Type},
                {"billing_month", type date},
                {"team_id", Int64.Type},
                {"contract_id", Int64.Type}})

    in
        transformedTable;


/* Helper functions for making OAuth 2.0 requests taken from
https://github.com/CurtHagenlocher/Twitter/blob/master/Twitter.pq
*/
Upwork.Request = 
            (isPost, // post or get 
            relativeUrl,  //relative url to base
            otherProps, //other api properties
            optional isManualStatusHandling //for manually handling errors
            ) =>
    let
        method = if isPost then "POST" else "GET",
        headers = [Accept="application/json"],
        queryString = Uri.BuildQueryString(otherProps),
        options = if isPost then [Headers = [#"Content-type" = "application/x-www-form-urlencoded"] & headers, Content = Text.ToBinary(queryString)] else [Headers = headers],
        actualUrl = if isPost or Text.Length(queryString) = 0 then relativeUrl else relativeUrl & "?" & queryString,
        relativePath = [RelativePath = actualUrl],
        manualStatusHandling = if isManualStatusHandling = true then [ManualStatusHandling={403}] else [],
        result = Web.Contents(baseUrl, manualStatusHandling & relativePath & options)
    in
        result;

//GraphQL Request
Upwork.GraphQLRequest = 
            (graphqlParams, //graphql properties,
            optional OrgId
            ) =>
    let
        method = "POST" ,
        
        headers = [Accept="application/json"],
        headerOrgId = if OrgId <> null then [#"X-Upwork-API-TenantId" = OrgId] else [],

        queryString = Json.FromValue(graphqlParams),
        options = [Headers = [#"Content-type" = "application/json"] & headers & headerOrgId, 
                        Content = queryString] ,
        
        manualStatusHandling = [],
        result = Function.InvokeAfter(()=>Web.Contents(graphQLUrl, manualStatusHandling & options), #duration(0,0,0, delayinSec))
    in
        result;

/* Authentication functions provided by SDK */
Upwork.StartLogin = (resourceUrl, state, display) =>
    let
        AuthorizeUrl = baseUrl & authenticateUrl & "?" & Uri.BuildQueryString([
            client_id = clientId,  
            redirect_uri = callbackUrl,
            state = state,
            response_type = "code"
        ])
    in
        [
            LoginUri = AuthorizeUrl,
            CallbackUri = callbackUrl,
            WindowHeight = windowHeight,
            WindowWidth = windowWidth,
            Context = null
        ];

Upwork.FinishLogin = (context, callbackUri, state) =>
   let
        parts = Uri.Parts(callbackUri)[Query],
        result = if (Record.HasFields(parts, {"error", "error_description"})) then 
                     error Error.Record(parts[error], parts[error_description], parts)
                    else
                     Upwork.TokenMethod("authorization_code", "code", parts[code])

    in
        result;

Upwork.TokenMethod = (grantType, tokenField, code) =>
    let
        queryString = [
            client_id = clientId,
            client_secret = clientSecret,
            grant_type = grantType,
            redirect_uri = callbackUrl
        ],
        queryWithCode = Record.AddField(queryString, tokenField, code),
        
        token_uri = baseUrl & requestTokenUrl,

        tokenResponse = Web.Contents(token_uri, [
            Content = Text.ToBinary(Uri.BuildQueryString(queryWithCode)),
            Headers = [
                #"Content-type" = "application/x-www-form-urlencoded",
                #"Accept" = "application/json"
            ]
        ]),
        body = Json.Document(tokenResponse),
        result = if (Record.HasFields(body, {"error", "error_description"})) then 
                    error Error.Record(body[error], body[error_description], body)
                 else
                    body
    in
        result;

//Refresh access_token
Upwork.Refresh = (resourceUrl, refresh_token) => 
                Upwork.TokenMethod("refresh_token", "refresh_token", refresh_token);

//Data Source Kind description
Upwork = [
    // TestConnection is required to enable the connector through the Gateway
    TestConnection = (dataSourcePath) => { "Upwork.Contents" },
    Authentication = [
        OAuth=
            [StartLogin=Upwork.StartLogin, 
            FinishLogin=Upwork.FinishLogin,
            Refresh=Upwork.Refresh]
    ],
    Label = Extension.LoadString("DataSourceLabel")
];


// Data Source UI publishing description
Upwork.Publish = [
    Beta = true,
    Category = Extension.LoadString("ConnectorCategory"),
    ButtonText = { Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp") },
    LearnMoreUrl = "https://github.com/upwork/powerbi-upwork",
    SourceImage = Upwork.Icons,
    SourceTypeImage = Upwork.Icons
];

Upwork.Icons = [
    Icon16 = { Extension.Contents("Upwork16.png"), Extension.Contents("Upwork20.png"), Extension.Contents("Upwork24.png"), Extension.Contents("Upwork32.png") },
    Icon32 = { Extension.Contents("Upwork32.png"), Extension.Contents("Upwork40.png"), Extension.Contents("Upwork48.png"), Extension.Contents("Upwork64.png") }
];

// Navigation Table Helper
Upwork.ToNavigationTable =
(
    table as table,
    keyColumns as list,
    nameColumn as text,
    dataColumn as text,
    itemKindColumn as text,
    itemNameColumn as text,
    isLeafColumn as text
) as table =>
    let
        tableType = Value.Type(table),
        newTableType = Type.AddTableKey(tableType, keyColumns, true) meta 
        [
            NavigationTable.NameColumn = nameColumn, 
            NavigationTable.DataColumn = dataColumn,
            NavigationTable.ItemKindColumn = itemKindColumn, 
            Preview.DelayColumn = dataColumn, 
            NavigationTable.IsLeafColumn = isLeafColumn
        ],
        navigationTable = Value.ReplaceType(table, newTableType)
    in
        navigationTable;