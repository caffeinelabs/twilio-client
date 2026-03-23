// Api20100401MessageApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ApiV2010AccountMessage; JSON = ApiV2010AccountMessage } "../Models/ApiV2010AccountMessage";
import { type ListMessageResponse; JSON = ListMessageResponse } "../Models/ListMessageResponse";
import { type MessageEnumAddressRetention; JSON = MessageEnumAddressRetention } "../Models/MessageEnumAddressRetention";
import { type MessageEnumContentRetention; JSON = MessageEnumContentRetention } "../Models/MessageEnumContentRetention";
import { type MessageEnumRiskCheck; JSON = MessageEnumRiskCheck } "../Models/MessageEnumRiskCheck";
import { type MessageEnumScheduleType; JSON = MessageEnumScheduleType } "../Models/MessageEnumScheduleType";
import { type MessageEnumTrafficType; JSON = MessageEnumTrafficType } "../Models/MessageEnumTrafficType";
import { type MessageEnumUpdateStatus; JSON = MessageEnumUpdateStatus } "../Models/MessageEnumUpdateStatus";
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


    /// Send a message
    /// Send a message
    public func createMessage(config : Config, accountSid : Text, to : Text, statusCallback : Text, applicationSid : Text, maxPrice : Float, provideFeedback : Bool, attempt : Int, validityPeriod : Int, forceDelivery : Bool, contentRetention : MessageEnumContentRetention, addressRetention : MessageEnumAddressRetention, smartEncoded : Bool, persistentAction : [Text], trafficType : MessageEnumTrafficType, shortenUrls : Bool, scheduleType : MessageEnumScheduleType, sendAt : Text, sendAsMms : Bool, contentVariables : Text, riskCheck : MessageEnumRiskCheck, from : Text, messagingServiceSid : Text, body : Text, mediaUrl : [Text], contentSid : Text) : async* ApiV2010AccountMessage {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Messages.json"
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
            from_candid(_) : ?ApiV2010AccountMessage.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountMessage.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountMessage");
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

    /// Deletes a Message resource from your account
    /// Deletes a Message resource from your account
    public func deleteMessage(config : Config, accountSid : Text, sid : Text) : async* () {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Messages/{Sid}.json"
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

    /// Fetch a specific Message
    /// Fetch a specific Message
    public func fetchMessage(config : Config, accountSid : Text, sid : Text) : async* ApiV2010AccountMessage {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Messages/{Sid}.json"
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
            from_candid(_) : ?ApiV2010AccountMessage.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountMessage.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountMessage");
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

    /// Retrieve a list of Message resources associated with a Twilio Account
    /// Retrieve a list of Message resources associated with a Twilio Account
    public func listMessage(config : Config, accountSid : Text, to : Text, from : Text, dateSent : Text, dateSentLess_Than : Text, dateSentGreater_Than : Text, pageSize : Nat, page : Nat, pageToken : Text) : async* ListMessageResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Messages.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            # "?" # "To=" # to # "&" # "From=" # from # "&" # "DateSent=" # debug_show(dateSent) # "&" # "DateSent&lt;=" # debug_show(dateSentLess_Than) # "&" # "DateSent&gt;=" # debug_show(dateSentGreater_Than) # "&" # "PageSize=" # debug_show(pageSize) # "&" # "Page=" # Int.toText(page) # "&" # "PageToken=" # pageToken;

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
            from_candid(_) : ?ListMessageResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListMessageResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListMessageResponse");
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

    /// Update a Message resource (used to redact Message `body` text and to cancel not-yet-sent messages)
    /// Update a Message resource (used to redact Message `body` text and to cancel not-yet-sent messages)
    public func updateMessage(config : Config, accountSid : Text, sid : Text, body : Text, status : MessageEnumUpdateStatus) : async* ApiV2010AccountMessage {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Messages/{Sid}.json"
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
            from_candid(_) : ?ApiV2010AccountMessage.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountMessage.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountMessage");
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
        createMessage;
        deleteMessage;
        fetchMessage;
        listMessage;
        updateMessage;
    };

    public module class Api20100401MessageApi(config : Config) {
        /// Send a message
        /// Send a message
        public func createMessage(accountSid : Text, to : Text, statusCallback : Text, applicationSid : Text, maxPrice : Float, provideFeedback : Bool, attempt : Int, validityPeriod : Int, forceDelivery : Bool, contentRetention : MessageEnumContentRetention, addressRetention : MessageEnumAddressRetention, smartEncoded : Bool, persistentAction : [Text], trafficType : MessageEnumTrafficType, shortenUrls : Bool, scheduleType : MessageEnumScheduleType, sendAt : Text, sendAsMms : Bool, contentVariables : Text, riskCheck : MessageEnumRiskCheck, from : Text, messagingServiceSid : Text, body : Text, mediaUrl : [Text], contentSid : Text) : async ApiV2010AccountMessage {
            await* operations__.createMessage(config, accountSid, to, statusCallback, applicationSid, maxPrice, provideFeedback, attempt, validityPeriod, forceDelivery, contentRetention, addressRetention, smartEncoded, persistentAction, trafficType, shortenUrls, scheduleType, sendAt, sendAsMms, contentVariables, riskCheck, from, messagingServiceSid, body, mediaUrl, contentSid)
        };

        /// Deletes a Message resource from your account
        /// Deletes a Message resource from your account
        public func deleteMessage(accountSid : Text, sid : Text) : async () {
            await* operations__.deleteMessage(config, accountSid, sid)
        };

        /// Fetch a specific Message
        /// Fetch a specific Message
        public func fetchMessage(accountSid : Text, sid : Text) : async ApiV2010AccountMessage {
            await* operations__.fetchMessage(config, accountSid, sid)
        };

        /// Retrieve a list of Message resources associated with a Twilio Account
        /// Retrieve a list of Message resources associated with a Twilio Account
        public func listMessage(accountSid : Text, to : Text, from : Text, dateSent : Text, dateSentLess_Than : Text, dateSentGreater_Than : Text, pageSize : Nat, page : Nat, pageToken : Text) : async ListMessageResponse {
            await* operations__.listMessage(config, accountSid, to, from, dateSent, dateSentLess_Than, dateSentGreater_Than, pageSize, page, pageToken)
        };

        /// Update a Message resource (used to redact Message `body` text and to cancel not-yet-sent messages)
        /// Update a Message resource (used to redact Message `body` text and to cancel not-yet-sent messages)
        public func updateMessage(accountSid : Text, sid : Text, body : Text, status : MessageEnumUpdateStatus) : async ApiV2010AccountMessage {
            await* operations__.updateMessage(config, accountSid, sid, body, status)
        };

    }
}
