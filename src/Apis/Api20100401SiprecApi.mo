// Api20100401SiprecApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ApiV2010AccountCallSiprec; JSON = ApiV2010AccountCallSiprec } "../Models/ApiV2010AccountCallSiprec";
import { type CreateRealtimeTranscriptionRequestStatusCallbackMethod; JSON = CreateRealtimeTranscriptionRequestStatusCallbackMethod } "../Models/CreateRealtimeTranscriptionRequestStatusCallbackMethod";
import { type SiprecEnumTrack; JSON = SiprecEnumTrack } "../Models/SiprecEnumTrack";
import { type SiprecEnumUpdateStatus; JSON = SiprecEnumUpdateStatus } "../Models/SiprecEnumUpdateStatus";
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


    /// Create a Siprec
    /// Create a Siprec
    public func createSiprec(config : Config, accountSid : Text, callSid : Text, name : Text, connectorName : Text, track : SiprecEnumTrack, statusCallback : Text, statusCallbackMethod : CreateRealtimeTranscriptionRequestStatusCallbackMethod, parameter1PeriodName : Text, parameter1PeriodValue : Text, parameter2PeriodName : Text, parameter2PeriodValue : Text, parameter3PeriodName : Text, parameter3PeriodValue : Text, parameter4PeriodName : Text, parameter4PeriodValue : Text, parameter5PeriodName : Text, parameter5PeriodValue : Text, parameter6PeriodName : Text, parameter6PeriodValue : Text, parameter7PeriodName : Text, parameter7PeriodValue : Text, parameter8PeriodName : Text, parameter8PeriodValue : Text, parameter9PeriodName : Text, parameter9PeriodValue : Text, parameter10PeriodName : Text, parameter10PeriodValue : Text, parameter11PeriodName : Text, parameter11PeriodValue : Text, parameter12PeriodName : Text, parameter12PeriodValue : Text, parameter13PeriodName : Text, parameter13PeriodValue : Text, parameter14PeriodName : Text, parameter14PeriodValue : Text, parameter15PeriodName : Text, parameter15PeriodValue : Text, parameter16PeriodName : Text, parameter16PeriodValue : Text, parameter17PeriodName : Text, parameter17PeriodValue : Text, parameter18PeriodName : Text, parameter18PeriodValue : Text, parameter19PeriodName : Text, parameter19PeriodValue : Text, parameter20PeriodName : Text, parameter20PeriodValue : Text, parameter21PeriodName : Text, parameter21PeriodValue : Text, parameter22PeriodName : Text, parameter22PeriodValue : Text, parameter23PeriodName : Text, parameter23PeriodValue : Text, parameter24PeriodName : Text, parameter24PeriodValue : Text, parameter25PeriodName : Text, parameter25PeriodValue : Text, parameter26PeriodName : Text, parameter26PeriodValue : Text, parameter27PeriodName : Text, parameter27PeriodValue : Text, parameter28PeriodName : Text, parameter28PeriodValue : Text, parameter29PeriodName : Text, parameter29PeriodValue : Text, parameter30PeriodName : Text, parameter30PeriodValue : Text, parameter31PeriodName : Text, parameter31PeriodValue : Text, parameter32PeriodName : Text, parameter32PeriodValue : Text, parameter33PeriodName : Text, parameter33PeriodValue : Text, parameter34PeriodName : Text, parameter34PeriodValue : Text, parameter35PeriodName : Text, parameter35PeriodValue : Text, parameter36PeriodName : Text, parameter36PeriodValue : Text, parameter37PeriodName : Text, parameter37PeriodValue : Text, parameter38PeriodName : Text, parameter38PeriodValue : Text, parameter39PeriodName : Text, parameter39PeriodValue : Text, parameter40PeriodName : Text, parameter40PeriodValue : Text, parameter41PeriodName : Text, parameter41PeriodValue : Text, parameter42PeriodName : Text, parameter42PeriodValue : Text, parameter43PeriodName : Text, parameter43PeriodValue : Text, parameter44PeriodName : Text, parameter44PeriodValue : Text, parameter45PeriodName : Text, parameter45PeriodValue : Text, parameter46PeriodName : Text, parameter46PeriodValue : Text, parameter47PeriodName : Text, parameter47PeriodValue : Text, parameter48PeriodName : Text, parameter48PeriodValue : Text, parameter49PeriodName : Text, parameter49PeriodValue : Text, parameter50PeriodName : Text, parameter50PeriodValue : Text, parameter51PeriodName : Text, parameter51PeriodValue : Text, parameter52PeriodName : Text, parameter52PeriodValue : Text, parameter53PeriodName : Text, parameter53PeriodValue : Text, parameter54PeriodName : Text, parameter54PeriodValue : Text, parameter55PeriodName : Text, parameter55PeriodValue : Text, parameter56PeriodName : Text, parameter56PeriodValue : Text, parameter57PeriodName : Text, parameter57PeriodValue : Text, parameter58PeriodName : Text, parameter58PeriodValue : Text, parameter59PeriodName : Text, parameter59PeriodValue : Text, parameter60PeriodName : Text, parameter60PeriodValue : Text, parameter61PeriodName : Text, parameter61PeriodValue : Text, parameter62PeriodName : Text, parameter62PeriodValue : Text, parameter63PeriodName : Text, parameter63PeriodValue : Text, parameter64PeriodName : Text, parameter64PeriodValue : Text, parameter65PeriodName : Text, parameter65PeriodValue : Text, parameter66PeriodName : Text, parameter66PeriodValue : Text, parameter67PeriodName : Text, parameter67PeriodValue : Text, parameter68PeriodName : Text, parameter68PeriodValue : Text, parameter69PeriodName : Text, parameter69PeriodValue : Text, parameter70PeriodName : Text, parameter70PeriodValue : Text, parameter71PeriodName : Text, parameter71PeriodValue : Text, parameter72PeriodName : Text, parameter72PeriodValue : Text, parameter73PeriodName : Text, parameter73PeriodValue : Text, parameter74PeriodName : Text, parameter74PeriodValue : Text, parameter75PeriodName : Text, parameter75PeriodValue : Text, parameter76PeriodName : Text, parameter76PeriodValue : Text, parameter77PeriodName : Text, parameter77PeriodValue : Text, parameter78PeriodName : Text, parameter78PeriodValue : Text, parameter79PeriodName : Text, parameter79PeriodValue : Text, parameter80PeriodName : Text, parameter80PeriodValue : Text, parameter81PeriodName : Text, parameter81PeriodValue : Text, parameter82PeriodName : Text, parameter82PeriodValue : Text, parameter83PeriodName : Text, parameter83PeriodValue : Text, parameter84PeriodName : Text, parameter84PeriodValue : Text, parameter85PeriodName : Text, parameter85PeriodValue : Text, parameter86PeriodName : Text, parameter86PeriodValue : Text, parameter87PeriodName : Text, parameter87PeriodValue : Text, parameter88PeriodName : Text, parameter88PeriodValue : Text, parameter89PeriodName : Text, parameter89PeriodValue : Text, parameter90PeriodName : Text, parameter90PeriodValue : Text, parameter91PeriodName : Text, parameter91PeriodValue : Text, parameter92PeriodName : Text, parameter92PeriodValue : Text, parameter93PeriodName : Text, parameter93PeriodValue : Text, parameter94PeriodName : Text, parameter94PeriodValue : Text, parameter95PeriodName : Text, parameter95PeriodValue : Text, parameter96PeriodName : Text, parameter96PeriodValue : Text, parameter97PeriodName : Text, parameter97PeriodValue : Text, parameter98PeriodName : Text, parameter98PeriodValue : Text, parameter99PeriodName : Text, parameter99PeriodValue : Text) : async* ApiV2010AccountCallSiprec {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Siprec.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{CallSid}", callSid);

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
            from_candid(_) : ?ApiV2010AccountCallSiprec.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountCallSiprec.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountCallSiprec");
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

    /// Stop a Siprec using either the SID of the Siprec resource or the `name` used when creating the resource
    /// Stop a Siprec using either the SID of the Siprec resource or the `name` used when creating the resource
    public func updateSiprec(config : Config, accountSid : Text, callSid : Text, sid : Text, status : SiprecEnumUpdateStatus) : async* ApiV2010AccountCallSiprec {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Siprec/{Sid}.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{CallSid}", callSid)
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
            from_candid(_) : ?ApiV2010AccountCallSiprec.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountCallSiprec.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountCallSiprec");
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
        createSiprec;
        updateSiprec;
    };

    public module class Api20100401SiprecApi(config : Config) {
        /// Create a Siprec
        /// Create a Siprec
        public func createSiprec(accountSid : Text, callSid : Text, name : Text, connectorName : Text, track : SiprecEnumTrack, statusCallback : Text, statusCallbackMethod : CreateRealtimeTranscriptionRequestStatusCallbackMethod, parameter1PeriodName : Text, parameter1PeriodValue : Text, parameter2PeriodName : Text, parameter2PeriodValue : Text, parameter3PeriodName : Text, parameter3PeriodValue : Text, parameter4PeriodName : Text, parameter4PeriodValue : Text, parameter5PeriodName : Text, parameter5PeriodValue : Text, parameter6PeriodName : Text, parameter6PeriodValue : Text, parameter7PeriodName : Text, parameter7PeriodValue : Text, parameter8PeriodName : Text, parameter8PeriodValue : Text, parameter9PeriodName : Text, parameter9PeriodValue : Text, parameter10PeriodName : Text, parameter10PeriodValue : Text, parameter11PeriodName : Text, parameter11PeriodValue : Text, parameter12PeriodName : Text, parameter12PeriodValue : Text, parameter13PeriodName : Text, parameter13PeriodValue : Text, parameter14PeriodName : Text, parameter14PeriodValue : Text, parameter15PeriodName : Text, parameter15PeriodValue : Text, parameter16PeriodName : Text, parameter16PeriodValue : Text, parameter17PeriodName : Text, parameter17PeriodValue : Text, parameter18PeriodName : Text, parameter18PeriodValue : Text, parameter19PeriodName : Text, parameter19PeriodValue : Text, parameter20PeriodName : Text, parameter20PeriodValue : Text, parameter21PeriodName : Text, parameter21PeriodValue : Text, parameter22PeriodName : Text, parameter22PeriodValue : Text, parameter23PeriodName : Text, parameter23PeriodValue : Text, parameter24PeriodName : Text, parameter24PeriodValue : Text, parameter25PeriodName : Text, parameter25PeriodValue : Text, parameter26PeriodName : Text, parameter26PeriodValue : Text, parameter27PeriodName : Text, parameter27PeriodValue : Text, parameter28PeriodName : Text, parameter28PeriodValue : Text, parameter29PeriodName : Text, parameter29PeriodValue : Text, parameter30PeriodName : Text, parameter30PeriodValue : Text, parameter31PeriodName : Text, parameter31PeriodValue : Text, parameter32PeriodName : Text, parameter32PeriodValue : Text, parameter33PeriodName : Text, parameter33PeriodValue : Text, parameter34PeriodName : Text, parameter34PeriodValue : Text, parameter35PeriodName : Text, parameter35PeriodValue : Text, parameter36PeriodName : Text, parameter36PeriodValue : Text, parameter37PeriodName : Text, parameter37PeriodValue : Text, parameter38PeriodName : Text, parameter38PeriodValue : Text, parameter39PeriodName : Text, parameter39PeriodValue : Text, parameter40PeriodName : Text, parameter40PeriodValue : Text, parameter41PeriodName : Text, parameter41PeriodValue : Text, parameter42PeriodName : Text, parameter42PeriodValue : Text, parameter43PeriodName : Text, parameter43PeriodValue : Text, parameter44PeriodName : Text, parameter44PeriodValue : Text, parameter45PeriodName : Text, parameter45PeriodValue : Text, parameter46PeriodName : Text, parameter46PeriodValue : Text, parameter47PeriodName : Text, parameter47PeriodValue : Text, parameter48PeriodName : Text, parameter48PeriodValue : Text, parameter49PeriodName : Text, parameter49PeriodValue : Text, parameter50PeriodName : Text, parameter50PeriodValue : Text, parameter51PeriodName : Text, parameter51PeriodValue : Text, parameter52PeriodName : Text, parameter52PeriodValue : Text, parameter53PeriodName : Text, parameter53PeriodValue : Text, parameter54PeriodName : Text, parameter54PeriodValue : Text, parameter55PeriodName : Text, parameter55PeriodValue : Text, parameter56PeriodName : Text, parameter56PeriodValue : Text, parameter57PeriodName : Text, parameter57PeriodValue : Text, parameter58PeriodName : Text, parameter58PeriodValue : Text, parameter59PeriodName : Text, parameter59PeriodValue : Text, parameter60PeriodName : Text, parameter60PeriodValue : Text, parameter61PeriodName : Text, parameter61PeriodValue : Text, parameter62PeriodName : Text, parameter62PeriodValue : Text, parameter63PeriodName : Text, parameter63PeriodValue : Text, parameter64PeriodName : Text, parameter64PeriodValue : Text, parameter65PeriodName : Text, parameter65PeriodValue : Text, parameter66PeriodName : Text, parameter66PeriodValue : Text, parameter67PeriodName : Text, parameter67PeriodValue : Text, parameter68PeriodName : Text, parameter68PeriodValue : Text, parameter69PeriodName : Text, parameter69PeriodValue : Text, parameter70PeriodName : Text, parameter70PeriodValue : Text, parameter71PeriodName : Text, parameter71PeriodValue : Text, parameter72PeriodName : Text, parameter72PeriodValue : Text, parameter73PeriodName : Text, parameter73PeriodValue : Text, parameter74PeriodName : Text, parameter74PeriodValue : Text, parameter75PeriodName : Text, parameter75PeriodValue : Text, parameter76PeriodName : Text, parameter76PeriodValue : Text, parameter77PeriodName : Text, parameter77PeriodValue : Text, parameter78PeriodName : Text, parameter78PeriodValue : Text, parameter79PeriodName : Text, parameter79PeriodValue : Text, parameter80PeriodName : Text, parameter80PeriodValue : Text, parameter81PeriodName : Text, parameter81PeriodValue : Text, parameter82PeriodName : Text, parameter82PeriodValue : Text, parameter83PeriodName : Text, parameter83PeriodValue : Text, parameter84PeriodName : Text, parameter84PeriodValue : Text, parameter85PeriodName : Text, parameter85PeriodValue : Text, parameter86PeriodName : Text, parameter86PeriodValue : Text, parameter87PeriodName : Text, parameter87PeriodValue : Text, parameter88PeriodName : Text, parameter88PeriodValue : Text, parameter89PeriodName : Text, parameter89PeriodValue : Text, parameter90PeriodName : Text, parameter90PeriodValue : Text, parameter91PeriodName : Text, parameter91PeriodValue : Text, parameter92PeriodName : Text, parameter92PeriodValue : Text, parameter93PeriodName : Text, parameter93PeriodValue : Text, parameter94PeriodName : Text, parameter94PeriodValue : Text, parameter95PeriodName : Text, parameter95PeriodValue : Text, parameter96PeriodName : Text, parameter96PeriodValue : Text, parameter97PeriodName : Text, parameter97PeriodValue : Text, parameter98PeriodName : Text, parameter98PeriodValue : Text, parameter99PeriodName : Text, parameter99PeriodValue : Text) : async ApiV2010AccountCallSiprec {
            await* operations__.createSiprec(config, accountSid, callSid, name, connectorName, track, statusCallback, statusCallbackMethod, parameter1PeriodName, parameter1PeriodValue, parameter2PeriodName, parameter2PeriodValue, parameter3PeriodName, parameter3PeriodValue, parameter4PeriodName, parameter4PeriodValue, parameter5PeriodName, parameter5PeriodValue, parameter6PeriodName, parameter6PeriodValue, parameter7PeriodName, parameter7PeriodValue, parameter8PeriodName, parameter8PeriodValue, parameter9PeriodName, parameter9PeriodValue, parameter10PeriodName, parameter10PeriodValue, parameter11PeriodName, parameter11PeriodValue, parameter12PeriodName, parameter12PeriodValue, parameter13PeriodName, parameter13PeriodValue, parameter14PeriodName, parameter14PeriodValue, parameter15PeriodName, parameter15PeriodValue, parameter16PeriodName, parameter16PeriodValue, parameter17PeriodName, parameter17PeriodValue, parameter18PeriodName, parameter18PeriodValue, parameter19PeriodName, parameter19PeriodValue, parameter20PeriodName, parameter20PeriodValue, parameter21PeriodName, parameter21PeriodValue, parameter22PeriodName, parameter22PeriodValue, parameter23PeriodName, parameter23PeriodValue, parameter24PeriodName, parameter24PeriodValue, parameter25PeriodName, parameter25PeriodValue, parameter26PeriodName, parameter26PeriodValue, parameter27PeriodName, parameter27PeriodValue, parameter28PeriodName, parameter28PeriodValue, parameter29PeriodName, parameter29PeriodValue, parameter30PeriodName, parameter30PeriodValue, parameter31PeriodName, parameter31PeriodValue, parameter32PeriodName, parameter32PeriodValue, parameter33PeriodName, parameter33PeriodValue, parameter34PeriodName, parameter34PeriodValue, parameter35PeriodName, parameter35PeriodValue, parameter36PeriodName, parameter36PeriodValue, parameter37PeriodName, parameter37PeriodValue, parameter38PeriodName, parameter38PeriodValue, parameter39PeriodName, parameter39PeriodValue, parameter40PeriodName, parameter40PeriodValue, parameter41PeriodName, parameter41PeriodValue, parameter42PeriodName, parameter42PeriodValue, parameter43PeriodName, parameter43PeriodValue, parameter44PeriodName, parameter44PeriodValue, parameter45PeriodName, parameter45PeriodValue, parameter46PeriodName, parameter46PeriodValue, parameter47PeriodName, parameter47PeriodValue, parameter48PeriodName, parameter48PeriodValue, parameter49PeriodName, parameter49PeriodValue, parameter50PeriodName, parameter50PeriodValue, parameter51PeriodName, parameter51PeriodValue, parameter52PeriodName, parameter52PeriodValue, parameter53PeriodName, parameter53PeriodValue, parameter54PeriodName, parameter54PeriodValue, parameter55PeriodName, parameter55PeriodValue, parameter56PeriodName, parameter56PeriodValue, parameter57PeriodName, parameter57PeriodValue, parameter58PeriodName, parameter58PeriodValue, parameter59PeriodName, parameter59PeriodValue, parameter60PeriodName, parameter60PeriodValue, parameter61PeriodName, parameter61PeriodValue, parameter62PeriodName, parameter62PeriodValue, parameter63PeriodName, parameter63PeriodValue, parameter64PeriodName, parameter64PeriodValue, parameter65PeriodName, parameter65PeriodValue, parameter66PeriodName, parameter66PeriodValue, parameter67PeriodName, parameter67PeriodValue, parameter68PeriodName, parameter68PeriodValue, parameter69PeriodName, parameter69PeriodValue, parameter70PeriodName, parameter70PeriodValue, parameter71PeriodName, parameter71PeriodValue, parameter72PeriodName, parameter72PeriodValue, parameter73PeriodName, parameter73PeriodValue, parameter74PeriodName, parameter74PeriodValue, parameter75PeriodName, parameter75PeriodValue, parameter76PeriodName, parameter76PeriodValue, parameter77PeriodName, parameter77PeriodValue, parameter78PeriodName, parameter78PeriodValue, parameter79PeriodName, parameter79PeriodValue, parameter80PeriodName, parameter80PeriodValue, parameter81PeriodName, parameter81PeriodValue, parameter82PeriodName, parameter82PeriodValue, parameter83PeriodName, parameter83PeriodValue, parameter84PeriodName, parameter84PeriodValue, parameter85PeriodName, parameter85PeriodValue, parameter86PeriodName, parameter86PeriodValue, parameter87PeriodName, parameter87PeriodValue, parameter88PeriodName, parameter88PeriodValue, parameter89PeriodName, parameter89PeriodValue, parameter90PeriodName, parameter90PeriodValue, parameter91PeriodName, parameter91PeriodValue, parameter92PeriodName, parameter92PeriodValue, parameter93PeriodName, parameter93PeriodValue, parameter94PeriodName, parameter94PeriodValue, parameter95PeriodName, parameter95PeriodValue, parameter96PeriodName, parameter96PeriodValue, parameter97PeriodName, parameter97PeriodValue, parameter98PeriodName, parameter98PeriodValue, parameter99PeriodName, parameter99PeriodValue)
        };

        /// Stop a Siprec using either the SID of the Siprec resource or the `name` used when creating the resource
        /// Stop a Siprec using either the SID of the Siprec resource or the `name` used when creating the resource
        public func updateSiprec(accountSid : Text, callSid : Text, sid : Text, status : SiprecEnumUpdateStatus) : async ApiV2010AccountCallSiprec {
            await* operations__.updateSiprec(config, accountSid, callSid, sid, status)
        };

    }
}
