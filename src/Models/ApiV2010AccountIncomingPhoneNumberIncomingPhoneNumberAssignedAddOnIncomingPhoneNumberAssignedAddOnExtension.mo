
// ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOnIncomingPhoneNumberAssignedAddOnExtension.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOnIncomingPhoneNumberAssignedAddOnExtension = {
        /// The unique string that that we created to identify the resource.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the resource.
        account_sid : ?Text;
        /// The SID of the Phone Number to which the Add-on is assigned.
        resource_sid : ?Text;
        /// The SID that uniquely identifies the assigned Add-on installation.
        assigned_add_on_sid : ?Text;
        /// The string that you assigned to describe the resource.
        friendly_name : ?Text;
        /// A string that you assigned to describe the Product this Extension is used within.
        product_name : ?Text;
        /// An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
        unique_name : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        /// Whether the Extension will be invoked.
        enabled : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOnIncomingPhoneNumberAssignedAddOnExtension type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            resource_sid : ?Text;
            assigned_add_on_sid : ?Text;
            friendly_name : ?Text;
            product_name : ?Text;
            unique_name : ?Text;
            uri : ?Text;
            enabled : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOnIncomingPhoneNumberAssignedAddOnExtension) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountIncomingPhoneNumberIncomingPhoneNumberAssignedAddOnIncomingPhoneNumberAssignedAddOnExtension = ?json;
    }
}
