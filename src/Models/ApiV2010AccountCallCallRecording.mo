
import { type CallRecordingEnumSource; JSON = CallRecordingEnumSource } "./CallRecordingEnumSource";

import { type CallRecordingEnumStatus; JSON = CallRecordingEnumStatus } "./CallRecordingEnumStatus";

// ApiV2010AccountCallCallRecording.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountCallCallRecording = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Recording resource.
        account_sid : ?Text;
        /// The API version used to make the recording.
        api_version : ?Text;
        /// The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Recording resource is associated with.
        call_sid : ?Text;
        /// The Conference SID that identifies the conference associated with the recording, if a conference recording.
        conference_sid : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The start time of the recording in GMT and in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
        start_time : ?Text;
        /// The length of the recording in seconds.
        duration : ?Text;
        /// The unique string that that we created to identify the Recording resource.
        sid : ?Text;
        /// The one-time cost of creating the recording in the `price_unit` currency.
        price : ?Float;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        /// How to decrypt the recording if it was encrypted using [Call Recording Encryption](https://www.twilio.com/docs/voice/tutorials/voice-recording-encryption) feature.
        encryption_details : ?Text;
        /// The currency used in the `price` property. Example: `USD`.
        price_unit : ?Text;
        status : ?CallRecordingEnumStatus;
        /// The number of channels in the final recording file.  Can be: `1`, or `2`. Separating a two leg call into two separate channels of the recording file is supported in [Dial](https://www.twilio.com/docs/voice/twiml/dial#attributes-record) and [Outbound Rest API](https://www.twilio.com/docs/voice/make-calls) record options.
        channels : ?Int;
        source : ?CallRecordingEnumSource;
        /// The error code that describes why the recording is `absent`. The error code is described in our [Error Dictionary](https://www.twilio.com/docs/api/errors). This value is null if the recording `status` is not `absent`.
        error_code : ?Int;
        /// The recorded track. Can be: `inbound`, `outbound`, or `both`.
        track : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountCallCallRecording type
        public type JSON = {
            account_sid : ?Text;
            api_version : ?Text;
            call_sid : ?Text;
            conference_sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            start_time : ?Text;
            duration : ?Text;
            sid : ?Text;
            price : ?Float;
            uri : ?Text;
            encryption_details : ?Text;
            price_unit : ?Text;
            status : ?CallRecordingEnumStatus.JSON;
            channels : ?Int;
            source : ?CallRecordingEnumSource.JSON;
            error_code : ?Int;
            track : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountCallCallRecording) : JSON = { value with
            status = do ? { CallRecordingEnumStatus.toJSON(value.status!) };
            source = do ? { CallRecordingEnumSource.toJSON(value.source!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountCallCallRecording {
            ?{ json with
                status = do ? { CallRecordingEnumStatus.fromJSON(json.status!)! };
                source = do ? { CallRecordingEnumSource.fromJSON(json.source!)! };
            }
        };
    }
}
