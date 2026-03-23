
import { type ParticipantEnumStatus; JSON = ParticipantEnumStatus } "./ParticipantEnumStatus";

// ApiV2010AccountConferenceParticipant.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountConferenceParticipant = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Participant resource.
        account_sid : ?Text;
        /// The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Participant resource is associated with.
        call_sid : ?Text;
        /// The user-specified label of this participant, if one was given when the participant was created. This may be used to fetch, update or delete the participant.
        label_ : ?Text;
        /// The SID of the participant who is being `coached`. The participant being coached is the only participant who can hear the participant who is `coaching`.
        call_sid_to_coach : ?Text;
        /// Whether the participant is coaching another call. Can be: `true` or `false`. If not present, defaults to `false` unless `call_sid_to_coach` is defined. If `true`, `call_sid_to_coach` must be defined.
        coaching : ?Bool;
        /// The SID of the conference the participant is in.
        conference_sid : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// Whether the conference ends when the participant leaves. Can be: `true` or `false` and the default is `false`. If `true`, the conference ends and all other participants drop out when the participant leaves.
        end_conference_on_exit : ?Bool;
        /// Whether the participant is muted. Can be `true` or `false`.
        muted : ?Bool;
        /// Whether the participant is on hold. Can be `true` or `false`.
        hold : ?Bool;
        /// Whether the conference starts when the participant joins the conference, if it has not already started. Can be: `true` or `false` and the default is `true`. If `false` and the conference has not started, the participant is muted and hears background music until another participant starts the conference.
        start_conference_on_enter : ?Bool;
        status : ?ParticipantEnumStatus;
        /// The wait time in milliseconds before participant's call is placed. Only available in the response to a create participant request.
        queue_time : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountConferenceParticipant type
        public type JSON = {
            account_sid : ?Text;
            call_sid : ?Text;
            label_ : ?Text;
            call_sid_to_coach : ?Text;
            coaching : ?Bool;
            conference_sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            end_conference_on_exit : ?Bool;
            muted : ?Bool;
            hold : ?Bool;
            start_conference_on_enter : ?Bool;
            status : ?ParticipantEnumStatus.JSON;
            queue_time : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountConferenceParticipant) : JSON = { value with
            status = do ? { ParticipantEnumStatus.toJSON(value.status!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountConferenceParticipant {
            ?{ json with
                status = do ? { ParticipantEnumStatus.fromJSON(json.status!)! };
            }
        };
    }
}
