
// RealtimeTranscriptionEnumStatus.mo
/// The status - one of `stopped`, `in-flight`
/// Enum values: #in_progress, #stopped

module {
    // User-facing type: type-safe variants for application code
    public type RealtimeTranscriptionEnumStatus = {
        #in_progress;
        #stopped;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer RealtimeTranscriptionEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : RealtimeTranscriptionEnumStatus) : JSON =
            switch (value) {
                case (#in_progress) "in-progress";
                case (#stopped) "stopped";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?RealtimeTranscriptionEnumStatus =
            switch (json) {
                case "in-progress" ?#in_progress;
                case "stopped" ?#stopped;
                case _ null;
            };
    }
}
