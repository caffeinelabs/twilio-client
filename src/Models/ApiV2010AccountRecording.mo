
import { type RecordingEnumSource; JSON = RecordingEnumSource } "./RecordingEnumSource";

import { type RecordingEnumStatus; JSON = RecordingEnumStatus } "./RecordingEnumStatus";

// ApiV2010AccountRecording.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountRecording = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Recording resource.
        account_sid : ?Text;
        /// The API version used during the recording.
        api_version : ?Text;
        /// The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Recording resource is associated with. This will always refer to the parent leg of a two-leg call.
        call_sid : ?Text;
        /// The Conference SID that identifies the conference associated with the recording, if a conference recording.
        conference_sid : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The start time of the recording in GMT and in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
        start_time : ?Text;
        /// The length of the recording in seconds.
        duration : ?Text;
        /// The unique string that that we created to identify the Recording resource.
        sid : ?Text;
        /// The one-time cost of creating the recording in the `price_unit` currency.
        price : ?Text;
        /// The currency used in the `price` property. Example: `USD`.
        price_unit : ?Text;
        status : ?RecordingEnumStatus;
        /// The number of channels in the recording resource. For information on specifying the number of channels in the downloaded recording file, check out [Fetch a Recording’s media file](https://www.twilio.com/docs/voice/api/recording#download-dual-channel-media-file).
        channels : ?Int;
        source : ?RecordingEnumSource;
        /// The error code that describes why the recording is `absent`. The error code is described in our [Error Dictionary](https://www.twilio.com/docs/api/errors). This value is null if the recording `status` is not `absent`.
        error_code : ?Int;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        /// How to decrypt the recording if it was encrypted using [Call Recording Encryption](https://www.twilio.com/docs/voice/tutorials/voice-recording-encryption) feature.
        encryption_details : ?Text;
        /// A list of related resources identified by their relative URIs.
        subresource_uris : ?Any;
        /// The URL of the media file associated with this recording resource. When stored externally, this is the full URL location of the media file.
        media_url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountRecording type
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
            status : ?RecordingEnumStatus.JSON;
            channels : ?Int;
            source : ?RecordingEnumSource.JSON;
            error_code : ?Int;
            uri : ?Text;
            encryption_details : ?Text;
            subresource_uris : ?Any;
            media_url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountRecording) : JSON = { value with
            status = do ? { RecordingEnumStatus.toJSON(value.status!) };
            source = do ? { RecordingEnumSource.toJSON(value.source!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountRecording {
            ?{ json with
                status = do ? { RecordingEnumStatus.fromJSON(json.status!)! };
                source = do ? { RecordingEnumSource.fromJSON(json.source!)! };
            }
        };
    }
}
