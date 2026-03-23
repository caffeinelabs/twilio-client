
import { type SiprecEnumStatus; JSON = SiprecEnumStatus } "./SiprecEnumStatus";

// ApiV2010AccountCallSiprec.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountCallSiprec = {
        /// The SID of the Siprec resource.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Siprec resource.
        account_sid : ?Text;
        /// The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Siprec resource is associated with.
        call_sid : ?Text;
        /// The user-specified name of this Siprec, if one was given when the Siprec was created. This may be used to stop the Siprec.
        name : ?Text;
        status : ?SiprecEnumStatus;
        /// The date and time in GMT that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountCallSiprec type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            call_sid : ?Text;
            name : ?Text;
            status : ?SiprecEnumStatus.JSON;
            date_updated : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountCallSiprec) : JSON = { value with
            status = do ? { SiprecEnumStatus.toJSON(value.status!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountCallSiprec {
            ?{ json with
                status = do ? { SiprecEnumStatus.fromJSON(json.status!)! };
            }
        };
    }
}
