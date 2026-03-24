
// BrandVettingEnumVettingProvider.mo
/// The third-party provider that has conducted the vetting. One of “CampaignVerify” (Campaign Verify tokens) or “AEGIS” (Secondary Vetting).
/// Enum values: #campaign_verify, #aegis

module {
    // User-facing type: type-safe variants for application code
    public type BrandVettingEnumVettingProvider = {
        #campaign_verify;
        #aegis;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer BrandVettingEnumVettingProvider type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : BrandVettingEnumVettingProvider) : JSON =
            switch (value) {
                case (#campaign_verify) "campaign-verify";
                case (#aegis) "aegis";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?BrandVettingEnumVettingProvider =
            switch (json) {
                case "campaign-verify" ?#campaign_verify;
                case "aegis" ?#aegis;
                case _ null;
            };
    }
}
