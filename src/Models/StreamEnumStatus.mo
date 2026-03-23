
// StreamEnumStatus.mo
/// The status of the Stream. Possible values are `stopped` and `in-progress`.
/// Enum values: #in_progress, #stopped

module {
    // User-facing type: type-safe variants for application code
    public type StreamEnumStatus = {
        #in_progress;
        #stopped;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer StreamEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : StreamEnumStatus) : JSON =
            switch (value) {
                case (#in_progress) "in-progress";
                case (#stopped) "stopped";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?StreamEnumStatus =
            switch (json) {
                case "in-progress" ?#in_progress;
                case "stopped" ?#stopped;
                case _ null;
            };
    }
}
