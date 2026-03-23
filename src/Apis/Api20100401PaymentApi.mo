// Api20100401PaymentApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ApiV2010AccountCallPayments; JSON = ApiV2010AccountCallPayments } "../Models/ApiV2010AccountCallPayments";
import { type CreatePaymentsRequestConfirmation; JSON = CreatePaymentsRequestConfirmation } "../Models/CreatePaymentsRequestConfirmation";
import { type PaymentsEnumBankAccountType; JSON = PaymentsEnumBankAccountType } "../Models/PaymentsEnumBankAccountType";
import { type PaymentsEnumCapture; JSON = PaymentsEnumCapture } "../Models/PaymentsEnumCapture";
import { type PaymentsEnumPaymentMethod; JSON = PaymentsEnumPaymentMethod } "../Models/PaymentsEnumPaymentMethod";
import { type PaymentsEnumStatus; JSON = PaymentsEnumStatus } "../Models/PaymentsEnumStatus";
import { type PaymentsEnumTokenType; JSON = PaymentsEnumTokenType } "../Models/PaymentsEnumTokenType";
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


    /// create an instance of payments. This will start a new payments session
    /// create an instance of payments. This will start a new payments session
    public func createPayments(config : Config, accountSid : Text, callSid : Text, idempotencyKey : Text, statusCallback : Text, bankAccountType : PaymentsEnumBankAccountType, chargeAmount : Float, currency : Text, description : Text, input : Text, minPostalCodeLength : Int, parameter : ?Text, paymentConnector : Text, paymentMethod : PaymentsEnumPaymentMethod, postalCode : Bool, securityCode : Bool, timeout : Int, tokenType : PaymentsEnumTokenType, validCardTypes : Text, requireMatchingInputs : Text, confirmation : CreatePaymentsRequestConfirmation) : async* ApiV2010AccountCallPayments {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Payments.json"
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
            from_candid(_) : ?ApiV2010AccountCallPayments.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountCallPayments.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountCallPayments");
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

    /// update an instance of payments with different phases of payment flows.
    /// update an instance of payments with different phases of payment flows.
    public func updatePayments(config : Config, accountSid : Text, callSid : Text, sid : Text, idempotencyKey : Text, statusCallback : Text, capture : PaymentsEnumCapture, status : PaymentsEnumStatus) : async* ApiV2010AccountCallPayments {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/Calls/{CallSid}/Payments/{Sid}.json"
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
            from_candid(_) : ?ApiV2010AccountCallPayments.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ApiV2010AccountCallPayments.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ApiV2010AccountCallPayments");
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
        createPayments;
        updatePayments;
    };

    public module class Api20100401PaymentApi(config : Config) {
        /// create an instance of payments. This will start a new payments session
        /// create an instance of payments. This will start a new payments session
        public func createPayments(accountSid : Text, callSid : Text, idempotencyKey : Text, statusCallback : Text, bankAccountType : PaymentsEnumBankAccountType, chargeAmount : Float, currency : Text, description : Text, input : Text, minPostalCodeLength : Int, parameter : ?Text, paymentConnector : Text, paymentMethod : PaymentsEnumPaymentMethod, postalCode : Bool, securityCode : Bool, timeout : Int, tokenType : PaymentsEnumTokenType, validCardTypes : Text, requireMatchingInputs : Text, confirmation : CreatePaymentsRequestConfirmation) : async ApiV2010AccountCallPayments {
            await* operations__.createPayments(config, accountSid, callSid, idempotencyKey, statusCallback, bankAccountType, chargeAmount, currency, description, input, minPostalCodeLength, parameter, paymentConnector, paymentMethod, postalCode, securityCode, timeout, tokenType, validCardTypes, requireMatchingInputs, confirmation)
        };

        /// update an instance of payments with different phases of payment flows.
        /// update an instance of payments with different phases of payment flows.
        public func updatePayments(accountSid : Text, callSid : Text, sid : Text, idempotencyKey : Text, statusCallback : Text, capture : PaymentsEnumCapture, status : PaymentsEnumStatus) : async ApiV2010AccountCallPayments {
            await* operations__.updatePayments(config, accountSid, callSid, sid, idempotencyKey, statusCallback, capture, status)
        };

    }
}
