
// CallEnumStatus.mo
/// The status of this call. Can be: `queued`, `ringing`, `in-progress`, `canceled`, `completed`, `failed`, `busy` or `no-answer`. See [Call Status Values](https://www.twilio.com/docs/voice/api/call-resource#call-status-values) below for more information.
/// Enum values: #queued, #ringing, #in_progress, #completed, #busy, #failed, #no_answer, #canceled

module {
    // User-facing type: type-safe variants for application code
    public type CallEnumStatus = {
        #queued;
        #ringing;
        #in_progress;
        #completed;
        #busy;
        #failed;
        #no_answer;
        #canceled;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CallEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CallEnumStatus) : JSON =
            switch (value) {
                case (#queued) "queued";
                case (#ringing) "ringing";
                case (#in_progress) "in-progress";
                case (#completed) "completed";
                case (#busy) "busy";
                case (#failed) "failed";
                case (#no_answer) "no-answer";
                case (#canceled) "canceled";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CallEnumStatus =
            switch (json) {
                case "queued" ?#queued;
                case "ringing" ?#ringing;
                case "in-progress" ?#in_progress;
                case "completed" ?#completed;
                case "busy" ?#busy;
                case "failed" ?#failed;
                case "no-answer" ?#no_answer;
                case "canceled" ?#canceled;
                case _ null;
            };
    }
}
