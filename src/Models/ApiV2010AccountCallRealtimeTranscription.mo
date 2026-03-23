
import { type RealtimeTranscriptionEnumStatus; JSON = RealtimeTranscriptionEnumStatus } "./RealtimeTranscriptionEnumStatus";

// ApiV2010AccountCallRealtimeTranscription.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountCallRealtimeTranscription = {
        /// The SID of the Transcription resource.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Transcription resource.
        account_sid : ?Text;
        /// The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Transcription resource is associated with.
        call_sid : ?Text;
        /// The user-specified name of this Transcription, if one was given when the Transcription was created. This may be used to stop the Transcription.
        name : ?Text;
        status : ?RealtimeTranscriptionEnumStatus;
        /// The date and time in GMT that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountCallRealtimeTranscription type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            call_sid : ?Text;
            name : ?Text;
            status : ?RealtimeTranscriptionEnumStatus.JSON;
            date_updated : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountCallRealtimeTranscription) : JSON = { value with
            status = do ? { RealtimeTranscriptionEnumStatus.toJSON(value.status!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountCallRealtimeTranscription {
            ?{ json with
                status = do ? { RealtimeTranscriptionEnumStatus.fromJSON(json.status!)! };
            }
        };
    }
}
