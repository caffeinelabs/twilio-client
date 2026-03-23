
// ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn = {
        /// The unique string that that we created to identify the resource.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the resource.
        account_sid : ?Text;
        /// The SID of the Phone Number to which the Add-on is assigned.
        resource_sid : ?Text;
        /// The string that you assigned to describe the resource.
        friendly_name : ?Text;
        /// A short description of the functionality that the Add-on provides.
        description : ?Text;
        /// A JSON string that represents the current configuration of this Add-on installation.
        configuration : ?Text;
        /// An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
        unique_name : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        /// A list of related resources identified by their relative URIs.
        subresource_uris : ?Any;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            resource_sid : ?Text;
            friendly_name : ?Text;
            description : ?Text;
            configuration : ?Text;
            unique_name : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            uri : ?Text;
            subresource_uris : ?Any;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOn = ?json;
    }
}
