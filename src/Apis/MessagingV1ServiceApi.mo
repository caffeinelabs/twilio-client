// MessagingV1ServiceApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type CreateServiceRequestFallbackMethod; JSON = CreateServiceRequestFallbackMethod } "../Models/CreateServiceRequestFallbackMethod";
import { type CreateServiceRequestInboundMethod; JSON = CreateServiceRequestInboundMethod } "../Models/CreateServiceRequestInboundMethod";
import { type ListServiceResponse; JSON = ListServiceResponse } "../Models/ListServiceResponse";
import { type MessagingV1Service; JSON = MessagingV1Service } "../Models/MessagingV1Service";
import { type ServiceEnumScanMessageContent; JSON = ServiceEnumScanMessageContent } "../Models/ServiceEnumScanMessageContent";
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
    public func createService(config : Config, friendlyName : Text, inboundRequestUrl : Text, inboundMethod : CreateServiceRequestInboundMethod, fallbackUrl : Text, fallbackMethod : CreateServiceRequestFallbackMethod, statusCallback : Text, stickySender : Bool, mmsConverter : Bool, smartEncoding : Bool, scanMessageContent : ServiceEnumScanMessageContent, fallbackToLongCode : Bool, areaCodeGeomatch : Bool, validityPeriod : Int, synchronousValidation : Bool, usecase : Text, useInboundWebhookOnNumber : Bool) : async* MessagingV1Service {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Services";

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
            from_candid(_) : ?MessagingV1Service.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (MessagingV1Service.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to MessagingV1Service");
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
    public func deleteService(config : Config, sid : Text) : async* () {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Services/{Sid}"
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
    public func fetchService(config : Config, sid : Text) : async* MessagingV1Service {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Services/{Sid}"
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
            from_candid(_) : ?MessagingV1Service.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (MessagingV1Service.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to MessagingV1Service");
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
    public func listService(config : Config, pageSize : Nat, page : Nat, pageToken : Text) : async* ListServiceResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Services"
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
            from_candid(_) : ?ListServiceResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListServiceResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListServiceResponse");
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
    public func updateService(config : Config, sid : Text, friendlyName : Text, inboundRequestUrl : Text, inboundMethod : CreateServiceRequestInboundMethod, fallbackUrl : Text, fallbackMethod : CreateServiceRequestFallbackMethod, statusCallback : Text, stickySender : Bool, mmsConverter : Bool, smartEncoding : Bool, scanMessageContent : ServiceEnumScanMessageContent, fallbackToLongCode : Bool, areaCodeGeomatch : Bool, validityPeriod : Int, synchronousValidation : Bool, usecase : Text, useInboundWebhookOnNumber : Bool) : async* MessagingV1Service {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Services/{Sid}"
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
            from_candid(_) : ?MessagingV1Service.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (MessagingV1Service.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to MessagingV1Service");
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
        createService;
        deleteService;
        fetchService;
        listService;
        updateService;
    };

    public module class MessagingV1ServiceApi(config : Config) {
        /// 
        /// 
        public func createService(friendlyName : Text, inboundRequestUrl : Text, inboundMethod : CreateServiceRequestInboundMethod, fallbackUrl : Text, fallbackMethod : CreateServiceRequestFallbackMethod, statusCallback : Text, stickySender : Bool, mmsConverter : Bool, smartEncoding : Bool, scanMessageContent : ServiceEnumScanMessageContent, fallbackToLongCode : Bool, areaCodeGeomatch : Bool, validityPeriod : Int, synchronousValidation : Bool, usecase : Text, useInboundWebhookOnNumber : Bool) : async MessagingV1Service {
            await* operations__.createService(config, friendlyName, inboundRequestUrl, inboundMethod, fallbackUrl, fallbackMethod, statusCallback, stickySender, mmsConverter, smartEncoding, scanMessageContent, fallbackToLongCode, areaCodeGeomatch, validityPeriod, synchronousValidation, usecase, useInboundWebhookOnNumber)
        };

        /// 
        /// 
        public func deleteService(sid : Text) : async () {
            await* operations__.deleteService(config, sid)
        };

        /// 
        /// 
        public func fetchService(sid : Text) : async MessagingV1Service {
            await* operations__.fetchService(config, sid)
        };

        /// 
        /// 
        public func listService(pageSize : Nat, page : Nat, pageToken : Text) : async ListServiceResponse {
            await* operations__.listService(config, pageSize, page, pageToken)
        };

        /// 
        /// 
        public func updateService(sid : Text, friendlyName : Text, inboundRequestUrl : Text, inboundMethod : CreateServiceRequestInboundMethod, fallbackUrl : Text, fallbackMethod : CreateServiceRequestFallbackMethod, statusCallback : Text, stickySender : Bool, mmsConverter : Bool, smartEncoding : Bool, scanMessageContent : ServiceEnumScanMessageContent, fallbackToLongCode : Bool, areaCodeGeomatch : Bool, validityPeriod : Int, synchronousValidation : Bool, usecase : Text, useInboundWebhookOnNumber : Bool) : async MessagingV1Service {
            await* operations__.updateService(config, sid, friendlyName, inboundRequestUrl, inboundMethod, fallbackUrl, fallbackMethod, statusCallback, stickySender, mmsConverter, smartEncoding, scanMessageContent, fallbackToLongCode, areaCodeGeomatch, validityPeriod, synchronousValidation, usecase, useInboundWebhookOnNumber)
        };

    }
}
