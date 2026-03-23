
// ApiV2010AccountCallUserDefinedMessageSubscription.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountCallUserDefinedMessageSubscription = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that subscribed to the User Defined Messages.
        account_sid : ?Text;
        /// The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the User Defined Message Subscription is associated with. This refers to the Call SID that is producing the User Defined Messages.
        call_sid : ?Text;
        /// The SID that uniquely identifies this User Defined Message Subscription.
        sid : ?Text;
        /// The date that this User Defined Message Subscription was created, given in RFC 2822 format.
        date_created : ?Text;
        /// The URI of the User Defined Message Subscription Resource, relative to `https://api.twilio.com`.
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountCallUserDefinedMessageSubscription type
        public type JSON = {
            account_sid : ?Text;
            call_sid : ?Text;
            sid : ?Text;
            date_created : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountCallUserDefinedMessageSubscription) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountCallUserDefinedMessageSubscription = ?json;
    }
}
