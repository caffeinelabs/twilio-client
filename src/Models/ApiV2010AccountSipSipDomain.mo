
import { type ApiV2010AccountApplicationVoiceFallbackMethod; JSON = ApiV2010AccountApplicationVoiceFallbackMethod } "./ApiV2010AccountApplicationVoiceFallbackMethod";

import { type ApiV2010AccountApplicationVoiceMethod; JSON = ApiV2010AccountApplicationVoiceMethod } "./ApiV2010AccountApplicationVoiceMethod";

import { type ApiV2010AccountSipSipDomainVoiceStatusCallbackMethod; JSON = ApiV2010AccountSipSipDomainVoiceStatusCallbackMethod } "./ApiV2010AccountSipSipDomainVoiceStatusCallbackMethod";

// ApiV2010AccountSipSipDomain.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountSipSipDomain = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the SipDomain resource.
        account_sid : ?Text;
        /// The API version used to process the call.
        api_version : ?Text;
        /// The types of authentication you have mapped to your domain. Can be: `IP_ACL` and `CREDENTIAL_LIST`. If you have both defined for your domain, both will be returned in a comma delimited string. If `auth_type` is not defined, the domain will not be able to receive any traffic.
        auth_type : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The unique address you reserve on Twilio to which you route your SIP traffic. Domain names can contain letters, digits, and \"-\" and must end with `sip.twilio.com`.
        domain_name : ?Text;
        /// The string that you assigned to describe the resource.
        friendly_name : ?Text;
        /// The unique string that that we created to identify the SipDomain resource.
        sid : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        voice_fallback_method : ?ApiV2010AccountApplicationVoiceFallbackMethod;
        /// The URL that we call when an error occurs while retrieving or executing the TwiML requested from `voice_url`.
        voice_fallback_url : ?Text;
        voice_method : ?ApiV2010AccountApplicationVoiceMethod;
        voice_status_callback_method : ?ApiV2010AccountSipSipDomainVoiceStatusCallbackMethod;
        /// The URL that we call to pass status parameters (such as call ended) to your application.
        voice_status_callback_url : ?Text;
        /// The URL we call using the `voice_method` when the domain receives a call.
        voice_url : ?Text;
        /// A list of mapping resources associated with the SIP Domain resource identified by their relative URIs.
        subresource_uris : ?Any;
        /// Whether to allow SIP Endpoints to register with the domain to receive calls.
        sip_registration : ?Bool;
        /// Whether emergency calling is enabled for the domain. If enabled, allows emergency calls on the domain from phone numbers with validated addresses.
        emergency_calling_enabled : ?Bool;
        /// Whether secure SIP is enabled for the domain. If enabled, TLS will be enforced and SRTP will be negotiated on all incoming calls to this sip domain.
        secure : ?Bool;
        /// The SID of the BYOC Trunk(Bring Your Own Carrier) resource that the Sip Domain will be associated with.
        byoc_trunk_sid : ?Text;
        /// Whether an emergency caller sid is configured for the domain. If present, this phone number will be used as the callback for the emergency call.
        emergency_caller_sid : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountSipSipDomain type
        public type JSON = {
            account_sid : ?Text;
            api_version : ?Text;
            auth_type : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            domain_name : ?Text;
            friendly_name : ?Text;
            sid : ?Text;
            uri : ?Text;
            voice_fallback_method : ?ApiV2010AccountApplicationVoiceFallbackMethod.JSON;
            voice_fallback_url : ?Text;
            voice_method : ?ApiV2010AccountApplicationVoiceMethod.JSON;
            voice_status_callback_method : ?ApiV2010AccountSipSipDomainVoiceStatusCallbackMethod.JSON;
            voice_status_callback_url : ?Text;
            voice_url : ?Text;
            subresource_uris : ?Any;
            sip_registration : ?Bool;
            emergency_calling_enabled : ?Bool;
            secure : ?Bool;
            byoc_trunk_sid : ?Text;
            emergency_caller_sid : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountSipSipDomain) : JSON = { value with
            voice_fallback_method = do ? { ApiV2010AccountApplicationVoiceFallbackMethod.toJSON(value.voice_fallback_method!) };
            voice_method = do ? { ApiV2010AccountApplicationVoiceMethod.toJSON(value.voice_method!) };
            voice_status_callback_method = do ? { ApiV2010AccountSipSipDomainVoiceStatusCallbackMethod.toJSON(value.voice_status_callback_method!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountSipSipDomain {
            ?{ json with
                voice_fallback_method = do ? { ApiV2010AccountApplicationVoiceFallbackMethod.fromJSON(json.voice_fallback_method!)! };
                voice_method = do ? { ApiV2010AccountApplicationVoiceMethod.fromJSON(json.voice_method!)! };
                voice_status_callback_method = do ? { ApiV2010AccountSipSipDomainVoiceStatusCallbackMethod.fromJSON(json.voice_status_callback_method!)! };
            }
        };
    }
}
