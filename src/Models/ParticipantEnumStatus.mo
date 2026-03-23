
// ParticipantEnumStatus.mo
/// The status of the participant's call in a session. Can be: `queued`, `connecting`, `ringing`, `connected`, `complete`, or `failed`.
/// Enum values: #queued, #connecting, #ringing, #connected, #complete, #failed

module {
    // User-facing type: type-safe variants for application code
    public type ParticipantEnumStatus = {
        #queued;
        #connecting;
        #ringing;
        #connected;
        #complete;
        #failed;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ParticipantEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ParticipantEnumStatus) : JSON =
            switch (value) {
                case (#queued) "queued";
                case (#connecting) "connecting";
                case (#ringing) "ringing";
                case (#connected) "connected";
                case (#complete) "complete";
                case (#failed) "failed";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ParticipantEnumStatus =
            switch (json) {
                case "queued" ?#queued;
                case "connecting" ?#connecting;
                case "ringing" ?#ringing;
                case "connected" ?#connected;
                case "complete" ?#complete;
                case "failed" ?#failed;
                case _ null;
            };
    }
}
