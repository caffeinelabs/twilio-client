// Api20100401DomainApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ApiV2010AccountSipSipDomain; JSON = ApiV2010AccountSipSipDomain } "../Models/ApiV2010AccountSipSipDomain";
import { type CreateApplicationRequestVoiceFallbackMethod; JSON = CreateApplicationRequestVoiceFallbackMethod } "../Models/CreateApplicationRequestVoiceFallbackMethod";
import { type CreateApplicationRequestVoiceMethod; JSON = CreateApplicationRequestVoiceMethod } "../Models/CreateApplicationRequestVoiceMethod";
import { type CreateSipDomainRequestVoiceStatusCallbackMethod; JSON = CreateSipDomainRequestVoiceStatusCallbackMethod } "../Models/CreateSipDomainRequestVoiceStatusCallbackMethod";
import { type ListSipDomainResponse; JSON = ListSipDomainResponse } "../Models/ListSipDomainResponse";
import { type UpdateSipDomainRequestVoiceMethod; JSON = UpdateSipDomainRequestVoiceMethod } "../Models/UpdateSipDomainRequestVoiceMethod";
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


    /// Create a new Domain
    /// Create a new Domain
    public func createSipDomain(config : Config, accountSid : Text, domainName : Text, friendlyName : Text, voiceUrl : Text, voiceMethod : CreateApplicationRequestVoiceMethod, voiceFallbackUrl : Text, voiceFallbackMethod : CreateApplicationRequestVoiceFallbackMethod, voiceStatusCallbackUrl : Text, voiceStatusCallbackMethod : CreateSipDomainRequestVoiceStatusCallbackMethod, sipRegistration : Bool, emergencyCallingEnabled : Bool, secure : Bool, byocTrunkSid : Text, emergencyCallerSid : Text) : async* ApiV2010AccountSipSipDomain {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/SIP/Domains.json"
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
            from_candid(_) : ?ApiV2010AccountSipSipDomain.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountSipSipDomain.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountSipSipDomain");
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

    /// Delete an instance of a Domain
    /// Delete an instance of a Domain
    public func deleteSipDomain(config : Config, accountSid : Text, sid : Text) : async* () {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/SIP/Domains/{Sid}.json"
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

    /// Fetch an instance of a Domain
    /// Fetch an instance of a Domain
    public func fetchSipDomain(config : Config, accountSid : Text, sid : Text) : async* ApiV2010AccountSipSipDomain {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/SIP/Domains/{Sid}.json"
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
            from_candid(_) : ?ApiV2010AccountSipSipDomain.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountSipSipDomain.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountSipSipDomain");
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

    /// Retrieve a list of domains belonging to the account used to make the request
    /// Retrieve a list of domains belonging to the account used to make the request
    public func listSipDomain(config : Config, accountSid : Text, pageSize : Nat, page : Nat, pageToken : Text) : async* ListSipDomainResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/SIP/Domains.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            # "?" # "PageSize=" # debug_show(pageSize) # "&" # "Page=" # Int.toText(page) # "&" # "PageToken=" # pageToken;

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
            from_candid(_) : ?ListSipDomainResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListSipDomainResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListSipDomainResponse");
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

    /// Update the attributes of a domain
    /// Update the attributes of a domain
    public func updateSipDomain(config : Config, accountSid : Text, sid : Text, friendlyName : Text, voiceFallbackMethod : CreateApplicationRequestVoiceFallbackMethod, voiceFallbackUrl : Text, voiceMethod : UpdateSipDomainRequestVoiceMethod, voiceStatusCallbackMethod : CreateSipDomainRequestVoiceStatusCallbackMethod, voiceStatusCallbackUrl : Text, voiceUrl : Text, sipRegistration : Bool, domainName : Text, emergencyCallingEnabled : Bool, secure : Bool, byocTrunkSid : Text, emergencyCallerSid : Text) : async* ApiV2010AccountSipSipDomain {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/SIP/Domains/{Sid}.json"
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
            from_candid(_) : ?ApiV2010AccountSipSipDomain.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountSipSipDomain.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountSipSipDomain");
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
        createSipDomain;
        deleteSipDomain;
        fetchSipDomain;
        listSipDomain;
        updateSipDomain;
    };

    public module class Api20100401DomainApi(config : Config) {
        /// Create a new Domain
        /// Create a new Domain
        public func createSipDomain(accountSid : Text, domainName : Text, friendlyName : Text, voiceUrl : Text, voiceMethod : CreateApplicationRequestVoiceMethod, voiceFallbackUrl : Text, voiceFallbackMethod : CreateApplicationRequestVoiceFallbackMethod, voiceStatusCallbackUrl : Text, voiceStatusCallbackMethod : CreateSipDomainRequestVoiceStatusCallbackMethod, sipRegistration : Bool, emergencyCallingEnabled : Bool, secure : Bool, byocTrunkSid : Text, emergencyCallerSid : Text) : async ApiV2010AccountSipSipDomain {
            await* operations__.createSipDomain(config, accountSid, domainName, friendlyName, voiceUrl, voiceMethod, voiceFallbackUrl, voiceFallbackMethod, voiceStatusCallbackUrl, voiceStatusCallbackMethod, sipRegistration, emergencyCallingEnabled, secure, byocTrunkSid, emergencyCallerSid)
        };

        /// Delete an instance of a Domain
        /// Delete an instance of a Domain
        public func deleteSipDomain(accountSid : Text, sid : Text) : async () {
            await* operations__.deleteSipDomain(config, accountSid, sid)
        };

        /// Fetch an instance of a Domain
        /// Fetch an instance of a Domain
        public func fetchSipDomain(accountSid : Text, sid : Text) : async ApiV2010AccountSipSipDomain {
            await* operations__.fetchSipDomain(config, accountSid, sid)
        };

        /// Retrieve a list of domains belonging to the account used to make the request
        /// Retrieve a list of domains belonging to the account used to make the request
        public func listSipDomain(accountSid : Text, pageSize : Nat, page : Nat, pageToken : Text) : async ListSipDomainResponse {
            await* operations__.listSipDomain(config, accountSid, pageSize, page, pageToken)
        };

        /// Update the attributes of a domain
        /// Update the attributes of a domain
        public func updateSipDomain(accountSid : Text, sid : Text, friendlyName : Text, voiceFallbackMethod : CreateApplicationRequestVoiceFallbackMethod, voiceFallbackUrl : Text, voiceMethod : UpdateSipDomainRequestVoiceMethod, voiceStatusCallbackMethod : CreateSipDomainRequestVoiceStatusCallbackMethod, voiceStatusCallbackUrl : Text, voiceUrl : Text, sipRegistration : Bool, domainName : Text, emergencyCallingEnabled : Bool, secure : Bool, byocTrunkSid : Text, emergencyCallerSid : Text) : async ApiV2010AccountSipSipDomain {
            await* operations__.updateSipDomain(config, accountSid, sid, friendlyName, voiceFallbackMethod, voiceFallbackUrl, voiceMethod, voiceStatusCallbackMethod, voiceStatusCallbackUrl, voiceUrl, sipRegistration, domainName, emergencyCallingEnabled, secure, byocTrunkSid, emergencyCallerSid)
        };

    }
}
