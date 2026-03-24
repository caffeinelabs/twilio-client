
// TollfreeVerificationEnumVettingProvider.mo
/// The third-party political vetting provider.
/// Enum values: #campaign_verify

module {
    // User-facing type: type-safe variants for application code
    public type TollfreeVerificationEnumVettingProvider = {
        #campaign_verify;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TollfreeVerificationEnumVettingProvider type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TollfreeVerificationEnumVettingProvider) : JSON =
            switch (value) {
                case (#campaign_verify) "CAMPAIGN_VERIFY";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TollfreeVerificationEnumVettingProvider =
            switch (json) {
                case "CAMPAIGN_VERIFY" ?#campaign_verify;
                case _ null;
            };
    }
}
