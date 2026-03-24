
// TollfreeVerificationEnumUseCaseCategoriesInner.mo
/// Enum values: #two_factor_authentication, #account_notifications, #customer_care, #charity_nonprofit, #delivery_notifications, #fraud_alert_messaging, #events, #higher_education, #k12, #marketing, #polling_and_voting_non_political, #political_election_campaigns, #public_service_announcement, #security_alert

module {
    // User-facing type: type-safe variants for application code
    public type TollfreeVerificationEnumUseCaseCategoriesInner = {
        #two_factor_authentication;
        #account_notifications;
        #customer_care;
        #charity_nonprofit;
        #delivery_notifications;
        #fraud_alert_messaging;
        #events;
        #higher_education;
        #k12;
        #marketing;
        #polling_and_voting_non_political;
        #political_election_campaigns;
        #public_service_announcement;
        #security_alert;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TollfreeVerificationEnumUseCaseCategoriesInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TollfreeVerificationEnumUseCaseCategoriesInner) : JSON =
            switch (value) {
                case (#two_factor_authentication) "TWO_FACTOR_AUTHENTICATION";
                case (#account_notifications) "ACCOUNT_NOTIFICATIONS";
                case (#customer_care) "CUSTOMER_CARE";
                case (#charity_nonprofit) "CHARITY_NONPROFIT";
                case (#delivery_notifications) "DELIVERY_NOTIFICATIONS";
                case (#fraud_alert_messaging) "FRAUD_ALERT_MESSAGING";
                case (#events) "EVENTS";
                case (#higher_education) "HIGHER_EDUCATION";
                case (#k12) "K12";
                case (#marketing) "MARKETING";
                case (#polling_and_voting_non_political) "POLLING_AND_VOTING_NON_POLITICAL";
                case (#political_election_campaigns) "POLITICAL_ELECTION_CAMPAIGNS";
                case (#public_service_announcement) "PUBLIC_SERVICE_ANNOUNCEMENT";
                case (#security_alert) "SECURITY_ALERT";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TollfreeVerificationEnumUseCaseCategoriesInner =
            switch (json) {
                case "TWO_FACTOR_AUTHENTICATION" ?#two_factor_authentication;
                case "ACCOUNT_NOTIFICATIONS" ?#account_notifications;
                case "CUSTOMER_CARE" ?#customer_care;
                case "CHARITY_NONPROFIT" ?#charity_nonprofit;
                case "DELIVERY_NOTIFICATIONS" ?#delivery_notifications;
                case "FRAUD_ALERT_MESSAGING" ?#fraud_alert_messaging;
                case "EVENTS" ?#events;
                case "HIGHER_EDUCATION" ?#higher_education;
                case "K12" ?#k12;
                case "MARKETING" ?#marketing;
                case "POLLING_AND_VOTING_NON_POLITICAL" ?#polling_and_voting_non_political;
                case "POLITICAL_ELECTION_CAMPAIGNS" ?#political_election_campaigns;
                case "PUBLIC_SERVICE_ANNOUNCEMENT" ?#public_service_announcement;
                case "SECURITY_ALERT" ?#security_alert;
                case _ null;
            };
    }
}
