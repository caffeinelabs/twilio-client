// MessagingV1TollfreeVerificationApi.mo

import Text "mo:core/Text";
import Int "mo:core/Int";
import Blob "mo:core/Blob";
import Array "mo:core/Array";
import Error "mo:core/Error";
import Base64 "mo:core/Base64";
import { JSON } "mo:serde-core";
import { type ListTollfreeVerificationResponse; JSON = ListTollfreeVerificationResponse } "../Models/ListTollfreeVerificationResponse";
import { type MessagingV1TollfreeVerification; JSON = MessagingV1TollfreeVerification } "../Models/MessagingV1TollfreeVerification";
import { type TollfreeVerificationEnumBusinessRegistrationAuthority; JSON = TollfreeVerificationEnumBusinessRegistrationAuthority } "../Models/TollfreeVerificationEnumBusinessRegistrationAuthority";
import { type TollfreeVerificationEnumBusinessType; JSON = TollfreeVerificationEnumBusinessType } "../Models/TollfreeVerificationEnumBusinessType";
import { type TollfreeVerificationEnumOptInType; JSON = TollfreeVerificationEnumOptInType } "../Models/TollfreeVerificationEnumOptInType";
import { type TollfreeVerificationEnumStatus; JSON = TollfreeVerificationEnumStatus } "../Models/TollfreeVerificationEnumStatus";
import { type TollfreeVerificationEnumUseCaseCategoriesInner; JSON = TollfreeVerificationEnumUseCaseCategoriesInner } "../Models/TollfreeVerificationEnumUseCaseCategoriesInner";
import { type TollfreeVerificationEnumVettingProvider; JSON = TollfreeVerificationEnumVettingProvider } "../Models/TollfreeVerificationEnumVettingProvider";
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


    /// Create a tollfree verification
    /// Create a tollfree verification
    public func createTollfreeVerification(config : Config, businessName : Text, businessWebsite : Text, notificationEmail : Text, useCaseCategories : ?[TollfreeVerificationEnumUseCaseCategoriesInner], useCaseSummary : Text, productionMessageSample : Text, optInImageUrls : [Text], optInType : TollfreeVerificationEnumOptInType, messageVolume : Text, tollfreePhoneNumberSid : Text, customerProfileSid : Text, businessStreetAddress : Text, businessStreetAddress2 : Text, businessCity : Text, businessStateProvinceRegion : Text, businessPostalCode : Text, businessCountry : Text, additionalInformation : Text, businessContactFirstName : Text, businessContactLastName : Text, businessContactEmail : Text, businessContactPhone : Text, externalReferenceId : Text, businessRegistrationNumber : Text, businessRegistrationAuthority : ?TollfreeVerificationEnumBusinessRegistrationAuthority, businessRegistrationCountry : Text, businessType : ?TollfreeVerificationEnumBusinessType, businessRegistrationPhoneNumber : Text, doingBusinessAs : Text, optInConfirmationMessage : Text, helpMessageSample : Text, privacyPolicyUrl : Text, termsAndConditionsUrl : Text, ageGatedContent : Bool, optInKeywords : [Text], vettingProvider : ?TollfreeVerificationEnumVettingProvider, vettingId : Text) : async* MessagingV1TollfreeVerification {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Tollfree/Verifications";

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
            from_candid(_) : ?MessagingV1TollfreeVerification.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (MessagingV1TollfreeVerification.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to MessagingV1TollfreeVerification");
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

    /// Delete a tollfree verification
    /// Delete a tollfree verification
    public func deleteTollfreeVerification(config : Config, sid : Text) : async* () {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Tollfree/Verifications/{Sid}"
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

    /// Retrieve a tollfree verification
    /// Retrieve a tollfree verification
    public func fetchTollfreeVerification(config : Config, sid : Text) : async* MessagingV1TollfreeVerification {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Tollfree/Verifications/{Sid}"
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
            from_candid(_) : ?MessagingV1TollfreeVerification.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (MessagingV1TollfreeVerification.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to MessagingV1TollfreeVerification");
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

    /// List tollfree verifications
    /// List tollfree verifications
    public func listTollfreeVerification(config : Config, tollfreePhoneNumberSid : Text, status : TollfreeVerificationEnumStatus, externalReferenceId : Text, includeSubAccounts : Bool, pageSize : Nat, page : Nat, pageToken : Text, trustProductSid : [Text]) : async* ListTollfreeVerificationResponse {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Tollfree/Verifications"
            # "?" # "TollfreePhoneNumberSid=" # tollfreePhoneNumberSid # "&" # "Status=" # TollfreeVerificationEnumStatus.toJSON(status) # "&" # "ExternalReferenceId=" # externalReferenceId # "&" # "IncludeSubAccounts=" # debug_show(includeSubAccounts) # "&" # "PageSize=" # debug_show(pageSize) # "&" # "Page=" # Int.toText(page) # "&" # "PageToken=" # pageToken # "&" # "TrustProductSid=" # debug_show(trustProductSid);

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
            from_candid(_) : ?ListTollfreeVerificationResponse.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (ListTollfreeVerificationResponse.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to ListTollfreeVerificationResponse");
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

    /// Edit a tollfree verification
    /// Edit a tollfree verification
    public func updateTollfreeVerification(config : Config, sid : Text, businessName : Text, businessWebsite : Text, notificationEmail : Text, useCaseCategories : ?[TollfreeVerificationEnumUseCaseCategoriesInner], useCaseSummary : Text, productionMessageSample : Text, optInImageUrls : [Text], optInType : TollfreeVerificationEnumOptInType, messageVolume : Text, businessStreetAddress : Text, businessStreetAddress2 : Text, businessCity : Text, businessStateProvinceRegion : Text, businessPostalCode : Text, businessCountry : Text, additionalInformation : Text, businessContactFirstName : Text, businessContactLastName : Text, businessContactEmail : Text, businessContactPhone : Text, editReason : Text, businessRegistrationNumber : Text, businessRegistrationAuthority : ?TollfreeVerificationEnumBusinessRegistrationAuthority, businessRegistrationCountry : Text, businessType : ?TollfreeVerificationEnumBusinessType, businessRegistrationPhoneNumber : Text, doingBusinessAs : Text, optInConfirmationMessage : Text, helpMessageSample : Text, privacyPolicyUrl : Text, termsAndConditionsUrl : Text, ageGatedContent : Bool, optInKeywords : [Text], vettingProvider : ?TollfreeVerificationEnumVettingProvider, vettingId : Text) : async* MessagingV1TollfreeVerification {
        let {baseUrl; cycles} = config;
        let baseUrl__ = baseUrl # "/v1/Tollfree/Verifications/{Sid}"
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
            from_candid(_) : ?MessagingV1TollfreeVerification.JSON |>
            (switch (_) {
                case (?jsonValue) {
                    switch (MessagingV1TollfreeVerification.fromJSON(jsonValue)) {
                        case (?value) value;
                        case null throw Error.reject("HTTP " # Int.toText(response.status) # ": Failed to convert response to MessagingV1TollfreeVerification");
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
        createTollfreeVerification;
        deleteTollfreeVerification;
        fetchTollfreeVerification;
        listTollfreeVerification;
        updateTollfreeVerification;
    };

    public module class MessagingV1TollfreeVerificationApi(config : Config) {
        /// Create a tollfree verification
        /// Create a tollfree verification
        public func createTollfreeVerification(businessName : Text, businessWebsite : Text, notificationEmail : Text, useCaseCategories : ?[TollfreeVerificationEnumUseCaseCategoriesInner], useCaseSummary : Text, productionMessageSample : Text, optInImageUrls : [Text], optInType : TollfreeVerificationEnumOptInType, messageVolume : Text, tollfreePhoneNumberSid : Text, customerProfileSid : Text, businessStreetAddress : Text, businessStreetAddress2 : Text, businessCity : Text, businessStateProvinceRegion : Text, businessPostalCode : Text, businessCountry : Text, additionalInformation : Text, businessContactFirstName : Text, businessContactLastName : Text, businessContactEmail : Text, businessContactPhone : Text, externalReferenceId : Text, businessRegistrationNumber : Text, businessRegistrationAuthority : ?TollfreeVerificationEnumBusinessRegistrationAuthority, businessRegistrationCountry : Text, businessType : ?TollfreeVerificationEnumBusinessType, businessRegistrationPhoneNumber : Text, doingBusinessAs : Text, optInConfirmationMessage : Text, helpMessageSample : Text, privacyPolicyUrl : Text, termsAndConditionsUrl : Text, ageGatedContent : Bool, optInKeywords : [Text], vettingProvider : ?TollfreeVerificationEnumVettingProvider, vettingId : Text) : async MessagingV1TollfreeVerification {
            await* operations__.createTollfreeVerification(config, businessName, businessWebsite, notificationEmail, useCaseCategories, useCaseSummary, productionMessageSample, optInImageUrls, optInType, messageVolume, tollfreePhoneNumberSid, customerProfileSid, businessStreetAddress, businessStreetAddress2, businessCity, businessStateProvinceRegion, businessPostalCode, businessCountry, additionalInformation, businessContactFirstName, businessContactLastName, businessContactEmail, businessContactPhone, externalReferenceId, businessRegistrationNumber, businessRegistrationAuthority, businessRegistrationCountry, businessType, businessRegistrationPhoneNumber, doingBusinessAs, optInConfirmationMessage, helpMessageSample, privacyPolicyUrl, termsAndConditionsUrl, ageGatedContent, optInKeywords, vettingProvider, vettingId)
        };

        /// Delete a tollfree verification
        /// Delete a tollfree verification
        public func deleteTollfreeVerification(sid : Text) : async () {
            await* operations__.deleteTollfreeVerification(config, sid)
        };

        /// Retrieve a tollfree verification
        /// Retrieve a tollfree verification
        public func fetchTollfreeVerification(sid : Text) : async MessagingV1TollfreeVerification {
            await* operations__.fetchTollfreeVerification(config, sid)
        };

        /// List tollfree verifications
        /// List tollfree verifications
        public func listTollfreeVerification(tollfreePhoneNumberSid : Text, status : TollfreeVerificationEnumStatus, externalReferenceId : Text, includeSubAccounts : Bool, pageSize : Nat, page : Nat, pageToken : Text, trustProductSid : [Text]) : async ListTollfreeVerificationResponse {
            await* operations__.listTollfreeVerification(config, tollfreePhoneNumberSid, status, externalReferenceId, includeSubAccounts, pageSize, page, pageToken, trustProductSid)
        };

        /// Edit a tollfree verification
        /// Edit a tollfree verification
        public func updateTollfreeVerification(sid : Text, businessName : Text, businessWebsite : Text, notificationEmail : Text, useCaseCategories : ?[TollfreeVerificationEnumUseCaseCategoriesInner], useCaseSummary : Text, productionMessageSample : Text, optInImageUrls : [Text], optInType : TollfreeVerificationEnumOptInType, messageVolume : Text, businessStreetAddress : Text, businessStreetAddress2 : Text, businessCity : Text, businessStateProvinceRegion : Text, businessPostalCode : Text, businessCountry : Text, additionalInformation : Text, businessContactFirstName : Text, businessContactLastName : Text, businessContactEmail : Text, businessContactPhone : Text, editReason : Text, businessRegistrationNumber : Text, businessRegistrationAuthority : ?TollfreeVerificationEnumBusinessRegistrationAuthority, businessRegistrationCountry : Text, businessType : ?TollfreeVerificationEnumBusinessType, businessRegistrationPhoneNumber : Text, doingBusinessAs : Text, optInConfirmationMessage : Text, helpMessageSample : Text, privacyPolicyUrl : Text, termsAndConditionsUrl : Text, ageGatedContent : Bool, optInKeywords : [Text], vettingProvider : ?TollfreeVerificationEnumVettingProvider, vettingId : Text) : async MessagingV1TollfreeVerification {
            await* operations__.updateTollfreeVerification(config, sid, businessName, businessWebsite, notificationEmail, useCaseCategories, useCaseSummary, productionMessageSample, optInImageUrls, optInType, messageVolume, businessStreetAddress, businessStreetAddress2, businessCity, businessStateProvinceRegion, businessPostalCode, businessCountry, additionalInformation, businessContactFirstName, businessContactLastName, businessContactEmail, businessContactPhone, editReason, businessRegistrationNumber, businessRegistrationAuthority, businessRegistrationCountry, businessType, businessRegistrationPhoneNumber, doingBusinessAs, optInConfirmationMessage, helpMessageSample, privacyPolicyUrl, termsAndConditionsUrl, ageGatedContent, optInKeywords, vettingProvider, vettingId)
        };

    }
}
