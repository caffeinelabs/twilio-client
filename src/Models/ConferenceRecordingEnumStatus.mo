
// ConferenceRecordingEnumStatus.mo
/// The status of the recording. Can be: `processing`, `completed` and `absent`. For more detailed statuses on in-progress recordings, check out how to [Update a Recording Resource](https://www.twilio.com/docs/voice/api/recording#update-a-recording-resource).
/// Enum values: #in_progress, #paused, #stopped, #processing, #completed, #absent

module {
    // User-facing type: type-safe variants for application code
    public type ConferenceRecordingEnumStatus = {
        #in_progress;
        #paused;
        #stopped;
        #processing;
        #completed;
        #absent;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ConferenceRecordingEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ConferenceRecordingEnumStatus) : JSON =
            switch (value) {
                case (#in_progress) "in-progress";
                case (#paused) "paused";
                case (#stopped) "stopped";
                case (#processing) "processing";
                case (#completed) "completed";
                case (#absent) "absent";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ConferenceRecordingEnumStatus =
            switch (json) {
                case "in-progress" ?#in_progress;
                case "paused" ?#paused;
                case "stopped" ?#stopped;
                case "processing" ?#processing;
                case "completed" ?#completed;
                case "absent" ?#absent;
                case _ null;
            };
    }
}
