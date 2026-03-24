
import { type BrandRegistrationsEnumBrandFeedback; JSON = BrandRegistrationsEnumBrandFeedback } "./BrandRegistrationsEnumBrandFeedback";

import { type BrandRegistrationsEnumIdentityStatus; JSON = BrandRegistrationsEnumIdentityStatus } "./BrandRegistrationsEnumIdentityStatus";

import { type BrandRegistrationsEnumStatus; JSON = BrandRegistrationsEnumStatus } "./BrandRegistrationsEnumStatus";

// MessagingV1BrandRegistrations.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1BrandRegistrations = {
        /// The unique string to identify Brand Registration.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Brand Registration resource.
        account_sid : ?Text;
        /// A2P Messaging Profile Bundle BundleSid.
        customer_profile_bundle_sid : ?Text;
        /// A2P Messaging Profile Bundle BundleSid.
        a2p_profile_bundle_sid : ?Text;
        /// The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_created : ?Text;
        /// The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_updated : ?Text;
        /// Type of brand. One of: \"STANDARD\", \"SOLE_PROPRIETOR\". SOLE_PROPRIETOR is for the low volume, SOLE_PROPRIETOR campaign use case. There can only be one SOLE_PROPRIETOR campaign created per SOLE_PROPRIETOR brand. STANDARD is for all other campaign use cases. Multiple campaign use cases can be created per STANDARD brand.
        brand_type : ?Text;
        status : ?BrandRegistrationsEnumStatus;
        /// Campaign Registry (TCR) Brand ID. Assigned only after successful brand registration.
        tcr_id : ?Text;
        /// DEPRECATED. A reason why brand registration has failed. Only applicable when status is FAILED.
        failure_reason : ?Text;
        /// A list of errors that occurred during the brand registration process.
        errors : ?[Text];
        /// The absolute URL of the Brand Registration resource.
        url : ?Text;
        /// The secondary vetting score if it was done. Otherwise, it will be the brand score if it's returned from TCR. It may be null if no score is available.
        brand_score : ?Int;
        /// DEPRECATED. Feedback on how to improve brand score
        brand_feedback : ?[BrandRegistrationsEnumBrandFeedback];
        identity_status : ?BrandRegistrationsEnumIdentityStatus;
        /// Publicly traded company identified in the Russell 3000 Index
        russell_3000 : ?Bool;
        /// Identified as a government entity
        government_entity : ?Bool;
        /// Nonprofit organization tax-exempt status per section 501 of the U.S. tax code.
        tax_exempt_status : ?Text;
        /// A flag to disable automatic secondary vetting for brands which it would otherwise be done.
        skip_automatic_sec_vet : ?Bool;
        /// A boolean that specifies whether brand should be a mock or not. If true, brand will be registered as a mock brand. Defaults to false if no value is provided.
        mock : ?Bool;
        links : ?Any;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1BrandRegistrations type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            customer_profile_bundle_sid : ?Text;
            a2p_profile_bundle_sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            brand_type : ?Text;
            status : ?BrandRegistrationsEnumStatus.JSON;
            tcr_id : ?Text;
            failure_reason : ?Text;
            errors : ?[Text];
            url : ?Text;
            brand_score : ?Int;
            brand_feedback : ?[BrandRegistrationsEnumBrandFeedback];
            identity_status : ?BrandRegistrationsEnumIdentityStatus.JSON;
            russell_3000 : ?Bool;
            government_entity : ?Bool;
            tax_exempt_status : ?Text;
            skip_automatic_sec_vet : ?Bool;
            mock : ?Bool;
            links : ?Any;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1BrandRegistrations) : JSON = { value with
            status = do ? { BrandRegistrationsEnumStatus.toJSON(value.status!) };
            identity_status = do ? { BrandRegistrationsEnumIdentityStatus.toJSON(value.identity_status!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1BrandRegistrations {
            ?{ json with
                status = do ? { BrandRegistrationsEnumStatus.fromJSON(json.status!)! };
                identity_status = do ? { BrandRegistrationsEnumIdentityStatus.fromJSON(json.identity_status!)! };
            }
        };
    }
}
