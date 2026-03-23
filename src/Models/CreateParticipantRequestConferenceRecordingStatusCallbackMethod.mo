
// CreateParticipantRequestConferenceRecordingStatusCallbackMethod.mo
/// The HTTP method we should use to call `conference_recording_status_callback`. Can be: `GET` or `POST` and defaults to `POST`.
/// Enum values: #get, #post

module {
    // User-facing type: type-safe variants for application code
    public type CreateParticipantRequestConferenceRecordingStatusCallbackMethod = {
        #get;
        #post;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateParticipantRequestConferenceRecordingStatusCallbackMethod type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateParticipantRequestConferenceRecordingStatusCallbackMethod) : JSON =
            switch (value) {
                case (#get) "GET";
                case (#post) "POST";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateParticipantRequestConferenceRecordingStatusCallbackMethod =
            switch (json) {
                case "GET" ?#get;
                case "POST" ?#post;
                case _ null;
            };
    }
}
