// Api20100401SipIpAddressApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ApiV2010AccountSipSipIpAccessControlListSipIpAddress; JSON = ApiV2010AccountSipSipIpAccessControlListSipIpAddress } "../Models/ApiV2010AccountSipSipIpAccessControlListSipIpAddress";
import { type ListSipIpAddressResponse; JSON = ListSipIpAddressResponse } "../Models/ListSipIpAddressResponse";
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


    /// Create a new IpAddress resource.
    /// Create a new IpAddress resource.
    public func createSipIpAddress(config : Config, accountSid : Text, ipAccessControlListSid : Text, friendlyName : Text, ipAddress : Text, cidrPrefixLength : Int) : async* ApiV2010AccountSipSipIpAccessControlListSipIpAddress {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{IpAccessControlListSid}", ipAccessControlListSid);

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
            from_candid(_) : ?ApiV2010AccountSipSipIpAccessControlListSipIpAddress.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountSipSipIpAccessControlListSipIpAddress.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountSipSipIpAccessControlListSipIpAddress");
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

    /// Delete an IpAddress resource.
    /// Delete an IpAddress resource.
    public func deleteSipIpAddress(config : Config, accountSid : Text, ipAccessControlListSid : Text, sid : Text) : async* () {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses/{Sid}.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{IpAccessControlListSid}", ipAccessControlListSid)
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

    /// Read one IpAddress resource.
    /// Read one IpAddress resource.
    public func fetchSipIpAddress(config : Config, accountSid : Text, ipAccessControlListSid : Text, sid : Text) : async* ApiV2010AccountSipSipIpAccessControlListSipIpAddress {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses/{Sid}.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{IpAccessControlListSid}", ipAccessControlListSid)
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
            from_candid(_) : ?ApiV2010AccountSipSipIpAccessControlListSipIpAddress.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountSipSipIpAccessControlListSipIpAddress.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountSipSipIpAccessControlListSipIpAddress");
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

    /// Read multiple IpAddress resources.
    /// Read multiple IpAddress resources.
    public func listSipIpAddress(config : Config, accountSid : Text, ipAccessControlListSid : Text, pageSize : Nat, page : Nat, pageToken : Text) : async* ListSipIpAddressResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{IpAccessControlListSid}", ipAccessControlListSid)
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
            from_candid(_) : ?ListSipIpAddressResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListSipIpAddressResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListSipIpAddressResponse");
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

    /// Update an IpAddress resource.
    /// Update an IpAddress resource.
    public func updateSipIpAddress(config : Config, accountSid : Text, ipAccessControlListSid : Text, sid : Text, ipAddress : Text, friendlyName : Text, cidrPrefixLength : Int) : async* ApiV2010AccountSipSipIpAccessControlListSipIpAddress {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/SIP/IpAccessControlLists/{IpAccessControlListSid}/IpAddresses/{Sid}.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{IpAccessControlListSid}", ipAccessControlListSid)
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
            from_candid(_) : ?ApiV2010AccountSipSipIpAccessControlListSipIpAddress.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountSipSipIpAccessControlListSipIpAddress.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountSipSipIpAccessControlListSipIpAddress");
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
        createSipIpAddress;
        deleteSipIpAddress;
        fetchSipIpAddress;
        listSipIpAddress;
        updateSipIpAddress;
    };

    public module class Api20100401SipIpAddressApi(config : Config) {
        /// Create a new IpAddress resource.
        /// Create a new IpAddress resource.
        public func createSipIpAddress(accountSid : Text, ipAccessControlListSid : Text, friendlyName : Text, ipAddress : Text, cidrPrefixLength : Int) : async ApiV2010AccountSipSipIpAccessControlListSipIpAddress {
            await* operations__.createSipIpAddress(config, accountSid, ipAccessControlListSid, friendlyName, ipAddress, cidrPrefixLength)
        };

        /// Delete an IpAddress resource.
        /// Delete an IpAddress resource.
        public func deleteSipIpAddress(accountSid : Text, ipAccessControlListSid : Text, sid : Text) : async () {
            await* operations__.deleteSipIpAddress(config, accountSid, ipAccessControlListSid, sid)
        };

        /// Read one IpAddress resource.
        /// Read one IpAddress resource.
        public func fetchSipIpAddress(accountSid : Text, ipAccessControlListSid : Text, sid : Text) : async ApiV2010AccountSipSipIpAccessControlListSipIpAddress {
            await* operations__.fetchSipIpAddress(config, accountSid, ipAccessControlListSid, sid)
        };

        /// Read multiple IpAddress resources.
        /// Read multiple IpAddress resources.
        public func listSipIpAddress(accountSid : Text, ipAccessControlListSid : Text, pageSize : Nat, page : Nat, pageToken : Text) : async ListSipIpAddressResponse {
            await* operations__.listSipIpAddress(config, accountSid, ipAccessControlListSid, pageSize, page, pageToken)
        };

        /// Update an IpAddress resource.
        /// Update an IpAddress resource.
        public func updateSipIpAddress(accountSid : Text, ipAccessControlListSid : Text, sid : Text, ipAddress : Text, friendlyName : Text, cidrPrefixLength : Int) : async ApiV2010AccountSipSipIpAccessControlListSipIpAddress {
            await* operations__.updateSipIpAddress(config, accountSid, ipAccessControlListSid, sid, ipAddress, friendlyName, cidrPrefixLength)
        };

    }
}
