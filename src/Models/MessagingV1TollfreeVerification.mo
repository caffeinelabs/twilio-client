
import { type TollfreeVerificationEnumBusinessRegistrationAuthority; JSON = TollfreeVerificationEnumBusinessRegistrationAuthority } "./TollfreeVerificationEnumBusinessRegistrationAuthority";

import { type TollfreeVerificationEnumBusinessType; JSON = TollfreeVerificationEnumBusinessType } "./TollfreeVerificationEnumBusinessType";

import { type TollfreeVerificationEnumOptInType; JSON = TollfreeVerificationEnumOptInType } "./TollfreeVerificationEnumOptInType";

import { type TollfreeVerificationEnumStatus; JSON = TollfreeVerificationEnumStatus } "./TollfreeVerificationEnumStatus";

import { type TollfreeVerificationEnumUseCaseCategoriesInner; JSON = TollfreeVerificationEnumUseCaseCategoriesInner } "./TollfreeVerificationEnumUseCaseCategoriesInner";

import { type TollfreeVerificationEnumVettingProvider; JSON = TollfreeVerificationEnumVettingProvider } "./TollfreeVerificationEnumVettingProvider";

// MessagingV1TollfreeVerification.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1TollfreeVerification = {
        /// The unique string to identify Tollfree Verification.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Tollfree Verification resource.
        account_sid : ?Text;
        /// Customer's Profile Bundle BundleSid.
        customer_profile_sid : ?Text;
        /// Tollfree TrustProduct Bundle BundleSid.
        trust_product_sid : ?Text;
        /// The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_created : ?Text;
        /// The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_updated : ?Text;
        /// The SID of the Regulated Item.
        regulated_item_sid : ?Text;
        /// The name of the business or organization using the Tollfree number.
        business_name : ?Text;
        /// The address of the business or organization using the Tollfree number.
        business_street_address : ?Text;
        /// The address of the business or organization using the Tollfree number.
        business_street_address2 : ?Text;
        /// The city of the business or organization using the Tollfree number.
        business_city : ?Text;
        /// The state/province/region of the business or organization using the Tollfree number.
        business_state_province_region : ?Text;
        /// The postal code of the business or organization using the Tollfree number.
        business_postal_code : ?Text;
        /// The country of the business or organization using the Tollfree number.
        business_country : ?Text;
        /// The website of the business or organization using the Tollfree number.
        business_website : ?Text;
        /// The first name of the contact for the business or organization using the Tollfree number.
        business_contact_first_name : ?Text;
        /// The last name of the contact for the business or organization using the Tollfree number.
        business_contact_last_name : ?Text;
        /// The email address of the contact for the business or organization using the Tollfree number.
        business_contact_email : ?Text;
        /// The E.164 formatted phone number of the contact for the business or organization using the Tollfree number.
        business_contact_phone : ?Text;
        /// The email address to receive the notification about the verification result. .
        notification_email : ?Text;
        /// The category of the use case for the Tollfree Number. List as many as are applicable.
        use_case_categories : ?[TollfreeVerificationEnumUseCaseCategoriesInner];
        /// Use this to further explain how messaging is used by the business or organization.
        use_case_summary : ?Text;
        /// An example of message content, i.e. a sample message.
        production_message_sample : ?Text;
        /// Link to an image that shows the opt-in workflow. Multiple images allowed and must be a publicly hosted URL.
        opt_in_image_urls : ?[Text];
        opt_in_type : ?TollfreeVerificationEnumOptInType;
        /// Estimate monthly volume of messages from the Tollfree Number.
        message_volume : ?Text;
        /// Additional information to be provided for verification.
        additional_information : ?Text;
        /// The SID of the Phone Number associated with the Tollfree Verification.
        tollfree_phone_number_sid : ?Text;
        /// The E.164 formatted toll-free phone number associated with the verification.
        tollfree_phone_number : ?Text;
        status : ?TollfreeVerificationEnumStatus;
        /// The absolute URL of the Tollfree Verification resource.
        url : ?Text;
        /// The rejection reason given when a Tollfree Verification has been rejected.
        rejection_reason : ?Text;
        /// The error code given when a Tollfree Verification has been rejected.
        error_code : ?Int;
        /// The date and time when the ability to edit a rejected verification expires.
        edit_expiration : ?Text;
        /// If a rejected verification is allowed to be edited/resubmitted. Some rejection reasons allow editing and some do not.
        edit_allowed : ?Bool;
        /// A legally recognized business registration number
        business_registration_number : ?Text;
        business_registration_authority : ?TollfreeVerificationEnumBusinessRegistrationAuthority;
        /// Country business is registered in
        business_registration_country : ?Text;
        business_type : ?TollfreeVerificationEnumBusinessType;
        /// The E.164 formatted number associated with the business.
        business_registration_phone_number : ?Text;
        /// Trade name, sub entity, or downstream business name of business being submitted for verification
        doing_business_as : ?Text;
        /// The confirmation message sent to users when they opt in to receive messages.
        opt_in_confirmation_message : ?Text;
        /// A sample help message provided to users.
        help_message_sample : ?Text;
        /// The URL to the privacy policy for the business or organization.
        privacy_policy_url : ?Text;
        /// The URL of the terms and conditions for the business or organization.
        terms_and_conditions_url : ?Text;
        /// Indicates if the content is age gated.
        age_gated_content : ?Bool;
        /// List of keywords that users can send to opt in or out of messages.
        opt_in_keywords : ?[Text];
        /// A list of rejection reasons and codes describing why a Tollfree Verification has been rejected.
        rejection_reasons : ?[Text];
        /// The URLs of the documents associated with the Tollfree Verification resource.
        resource_links : ?Text;
        /// An optional external reference ID supplied by customer and echoed back on status retrieval.
        external_reference_id : ?Text;
        vetting_id : ?Text;
        vetting_provider : ?TollfreeVerificationEnumVettingProvider;
        vetting_id_expiration : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1TollfreeVerification type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            customer_profile_sid : ?Text;
            trust_product_sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            regulated_item_sid : ?Text;
            business_name : ?Text;
            business_street_address : ?Text;
            business_street_address2 : ?Text;
            business_city : ?Text;
            business_state_province_region : ?Text;
            business_postal_code : ?Text;
            business_country : ?Text;
            business_website : ?Text;
            business_contact_first_name : ?Text;
            business_contact_last_name : ?Text;
            business_contact_email : ?Text;
            business_contact_phone : ?Text;
            notification_email : ?Text;
            use_case_categories : ?[TollfreeVerificationEnumUseCaseCategoriesInner];
            use_case_summary : ?Text;
            production_message_sample : ?Text;
            opt_in_image_urls : ?[Text];
            opt_in_type : ?TollfreeVerificationEnumOptInType.JSON;
            message_volume : ?Text;
            additional_information : ?Text;
            tollfree_phone_number_sid : ?Text;
            tollfree_phone_number : ?Text;
            status : ?TollfreeVerificationEnumStatus.JSON;
            url : ?Text;
            rejection_reason : ?Text;
            error_code : ?Int;
            edit_expiration : ?Text;
            edit_allowed : ?Bool;
            business_registration_number : ?Text;
            business_registration_authority : ?TollfreeVerificationEnumBusinessRegistrationAuthority.JSON;
            business_registration_country : ?Text;
            business_type : ?TollfreeVerificationEnumBusinessType.JSON;
            business_registration_phone_number : ?Text;
            doing_business_as : ?Text;
            opt_in_confirmation_message : ?Text;
            help_message_sample : ?Text;
            privacy_policy_url : ?Text;
            terms_and_conditions_url : ?Text;
            age_gated_content : ?Bool;
            opt_in_keywords : ?[Text];
            rejection_reasons : ?[Text];
            resource_links : ?Text;
            external_reference_id : ?Text;
            vetting_id : ?Text;
            vetting_provider : ?TollfreeVerificationEnumVettingProvider.JSON;
            vetting_id_expiration : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1TollfreeVerification) : JSON = { value with
            opt_in_type = do ? { TollfreeVerificationEnumOptInType.toJSON(value.opt_in_type!) };
            status = do ? { TollfreeVerificationEnumStatus.toJSON(value.status!) };
            business_registration_authority = do ? { TollfreeVerificationEnumBusinessRegistrationAuthority.toJSON(value.business_registration_authority!) };
            business_type = do ? { TollfreeVerificationEnumBusinessType.toJSON(value.business_type!) };
            vetting_provider = do ? { TollfreeVerificationEnumVettingProvider.toJSON(value.vetting_provider!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1TollfreeVerification {
            ?{ json with
                opt_in_type = do ? { TollfreeVerificationEnumOptInType.fromJSON(json.opt_in_type!)! };
                status = do ? { TollfreeVerificationEnumStatus.fromJSON(json.status!)! };
                business_registration_authority = do ? { TollfreeVerificationEnumBusinessRegistrationAuthority.fromJSON(json.business_registration_authority!)! };
                business_type = do ? { TollfreeVerificationEnumBusinessType.fromJSON(json.business_type!)! };
                vetting_provider = do ? { TollfreeVerificationEnumVettingProvider.fromJSON(json.vetting_provider!)! };
            }
        };
    }
}
