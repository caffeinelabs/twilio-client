
import { type ApiV2010AccountShortCodeSmsFallbackMethod; JSON = ApiV2010AccountShortCodeSmsFallbackMethod } "./ApiV2010AccountShortCodeSmsFallbackMethod";

import { type ApiV2010AccountShortCodeSmsMethod; JSON = ApiV2010AccountShortCodeSmsMethod } "./ApiV2010AccountShortCodeSmsMethod";

// ApiV2010AccountShortCode.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountShortCode = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this ShortCode resource.
        account_sid : ?Text;
        /// The API version used to start a new TwiML session when an SMS message is sent to this short code.
        api_version : ?Text;
        /// The date and time in GMT that this resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that this resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// A string that you assigned to describe this resource. By default, the `FriendlyName` is the short code.
        friendly_name : ?Text;
        /// The short code. e.g., 894546.
        short_code : ?Text;
        /// The unique string that that we created to identify this ShortCode resource.
        sid : ?Text;
        sms_fallback_method : ?ApiV2010AccountShortCodeSmsFallbackMethod;
        /// The URL that we call if an error occurs while retrieving or executing the TwiML from `sms_url`.
        sms_fallback_url : ?Text;
        sms_method : ?ApiV2010AccountShortCodeSmsMethod;
        /// The URL we call when receiving an incoming SMS message to this short code.
        sms_url : ?Text;
        /// The URI of this resource, relative to `https://api.twilio.com`.
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountShortCode type
        public type JSON = {
            account_sid : ?Text;
            api_version : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            friendly_name : ?Text;
            short_code : ?Text;
            sid : ?Text;
            sms_fallback_method : ?ApiV2010AccountShortCodeSmsFallbackMethod.JSON;
            sms_fallback_url : ?Text;
            sms_method : ?ApiV2010AccountShortCodeSmsMethod.JSON;
            sms_url : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountShortCode) : JSON = { value with
            sms_fallback_method = do ? { ApiV2010AccountShortCodeSmsFallbackMethod.toJSON(value.sms_fallback_method!) };
            sms_method = do ? { ApiV2010AccountShortCodeSmsMethod.toJSON(value.sms_method!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountShortCode {
            ?{ json with
                sms_fallback_method = do ? { ApiV2010AccountShortCodeSmsFallbackMethod.fromJSON(json.sms_fallback_method!)! };
                sms_method = do ? { ApiV2010AccountShortCodeSmsMethod.fromJSON(json.sms_method!)! };
            }
        };
    }
}
