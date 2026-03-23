
import { type ApiV2010AccountApplicationSmsFallbackMethod; JSON = ApiV2010AccountApplicationSmsFallbackMethod } "./ApiV2010AccountApplicationSmsFallbackMethod";

import { type ApiV2010AccountApplicationSmsMethod; JSON = ApiV2010AccountApplicationSmsMethod } "./ApiV2010AccountApplicationSmsMethod";

import { type ApiV2010AccountApplicationStatusCallbackMethod; JSON = ApiV2010AccountApplicationStatusCallbackMethod } "./ApiV2010AccountApplicationStatusCallbackMethod";

import { type ApiV2010AccountApplicationVoiceFallbackMethod; JSON = ApiV2010AccountApplicationVoiceFallbackMethod } "./ApiV2010AccountApplicationVoiceFallbackMethod";

import { type ApiV2010AccountApplicationVoiceMethod; JSON = ApiV2010AccountApplicationVoiceMethod } "./ApiV2010AccountApplicationVoiceMethod";

import { type ApiV2010AccountIncomingPhoneNumberCapabilities; JSON = ApiV2010AccountIncomingPhoneNumberCapabilities } "./ApiV2010AccountIncomingPhoneNumberCapabilities";

import { type IncomingPhoneNumberEnumAddressRequirement; JSON = IncomingPhoneNumberEnumAddressRequirement } "./IncomingPhoneNumberEnumAddressRequirement";

import { type IncomingPhoneNumberEnumEmergencyAddressStatus; JSON = IncomingPhoneNumberEnumEmergencyAddressStatus } "./IncomingPhoneNumberEnumEmergencyAddressStatus";

import { type IncomingPhoneNumberEnumEmergencyStatus; JSON = IncomingPhoneNumberEnumEmergencyStatus } "./IncomingPhoneNumberEnumEmergencyStatus";

import { type IncomingPhoneNumberEnumVoiceReceiveMode; JSON = IncomingPhoneNumberEnumVoiceReceiveMode } "./IncomingPhoneNumberEnumVoiceReceiveMode";

