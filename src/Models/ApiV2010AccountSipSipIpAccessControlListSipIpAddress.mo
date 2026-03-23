
// ApiV2010AccountSipSipIpAccessControlListSipIpAddress.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountSipSipIpAccessControlListSipIpAddress = {
        /// A 34 character string that uniquely identifies this resource.
        sid : ?Text;
        /// The unique id of the Account that is responsible for this resource.
        account_sid : ?Text;
        /// A human readable descriptive text for this resource, up to 255 characters long.
        friendly_name : ?Text;
        /// An IP address in dotted decimal notation from which you want to accept traffic. Any SIP requests from this IP address will be allowed by Twilio. IPv4 only supported today.
        ip_address : ?Text;
        /// An integer representing the length of the CIDR prefix to use with this IP address when accepting traffic. By default the entire IP address is used.
        cidr_prefix_length : ?Int;
        /// The unique id of the IpAccessControlList resource that includes this resource.
        ip_access_control_list_sid : ?Text;
        /// The date that this resource was created, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
        date_created : ?Text;
        /// The date that this resource was last updated, given as GMT in [RFC 2822](https://www.php.net/manual/en/class.datetime.php#datetime.constants.rfc2822) format.
        date_updated : ?Text;
        /// The URI for this resource, relative to `https://api.twilio.com`
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountSipSipIpAccessControlListSipIpAddress type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            friendly_name : ?Text;
            ip_address : ?Text;
            cidr_prefix_length : ?Int;
            ip_access_control_list_sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountSipSipIpAccessControlListSipIpAddress) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountSipSipIpAccessControlListSipIpAddress = ?json;
    }
}
