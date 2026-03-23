
// RecordingEnumStatus.mo
/// The status of the recording. Can be: `processing`, `completed`, `absent` or `deleted`. For information about more detailed statuses on in-progress recordings, check out how to [Update a Recording Resource](https://www.twilio.com/docs/voice/api/recording#update-a-recording-resource).
/// Enum values: #in_progress, #paused, #stopped, #processing, #completed, #absent, #deleted

module {
    // User-facing type: type-safe variants for application code
    public type RecordingEnumStatus = {
        #in_progress;
        #paused;
        #stopped;
        #processing;
        #completed;
        #absent;
        #deleted;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer RecordingEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : RecordingEnumStatus) : JSON =
            switch (value) {
                case (#in_progress) "in-progress";
                case (#paused) "paused";
                case (#stopped) "stopped";
                case (#processing) "processing";
                case (#completed) "completed";
                case (#absent) "absent";
                case (#deleted) "deleted";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?RecordingEnumStatus =
            switch (json) {
                case "in-progress" ?#in_progress;
                case "paused" ?#paused;
                case "stopped" ?#stopped;
                case "processing" ?#processing;
                case "completed" ?#completed;
                case "absent" ?#absent;
                case "deleted" ?#deleted;
                case _ null;
            };
    }
}
