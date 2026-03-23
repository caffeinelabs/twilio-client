// Api20100401IncomingPhoneNumberApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ApiV2010AccountIncomingPhoneNumber; JSON = ApiV2010AccountIncomingPhoneNumber } "../Models/ApiV2010AccountIncomingPhoneNumber";
import { type IncomingPhoneNumberEnumEmergencyStatus; JSON = IncomingPhoneNumberEnumEmergencyStatus } "../Models/IncomingPhoneNumberEnumEmergencyStatus";
import { type IncomingPhoneNumberEnumVoiceReceiveMode; JSON = IncomingPhoneNumberEnumVoiceReceiveMode } "../Models/IncomingPhoneNumberEnumVoiceReceiveMode";
import { type ListIncomingPhoneNumberResponse; JSON = ListIncomingPhoneNumberResponse } "../Models/ListIncomingPhoneNumberResponse";
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


    /// Purchase a phone-number for the account.
    /// Purchase a phone-number for the account.
    public func createIncomingPhoneNumber(config : Config, accountSid : Text, apiVersion : Text, friendlyName : Text, smsApplicationSid : Text, smsFallbackMethod : UpdateIncomingPhoneNumberRequestSmsFallbackMethod, smsFallbackUrl : Text, smsMethod : UpdateIncomingPhoneNumberRequestSmsMethod, smsUrl : Text, statusCallback : Text, statusCallbackMethod : UpdateIncomingPhoneNumberRequestStatusCallbackMethod, voiceApplicationSid : Text, voiceCallerIdLookup : Bool, voiceFallbackMethod : UpdateIncomingPhoneNumberRequestVoiceFallbackMethod, voiceFallbackUrl : Text, voiceMethod : UpdateIncomingPhoneNumberRequestVoiceMethod, voiceUrl : Text, emergencyStatus : IncomingPhoneNumberEnumEmergencyStatus, emergencyAddressSid : Text, trunkSid : Text, identitySid : Text, addressSid : Text, voiceReceiveMode : IncomingPhoneNumberEnumVoiceReceiveMode, bundleSid : Text, phoneNumber : Text, areaCode : Text) : async* ApiV2010AccountIncomingPhoneNumber {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers.json"
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
            from_candid(_) : ?ApiV2010AccountIncomingPhoneNumber.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountIncomingPhoneNumber.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountIncomingPhoneNumber");
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

    /// Delete a phone-numbers belonging to the account used to make the request.
    /// Delete a phone-numbers belonging to the account used to make the request.
    public func deleteIncomingPhoneNumber(config : Config, accountSid : Text, sid : Text) : async* () {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{Sid}.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{Sid}", sid);

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
            method = #delete;
            headers;
            body = null;
        };

        // Call the management canister's http_request method with cycles
        ignore await (with cycles) http_request(request);

    };

    /// Fetch an incoming-phone-number belonging to the account used to make the request.
    /// Fetch an incoming-phone-number belonging to the account used to make the request.
    public func fetchIncomingPhoneNumber(config : Config, accountSid : Text, sid : Text) : async* ApiV2010AccountIncomingPhoneNumber {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{Sid}.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{Sid}", sid);

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
            from_candid(_) : ?ApiV2010AccountIncomingPhoneNumber.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountIncomingPhoneNumber.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountIncomingPhoneNumber");
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

    /// Retrieve a list of incoming-phone-numbers belonging to the account used to make the request.
    /// Retrieve a list of incoming-phone-numbers belonging to the account used to make the request.
    public func listIncomingPhoneNumber(config : Config, accountSid : Text, beta : Bool, friendlyName : Text, phoneNumber : Text, origin : Text, pageSize : Nat, page : Nat, pageToken : Text) : async* ListIncomingPhoneNumberResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers.json"
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
            from_candid(_) : ?ListIncomingPhoneNumberResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListIncomingPhoneNumberResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListIncomingPhoneNumberResponse");
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

    /// Update an incoming-phone-number instance.
    /// Update an incoming-phone-number instance.
    public func updateIncomingPhoneNumber(config : Config, accountSid : Text, sid : Text, accountSid2 : Text, apiVersion : Text, friendlyName : Text, smsApplicationSid : Text, smsFallbackMethod : UpdateIncomingPhoneNumberRequestSmsFallbackMethod, smsFallbackUrl : Text, smsMethod : UpdateIncomingPhoneNumberRequestSmsMethod, smsUrl : Text, statusCallback : Text, statusCallbackMethod : UpdateIncomingPhoneNumberRequestStatusCallbackMethod, voiceApplicationSid : Text, voiceCallerIdLookup : Bool, voiceFallbackMethod : UpdateIncomingPhoneNumberRequestVoiceFallbackMethod, voiceFallbackUrl : Text, voiceMethod : UpdateIncomingPhoneNumberRequestVoiceMethod, voiceUrl : Text, emergencyStatus : IncomingPhoneNumberEnumEmergencyStatus, emergencyAddressSid : Text, trunkSid : Text, voiceReceiveMode : IncomingPhoneNumberEnumVoiceReceiveMode, identitySid : Text, addressSid : Text, bundleSid : Text) : async* ApiV2010AccountIncomingPhoneNumber {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{Sid}.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{Sid}", sid);

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
            from_candid(_) : ?ApiV2010AccountIncomingPhoneNumber.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountIncomingPhoneNumber.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountIncomingPhoneNumber");
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
        createIncomingPhoneNumber;
        deleteIncomingPhoneNumber;
        fetchIncomingPhoneNumber;
        listIncomingPhoneNumber;
        updateIncomingPhoneNumber;
    };

    public module class Api20100401IncomingPhoneNumberApi(config : Config) {
        /// Purchase a phone-number for the account.
        /// Purchase a phone-number for the account.
        public func createIncomingPhoneNumber(accountSid : Text, apiVersion : Text, friendlyName : Text, smsApplicationSid : Text, smsFallbackMethod : UpdateIncomingPhoneNumberRequestSmsFallbackMethod, smsFallbackUrl : Text, smsMethod : UpdateIncomingPhoneNumberRequestSmsMethod, smsUrl : Text, statusCallback : Text, statusCallbackMethod : UpdateIncomingPhoneNumberRequestStatusCallbackMethod, voiceApplicationSid : Text, voiceCallerIdLookup : Bool, voiceFallbackMethod : UpdateIncomingPhoneNumberRequestVoiceFallbackMethod, voiceFallbackUrl : Text, voiceMethod : UpdateIncomingPhoneNumberRequestVoiceMethod, voiceUrl : Text, emergencyStatus : IncomingPhoneNumberEnumEmergencyStatus, emergencyAddressSid : Text, trunkSid : Text, identitySid : Text, addressSid : Text, voiceReceiveMode : IncomingPhoneNumberEnumVoiceReceiveMode, bundleSid : Text, phoneNumber : Text, areaCode : Text) : async ApiV2010AccountIncomingPhoneNumber {
            await* operations__.createIncomingPhoneNumber(config, accountSid, apiVersion, friendlyName, smsApplicationSid, smsFallbackMethod, smsFallbackUrl, smsMethod, smsUrl, statusCallback, statusCallbackMethod, voiceApplicationSid, voiceCallerIdLookup, voiceFallbackMethod, voiceFallbackUrl, voiceMethod, voiceUrl, emergencyStatus, emergencyAddressSid, trunkSid, identitySid, addressSid, voiceReceiveMode, bundleSid, phoneNumber, areaCode)
        };

        /// Delete a phone-numbers belonging to the account used to make the request.
        /// Delete a phone-numbers belonging to the account used to make the request.
        public func deleteIncomingPhoneNumber(accountSid : Text, sid : Text) : async () {
            await* operations__.deleteIncomingPhoneNumber(config, accountSid, sid)
        };

        /// Fetch an incoming-phone-number belonging to the account used to make the request.
        /// Fetch an incoming-phone-number belonging to the account used to make the request.
        public func fetchIncomingPhoneNumber(accountSid : Text, sid : Text) : async ApiV2010AccountIncomingPhoneNumber {
            await* operations__.fetchIncomingPhoneNumber(config, accountSid, sid)
        };

        /// Retrieve a list of incoming-phone-numbers belonging to the account used to make the request.
        /// Retrieve a list of incoming-phone-numbers belonging to the account used to make the request.
        public func listIncomingPhoneNumber(accountSid : Text, beta : Bool, friendlyName : Text, phoneNumber : Text, origin : Text, pageSize : Nat, page : Nat, pageToken : Text) : async ListIncomingPhoneNumberResponse {
            await* operations__.listIncomingPhoneNumber(config, accountSid, beta, friendlyName, phoneNumber, origin, pageSize, page, pageToken)
        };

        /// Update an incoming-phone-number instance.
        /// Update an incoming-phone-number instance.
        public func updateIncomingPhoneNumber(accountSid : Text, sid : Text, accountSid2 : Text, apiVersion : Text, friendlyName : Text, smsApplicationSid : Text, smsFallbackMethod : UpdateIncomingPhoneNumberRequestSmsFallbackMethod, smsFallbackUrl : Text, smsMethod : UpdateIncomingPhoneNumberRequestSmsMethod, smsUrl : Text, statusCallback : Text, statusCallbackMethod : UpdateIncomingPhoneNumberRequestStatusCallbackMethod, voiceApplicationSid : Text, voiceCallerIdLookup : Bool, voiceFallbackMethod : UpdateIncomingPhoneNumberRequestVoiceFallbackMethod, voiceFallbackUrl : Text, voiceMethod : UpdateIncomingPhoneNumberRequestVoiceMethod, voiceUrl : Text, emergencyStatus : IncomingPhoneNumberEnumEmergencyStatus, emergencyAddressSid : Text, trunkSid : Text, voiceReceiveMode : IncomingPhoneNumberEnumVoiceReceiveMode, identitySid : Text, addressSid : Text, bundleSid : Text) : async ApiV2010AccountIncomingPhoneNumber {
            await* operations__.updateIncomingPhoneNumber(config, accountSid, sid, accountSid2, apiVersion, friendlyName, smsApplicationSid, smsFallbackMethod, smsFallbackUrl, smsMethod, smsUrl, statusCallback, statusCallbackMethod, voiceApplicationSid, voiceCallerIdLookup, voiceFallbackMethod, voiceFallbackUrl, voiceMethod, voiceUrl, emergencyStatus, emergencyAddressSid, trunkSid, voiceReceiveMode, identitySid, addressSid, bundleSid)
        };

    }
}
