
import { type ApiV2010AccountTokenIceServersInner; JSON = ApiV2010AccountTokenIceServersInner } "./ApiV2010AccountTokenIceServersInner";

// ApiV2010AccountToken.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountToken = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Token resource.
        account_sid : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// An array representing the ephemeral credentials and the STUN and TURN server URIs.
        ice_servers : ?[ApiV2010AccountTokenIceServersInner];
        /// The temporary password that the username will use when authenticating with Twilio.
        password : ?Text;
        /// The duration in seconds for which the username and password are valid.
        ttl : ?Text;
        /// The temporary username that uniquely identifies a Token.
        username : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountToken type
        public type JSON = {
            account_sid : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            ice_servers : ?[ApiV2010AccountTokenIceServersInner];
            password : ?Text;
            ttl : ?Text;
            username : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountToken) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountToken = ?json;
    }
}
