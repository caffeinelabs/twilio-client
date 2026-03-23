// Api20100401IncomingPhoneNumberMobileApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberMobile; JSON = ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberMobile } "../Models/ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberMobile";
import { type IncomingPhoneNumberMobileEnumEmergencyStatus; JSON = IncomingPhoneNumberMobileEnumEmergencyStatus } "../Models/IncomingPhoneNumberMobileEnumEmergencyStatus";
import { type IncomingPhoneNumberMobileEnumVoiceReceiveMode; JSON = IncomingPhoneNumberMobileEnumVoiceReceiveMode } "../Models/IncomingPhoneNumberMobileEnumVoiceReceiveMode";
import { type ListIncomingPhoneNumberMobileResponse; JSON = ListIncomingPhoneNumberMobileResponse } "../Models/ListIncomingPhoneNumberMobileResponse";
import { type UpdateIncomingPhoneNumberRequestSmsFallbackMethod; JSON = UpdateIncomingPhoneNumberRequestSmsFallbackMethod } "../Models/UpdateIncomingPhoneNumberRequestSmsFallbackMethod";
import { type UpdateIncomingPhoneNumberRequestSmsMethod; JSON = UpdateIncomingPhoneNumberRequestSmsMethod } "../Models/UpdateIncomingPhoneNumberRequestSmsMethod";
import { type UpdateIncomingPhoneNumberRequestStatusCallbackMethod; JSON = UpdateIncomingPhoneNumberRequestStatusCallbackMethod } "../Models/UpdateIncomingPhoneNumberRequestStatusCallbackMethod";
import { type UpdateIncomingPhoneNumberRequestVoiceFallbackMethod; JSON = UpdateIncomingPhoneNumberRequestVoiceFallbackMethod } "../Models/UpdateIncomingPhoneNumberRequestVoiceFallbackMethod";
import { type UpdateIncomingPhoneNumberRequestVoiceMethod; JSON = UpdateIncomingPhoneNumberRequestVoiceMethod } "../Models/UpdateIncomingPhoneNumberRequestVoiceMethod";
import { type Config } "../Config";

