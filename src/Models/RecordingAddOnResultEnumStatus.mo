
// RecordingAddOnResultEnumStatus.mo
/// The status of the result. Can be: `canceled`, `completed`, `deleted`, `failed`, `in-progress`, `init`, `processing`, `queued`.
/// Enum values: #canceled, #completed, #deleted, #failed, #in_progress, #init, #processing, #queued

module {
    // User-facing type: type-safe variants for application code
    public type RecordingAddOnResultEnumStatus = {
        #canceled;
        #completed;
        #deleted;
        #failed;
        #in_progress;
        #init;
        #processing;
        #queued;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer RecordingAddOnResultEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : RecordingAddOnResultEnumStatus) : JSON =
            switch (value) {
                case (#canceled) "canceled";
                case (#completed) "completed";
                case (#deleted) "deleted";
                case (#failed) "failed";
                case (#in_progress) "in-progress";
                case (#init) "init";
                case (#processing) "processing";
                case (#queued) "queued";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?RecordingAddOnResultEnumStatus =
            switch (json) {
                case "canceled" ?#canceled;
                case "completed" ?#completed;
                case "deleted" ?#deleted;
                case "failed" ?#failed;
                case "in-progress" ?#in_progress;
                case "init" ?#init;
                case "processing" ?#processing;
                case "queued" ?#queued;
                case _ null;
            };
    }
}
