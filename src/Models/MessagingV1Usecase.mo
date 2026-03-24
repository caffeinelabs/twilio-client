
// MessagingV1Usecase.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1Usecase = {
        /// Human readable use case details (usecase, description and purpose) of Messaging Service Use Cases.
        usecases : ?[Text];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1Usecase type
        public type JSON = {
            usecases : ?[Text];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1Usecase) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1Usecase = ?json;
    }
}
