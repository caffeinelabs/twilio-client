
// MessagingV1ServiceUsAppToPersonV2.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1ServiceUsAppToPersonV2 = {
        /// The unique string that identifies a US A2P Compliance resource `QE2c6890da8086d771620e9b13fadeba0b`.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that the Campaign belongs to.
        account_sid : ?Text;
        /// The unique string to identify the A2P brand.
        brand_registration_sid : ?Text;
        /// The SID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) that the resource is associated with.
        messaging_service_sid : ?Text;
        /// A short description of what this SMS campaign does. Min length: 40 characters. Max length: 4096 characters.
        description : ?Text;
        /// An array of sample message strings, min two and max five. Min length for each sample: 20 chars. Max length for each sample: 1024 chars.
        message_samples : ?[Text];
        /// A2P Campaign Use Case. Examples: [ 2FA, EMERGENCY, MARKETING, SOLE_PROPRIETOR...]. SOLE_PROPRIETOR campaign use cases can only be created by SOLE_PROPRIETOR Brands, and there can only be one SOLE_PROPRIETOR campaign created per SOLE_PROPRIETOR Brand.
        us_app_to_person_usecase : ?Text;
        /// Indicate that this SMS campaign will send messages that contain links.
        has_embedded_links : ?Bool;
        /// Indicates that this SMS campaign will send messages that contain phone numbers.
        has_embedded_phone : ?Bool;
        /// A boolean that specifies whether campaign has Subscriber Optin or not.
        subscriber_opt_in : ?Bool;
        /// A boolean that specifies whether campaign is age gated or not.
        age_gated : ?Bool;
        /// A boolean that specifies whether campaign allows direct lending or not.
        direct_lending : ?Bool;
        /// Campaign status. Examples: IN_PROGRESS, VERIFIED, FAILED.
        campaign_status : ?Text;
        /// The Campaign Registry (TCR) Campaign ID.
        campaign_id : ?Text;
        /// Indicates whether the campaign was registered externally or not.
        is_externally_registered : ?Bool;
        /// Rate limit and/or classification set by each carrier, Ex. AT&T or T-Mobile.
        rate_limits : ?Text;
        /// Details around how a consumer opts-in to their campaign, therefore giving consent to receive their messages. If multiple opt-in methods can be used for the same campaign, they must all be listed. 40 character minimum. 2048 character maximum.
        message_flow : ?Text;
        /// If end users can text in a keyword to start receiving messages from this campaign, the auto-reply messages sent to the end users must be provided. The opt-in response should include the Brand name, confirmation of opt-in enrollment to a recurring message campaign, how to get help, and clear description of how to opt-out. This field is required if end users can text in a keyword to start receiving messages from this campaign. 20 character minimum. 320 character maximum.
        opt_in_message : ?Text;
        /// Upon receiving the opt-out keywords from the end users, Twilio customers are expected to send back an auto-generated response, which must provide acknowledgment of the opt-out request and confirmation that no further messages will be sent. It is also recommended that these opt-out messages include the brand name. This field is required if managing opt out keywords yourself (i.e. not using Twilio's Default or Advanced Opt Out features). 20 character minimum. 320 character maximum.
        opt_out_message : ?Text;
        /// When customers receive the help keywords from their end users, Twilio customers are expected to send back an auto-generated response; this may include the brand name and additional support contact information. This field is required if managing help keywords yourself (i.e. not using Twilio's Default or Advanced Opt Out features). 20 character minimum. 320 character maximum.
        help_message : ?Text;
        /// If end users can text in a keyword to start receiving messages from this campaign, those keywords must be provided. This field is required if end users can text in a keyword to start receiving messages from this campaign. Values must be alphanumeric. 255 character maximum.
        opt_in_keywords : ?[Text];
        /// End users should be able to text in a keyword to stop receiving messages from this campaign. Those keywords must be provided. This field is required if managing opt out keywords yourself (i.e. not using Twilio's Default or Advanced Opt Out features). Values must be alphanumeric. 255 character maximum.
        opt_out_keywords : ?[Text];
        /// End users should be able to text in a keyword to receive help. Those keywords must be provided as part of the campaign registration request. This field is required if managing help keywords yourself (i.e. not using Twilio's Default or Advanced Opt Out features). Values must be alphanumeric. 255 character maximum.
        help_keywords : ?[Text];
        /// The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_created : ?Text;
        /// The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_updated : ?Text;
        /// The absolute URL of the US App to Person resource.
        url : ?Text;
        /// A boolean that specifies whether campaign is a mock or not. Mock campaigns will be automatically created if using a mock brand. Mock campaigns should only be used for testing purposes.
        mock : ?Bool;
        /// Details indicating why a campaign registration failed. These errors can indicate one or more fields that were incorrect or did not meet review requirements.
        errors : ?[Text];
        /// The URL of the privacy policy for the campaign.
        privacy_policy_url : Text;
        /// The URL of the terms and conditions for the campaign.
        terms_and_conditions_url : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1ServiceUsAppToPersonV2 type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            brand_registration_sid : ?Text;
            messaging_service_sid : ?Text;
            description : ?Text;
            message_samples : ?[Text];
            us_app_to_person_usecase : ?Text;
            has_embedded_links : ?Bool;
            has_embedded_phone : ?Bool;
            subscriber_opt_in : ?Bool;
            age_gated : ?Bool;
            direct_lending : ?Bool;
            campaign_status : ?Text;
            campaign_id : ?Text;
            is_externally_registered : ?Bool;
            rate_limits : ?Text;
            message_flow : ?Text;
            opt_in_message : ?Text;
            opt_out_message : ?Text;
            help_message : ?Text;
            opt_in_keywords : ?[Text];
            opt_out_keywords : ?[Text];
            help_keywords : ?[Text];
            date_created : ?Text;
            date_updated : ?Text;
            url : ?Text;
            mock : ?Bool;
            errors : ?[Text];
            privacy_policy_url : Text;
            terms_and_conditions_url : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1ServiceUsAppToPersonV2) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1ServiceUsAppToPersonV2 = ?json;
    }
}
