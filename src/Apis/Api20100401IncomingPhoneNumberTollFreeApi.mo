// Api20100401IncomingPhoneNumberTollFreeApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberTollFree; JSON = ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberTollFree } "../Models/ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberTollFree";
import { type IncomingPhoneNumberTollFreeEnumEmergencyStatus; JSON = IncomingPhoneNumberTollFreeEnumEmergencyStatus } "../Models/IncomingPhoneNumberTollFreeEnumEmergencyStatus";
import { type IncomingPhoneNumberTollFreeEnumVoiceReceiveMode; JSON = IncomingPhoneNumberTollFreeEnumVoiceReceiveMode } "../Models/IncomingPhoneNumberTollFreeEnumVoiceReceiveMode";
import { type ListIncomingPhoneNumberTollFreeResponse; JSON = ListIncomingPhoneNumberTollFreeResponse } "../Models/ListIncomingPhoneNumberTollFreeResponse";
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
    public func createIncomingPhoneNumberTollFree(config : Config, accountSid : Text, phoneNumber : Text, apiVersion : Text, friendlyName : Text, smsApplicationSid : Text, smsFallbackMethod : UpdateIncomingPhoneNumberRequestSmsFallbackMethod, smsFallbackUrl : Text, smsMethod : UpdateIncomingPhoneNumberRequestSmsMethod, smsUrl : Text, statusCallback : Text, statusCallbackMethod : UpdateIncomingPhoneNumberRequestStatusCallbackMethod, voiceApplicationSid : Text, voiceCallerIdLookup : Bool, voiceFallbackMethod : UpdateIncomingPhoneNumberRequestVoiceFallbackMethod, voiceFallbackUrl : Text, voiceMethod : UpdateIncomingPhoneNumberRequestVoiceMethod, voiceUrl : Text, identitySid : Text, addressSid : Text, emergencyStatus : IncomingPhoneNumberTollFreeEnumEmergencyStatus, emergencyAddressSid : Text, trunkSid : Text, voiceReceiveMode : IncomingPhoneNumberTollFreeEnumVoiceReceiveMode, bundleSid : Text) : async* ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberTollFree {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/TollFree.json"
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
            from_candid(_) : ?ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberTollFree.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberTollFree.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberTollFree");
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
    public func listIncomingPhoneNumberTollFree(config : Config, accountSid : Text, beta : Bool, friendlyName : Text, phoneNumber : Text, origin : Text, pageSize : Nat, page : Nat, pageToken : Text) : async* ListIncomingPhoneNumberTollFreeResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/TollFree.json"
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
            from_candid(_) : ?ListIncomingPhoneNumberTollFreeResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListIncomingPhoneNumberTollFreeResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListIncomingPhoneNumberTollFreeResponse");
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
        createIncomingPhoneNumberTollFree;
        listIncomingPhoneNumberTollFree;
    };

    public module class Api20100401IncomingPhoneNumberTollFreeApi(config : Config) {
        /// 
        /// 
        public func createIncomingPhoneNumberTollFree(accountSid : Text, phoneNumber : Text, apiVersion : Text, friendlyName : Text, smsApplicationSid : Text, smsFallbackMethod : UpdateIncomingPhoneNumberRequestSmsFallbackMethod, smsFallbackUrl : Text, smsMethod : UpdateIncomingPhoneNumberRequestSmsMethod, smsUrl : Text, statusCallback : Text, statusCallbackMethod : UpdateIncomingPhoneNumberRequestStatusCallbackMethod, voiceApplicationSid : Text, voiceCallerIdLookup : Bool, voiceFallbackMethod : UpdateIncomingPhoneNumberRequestVoiceFallbackMethod, voiceFallbackUrl : Text, voiceMethod : UpdateIncomingPhoneNumberRequestVoiceMethod, voiceUrl : Text, identitySid : Text, addressSid : Text, emergencyStatus : IncomingPhoneNumberTollFreeEnumEmergencyStatus, emergencyAddressSid : Text, trunkSid : Text, voiceReceiveMode : IncomingPhoneNumberTollFreeEnumVoiceReceiveMode, bundleSid : Text) : async ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberTollFree {
            await* operations__.createIncomingPhoneNumberTollFree(config, accountSid, phoneNumber, apiVersion, friendlyName, smsApplicationSid, smsFallbackMethod, smsFallbackUrl, smsMethod, smsUrl, statusCallback, statusCallbackMethod, voiceApplicationSid, voiceCallerIdLookup, voiceFallbackMethod, voiceFallbackUrl, voiceMethod, voiceUrl, identitySid, addressSid, emergencyStatus, emergencyAddressSid, trunkSid, voiceReceiveMode, bundleSid)
        };

        /// 
        /// 
        public func listIncomingPhoneNumberTollFree(accountSid : Text, beta : Bool, friendlyName : Text, phoneNumber : Text, origin : Text, pageSize : Nat, page : Nat, pageToken : Text) : async ListIncomingPhoneNumberTollFreeResponse {
            await* operations__.listIncomingPhoneNumberTollFree(config, accountSid, beta, friendlyName, phoneNumber, origin, pageSize, page, pageToken)
        };

    }
}
