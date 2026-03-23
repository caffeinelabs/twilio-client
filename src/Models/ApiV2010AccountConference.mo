
import { type ConferenceEnumReasonConferenceEnded; JSON = ConferenceEnumReasonConferenceEnded } "./ConferenceEnumReasonConferenceEnded";

import { type ConferenceEnumStatus; JSON = ConferenceEnumStatus } "./ConferenceEnumStatus";

// ApiV2010AccountConference.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountConference = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this Conference resource.
        account_sid : ?Text;
        /// The date and time in UTC that this resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in UTC that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The API version used to create this conference.
        api_version : ?Text;
        /// A string that you assigned to describe this conference room. Maximum length is 128 characters.
        friendly_name : ?Text;
        /// A string that represents the Twilio Region where the conference audio was mixed. May be `us1`, `us2`, `ie1`,  `de1`, `sg1`, `br1`, `au1`, and `jp1`. Basic conference audio will always be mixed in `us1`. Global Conference audio will be mixed nearest to the majority of participants.
        region_ : ?Text;
        /// The unique, Twilio-provided string used to identify this Conference resource.
        sid : ?Text;
        status : ?ConferenceEnumStatus;
        /// The URI of this resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        /// A list of related resources identified by their URIs relative to `https://api.twilio.com`.
        subresource_uris : ?Any;
        reason_conference_ended : ?ConferenceEnumReasonConferenceEnded;
        /// The call SID that caused the conference to end.
        call_sid_ending_conference : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountConference type
        public type JSON = {
            account_sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            api_version : ?Text;
            friendly_name : ?Text;
            region_ : ?Text;
            sid : ?Text;
            status : ?ConferenceEnumStatus.JSON;
            uri : ?Text;
            subresource_uris : ?Any;
            reason_conference_ended : ?ConferenceEnumReasonConferenceEnded.JSON;
            call_sid_ending_conference : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountConference) : JSON = { value with
            status = do ? { ConferenceEnumStatus.toJSON(value.status!) };
            reason_conference_ended = do ? { ConferenceEnumReasonConferenceEnded.toJSON(value.reason_conference_ended!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountConference {
            ?{ json with
                status = do ? { ConferenceEnumStatus.fromJSON(json.status!)! };
                reason_conference_ended = do ? { ConferenceEnumReasonConferenceEnded.fromJSON(json.reason_conference_ended!)! };
            }
        };
    }
}
