
// MessagingV1ServiceUsAppToPersonUsecase.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1ServiceUsAppToPersonUsecase = {
        /// Human readable name, code, description and post_approval_required (indicates whether or not post approval is required for this Use Case) of A2P Campaign Use Cases.
        us_app_to_person_usecases : ?[Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1ServiceUsAppToPersonUsecase type
        public type JSON = {
            us_app_to_person_usecases : ?[Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1ServiceUsAppToPersonUsecase) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1ServiceUsAppToPersonUsecase = ?json;
    }
}
