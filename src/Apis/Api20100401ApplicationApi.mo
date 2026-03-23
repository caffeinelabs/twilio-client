// Api20100401ApplicationApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ApiV2010AccountApplication; JSON = ApiV2010AccountApplication } "../Models/ApiV2010AccountApplication";
import { type CreateApplicationRequestSmsFallbackMethod; JSON = CreateApplicationRequestSmsFallbackMethod } "../Models/CreateApplicationRequestSmsFallbackMethod";
import { type CreateApplicationRequestSmsMethod; JSON = CreateApplicationRequestSmsMethod } "../Models/CreateApplicationRequestSmsMethod";
import { type CreateApplicationRequestStatusCallbackMethod; JSON = CreateApplicationRequestStatusCallbackMethod } "../Models/CreateApplicationRequestStatusCallbackMethod";
import { type CreateApplicationRequestVoiceFallbackMethod; JSON = CreateApplicationRequestVoiceFallbackMethod } "../Models/CreateApplicationRequestVoiceFallbackMethod";
import { type CreateApplicationRequestVoiceMethod; JSON = CreateApplicationRequestVoiceMethod } "../Models/CreateApplicationRequestVoiceMethod";
import { type ListApplicationResponse; JSON = ListApplicationResponse } "../Models/ListApplicationResponse";
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


    /// Create a new application within your account
    /// Create a new application within your account
    public func createApplication(config : Config, accountSid : Text, apiVersion : Text, voiceUrl : Text, voiceMethod : CreateApplicationRequestVoiceMethod, voiceFallbackUrl : Text, voiceFallbackMethod : CreateApplicationRequestVoiceFallbackMethod, statusCallback : Text, statusCallbackMethod : CreateApplicationRequestStatusCallbackMethod, voiceCallerIdLookup : Bool, smsUrl : Text, smsMethod : CreateApplicationRequestSmsMethod, smsFallbackUrl : Text, smsFallbackMethod : CreateApplicationRequestSmsFallbackMethod, smsStatusCallback : Text, messageStatusCallback : Text, friendlyName : Text, publicApplicationConnectEnabled : Bool) : async* ApiV2010AccountApplication {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Applications.json"
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
            from_candid(_) : ?ApiV2010AccountApplication.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountApplication.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountApplication");
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

    /// Delete the application by the specified application sid
    /// Delete the application by the specified application sid
    public func deleteApplication(config : Config, accountSid : Text, sid : Text) : async* () {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Applications/{Sid}.json"
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

    /// Fetch the application specified by the provided sid
    /// Fetch the application specified by the provided sid
    public func fetchApplication(config : Config, accountSid : Text, sid : Text) : async* ApiV2010AccountApplication {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Applications/{Sid}.json"
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
            from_candid(_) : ?ApiV2010AccountApplication.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountApplication.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountApplication");
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

    /// Retrieve a list of applications representing an application within the requesting account
    /// Retrieve a list of applications representing an application within the requesting account
    public func listApplication(config : Config, accountSid : Text, friendlyName : Text, pageSize : Nat, page : Nat, pageToken : Text) : async* ListApplicationResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Applications.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            # "?" # "FriendlyName=" # friendlyName # "&" # "PageSize=" # debug_show(pageSize) # "&" # "Page=" # Int.toText(page) # "&" # "PageToken=" # pageToken;

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
            from_candid(_) : ?ListApplicationResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListApplicationResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListApplicationResponse");
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

    /// Updates the application's properties
    /// Updates the application's properties
    public func updateApplication(config : Config, accountSid : Text, sid : Text, friendlyName : Text, apiVersion : Text, voiceUrl : Text, voiceMethod : CreateApplicationRequestVoiceMethod, voiceFallbackUrl : Text, voiceFallbackMethod : CreateApplicationRequestVoiceFallbackMethod, statusCallback : Text, statusCallbackMethod : CreateApplicationRequestStatusCallbackMethod, voiceCallerIdLookup : Bool, smsUrl : Text, smsMethod : CreateApplicationRequestSmsMethod, smsFallbackUrl : Text, smsFallbackMethod : CreateApplicationRequestSmsFallbackMethod, smsStatusCallback : Text, messageStatusCallback : Text, publicApplicationConnectEnabled : Bool) : async* ApiV2010AccountApplication {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Applications/{Sid}.json"
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
            from_candid(_) : ?ApiV2010AccountApplication.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountApplication.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountApplication");
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
        createApplication;
        deleteApplication;
        fetchApplication;
        listApplication;
        updateApplication;
    };

    public module class Api20100401ApplicationApi(config : Config) {
        /// Create a new application within your account
        /// Create a new application within your account
        public func createApplication(accountSid : Text, apiVersion : Text, voiceUrl : Text, voiceMethod : CreateApplicationRequestVoiceMethod, voiceFallbackUrl : Text, voiceFallbackMethod : CreateApplicationRequestVoiceFallbackMethod, statusCallback : Text, statusCallbackMethod : CreateApplicationRequestStatusCallbackMethod, voiceCallerIdLookup : Bool, smsUrl : Text, smsMethod : CreateApplicationRequestSmsMethod, smsFallbackUrl : Text, smsFallbackMethod : CreateApplicationRequestSmsFallbackMethod, smsStatusCallback : Text, messageStatusCallback : Text, friendlyName : Text, publicApplicationConnectEnabled : Bool) : async ApiV2010AccountApplication {
            await* operations__.createApplication(config, accountSid, apiVersion, voiceUrl, voiceMethod, voiceFallbackUrl, voiceFallbackMethod, statusCallback, statusCallbackMethod, voiceCallerIdLookup, smsUrl, smsMethod, smsFallbackUrl, smsFallbackMethod, smsStatusCallback, messageStatusCallback, friendlyName, publicApplicationConnectEnabled)
        };

        /// Delete the application by the specified application sid
        /// Delete the application by the specified application sid
        public func deleteApplication(accountSid : Text, sid : Text) : async () {
            await* operations__.deleteApplication(config, accountSid, sid)
        };

        /// Fetch the application specified by the provided sid
        /// Fetch the application specified by the provided sid
        public func fetchApplication(accountSid : Text, sid : Text) : async ApiV2010AccountApplication {
            await* operations__.fetchApplication(config, accountSid, sid)
        };

        /// Retrieve a list of applications representing an application within the requesting account
        /// Retrieve a list of applications representing an application within the requesting account
        public func listApplication(accountSid : Text, friendlyName : Text, pageSize : Nat, page : Nat, pageToken : Text) : async ListApplicationResponse {
            await* operations__.listApplication(config, accountSid, friendlyName, pageSize, page, pageToken)
        };

        /// Updates the application's properties
        /// Updates the application's properties
        public func updateApplication(accountSid : Text, sid : Text, friendlyName : Text, apiVersion : Text, voiceUrl : Text, voiceMethod : CreateApplicationRequestVoiceMethod, voiceFallbackUrl : Text, voiceFallbackMethod : CreateApplicationRequestVoiceFallbackMethod, statusCallback : Text, statusCallbackMethod : CreateApplicationRequestStatusCallbackMethod, voiceCallerIdLookup : Bool, smsUrl : Text, smsMethod : CreateApplicationRequestSmsMethod, smsFallbackUrl : Text, smsFallbackMethod : CreateApplicationRequestSmsFallbackMethod, smsStatusCallback : Text, messageStatusCallback : Text, publicApplicationConnectEnabled : Bool) : async ApiV2010AccountApplication {
            await* operations__.updateApplication(config, accountSid, sid, friendlyName, apiVersion, voiceUrl, voiceMethod, voiceFallbackUrl, voiceFallbackMethod, statusCallback, statusCallbackMethod, voiceCallerIdLookup, smsUrl, smsMethod, smsFallbackUrl, smsFallbackMethod, smsStatusCallback, messageStatusCallback, publicApplicationConnectEnabled)
        };

    }
}
