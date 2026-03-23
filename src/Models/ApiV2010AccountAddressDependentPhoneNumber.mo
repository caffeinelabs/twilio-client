
import { type ApiV2010AccountApplicationSmsFallbackMethod; JSON = ApiV2010AccountApplicationSmsFallbackMethod } "./ApiV2010AccountApplicationSmsFallbackMethod";

import { type ApiV2010AccountApplicationSmsMethod; JSON = ApiV2010AccountApplicationSmsMethod } "./ApiV2010AccountApplicationSmsMethod";

import { type ApiV2010AccountApplicationStatusCallbackMethod; JSON = ApiV2010AccountApplicationStatusCallbackMethod } "./ApiV2010AccountApplicationStatusCallbackMethod";

import { type ApiV2010AccountApplicationVoiceFallbackMethod; JSON = ApiV2010AccountApplicationVoiceFallbackMethod } "./ApiV2010AccountApplicationVoiceFallbackMethod";

import { type ApiV2010AccountApplicationVoiceMethod; JSON = ApiV2010AccountApplicationVoiceMethod } "./ApiV2010AccountApplicationVoiceMethod";

import { type DependentPhoneNumberEnumAddressRequirement; JSON = DependentPhoneNumberEnumAddressRequirement } "./DependentPhoneNumberEnumAddressRequirement";

import { type DependentPhoneNumberEnumEmergencyStatus; JSON = DependentPhoneNumberEnumEmergencyStatus } "./DependentPhoneNumberEnumEmergencyStatus";

// ApiV2010AccountAddressDependentPhoneNumber.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountAddressDependentPhoneNumber = {
        /// The unique string that that we created to identify the DependentPhoneNumber resource.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the DependentPhoneNumber resource.
        account_sid : ?Text;
        /// The string that you assigned to describe the resource.
        friendly_name : ?Text;
        /// The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.
        phone_number : ?Text;
        /// The URL we call when the phone number receives a call. The `voice_url` will not be used if a `voice_application_sid` or a `trunk_sid` is set.
        voice_url : ?Text;
        voice_method : ?ApiV2010AccountApplicationVoiceMethod;
        voice_fallback_method : ?ApiV2010AccountApplicationVoiceFallbackMethod;
        /// The URL that we call when an error occurs retrieving or executing the TwiML requested by `url`.
        voice_fallback_url : ?Text;
        /// Whether we look up the caller's caller-ID name from the CNAM database. Can be: `true` or `false`. Caller ID lookups can cost $0.01 each.
        voice_caller_id_lookup : ?Bool;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        sms_fallback_method : ?ApiV2010AccountApplicationSmsFallbackMethod;
        /// The URL that we call when an error occurs while retrieving or executing the TwiML from `sms_url`.
        sms_fallback_url : ?Text;
        sms_method : ?ApiV2010AccountApplicationSmsMethod;
        /// The URL we call when the phone number receives an incoming SMS message.
        sms_url : ?Text;
        address_requirements : ?DependentPhoneNumberEnumAddressRequirement;
        /// The set of Boolean properties that indicates whether a phone number can receive calls or messages.  Capabilities are  `Voice`, `SMS`, and `MMS` and each capability can be: `true` or `false`.
        capabilities : ?Text;
        /// The URL we call using the `status_callback_method` to send status information to your application.
        status_callback : ?Text;
        status_callback_method : ?ApiV2010AccountApplicationStatusCallbackMethod;
        /// The API version used to start a new TwiML session.
        api_version : ?Text;
        /// The SID of the application that handles SMS messages sent to the phone number. If an `sms_application_sid` is present, we ignore all `sms_*_url` values and use those of the application.
        sms_application_sid : ?Text;
        /// The SID of the application that handles calls to the phone number. If a `voice_application_sid` is present, we ignore all of the voice urls and use those set on the application. Setting a `voice_application_sid` will automatically delete your `trunk_sid` and vice versa.
        voice_application_sid : ?Text;
        /// The SID of the Trunk that handles calls to the phone number. If a `trunk_sid` is present, we ignore all of the voice urls and voice applications and use those set on the Trunk. Setting a `trunk_sid` will automatically delete your `voice_application_sid` and vice versa.
        trunk_sid : ?Text;
        emergency_status : ?DependentPhoneNumberEnumEmergencyStatus;
        /// The SID of the emergency address configuration that we use for emergency calling from the phone number.
        emergency_address_sid : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountAddressDependentPhoneNumber type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            friendly_name : ?Text;
            phone_number : ?Text;
            voice_url : ?Text;
            voice_method : ?ApiV2010AccountApplicationVoiceMethod.JSON;
            voice_fallback_method : ?ApiV2010AccountApplicationVoiceFallbackMethod.JSON;
            voice_fallback_url : ?Text;
            voice_caller_id_lookup : ?Bool;
            date_created : ?Text;
            date_updated : ?Text;
            sms_fallback_method : ?ApiV2010AccountApplicationSmsFallbackMethod.JSON;
            sms_fallback_url : ?Text;
            sms_method : ?ApiV2010AccountApplicationSmsMethod.JSON;
            sms_url : ?Text;
            address_requirements : ?DependentPhoneNumberEnumAddressRequirement.JSON;
            capabilities : ?Text;
            status_callback : ?Text;
            status_callback_method : ?ApiV2010AccountApplicationStatusCallbackMethod.JSON;
            api_version : ?Text;
            sms_application_sid : ?Text;
            voice_application_sid : ?Text;
            trunk_sid : ?Text;
            emergency_status : ?DependentPhoneNumberEnumEmergencyStatus.JSON;
            emergency_address_sid : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountAddressDependentPhoneNumber) : JSON = { value with
            voice_method = do ? { ApiV2010AccountApplicationVoiceMethod.toJSON(value.voice_method!) };
            voice_fallback_method = do ? { ApiV2010AccountApplicationVoiceFallbackMethod.toJSON(value.voice_fallback_method!) };
            sms_fallback_method = do ? { ApiV2010AccountApplicationSmsFallbackMethod.toJSON(value.sms_fallback_method!) };
            sms_method = do ? { ApiV2010AccountApplicationSmsMethod.toJSON(value.sms_method!) };
            address_requirements = do ? { DependentPhoneNumberEnumAddressRequirement.toJSON(value.address_requirements!) };
            status_callback_method = do ? { ApiV2010AccountApplicationStatusCallbackMethod.toJSON(value.status_callback_method!) };
            emergency_status = do ? { DependentPhoneNumberEnumEmergencyStatus.toJSON(value.emergency_status!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountAddressDependentPhoneNumber {
            ?{ json with
                voice_method = do ? { ApiV2010AccountApplicationVoiceMethod.fromJSON(json.voice_method!)! };
                voice_fallback_method = do ? { ApiV2010AccountApplicationVoiceFallbackMethod.fromJSON(json.voice_fallback_method!)! };
                sms_fallback_method = do ? { ApiV2010AccountApplicationSmsFallbackMethod.fromJSON(json.sms_fallback_method!)! };
                sms_method = do ? { ApiV2010AccountApplicationSmsMethod.fromJSON(json.sms_method!)! };
                address_requirements = do ? { DependentPhoneNumberEnumAddressRequirement.fromJSON(json.address_requirements!)! };
                status_callback_method = do ? { ApiV2010AccountApplicationStatusCallbackMethod.fromJSON(json.status_callback_method!)! };
                emergency_status = do ? { DependentPhoneNumberEnumEmergencyStatus.fromJSON(json.emergency_status!)! };
            }
        };
    }
}
