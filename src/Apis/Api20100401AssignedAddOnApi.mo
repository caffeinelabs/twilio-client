// Api20100401AssignedAddOnApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn; JSON = ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn } "../Models/ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn";
import { type ListIncomingPhoneNumberAssignedAddOnResponse; JSON = ListIncomingPhoneNumberAssignedAddOnResponse } "../Models/ListIncomingPhoneNumberAssignedAddOnResponse";
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


    /// Assign an Add-on installation to the Number specified.
    /// Assign an Add-on installation to the Number specified.
    public func createIncomingPhoneNumberAssignedAddOn(config : Config, accountSid : Text, resourceSid : Text, installedAddOnSid : Text) : async* ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{ResourceSid}", resourceSid);

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
            from_candid(_) : ?ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn");
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

    /// Remove the assignment of an Add-on installation from the Number specified.
    /// Remove the assignment of an Add-on installation from the Number specified.
    public func deleteIncomingPhoneNumberAssignedAddOn(config : Config, accountSid : Text, resourceSid : Text, sid : Text) : async* () {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns/{Sid}.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{ResourceSid}", resourceSid)
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

    /// Fetch an instance of an Add-on installation currently assigned to this Number.
    /// Fetch an instance of an Add-on installation currently assigned to this Number.
    public func fetchIncomingPhoneNumberAssignedAddOn(config : Config, accountSid : Text, resourceSid : Text, sid : Text) : async* ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns/{Sid}.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{ResourceSid}", resourceSid)
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
            from_candid(_) : ?ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn");
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

    /// Retrieve a list of Add-on installations currently assigned to this Number.
    /// Retrieve a list of Add-on installations currently assigned to this Number.
    public func listIncomingPhoneNumberAssignedAddOn(config : Config, accountSid : Text, resourceSid : Text, pageSize : Nat, page : Nat, pageToken : Text) : async* ListIncomingPhoneNumberAssignedAddOnResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/IncomingPhoneNumbers/{ResourceSid}/AssignedAddOns.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{ResourceSid}", resourceSid)
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
            from_candid(_) : ?ListIncomingPhoneNumberAssignedAddOnResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListIncomingPhoneNumberAssignedAddOnResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListIncomingPhoneNumberAssignedAddOnResponse");
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
        createIncomingPhoneNumberAssignedAddOn;
        deleteIncomingPhoneNumberAssignedAddOn;
        fetchIncomingPhoneNumberAssignedAddOn;
        listIncomingPhoneNumberAssignedAddOn;
    };

    public module class Api20100401AssignedAddOnApi(config : Config) {
        /// Assign an Add-on installation to the Number specified.
        /// Assign an Add-on installation to the Number specified.
        public func createIncomingPhoneNumberAssignedAddOn(accountSid : Text, resourceSid : Text, installedAddOnSid : Text) : async ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn {
            await* operations__.createIncomingPhoneNumberAssignedAddOn(config, accountSid, resourceSid, installedAddOnSid)
        };

        /// Remove the assignment of an Add-on installation from the Number specified.
        /// Remove the assignment of an Add-on installation from the Number specified.
        public func deleteIncomingPhoneNumberAssignedAddOn(accountSid : Text, resourceSid : Text, sid : Text) : async () {
            await* operations__.deleteIncomingPhoneNumberAssignedAddOn(config, accountSid, resourceSid, sid)
        };

        /// Fetch an instance of an Add-on installation currently assigned to this Number.
        /// Fetch an instance of an Add-on installation currently assigned to this Number.
        public func fetchIncomingPhoneNumberAssignedAddOn(accountSid : Text, resourceSid : Text, sid : Text) : async ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn {
            await* operations__.fetchIncomingPhoneNumberAssignedAddOn(config, accountSid, resourceSid, sid)
        };

        /// Retrieve a list of Add-on installations currently assigned to this Number.
        /// Retrieve a list of Add-on installations currently assigned to this Number.
        public func listIncomingPhoneNumberAssignedAddOn(accountSid : Text, resourceSid : Text, pageSize : Nat, page : Nat, pageToken : Text) : async ListIncomingPhoneNumberAssignedAddOnResponse {
            await* operations__.listIncomingPhoneNumberAssignedAddOn(config, accountSid, resourceSid, pageSize, page, pageToken)
        };

    }
}
