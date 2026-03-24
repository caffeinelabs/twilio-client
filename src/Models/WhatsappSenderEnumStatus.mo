
// WhatsappSenderEnumStatus.mo
/// The status of the sender. Configuring: We are in the process of registering the sender. If your sender stays in this state for a long period of time it is possible that there is an issue with parameters you provided; PendingVerification: We have successfully registered the sender with WhatsApp and you should receive a code from their services; Configured: The sender has been successfully verified with WhatsApp and is all set to start sending messages; ConfigurationError - If configuration fails due to below possibilities: parameters provided were incorrect, Twilio account suspended or deleted, whatsapp api failed, Twilio internal error. VerificationError - If verification api fails, please check error_message for more details
/// Enum values: #configuring, #pendingverification, #configured, #configurationerror, #verificationerror

module {
    // User-facing type: type-safe variants for application code
    public type WhatsappSenderEnumStatus = {
        #configuring;
        #pendingverification;
        #configured;
        #configurationerror;
        #verificationerror;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer WhatsappSenderEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : WhatsappSenderEnumStatus) : JSON =
            switch (value) {
                case (#configuring) "Configuring";
                case (#pendingverification) "PendingVerification";
                case (#configured) "Configured";
                case (#configurationerror) "ConfigurationError";
                case (#verificationerror) "VerificationError";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?WhatsappSenderEnumStatus =
            switch (json) {
                case "Configuring" ?#configuring;
                case "PendingVerification" ?#pendingverification;
                case "Configured" ?#configured;
                case "ConfigurationError" ?#configurationerror;
                case "VerificationError" ?#verificationerror;
                case _ null;
            };
    }
}
