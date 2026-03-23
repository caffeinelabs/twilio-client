
import { type RecordingAddOnResultEnumStatus; JSON = RecordingAddOnResultEnumStatus } "./RecordingAddOnResultEnumStatus";

// ApiV2010AccountRecordingRecordingAddOnResult.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountRecordingRecordingAddOnResult = {
        /// The unique string that that we created to identify the Recording AddOnResult resource.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Recording AddOnResult resource.
        account_sid : ?Text;
        status : ?RecordingAddOnResultEnumStatus;
        /// The SID of the Add-on to which the result belongs.
        add_on_sid : ?Text;
        /// The SID of the Add-on configuration.
        add_on_configuration_sid : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The date and time in GMT that the result was completed specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_completed : ?Text;
        /// The SID of the recording to which the AddOnResult resource belongs.
        reference_sid : ?Text;
        /// A list of related resources identified by their relative URIs.
        subresource_uris : ?Any;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountRecordingRecordingAddOnResult type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            status : ?RecordingAddOnResultEnumStatus.JSON;
            add_on_sid : ?Text;
            add_on_configuration_sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            date_completed : ?Text;
            reference_sid : ?Text;
            subresource_uris : ?Any;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountRecordingRecordingAddOnResult) : JSON = { value with
            status = do ? { RecordingAddOnResultEnumStatus.toJSON(value.status!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountRecordingRecordingAddOnResult {
            ?{ json with
                status = do ? { RecordingAddOnResultEnumStatus.fromJSON(json.status!)! };
            }
        };
    }
}
