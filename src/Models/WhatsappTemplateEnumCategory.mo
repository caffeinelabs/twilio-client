
// WhatsappTemplateEnumCategory.mo
/// The Category of this WhatsApp Template. One of `ACCOUNT_UPDATE`, `ALERT_UPDATE`, `APPOINTMENT_UPDATE`, `AUTO_REPLY`, `ISSUE_RESOLUTION`, `PAYMENT_UPDATE`, `PERSONAL_FINANCE_UPDATE`, `RESERVATION_UPDATE`, `SHIPPING_UPDATE`, `TICKET_UPDATE`, `TRANSPORTATION_UPDATE`, `MARKETING`, `AUTHENTICATION`, `UTILITY`, `OTP` or `TRANSACTIONAL`.
/// Enum values: #account_update, #alert_update, #auto_reply, #appointment_update, #issue_resolution, #payment_update, #personal_finance_update, #reservation_update, #shipping_update, #ticket_update, #transportation_update, #marketing, #otp, #transactional, #authentication, #utility

module {
    // User-facing type: type-safe variants for application code
    public type WhatsappTemplateEnumCategory = {
        #account_update;
        #alert_update;
        #auto_reply;
        #appointment_update;
        #issue_resolution;
        #payment_update;
        #personal_finance_update;
        #reservation_update;
        #shipping_update;
        #ticket_update;
        #transportation_update;
        #marketing;
        #otp;
        #transactional;
        #authentication;
        #utility;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WhatsappTemplateEnumCategory type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WhatsappTemplateEnumCategory) : JSON =
            switch (value) {
                case (#account_update) "ACCOUNT_UPDATE";
                case (#alert_update) "ALERT_UPDATE";
                case (#auto_reply) "AUTO_REPLY";
                case (#appointment_update) "APPOINTMENT_UPDATE";
                case (#issue_resolution) "ISSUE_RESOLUTION";
                case (#payment_update) "PAYMENT_UPDATE";
                case (#personal_finance_update) "PERSONAL_FINANCE_UPDATE";
                case (#reservation_update) "RESERVATION_UPDATE";
                case (#shipping_update) "SHIPPING_UPDATE";
                case (#ticket_update) "TICKET_UPDATE";
                case (#transportation_update) "TRANSPORTATION_UPDATE";
                case (#marketing) "MARKETING";
                case (#otp) "OTP";
                case (#transactional) "TRANSACTIONAL";
                case (#authentication) "AUTHENTICATION";
                case (#utility) "UTILITY";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WhatsappTemplateEnumCategory =
            switch (json) {
                case "ACCOUNT_UPDATE" ?#account_update;
                case "ALERT_UPDATE" ?#alert_update;
                case "AUTO_REPLY" ?#auto_reply;
                case "APPOINTMENT_UPDATE" ?#appointment_update;
                case "ISSUE_RESOLUTION" ?#issue_resolution;
                case "PAYMENT_UPDATE" ?#payment_update;
                case "PERSONAL_FINANCE_UPDATE" ?#personal_finance_update;
                case "RESERVATION_UPDATE" ?#reservation_update;
                case "SHIPPING_UPDATE" ?#shipping_update;
                case "TICKET_UPDATE" ?#ticket_update;
                case "TRANSPORTATION_UPDATE" ?#transportation_update;
                case "MARKETING" ?#marketing;
                case "OTP" ?#otp;
                case "TRANSACTIONAL" ?#transactional;
                case "AUTHENTICATION" ?#authentication;
                case "UTILITY" ?#utility;
                case _ null;
            };
    }
}
