
import { type CallEnumStatus; JSON = CallEnumStatus } "./CallEnumStatus";

// ApiV2010AccountCall.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountCall = {
        /// The unique string that we created to identify this Call resource.
        sid : ?Text;
        /// The date and time in UTC that this resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in UTC that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The SID that identifies the call that created this leg.
        parent_call_sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Call resource.
        account_sid : ?Text;
        /// The phone number, SIP address, Client identifier or SIM SID that received this call. Phone numbers are in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (e.g., +16175551212). SIP addresses are formatted as `name@company.com`. Client identifiers are formatted `client:name`. SIM SIDs are formatted as `sim:sid`.
        to : ?Text;
        /// The phone number, SIP address or Client identifier that received this call. Formatted for display. Non-North American phone numbers are in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (e.g., +442071838750).
        to_formatted : ?Text;
        /// The phone number, SIP address, Client identifier or SIM SID that made this call. Phone numbers are in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (e.g., +16175551212). SIP addresses are formatted as `name@company.com`. Client identifiers are formatted `client:name`. SIM SIDs are formatted as `sim:sid`.
        from : ?Text;
        /// The calling phone number, SIP address, or Client identifier formatted for display. Non-North American phone numbers are in [E.164](https://www.twilio.com/docs/glossary/what-e164) format (e.g., +442071838750).
        from_formatted : ?Text;
        /// If the call was inbound, this is the SID of the IncomingPhoneNumber resource that received the call. If the call was outbound, it is the SID of the OutgoingCallerId resource from which the call was placed.
        phone_number_sid : ?Text;
        status : ?CallEnumStatus;
        /// The start time of the call, given as UTC in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format. Empty if the call has not yet been dialed.
        start_time : ?Text;
        /// The time the call ended, given as UTC in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format. Empty if the call did not complete successfully.
        end_time : ?Text;
        /// The length of the call in seconds. This value is empty for busy, failed, unanswered, or ongoing calls.
        duration : ?Text;
        /// The charge for this call, in the currency associated with the account. Populated after the call is completed. May not be immediately available. The price associated with a call only reflects the charge for connectivity.  Charges for other call-related features such as Answering Machine Detection, Text-To-Speech, and SIP REFER are not included in this value.
        price : ?Text;
        /// The currency in which `Price` is measured, in [ISO 4127](https://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g., `USD`, `EUR`, `JPY`). Always capitalized for calls.
        price_unit : ?Text;
        /// A string describing the direction of the call. Can be: `inbound` for inbound calls, `outbound-api` for calls initiated via the REST API or `outbound-dial` for calls initiated by a `<Dial>` verb. Using [Elastic SIP Trunking](https://www.twilio.com/docs/sip-trunking), the values can be [`trunking-terminating`](https://www.twilio.com/docs/sip-trunking#termination) for outgoing calls from your communications infrastructure to the PSTN or [`trunking-originating`](https://www.twilio.com/docs/sip-trunking#origination) for incoming calls to your communications infrastructure from the PSTN.
        direction : ?Text;
        /// Either `human` or `machine` if this call was initiated with answering machine detection. Empty otherwise.
        answered_by : ?Text;
        /// The API version used to create the call.
        api_version : ?Text;
        /// The forwarding phone number if this call was an incoming call forwarded from another number (depends on carrier supporting forwarding). Otherwise, empty.
        forwarded_from : ?Text;
        /// The Group SID associated with this call. If no Group is associated with the call, the field is empty.
        group_sid : ?Text;
        /// The caller's name if this call was an incoming call to a phone number with caller ID Lookup enabled. Otherwise, empty.
        caller_name : ?Text;
        /// The wait time in milliseconds before the call is placed.
        queue_time : ?Text;
        /// The unique identifier of the trunk resource that was used for this call. The field is empty if the call was not made using a SIP trunk or if the call is not terminated.
        trunk_sid : ?Text;
        /// The URI of this resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        /// A list of subresources available to this call, identified by their URIs relative to `https://api.twilio.com`.
        subresource_uris : ?Any;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountCall type
        public type JSON = {
            sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            parent_call_sid : ?Text;
            account_sid : ?Text;
            to : ?Text;
            to_formatted : ?Text;
            from : ?Text;
            from_formatted : ?Text;
            phone_number_sid : ?Text;
            status : ?CallEnumStatus.JSON;
            start_time : ?Text;
            end_time : ?Text;
            duration : ?Text;
            price : ?Text;
            price_unit : ?Text;
            direction : ?Text;
            answered_by : ?Text;
            api_version : ?Text;
            forwarded_from : ?Text;
            group_sid : ?Text;
            caller_name : ?Text;
            queue_time : ?Text;
            trunk_sid : ?Text;
            uri : ?Text;
            subresource_uris : ?Any;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountCall) : JSON = { value with
            status = do ? { CallEnumStatus.toJSON(value.status!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountCall {
            ?{ json with
                status = do ? { CallEnumStatus.fromJSON(json.status!)! };
            }
        };
    }
}