// ApiV2010AccountIncomingPhoneNumber.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountIncomingPhoneNumber = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created this IncomingPhoneNumber resource.
        account_sid : ?Text;
        /// The SID of the Address resource associated with the phone number.
        address_sid : ?Text;
        address_requirements : ?IncomingPhoneNumberEnumAddressRequirement;
        /// The API version used to start a new TwiML session.
        api_version : ?Text;
        /// Whether the phone number is new to the Twilio platform. Can be: `true` or `false`.
        beta : ?Bool;
        capabilities : ?ApiV2010AccountIncomingPhoneNumberCapabilities;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The string that you assigned to describe the resource.
        friendly_name : ?Text;
        /// The SID of the Identity resource that we associate with the phone number. Some regions require an Identity to meet local regulations.
        identity_sid : ?Text;
        /// The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.
        phone_number : ?Text;
        /// The phone number's origin. `twilio` identifies Twilio-owned phone numbers and `hosted` identifies hosted phone numbers.
        origin : ?Text;
        /// The unique string that that we created to identify this IncomingPhoneNumber resource.
        sid : ?Text;
        /// The SID of the application that handles SMS messages sent to the phone number. If an `sms_application_sid` is present, we ignore all `sms_*_url` values and use those of the application.
        sms_application_sid : ?Text;
        sms_fallback_method : ?ApiV2010AccountApplicationSmsFallbackMethod;
        /// The URL that we call when an error occurs while retrieving or executing the TwiML from `sms_url`.
        sms_fallback_url : ?Text;
        sms_method : ?ApiV2010AccountApplicationSmsMethod;
        /// The URL we call when the phone number receives an incoming SMS message.
        sms_url : ?Text;
        /// The URL we call using the `status_callback_method` to send status information to your application.
        status_callback : ?Text;
        status_callback_method : ?ApiV2010AccountApplicationStatusCallbackMethod;
        /// The SID of the Trunk that handles calls to the phone number. If a `trunk_sid` is present, we ignore all of the voice urls and voice applications and use those set on the Trunk. Setting a `trunk_sid` will automatically delete your `voice_application_sid` and vice versa.
        trunk_sid : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        voice_receive_mode : ?IncomingPhoneNumberEnumVoiceReceiveMode;
        /// The SID of the application that handles calls to the phone number. If a `voice_application_sid` is present, we ignore all of the voice urls and use those set on the application. Setting a `voice_application_sid` will automatically delete your `trunk_sid` and vice versa.
        voice_application_sid : ?Text;
        /// Whether we look up the caller's caller-ID name from the CNAM database ($0.01 per look up). Can be: `true` or `false`.
        voice_caller_id_lookup : ?Bool;
        voice_fallback_method : ?ApiV2010AccountApplicationVoiceFallbackMethod;
        /// The URL that we call when an error occurs retrieving or executing the TwiML requested by `url`.
        voice_fallback_url : ?Text;
        voice_method : ?ApiV2010AccountApplicationVoiceMethod;
        /// The URL we call when the phone number receives a call. The `voice_url` will not be used if a `voice_application_sid` or a `trunk_sid` is set.
        voice_url : ?Text;
        emergency_status : ?IncomingPhoneNumberEnumEmergencyStatus;
        /// The SID of the emergency address configuration that we use for emergency calling from this phone number.
        emergency_address_sid : ?Text;
        emergency_address_status : ?IncomingPhoneNumberEnumEmergencyAddressStatus;
        /// The SID of the Bundle resource that you associate with the phone number. Some regions require a Bundle to meet local Regulations.
        bundle_sid : ?Text;
        status : ?Text;
        /// The phone number type.
        type_ : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountIncomingPhoneNumber type
        public type JSON = {
            account_sid : ?Text;
            address_sid : ?Text;
            address_requirements : ?IncomingPhoneNumberEnumAddressRequirement.JSON;
            api_version : ?Text;
            beta : ?Bool;
            capabilities : ?ApiV2010AccountIncomingPhoneNumberCapabilities;
            date_created : ?Text;
            date_updated : ?Text;
            friendly_name : ?Text;
            identity_sid : ?Text;
            phone_number : ?Text;
            origin : ?Text;
            sid : ?Text;
            sms_application_sid : ?Text;
            sms_fallback_method : ?ApiV2010AccountApplicationSmsFallbackMethod.JSON;
            sms_fallback_url : ?Text;
            sms_method : ?ApiV2010AccountApplicationSmsMethod.JSON;
            sms_url : ?Text;
            status_callback : ?Text;
            status_callback_method : ?ApiV2010AccountApplicationStatusCallbackMethod.JSON;
            trunk_sid : ?Text;
            uri : ?Text;
            voice_receive_mode : ?IncomingPhoneNumberEnumVoiceReceiveMode.JSON;
            voice_application_sid : ?Text;
            voice_caller_id_lookup : ?Bool;
            voice_fallback_method : ?ApiV2010AccountApplicationVoiceFallbackMethod.JSON;
            voice_fallback_url : ?Text;
            voice_method : ?ApiV2010AccountApplicationVoiceMethod.JSON;
            voice_url : ?Text;
            emergency_status : ?IncomingPhoneNumberEnumEmergencyStatus.JSON;
            emergency_address_sid : ?Text;
            emergency_address_status : ?IncomingPhoneNumberEnumEmergencyAddressStatus.JSON;
            bundle_sid : ?Text;
            status : ?Text;
            type_ : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountIncomingPhoneNumber) : JSON = { value with
            address_requirements = do ? { IncomingPhoneNumberEnumAddressRequirement.toJSON(value.address_requirements!) };
            sms_fallback_method = do ? { ApiV2010AccountApplicationSmsFallbackMethod.toJSON(value.sms_fallback_method!) };
            sms_method = do ? { ApiV2010AccountApplicationSmsMethod.toJSON(value.sms_method!) };
            status_callback_method = do ? { ApiV2010AccountApplicationStatusCallbackMethod.toJSON(value.status_callback_method!) };
            voice_receive_mode = do ? { IncomingPhoneNumberEnumVoiceReceiveMode.toJSON(value.voice_receive_mode!) };
            voice_fallback_method = do ? { ApiV2010AccountApplicationVoiceFallbackMethod.toJSON(value.voice_fallback_method!) };
            voice_method = do ? { ApiV2010AccountApplicationVoiceMethod.toJSON(value.voice_method!) };
            emergency_status = do ? { IncomingPhoneNumberEnumEmergencyStatus.toJSON(value.emergency_status!) };
            emergency_address_status = do ? { IncomingPhoneNumberEnumEmergencyAddressStatus.toJSON(value.emergency_address_status!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountIncomingPhoneNumber {
            ?{ json with
                address_requirements = do ? { IncomingPhoneNumberEnumAddressRequirement.fromJSON(json.address_requirements!)! };
                sms_fallback_method = do ? { ApiV2010AccountApplicationSmsFallbackMethod.fromJSON(json.sms_fallback_method!)! };
                sms_method = do ? { ApiV2010AccountApplicationSmsMethod.fromJSON(json.sms_method!)! };
                status_callback_method = do ? { ApiV2010AccountApplicationStatusCallbackMethod.fromJSON(json.status_callback_method!)! };
                voice_receive_mode = do ? { IncomingPhoneNumberEnumVoiceReceiveMode.fromJSON(json.voice_receive_mode!)! };
                voice_fallback_method = do ? { ApiV2010AccountApplicationVoiceFallbackMethod.fromJSON(json.voice_fallback_method!)! };
                voice_method = do ? { ApiV2010AccountApplicationVoiceMethod.fromJSON(json.voice_method!)! };
                emergency_status = do ? { IncomingPhoneNumberEnumEmergencyStatus.fromJSON(json.emergency_status!)! };
                emergency_address_status = do ? { IncomingPhoneNumberEnumEmergencyAddressStatus.fromJSON(json.emergency_address_status!)! };
            }
        };
    }
}
