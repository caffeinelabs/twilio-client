// MessagingV1UsAppToPersonApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ListUsAppToPersonResponse; JSON = ListUsAppToPersonResponse } "../Models/ListUsAppToPersonResponse";
import { type MessagingV1ServiceUsAppToPersonResponse; JSON = MessagingV1ServiceUsAppToPersonResponse } "../Models/MessagingV1ServiceUsAppToPersonResponse";
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
    public func createUsAppToPerson(config : Config, messagingServiceSid : Text, brandRegistrationSid : Text, description : Text, messageFlow : Text, messageSamples : [Text], usAppToPersonUsecase : Text, hasEmbeddedLinks : Bool, hasEmbeddedPhone : Bool, xTwilioApiVersion : Text, optInMessage : Text, optOutMessage : Text, helpMessage : Text, optInKeywords : [Text], optOutKeywords : [Text], helpKeywords : [Text], subscriberOptIn : Bool, ageGated : Bool, directLending : Bool, privacyPolicyUrl : Text, termsAndConditionsUrl : Text) : async* MessagingV1ServiceUsAppToPersonResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Services/{MessagingServiceSid}/Compliance/Usa2p"
            |> Text.replace(_, #text "{MessagingServiceSid}", messagingServiceSid);

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" },
            { name = "X-Twilio-Api-Version"; value = xTwilioApiVersion }
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
            from_candid(_) : ?MessagingV1ServiceUsAppToPersonResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (MessagingV1ServiceUsAppToPersonResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to MessagingV1ServiceUsAppToPersonResponse");
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
    public func deleteUsAppToPerson(config : Config, messagingServiceSid : Text, sid : Text) : async* () {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Services/{MessagingServiceSid}/Compliance/Usa2p/{Sid}"
            |> Text.replace(_, #text "{MessagingServiceSid}", messagingServiceSid)
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

    /// 
    /// 
    public func fetchUsAppToPerson(config : Config, messagingServiceSid : Text, sid : Text, xTwilioApiVersion : Text) : async* MessagingV1ServiceUsAppToPersonResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Services/{MessagingServiceSid}/Compliance/Usa2p/{Sid}"
            |> Text.replace(_, #text "{MessagingServiceSid}", messagingServiceSid)
            |> Text.replace(_, #text "{Sid}", sid);

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" },
            { name = "X-Twilio-Api-Version"; value = xTwilioApiVersion }
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
            from_candid(_) : ?MessagingV1ServiceUsAppToPersonResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (MessagingV1ServiceUsAppToPersonResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to MessagingV1ServiceUsAppToPersonResponse");
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
    public func listUsAppToPerson(config : Config, messagingServiceSid : Text, pageSize : Nat, page : Nat, pageToken : Text, xTwilioApiVersion : Text) : async* ListUsAppToPersonResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Services/{MessagingServiceSid}/Compliance/Usa2p"
            |> Text.replace(_, #text "{MessagingServiceSid}", messagingServiceSid)
            # "?" # "PageSize=" # debug_show(pageSize) # "&" # "Page=" # Int.toText(page) # "&" # "PageToken=" # pageToken;

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" },
            { name = "X-Twilio-Api-Version"; value = xTwilioApiVersion }
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
            from_candid(_) : ?ListUsAppToPersonResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListUsAppToPersonResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListUsAppToPersonResponse");
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
    public func updateUsAppToPerson(config : Config, messagingServiceSid : Text, sid : Text, hasEmbeddedLinks : Bool, hasEmbeddedPhone : Bool, messageSamples : [Text], messageFlow : Text, description : Text, ageGated : Bool, directLending : Bool, xTwilioApiVersion : Text, privacyPolicyUrl : Text, termsAndConditionsUrl : Text) : async* MessagingV1ServiceUsAppToPersonResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Services/{MessagingServiceSid}/Compliance/Usa2p/{Sid}"
            |> Text.replace(_, #text "{MessagingServiceSid}", messagingServiceSid)
            |> Text.replace(_, #text "{Sid}", sid);

        // Add API key as query parameter if using apiKey auth
        let url = switch (config.auth) {
            case _ baseUrl__;
        };

        let baseHeaders = [
            { name = "Content-Type"; value = "application/json; charset=utf-8" },
            { name = "X-Twilio-Api-Version"; value = xTwilioApiVersion }
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
            from_candid(_) : ?MessagingV1ServiceUsAppToPersonResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (MessagingV1ServiceUsAppToPersonResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to MessagingV1ServiceUsAppToPersonResponse");
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
        createUsAppToPerson;
        deleteUsAppToPerson;
        fetchUsAppToPerson;
        listUsAppToPerson;
        updateUsAppToPerson;
    };

    public module class MessagingV1UsAppToPersonApi(config : Config) {
        /// 
        /// 
        public func createUsAppToPerson(messagingServiceSid : Text, brandRegistrationSid : Text, description : Text, messageFlow : Text, messageSamples : [Text], usAppToPersonUsecase : Text, hasEmbeddedLinks : Bool, hasEmbeddedPhone : Bool, xTwilioApiVersion : Text, optInMessage : Text, optOutMessage : Text, helpMessage : Text, optInKeywords : [Text], optOutKeywords : [Text], helpKeywords : [Text], subscriberOptIn : Bool, ageGated : Bool, directLending : Bool, privacyPolicyUrl : Text, termsAndConditionsUrl : Text) : async MessagingV1ServiceUsAppToPersonResponse {
            await* operations__.createUsAppToPerson(config, messagingServiceSid, brandRegistrationSid, description, messageFlow, messageSamples, usAppToPersonUsecase, hasEmbeddedLinks, hasEmbeddedPhone, xTwilioApiVersion, optInMessage, optOutMessage, helpMessage, optInKeywords, optOutKeywords, helpKeywords, subscriberOptIn, ageGated, directLending, privacyPolicyUrl, termsAndConditionsUrl)
        };

        /// 
        /// 
        public func deleteUsAppToPerson(messagingServiceSid : Text, sid : Text) : async () {
            await* operations__.deleteUsAppToPerson(config, messagingServiceSid, sid)
        };

        /// 
        /// 
        public func fetchUsAppToPerson(messagingServiceSid : Text, sid : Text, xTwilioApiVersion : Text) : async MessagingV1ServiceUsAppToPersonResponse {
            await* operations__.fetchUsAppToPerson(config, messagingServiceSid, sid, xTwilioApiVersion)
        };

        /// 
        /// 
        public func listUsAppToPerson(messagingServiceSid : Text, pageSize : Nat, page : Nat, pageToken : Text, xTwilioApiVersion : Text) : async ListUsAppToPersonResponse {
            await* operations__.listUsAppToPerson(config, messagingServiceSid, pageSize, page, pageToken, xTwilioApiVersion)
        };

        /// 
        /// 
        public func updateUsAppToPerson(messagingServiceSid : Text, sid : Text, hasEmbeddedLinks : Bool, hasEmbeddedPhone : Bool, messageSamples : [Text], messageFlow : Text, description : Text, ageGated : Bool, directLending : Bool, xTwilioApiVersion : Text, privacyPolicyUrl : Text, termsAndConditionsUrl : Text) : async MessagingV1ServiceUsAppToPersonResponse {
            await* operations__.updateUsAppToPerson(config, messagingServiceSid, sid, hasEmbeddedLinks, hasEmbeddedPhone, messageSamples, messageFlow, description, ageGated, directLending, xTwilioApiVersion, privacyPolicyUrl, termsAndConditionsUrl)
        };

    }
}
