
// ConferenceEnumStatus.mo
/// The status of this conference. Can be: `init`, `in-progress`, or `completed`.
/// Enum values: #init, #in_progress, #completed

module {
    // User-facing type: type-safe variants for application code
    public type ConferenceEnumStatus = {
        #init;
        #in_progress;
        #completed;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ConferenceEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ConferenceEnumStatus) : JSON =
            switch (value) {
                case (#init) "init";
                case (#in_progress) "in-progress";
                case (#completed) "completed";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ConferenceEnumStatus =
            switch (json) {
                case "init" ?#init;
                case "in-progress" ?#in_progress;
                case "completed" ?#completed;
                case _ null;
            };
    }
}
