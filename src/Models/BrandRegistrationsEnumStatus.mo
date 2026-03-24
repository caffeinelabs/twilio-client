
// BrandRegistrationsEnumStatus.mo
/// Brand Registration status. One of \"PENDING\", \"APPROVED\", \"FAILED\", \"IN_REVIEW\", \"DELETION_PENDING\", \"DELETION_FAILED\", \"SUSPENDED\".
/// Enum values: #pending, #approved, #failed, #in_review, #deletion_pending, #deletion_failed, #suspended

module {
    // User-facing type: type-safe variants for application code
    public type BrandRegistrationsEnumStatus = {
        #pending;
        #approved;
        #failed;
        #in_review;
        #deletion_pending;
        #deletion_failed;
        #suspended;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer BrandRegistrationsEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : BrandRegistrationsEnumStatus) : JSON =
            switch (value) {
                case (#pending) "PENDING";
                case (#approved) "APPROVED";
                case (#failed) "FAILED";
                case (#in_review) "IN_REVIEW";
                case (#deletion_pending) "DELETION_PENDING";
                case (#deletion_failed) "DELETION_FAILED";
                case (#suspended) "SUSPENDED";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?BrandRegistrationsEnumStatus =
            switch (json) {
                case "PENDING" ?#pending;
                case "APPROVED" ?#approved;
                case "FAILED" ?#failed;
                case "IN_REVIEW" ?#in_review;
                case "DELETION_PENDING" ?#deletion_pending;
                case "DELETION_FAILED" ?#deletion_failed;
                case "SUSPENDED" ?#suspended;
                case _ null;
            };
    }
}
