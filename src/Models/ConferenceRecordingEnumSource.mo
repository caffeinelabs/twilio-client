
// ConferenceRecordingEnumSource.mo
/// How the recording was created. Can be: `DialVerb`, `Conference`, `OutboundAPI`, `Trunking`, `RecordVerb`, `StartCallRecordingAPI`, `StartConferenceRecordingAPI`.
/// Enum values: #dialverb, #conference, #outboundapi, #trunking, #recordverb, #startcallrecordingapi, #startconferencerecordingapi

module {
    // User-facing type: type-safe variants for application code
    public type ConferenceRecordingEnumSource = {
        #dialverb;
        #conference;
        #outboundapi;
        #trunking;
        #recordverb;
        #startcallrecordingapi;
        #startconferencerecordingapi;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ConferenceRecordingEnumSource type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ConferenceRecordingEnumSource) : JSON =
            switch (value) {
                case (#dialverb) "DialVerb";
                case (#conference) "Conference";
                case (#outboundapi) "OutboundAPI";
                case (#trunking) "Trunking";
                case (#recordverb) "RecordVerb";
                case (#startcallrecordingapi) "StartCallRecordingAPI";
                case (#startconferencerecordingapi) "StartConferenceRecordingAPI";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ConferenceRecordingEnumSource =
            switch (json) {
                case "DialVerb" ?#dialverb;
                case "Conference" ?#conference;
                case "OutboundAPI" ?#outboundapi;
                case "Trunking" ?#trunking;
                case "RecordVerb" ?#recordverb;
                case "StartCallRecordingAPI" ?#startcallrecordingapi;
                case "StartConferenceRecordingAPI" ?#startconferencerecordingapi;
                case _ null;
            };
    }
}
