
import { type ApiV2010AccountApplicationSmsFallbackMethod; JSON = ApiV2010AccountApplicationSmsFallbackMethod } "./ApiV2010AccountApplicationSmsFallbackMethod";

import { type ApiV2010AccountApplicationSmsMethod; JSON = ApiV2010AccountApplicationSmsMethod } "./ApiV2010AccountApplicationSmsMethod";

import { type ApiV2010AccountApplicationStatusCallbackMethod; JSON = ApiV2010AccountApplicationStatusCallbackMethod } "./ApiV2010AccountApplicationStatusCallbackMethod";

import { type ApiV2010AccountApplicationVoiceFallbackMethod; JSON = ApiV2010AccountApplicationVoiceFallbackMethod } "./ApiV2010AccountApplicationVoiceFallbackMethod";

import { type ApiV2010AccountApplicationVoiceMethod; JSON = ApiV2010AccountApplicationVoiceMethod } "./ApiV2010AccountApplicationVoiceMethod";

// ApiV2010AccountApplication.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountApplication = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Application resource.
        account_sid : ?Text;
        /// The API version used to start a new TwiML session.
        api_version : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The string that you assigned to describe the resource.
        friendly_name : ?Text;
        /// The URL we call using a POST method to send message status information to your application.
        message_status_callback : ?Text;
        /// The unique string that that we created to identify the Application resource.
        sid : ?Text;
        sms_fallback_method : ?ApiV2010AccountApplicationSmsFallbackMethod;
        /// The URL that we call when an error occurs while retrieving or executing the TwiML from `sms_url`.
        sms_fallback_url : ?Text;
        sms_method : ?ApiV2010AccountApplicationSmsMethod;
        /// The URL we call using a POST method to send status information to your application about SMS messages that refer to the application.
        sms_status_callback : ?Text;
        /// The URL we call when the phone number receives an incoming SMS message.
        sms_url : ?Text;
        /// The URL we call using the `status_callback_method` to send status information to your application.
        status_callback : ?Text;
        status_callback_method : ?ApiV2010AccountApplicationStatusCallbackMethod;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        /// Whether we look up the caller's caller-ID name from the CNAM database (additional charges apply). Can be: `true` or `false`.
        voice_caller_id_lookup : ?Bool;
        voice_fallback_method : ?ApiV2010AccountApplicationVoiceFallbackMethod;
        /// The URL that we call when an error occurs retrieving or executing the TwiML requested by `url`.
        voice_fallback_url : ?Text;
        voice_method : ?ApiV2010AccountApplicationVoiceMethod;
        /// The URL we call when the phone number assigned to this application receives a call.
        voice_url : ?Text;
        /// Whether to allow other Twilio accounts to dial this applicaton using Dial verb. Can be: `true` or `false`.
        public_application_connect_enabled : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountApplication type
        public type JSON = {
            account_sid : ?Text;
            api_version : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            friendly_name : ?Text;
            message_status_callback : ?Text;
            sid : ?Text;
            sms_fallback_method : ?ApiV2010AccountApplicationSmsFallbackMethod.JSON;
            sms_fallback_url : ?Text;
            sms_method : ?ApiV2010AccountApplicationSmsMethod.JSON;
            sms_status_callback : ?Text;
            sms_url : ?Text;
            status_callback : ?Text;
            status_callback_method : ?ApiV2010AccountApplicationStatusCallbackMethod.JSON;
            uri : ?Text;
            voice_caller_id_lookup : ?Bool;
            voice_fallback_method : ?ApiV2010AccountApplicationVoiceFallbackMethod.JSON;
            voice_fallback_url : ?Text;
            voice_method : ?ApiV2010AccountApplicationVoiceMethod.JSON;
            voice_url : ?Text;
            public_application_connect_enabled : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountApplication) : JSON = { value with
            sms_fallback_method = do ? { ApiV2010AccountApplicationSmsFallbackMethod.toJSON(value.sms_fallback_method!) };
            sms_method = do ? { ApiV2010AccountApplicationSmsMethod.toJSON(value.sms_method!) };
            status_callback_method = do ? { ApiV2010AccountApplicationStatusCallbackMethod.toJSON(value.status_callback_method!) };
            voice_fallback_method = do ? { ApiV2010AccountApplicationVoiceFallbackMethod.toJSON(value.voice_fallback_method!) };
            voice_method = do ? { ApiV2010AccountApplicationVoiceMethod.toJSON(value.voice_method!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountApplication {
            ?{ json with
                sms_fallback_method = do ? { ApiV2010AccountApplicationSmsFallbackMethod.fromJSON(json.sms_fallback_method!)! };
                sms_method = do ? { ApiV2010AccountApplicationSmsMethod.fromJSON(json.sms_method!)! };
                status_callback_method = do ? { ApiV2010AccountApplicationStatusCallbackMethod.fromJSON(json.status_callback_method!)! };
                voice_fallback_method = do ? { ApiV2010AccountApplicationVoiceFallbackMethod.fromJSON(json.voice_fallback_method!)! };
                voice_method = do ? { ApiV2010AccountApplicationVoiceMethod.fromJSON(json.voice_method!)! };
            }
        };
    }
}
