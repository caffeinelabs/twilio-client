
// ApiV2010AccountUsageUsageRecordUsageRecordThisMonth.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountUsageUsageRecordUsageRecordThisMonth = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that accrued the usage.
        account_sid : ?Text;
        /// The API version used to create the resource.
        api_version : ?Text;
        /// Usage records up to date as of this timestamp, formatted as YYYY-MM-DDTHH:MM:SS+00:00. All timestamps are in GMT
        as_of : ?Text;
        /// The category of usage. For more information, see [Usage Categories](https://www.twilio.com/docs/usage/api/usage-record#usage-categories).
        category : ?Text;
        /// The number of usage events, such as the number of calls.
        count : ?Text;
        /// The units in which `count` is measured, such as `calls` for calls or `messages` for SMS.
        count_unit : ?Text;
        /// A plain-language description of the usage category.
        description : ?Text;
        /// The last date for which usage is included in the UsageRecord. The date is specified in GMT and formatted as `YYYY-MM-DD`.
        end_date : ?Text;
        /// The total price of the usage in the currency specified in `price_unit` and associated with the account.
        price : ?Float;
        /// The currency in which `price` is measured, in [ISO 4127](https://www.iso.org/iso/home/standards/currency_codes.htm) format, such as `usd`, `eur`, and `jpy`.
        price_unit : ?Text;
        /// The first date for which usage is included in this UsageRecord. The date is specified in GMT and formatted as `YYYY-MM-DD`.
        start_date : ?Text;
        /// A list of related resources identified by their URIs. For more information, see [List Subresources](https://www.twilio.com/docs/usage/api/usage-record#list-subresources).
        subresource_uris : ?Any;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        /// The amount used to bill usage and measured in units described in `usage_unit`.
        usage : ?Text;
        /// The units in which `usage` is measured, such as `minutes` for calls or `messages` for SMS.
        usage_unit : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountUsageUsageRecordUsageRecordThisMonth type
        public type JSON = {
            account_sid : ?Text;
            api_version : ?Text;
            as_of : ?Text;
            category : ?Text;
            count : ?Text;
            count_unit : ?Text;
            description : ?Text;
            end_date : ?Text;
            price : ?Float;
            price_unit : ?Text;
            start_date : ?Text;
            subresource_uris : ?Any;
            uri : ?Text;
            usage : ?Text;
            usage_unit : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountUsageUsageRecordUsageRecordThisMonth) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountUsageUsageRecordUsageRecordThisMonth = ?json;
    }
}
