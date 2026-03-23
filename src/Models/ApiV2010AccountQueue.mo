
// ApiV2010AccountQueue.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountQueue = {
        /// The date and time in GMT that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The number of calls currently in the queue.
        current_size : ?Int;
        /// A string that you assigned to describe this resource.
        friendly_name : ?Text;
        /// The URI of this resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Queue resource.
        account_sid : ?Text;
        ///  The average wait time in seconds of the members in this queue. This is calculated at the time of the request.
        average_wait_time : ?Int;
        /// The unique string that that we created to identify this Queue resource.
        sid : ?Text;
        /// The date and time in GMT that this resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        ///  The maximum number of calls that can be in the queue. The default is 1000 and the maximum is 5000.
        max_size : ?Int;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountQueue type
        public type JSON = {
            date_updated : ?Text;
            current_size : ?Int;
            friendly_name : ?Text;
            uri : ?Text;
            account_sid : ?Text;
            average_wait_time : ?Int;
            sid : ?Text;
            date_created : ?Text;
            max_size : ?Int;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountQueue) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountQueue = ?json;
    }
}
