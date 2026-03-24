
// TollfreeVerificationEnumStatus.mo
/// The compliance status of the Tollfree Verification record.
/// Enum values: #pending_review, #in_review, #twilio_approved, #twilio_rejected

module {
    // User-facing type: type-safe variants for application code
    public type TollfreeVerificationEnumStatus = {
        #pending_review;
        #in_review;
        #twilio_approved;
        #twilio_rejected;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TollfreeVerificationEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TollfreeVerificationEnumStatus) : JSON =
            switch (value) {
                case (#pending_review) "PENDING_REVIEW";
                case (#in_review) "IN_REVIEW";
                case (#twilio_approved) "TWILIO_APPROVED";
                case (#twilio_rejected) "TWILIO_REJECTED";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TollfreeVerificationEnumStatus =
            switch (json) {
                case "PENDING_REVIEW" ?#pending_review;
                case "IN_REVIEW" ?#in_review;
                case "TWILIO_APPROVED" ?#twilio_approved;
                case "TWILIO_REJECTED" ?#twilio_rejected;
                case _ null;
            };
    }
}
