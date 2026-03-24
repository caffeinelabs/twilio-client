
import { type BrandVettingEnumVettingProvider; JSON = BrandVettingEnumVettingProvider } "./BrandVettingEnumVettingProvider";

// MessagingV1BrandRegistrationsBrandVetting.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1BrandRegistrationsBrandVetting = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the vetting record.
        account_sid : ?Text;
        /// The unique string to identify Brand Registration.
        brand_sid : ?Text;
        /// The Twilio SID of the third-party vetting record.
        brand_vetting_sid : ?Text;
        /// The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_updated : ?Text;
        /// The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_created : ?Text;
        /// The unique identifier of the vetting from the third-party provider.
        vetting_id : ?Text;
        /// The type of vetting that has been conducted. One of “STANDARD” (Aegis) or “POLITICAL” (Campaign Verify).
        vetting_class : ?Text;
        /// The status of the import vetting attempt. One of “PENDING,” “SUCCESS,” or “FAILED”.
        vetting_status : ?Text;
        vetting_provider : ?BrandVettingEnumVettingProvider;
        /// The absolute URL of the Brand Vetting resource.
        url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1BrandRegistrationsBrandVetting type
        public type JSON = {
            account_sid : ?Text;
            brand_sid : ?Text;
            brand_vetting_sid : ?Text;
            date_updated : ?Text;
            date_created : ?Text;
            vetting_id : ?Text;
            vetting_class : ?Text;
            vetting_status : ?Text;
            vetting_provider : ?BrandVettingEnumVettingProvider.JSON;
            url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1BrandRegistrationsBrandVetting) : JSON = { value with
            vetting_provider = do ? { BrandVettingEnumVettingProvider.toJSON(value.vetting_provider!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1BrandRegistrationsBrandVetting {
            ?{ json with
                vetting_provider = do ? { BrandVettingEnumVettingProvider.fromJSON(json.vetting_provider!)! };
            }
        };
    }
}