module {
    // Management Canister interface for HTTP outcalls
    // Based on types in https://github.com/dfinity/sdk/blob/master/src/dfx/src/util/ic.did
    type http_header = {
        name : Text;
        value : Text;
    };

    type http_method = {
        #get;
        #head;
        #post;
        #put;    // Non-replicated only (is_replicated forced to ?false in generated code)
        #delete; // Non-replicated only (is_replicated forced to ?false in generated code)
    };

    type http_request_args = {
        url : Text;
        max_response_bytes : ?Nat64;
        method : http_method;
        headers : [http_header];
        body : ?Blob;
        transform : ?{
            function : shared query ({ response : http_request_result; context : Blob }) -> async http_request_result;
            context : Blob;
        };
        is_replicated : ?Bool;
    };

    type http_request_result = {
        status : Nat;
        headers : [http_header];
        body : Blob;
    };

    let http_request = (actor "aaaaa-aa" : actor { http_request : (http_request_args) -> async http_request_result }).http_request;


    /// 
    /// 
    public func createIncomingPhoneNumberMobile(config : Config, accountSid : Text, phoneNumber : Text, apiVersion : Text, friendlyName : Text, smsApplicationSid : Text, smsFallbackMethod : UpdateIncomingPhoneNumberRequestSmsFallbackMethod, smsFallbackUrl : Text, smsMethod : UpdateIncomingPhoneNumberRequestSmsMethod, smsUrl : Text, statusCallback : Text, statusCallbackMethod : UpdateIncomingPhoneNumberRequestStatusCallbackMethod, voiceApplicationSid : Text, voiceCallerIdLookup : Bool, voiceFallbackMethod : UpdateIncomingPhoneNumberRequestVoiceFallbackMethod, voiceFallbackUrl : Text, voiceMethod : UpdateIncomingPhoneNumberRequestVoiceMethod, voiceUrl : Text, identitySid : Text, addressSid : Text, emergencyStatus : IncomingPhoneNumberMobileEnumEmergencyStatus, emergencyAddressSid : Text, trunkSid : Text, voiceReceiveMode : IncomingPhoneNumberMobileEnumVoiceReceiveMode, bundleSid : Text) : async* ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberMobile {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/Mobile.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid);

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" }
        ];

        // Build authentication headers based on auth type
        let authHeaders = switch (config.auth) {
            case (?#bearer(token)) {
                [{ name = "Authorization"; value = "Bearer " # token }]
            };
            case (?#apiKey(key)) {
                // API key goes in query parameter, not header
                []
            };
            case (?#basicAuth({user; password})) {
                let encoded = Base64.encode(Text.encodeUtf8(user # ":" # password));
                [{ name = "Authorization"; value = "Basic " # encoded }]
            };
            case null [];
        };

        let headers = Array.flatten<http_header>([
            baseHeaders,
            authHeaders
        ]);

        let request : http_request_args = { config with
            url;
            method = #post;
            headers;
            body = null;
        };

        // Call the management canister's http_request method with cycles
        let response : http_request_result = await (with cycles) http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.fromText(_, null)) {
                case (#ok(blob)) blob;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to parse JSON: " # msg);
            }) |>
            from_candid(_) : ?ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberMobile.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberMobile.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberMobile");
                    }
                };
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to deserialize response");
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };


            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };

    /// 
    /// 
    public func listIncomingPhoneNumberMobile(config : Config, accountSid : Text, beta : Bool, friendlyName : Text, phoneNumber : Text, origin : Text, pageSize : Nat, page : Nat, pageToken : Text) : async* ListIncomingPhoneNumberMobileResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/Mobile.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            # "?" # "Beta=" # debug_show(beta) # "&" # "FriendlyName=" # friendlyName # "&" # "PhoneNumber=" # phoneNumber # "&" # "Origin=" # origin # "&" # "PageSize=" # debug_show(pageSize) # "&" # "Page=" # Int.toText(page) # "&" # "PageToken=" # pageToken;

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" }
        ];

        // Build authentication headers based on auth type
        let authHeaders = switch (config.auth) {
            case (?#bearer(token)) {
                [{ name = "Authorization"; value = "Bearer " # token }]
            };
            case (?#apiKey(key)) {
                // API key goes in query parameter, not header
                []
            };
            case (?#basicAuth({user; password})) {
                let encoded = Base64.encode(Text.encodeUtf8(user # ":" # password));
                [{ name = "Authorization"; value = "Basic " # encoded }]
            };
            case null [];
        };

        let headers = Array.flatten<http_header>([
            baseHeaders,
            authHeaders
        ]);

        let request : http_request_args = { config with
            url;
            method = #get;
            headers;
            body = null;
        };

        // Call the management canister's http_request method with cycles
        let response : http_request_result = await (with cycles) http_request(request);

        // Check HTTP status code before parsing
        if (response.status >= 200 and response.status < 300) {
            // Success response (2xx): parse as expected return type
            (switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to decode response body as UTF-8");
            }) |>
            (switch (JSON.fromText(_, null)) {
                case (#ok(blob)) blob;
                case (#err(msg)) throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to parse JSON: " # msg);
            }) |>
            from_candid(_) : ?ListIncomingPhoneNumberMobileResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListIncomingPhoneNumberMobileResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListIncomingPhoneNumberMobileResponse");
                    }
                };
                case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to deserialize response");
            })
        } else {
            // Error response (4xx, 5xx): parse error models and throw
            let responseText = switch (Text.decodeUtf8(response.body)) {
                case (?text) text;
                case null "";  // Empty body for some errors (e.g., 404)
            };


            // Fallback for status codes not defined in OpenAPI spec
            throw Error.reject("HTTP " # Int.toText(response.status) # ": Unexpected error" #
                (if (responseText != "") { " - " # responseText } else { "" }));
        }
    };


    let operations__ = {
        createIncomingPhoneNumberMobile;
        listIncomingPhoneNumberMobile;
    };

    public module class Api20100401IncomingPhoneNumberMobileApi(config : Config) {
        /// 
        /// 
        public func createIncomingPhoneNumberMobile(accountSid : Text, phoneNumber : Text, apiVersion : Text, friendlyName : Text, smsApplicationSid : Text, smsFallbackMethod : UpdateIncomingPhoneNumberRequestSmsFallbackMethod, smsFallbackUrl : Text, smsMethod : UpdateIncomingPhoneNumberRequestSmsMethod, smsUrl : Text, statusCallback : Text, statusCallbackMethod : UpdateIncomingPhoneNumberRequestStatusCallbackMethod, voiceApplicationSid : Text, voiceCallerIdLookup : Bool, voiceFallbackMethod : UpdateIncomingPhoneNumberRequestVoiceFallbackMethod, voiceFallbackUrl : Text, voiceMethod : UpdateIncomingPhoneNumberRequestVoiceMethod, voiceUrl : Text, identitySid : Text, addressSid : Text, emergencyStatus : IncomingPhoneNumberMobileEnumEmergencyStatus, emergencyAddressSid : Text, trunkSid : Text, voiceReceiveMode : IncomingPhoneNumberMobileEnumVoiceReceiveMode, bundleSid : Text) : async ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberMobile {
            await* operations__.createIncomingPhoneNumberMobile(config, accountSid, phoneNumber, apiVersion, friendlyName, smsApplicationSid, smsFallbackMethod, smsFallbackUrl, smsMethod, smsUrl, statusCallback, statusCallbackMethod, voiceApplicationSid, voiceCallerIdLookup, voiceFallbackMethod, voiceFallbackUrl, voiceMethod, voiceUrl, identitySid, addressSid, emergencyStatus, emergencyAddressSid, trunkSid, voiceReceiveMode, bundleSid)
        };

        /// 
        /// 
        public func listIncomingPhoneNumberMobile(accountSid : Text, beta : Bool, friendlyName : Text, phoneNumber : Text, origin : Text, pageSize : Nat, page : Nat, pageToken : Text) : async ListIncomingPhoneNumberMobileResponse {
            await* operations__.listIncomingPhoneNumberMobile(config, accountSid, beta, friendlyName, phoneNumber, origin, pageSize, page, pageToken)
        };

    }
}
