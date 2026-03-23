// Api20100401CallApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ApiV2010AccountCall; JSON = ApiV2010AccountCall } "../Models/ApiV2010AccountCall";
import { type CallEnumStatus; JSON = CallEnumStatus } "../Models/CallEnumStatus";
import { type CallEnumUpdateStatus; JSON = CallEnumUpdateStatus } "../Models/CallEnumUpdateStatus";
import { type CreateCallRequestAsyncAmdStatusCallbackMethod; JSON = CreateCallRequestAsyncAmdStatusCallbackMethod } "../Models/CreateCallRequestAsyncAmdStatusCallbackMethod";
import { type CreateCallRequestFallbackMethod; JSON = CreateCallRequestFallbackMethod } "../Models/CreateCallRequestFallbackMethod";
import { type CreateCallRequestMethod; JSON = CreateCallRequestMethod } "../Models/CreateCallRequestMethod";
import { type CreateCallRequestRecordingStatusCallbackMethod; JSON = CreateCallRequestRecordingStatusCallbackMethod } "../Models/CreateCallRequestRecordingStatusCallbackMethod";
import { type CreateCallRequestStatusCallbackMethod; JSON = CreateCallRequestStatusCallbackMethod } "../Models/CreateCallRequestStatusCallbackMethod";
import { type ListCallResponse; JSON = ListCallResponse } "../Models/ListCallResponse";
import { type UpdateCallRequestMethod; JSON = UpdateCallRequestMethod } "../Models/UpdateCallRequestMethod";
import { type UpdateCallRequestStatusCallbackMethod; JSON = UpdateCallRequestStatusCallbackMethod } "../Models/UpdateCallRequestStatusCallbackMethod";
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


    /// Create a new outgoing call to phones, SIP-enabled endpoints or Twilio Client connections
    /// Create a new outgoing call to phones, SIP-enabled endpoints or Twilio Client connections
    public func createCall(config : Config, accountSid : Text, to : Text, from : Text, method : CreateCallRequestMethod, fallbackUrl : Text, fallbackMethod : CreateCallRequestFallbackMethod, statusCallback : Text, statusCallbackEvent : [Text], statusCallbackMethod : CreateCallRequestStatusCallbackMethod, sendDigits : Text, timeout : Int, record : Bool, recordingChannels : Text, recordingStatusCallback : Text, recordingStatusCallbackMethod : CreateCallRequestRecordingStatusCallbackMethod, sipAuthUsername : Text, sipAuthPassword : Text, machineDetection : Text, machineDetectionTimeout : Int, recordingStatusCallbackEvent : [Text], trim : Text, callerId : Text, machineDetectionSpeechThreshold : Int, machineDetectionSpeechEndThreshold : Int, machineDetectionSilenceTimeout : Int, asyncAmd : Text, asyncAmdStatusCallback : Text, asyncAmdStatusCallbackMethod : CreateCallRequestAsyncAmdStatusCallbackMethod, byoc : Text, callReason : Text, callToken : Text, recordingTrack : Text, timeLimit : Int, clientNotificationUrl : Text, url : Text, twiml : Text, applicationSid : Text) : async* ApiV2010AccountCall {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Calls.json"
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
            from_candid(_) : ?ApiV2010AccountCall.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountCall.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountCall");
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

    /// Delete a Call record from your account. Once the record is deleted, it will no longer appear in the API and Account Portal logs.
    /// Delete a Call record from your account. Once the record is deleted, it will no longer appear in the API and Account Portal logs.
    public func deleteCall(config : Config, accountSid : Text, sid : Text) : async* () {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Calls/{Sid}.json"
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

    /// Fetch the call specified by the provided Call SID
    /// Fetch the call specified by the provided Call SID
    public func fetchCall(config : Config, accountSid : Text, sid : Text) : async* ApiV2010AccountCall {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Calls/{Sid}.json"
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
            from_candid(_) : ?ApiV2010AccountCall.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountCall.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountCall");
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

    /// Retrieves a collection of calls made to and from your account
    /// Retrieves a collection of calls made to and from your account
    public func listCall(config : Config, accountSid : Text, to : Text, from : Text, parentCallSid : Text, status : CallEnumStatus, startTime : Text, startTimeLess_Than : Text, startTimeGreater_Than : Text, endTime : Text, endTimeLess_Than : Text, endTimeGreater_Than : Text, pageSize : Nat, page : Nat, pageToken : Text) : async* ListCallResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Calls.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            # "?" # "To=" # to # "&" # "From=" # from # "&" # "ParentCallSid=" # parentCallSid # "&" # "Status=" # CallEnumStatus.toJSON(status) # "&" # "StartTime=" # debug_show(startTime) # "&" # "StartTime&lt;=" # debug_show(startTimeLess_Than) # "&" # "StartTime&gt;=" # debug_show(startTimeGreater_Than) # "&" # "EndTime=" # debug_show(endTime) # "&" # "EndTime&lt;=" # debug_show(endTimeLess_Than) # "&" # "EndTime&gt;=" # debug_show(endTimeGreater_Than) # "&" # "PageSize=" # debug_show(pageSize) # "&" # "Page=" # Int.toText(page) # "&" # "PageToken=" # pageToken;

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
            from_candid(_) : ?ListCallResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListCallResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListCallResponse");
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

    /// Initiates a call redirect or terminates a call
    /// Initiates a call redirect or terminates a call
    public func updateCall(config : Config, accountSid : Text, sid : Text, url : Text, method : UpdateCallRequestMethod, status : CallEnumUpdateStatus, fallbackUrl : Text, fallbackMethod : CreateCallRequestFallbackMethod, statusCallback : Text, statusCallbackMethod : UpdateCallRequestStatusCallbackMethod, twiml : Text, timeLimit : Int) : async* ApiV2010AccountCall {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Calls/{Sid}.json"
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
            from_candid(_) : ?ApiV2010AccountCall.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountCall.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountCall");
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
        createCall;
        deleteCall;
        fetchCall;
        listCall;
        updateCall;
    };

    public module class Api20100401CallApi(config : Config) {
        /// Create a new outgoing call to phones, SIP-enabled endpoints or Twilio Client connections
        /// Create a new outgoing call to phones, SIP-enabled endpoints or Twilio Client connections
        public func createCall(accountSid : Text, to : Text, from : Text, method : CreateCallRequestMethod, fallbackUrl : Text, fallbackMethod : CreateCallRequestFallbackMethod, statusCallback : Text, statusCallbackEvent : [Text], statusCallbackMethod : CreateCallRequestStatusCallbackMethod, sendDigits : Text, timeout : Int, record : Bool, recordingChannels : Text, recordingStatusCallback : Text, recordingStatusCallbackMethod : CreateCallRequestRecordingStatusCallbackMethod, sipAuthUsername : Text, sipAuthPassword : Text, machineDetection : Text, machineDetectionTimeout : Int, recordingStatusCallbackEvent : [Text], trim : Text, callerId : Text, machineDetectionSpeechThreshold : Int, machineDetectionSpeechEndThreshold : Int, machineDetectionSilenceTimeout : Int, asyncAmd : Text, asyncAmdStatusCallback : Text, asyncAmdStatusCallbackMethod : CreateCallRequestAsyncAmdStatusCallbackMethod, byoc : Text, callReason : Text, callToken : Text, recordingTrack : Text, timeLimit : Int, clientNotificationUrl : Text, url : Text, twiml : Text, applicationSid : Text) : async ApiV2010AccountCall {
            await* operations__.createCall(config, accountSid, to, from, method, fallbackUrl, fallbackMethod, statusCallback, statusCallbackEvent, statusCallbackMethod, sendDigits, timeout, record, recordingChannels, recordingStatusCallback, recordingStatusCallbackMethod, sipAuthUsername, sipAuthPassword, machineDetection, machineDetectionTimeout, recordingStatusCallbackEvent, trim, callerId, machineDetectionSpeechThreshold, machineDetectionSpeechEndThreshold, machineDetectionSilenceTimeout, asyncAmd, asyncAmdStatusCallback, asyncAmdStatusCallbackMethod, byoc, callReason, callToken, recordingTrack, timeLimit, clientNotificationUrl, url, twiml, applicationSid)
        };

        /// Delete a Call record from your account. Once the record is deleted, it will no longer appear in the API and Account Portal logs.
        /// Delete a Call record from your account. Once the record is deleted, it will no longer appear in the API and Account Portal logs.
        public func deleteCall(accountSid : Text, sid : Text) : async () {
            await* operations__.deleteCall(config, accountSid, sid)
        };

        /// Fetch the call specified by the provided Call SID
        /// Fetch the call specified by the provided Call SID
        public func fetchCall(accountSid : Text, sid : Text) : async ApiV2010AccountCall {
            await* operations__.fetchCall(config, accountSid, sid)
        };

        /// Retrieves a collection of calls made to and from your account
        /// Retrieves a collection of calls made to and from your account
        public func listCall(accountSid : Text, to : Text, from : Text, parentCallSid : Text, status : CallEnumStatus, startTime : Text, startTimeLess_Than : Text, startTimeGreater_Than : Text, endTime : Text, endTimeLess_Than : Text, endTimeGreater_Than : Text, pageSize : Nat, page : Nat, pageToken : Text) : async ListCallResponse {
            await* operations__.listCall(config, accountSid, to, from, parentCallSid, status, startTime, startTimeLess_Than, startTimeGreater_Than, endTime, endTimeLess_Than, endTimeGreater_Than, pageSize, page, pageToken)
        };

        /// Initiates a call redirect or terminates a call
        /// Initiates a call redirect or terminates a call
        public func updateCall(accountSid : Text, sid : Text, url : Text, method : UpdateCallRequestMethod, status : CallEnumUpdateStatus, fallbackUrl : Text, fallbackMethod : CreateCallRequestFallbackMethod, statusCallback : Text, statusCallbackMethod : UpdateCallRequestStatusCallbackMethod, twiml : Text, timeLimit : Int) : async ApiV2010AccountCall {
            await* operations__.updateCall(config, accountSid, sid, url, method, status, fallbackUrl, fallbackMethod, statusCallback, statusCallbackMethod, twiml, timeLimit)
        };

    }
}
