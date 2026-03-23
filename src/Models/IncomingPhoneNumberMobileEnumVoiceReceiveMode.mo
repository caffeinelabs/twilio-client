
// IncomingPhoneNumberMobileEnumVoiceReceiveMode.mo
/// Enum values: #voice, #fax

module {
    // User-facing type: type-safe variants for application code
    public type IncomingPhoneNumberMobileEnumVoiceReceiveMode = {
        #voice;
        #fax;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer IncomingPhoneNumberMobileEnumVoiceReceiveMode type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : IncomingPhoneNumberMobileEnumVoiceReceiveMode) : JSON =
            switch (value) {
                case (#voice) "voice";
                case (#fax) "fax";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?IncomingPhoneNumberMobileEnumVoiceReceiveMode =
            switch (json) {
                case "voice" ?#voice;
                case "fax" ?#fax;
                case _ null;
            };
    }
}
