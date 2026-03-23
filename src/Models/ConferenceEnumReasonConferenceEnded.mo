
// ConferenceEnumReasonConferenceEnded.mo
/// The reason why a conference ended. When a conference is in progress, will be `null`. When conference is completed, can be: `conference-ended-via-api`, `participant-with-end-conference-on-exit-left`, `participant-with-end-conference-on-exit-kicked`, `last-participant-kicked`, or `last-participant-left`.
/// Enum values: #conference_ended_via_api, #participant_with_end_conference_on_exit_left, #participant_with_end_conference_on_exit_kicked, #last_participant_kicked, #last_participant_left

module {
    // User-facing type: type-safe variants for application code
    public type ConferenceEnumReasonConferenceEnded = {
        #conference_ended_via_api;
        #participant_with_end_conference_on_exit_left;
        #participant_with_end_conference_on_exit_kicked;
        #last_participant_kicked;
        #last_participant_left;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ConferenceEnumReasonConferenceEnded type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ConferenceEnumReasonConferenceEnded) : JSON =
            switch (value) {
                case (#conference_ended_via_api) "conference-ended-via-api";
                case (#participant_with_end_conference_on_exit_left) "participant-with-end-conference-on-exit-left";
                case (#participant_with_end_conference_on_exit_kicked) "participant-with-end-conference-on-exit-kicked";
                case (#last_participant_kicked) "last-participant-kicked";
                case (#last_participant_left) "last-participant-left";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ConferenceEnumReasonConferenceEnded =
            switch (json) {
                case "conference-ended-via-api" ?#conference_ended_via_api;
                case "participant-with-end-conference-on-exit-left" ?#participant_with_end_conference_on_exit_left;
                case "participant-with-end-conference-on-exit-kicked" ?#participant_with_end_conference_on_exit_kicked;
                case "last-participant-kicked" ?#last_participant_kicked;
                case "last-participant-left" ?#last_participant_left;
                case _ null;
            };
    }
}
