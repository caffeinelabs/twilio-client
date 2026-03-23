
import { type RecordingTranscriptionEnumStatus; JSON = RecordingTranscriptionEnumStatus } "./RecordingTranscriptionEnumStatus";

// ApiV2010AccountRecordingRecordingTranscription.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountRecordingRecordingTranscription = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Transcription resource.
        account_sid : ?Text;
        /// The API version used to create the transcription.
        api_version : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The duration of the transcribed audio in seconds.
        duration : ?Text;
        /// The charge for the transcript in the currency associated with the account. This value is populated after the transcript is complete so it may not be available immediately.
        price : ?Float;
        /// The currency in which `price` is measured, in [ISO 4127](https://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g. `usd`, `eur`, `jpy`).
        price_unit : ?Text;
        /// The SID of the [Recording](https://www.twilio.com/docs/voice/api/recording) from which the transcription was created.
        recording_sid : ?Text;
        /// The unique string that that we created to identify the Transcription resource.
        sid : ?Text;
        status : ?RecordingTranscriptionEnumStatus;
        /// The text content of the transcription.
        transcription_text : ?Text;
        /// The transcription type.
        type_ : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountRecordingRecordingTranscription type
        public type JSON = {
            account_sid : ?Text;
            api_version : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            duration : ?Text;
            price : ?Float;
            price_unit : ?Text;
            recording_sid : ?Text;
            sid : ?Text;
            status : ?RecordingTranscriptionEnumStatus.JSON;
            transcription_text : ?Text;
            type_ : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountRecordingRecordingTranscription) : JSON = { value with
            status = do ? { RecordingTranscriptionEnumStatus.toJSON(value.status!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountRecordingRecordingTranscription {
            ?{ json with
                status = do ? { RecordingTranscriptionEnumStatus.fromJSON(json.status!)! };
            }
        };
    }
}
