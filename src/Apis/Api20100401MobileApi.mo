// Api20100401MobileApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ListAvailablePhoneNumberMobileResponse; JSON = ListAvailablePhoneNumberMobileResponse } "../Models/ListAvailablePhoneNumberMobileResponse";
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
    public func listAvailablePhoneNumberMobile(config : Config, accountSid : Text, countryCode : Text, areaCode : Int, contains : Text, smsEnabled : Bool, mmsEnabled : Bool, voiceEnabled : Bool, excludeAllAddressRequired : Bool, excludeLocalAddressRequired : Bool, excludeForeignAddressRequired : Bool, beta : Bool, nearNumber : Text, nearLatLong : Text, distance : Int, inPostalCode : Text, inRegion : Text, inRateCenter : Text, inLata : Text, inLocality : Text, faxEnabled : Bool, pageSize : Nat, page : Nat, pageToken : Text) : async* ListAvailablePhoneNumberMobileResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/2010-04-01/Accounts/{AccountSid}/AvailablePhoneNumbers/{CountryCode}/Mobile.json"
            |> Text.replace(_, #text "{AccountSid}", accountSid)
            |> Text.replace(_, #text "{CountryCode}", countryCode)
            # "?" # "AreaCode=" # Int.toText(areaCode) # "&" # "Contains=" # contains # "&" # "SmsEnabled=" # debug_show(smsEnabled) # "&" # "MmsEnabled=" # debug_show(mmsEnabled) # "&" # "VoiceEnabled=" # debug_show(voiceEnabled) # "&" # "ExcludeAllAddressRequired=" # debug_show(excludeAllAddressRequired) # "&" # "ExcludeLocalAddressRequired=" # debug_show(excludeLocalAddressRequired) # "&" # "ExcludeForeignAddressRequired=" # debug_show(excludeForeignAddressRequired) # "&" # "Beta=" # debug_show(beta) # "&" # "NearNumber=" # nearNumber # "&" # "NearLatLong=" # nearLatLong # "&" # "Distance=" # Int.toText(distance) # "&" # "InPostalCode=" # inPostalCode # "&" # "InRegion=" # inRegion # "&" # "InRateCenter=" # inRateCenter # "&" # "InLata=" # inLata # "&" # "InLocality=" # inLocality # "&" # "FaxEnabled=" # debug_show(faxEnabled) # "&" # "PageSize=" # debug_show(pageSize) # "&" # "Page=" # Int.toText(page) # "&" # "PageToken=" # pageToken;

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
            from_candid(_) : ?ListAvailablePhoneNumberMobileResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListAvailablePhoneNumberMobileResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListAvailablePhoneNumberMobileResponse");
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
        listAvailablePhoneNumberMobile;
    };

    public module class Api20100401MobileApi(config : Config) {
        /// 
        /// 
        public func listAvailablePhoneNumberMobile(accountSid : Text, countryCode : Text, areaCode : Int, contains : Text, smsEnabled : Bool, mmsEnabled : Bool, voiceEnabled : Bool, excludeAllAddressRequired : Bool, excludeLocalAddressRequired : Bool, excludeForeignAddressRequired : Bool, beta : Bool, nearNumber : Text, nearLatLong : Text, distance : Int, inPostalCode : Text, inRegion : Text, inRateCenter : Text, inLata : Text, inLocality : Text, faxEnabled : Bool, pageSize : Nat, page : Nat, pageToken : Text) : async ListAvailablePhoneNumberMobileResponse {
            await* operations__.listAvailablePhoneNumberMobile(config, accountSid, countryCode, areaCode, contains, smsEnabled, mmsEnabled, voiceEnabled, excludeAllAddressRequired, excludeLocalAddressRequired, excludeForeignAddressRequired, beta, nearNumber, nearLatLong, distance, inPostalCode, inRegion, inRateCenter, inLata, inLocality, faxEnabled, pageSize, page, pageToken)
        };

    }
}
