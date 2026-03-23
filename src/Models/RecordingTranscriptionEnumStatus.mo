
// RecordingTranscriptionEnumStatus.mo
/// The status of the transcription. Can be: `in-progress`, `completed`, `failed`.
/// Enum values: #in_progress, #completed, #failed

module {
    // User-facing type: type-safe variants for application code
    public type RecordingTranscriptionEnumStatus = {
        #in_progress;
        #completed;
        #failed;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer RecordingTranscriptionEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : RecordingTranscriptionEnumStatus) : JSON =
            switch (value) {
                case (#in_progress) "in-progress";
                case (#completed) "completed";
                case (#failed) "failed";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?RecordingTranscriptionEnumStatus =
            switch (json) {
                case "in-progress" ?#in_progress;
                case "completed" ?#completed;
                case "failed" ?#failed;
                case _ null;
            };
    }
}
