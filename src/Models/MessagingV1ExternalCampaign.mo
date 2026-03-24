
// MessagingV1ExternalCampaign.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1ExternalCampaign = {
        /// The unique string that identifies a US A2P Compliance resource `QE2c6890da8086d771620e9b13fadeba0b`.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that the Campaign belongs to.
        account_sid : ?Text;
        /// ID of the preregistered campaign.
        campaign_id : ?Text;
        /// The SID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) that the resource is associated with.
        messaging_service_sid : ?Text;
        /// The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_created : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1ExternalCampaign type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            campaign_id : ?Text;
            messaging_service_sid : ?Text;
            date_created : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1ExternalCampaign) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1ExternalCampaign = ?json;
    }
}
