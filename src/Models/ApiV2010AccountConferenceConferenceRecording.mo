
import { type ConferenceRecordingEnumSource; JSON = ConferenceRecordingEnumSource } "./ConferenceRecordingEnumSource";

import { type ConferenceRecordingEnumStatus; JSON = ConferenceRecordingEnumStatus } "./ConferenceRecordingEnumStatus";

// ApiV2010AccountConferenceConferenceRecording.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountConferenceConferenceRecording = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Conference Recording resource.
        account_sid : ?Text;
        /// The API version used to create the recording.
        api_version : ?Text;
        /// The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Conference Recording resource is associated with.
        call_sid : ?Text;
        /// The Conference SID that identifies the conference associated with the recording.
        conference_sid : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The start time of the recording in GMT and in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
        start_time : ?Text;
        /// The length of the recording in seconds.
        duration : ?Text;
        /// The unique string that that we created to identify the Conference Recording resource.
        sid : ?Text;
        /// The one-time cost of creating the recording in the `price_unit` currency.
        price : ?Text;
        /// The currency used in the `price` property. Example: `USD`.
        price_unit : ?Text;
        status : ?ConferenceRecordingEnumStatus;
        /// The number of channels in the final recording file.  Can be: `1`, or `2`. Separating a two leg call into two separate channels of the recording file is supported in [Dial](https://www.twilio.com/docs/voice/twiml/dial#attributes-record) and [Outbound Rest API](https://www.twilio.com/docs/voice/make-calls) record options.
        channels : ?Int;
        source : ?ConferenceRecordingEnumSource;
        /// The error code that describes why the recording is `absent`. The error code is described in our [Error Dictionary](https://www.twilio.com/docs/api/errors). This value is null if the recording `status` is not `absent`.
        error_code : ?Int;
        /// How to decrypt the recording if it was encrypted using [Call Recording Encryption](https://www.twilio.com/docs/voice/tutorials/voice-recording-encryption) feature.
        encryption_details : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountConferenceConferenceRecording type
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
            price : ?Text;
            price_unit : ?Text;
            status : ?ConferenceRecordingEnumStatus.JSON;
            channels : ?Int;
            source : ?ConferenceRecordingEnumSource.JSON;
            error_code : ?Int;
            encryption_details : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountConferenceConferenceRecording) : JSON = { value with
            status = do ? { ConferenceRecordingEnumStatus.toJSON(value.status!) };
            source = do ? { ConferenceRecordingEnumSource.toJSON(value.source!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountConferenceConferenceRecording {
            ?{ json with
                status = do ? { ConferenceRecordingEnumStatus.fromJSON(json.status!)! };
                source = do ? { ConferenceRecordingEnumSource.fromJSON(json.source!)! };
            }
        };
    }
}
