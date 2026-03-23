
// ApiV2010AccountQueueMember.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountQueueMember = {
        /// The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Member resource is associated with.
        call_sid : ?Text;
        /// The date that the member was enqueued, given in RFC 2822 format.
        date_enqueued : ?Text;
        /// This member's current position in the queue.
        position : ?Int;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        /// The number of seconds the member has been in the queue.
        wait_time : ?Int;
        /// The SID of the Queue the member is in.
        queue_sid : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountQueueMember type
        public type JSON = {
            call_sid : ?Text;
            date_enqueued : ?Text;
            position : ?Int;
            uri : ?Text;
            wait_time : ?Int;
            queue_sid : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountQueueMember) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountQueueMember = ?json;
    }
}
