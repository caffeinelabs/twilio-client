
// BrandRegistrationsEnumIdentityStatus.mo
/// When a brand is registered, TCR will attempt to verify the identity of the brand based on the supplied information.
/// Enum values: #self_declared, #unverified, #verified, #vetted_verified

module {
    // User-facing type: type-safe variants for application code
    public type BrandRegistrationsEnumIdentityStatus = {
        #self_declared;
        #unverified;
        #verified;
        #vetted_verified;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer BrandRegistrationsEnumIdentityStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : BrandRegistrationsEnumIdentityStatus) : JSON =
            switch (value) {
                case (#self_declared) "SELF_DECLARED";
                case (#unverified) "UNVERIFIED";
                case (#verified) "VERIFIED";
                case (#vetted_verified) "VETTED_VERIFIED";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?BrandRegistrationsEnumIdentityStatus =
            switch (json) {
                case "SELF_DECLARED" ?#self_declared;
                case "UNVERIFIED" ?#unverified;
                case "VERIFIED" ?#verified;
                case "VETTED_VERIFIED" ?#vetted_verified;
                case _ null;
            };
    }
}
