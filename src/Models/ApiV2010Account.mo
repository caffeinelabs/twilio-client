
import { type AccountEnumStatus; JSON = AccountEnumStatus } "./AccountEnumStatus";

import { type AccountEnumType; JSON = AccountEnumType } "./AccountEnumType";

// ApiV2010Account.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010Account = {
        /// The authorization token for this account. This token should be kept a secret, so no sharing.
        auth_token : ?Text;
        /// The date that this account was created, in GMT in RFC 2822 format
        date_created : ?Text;
        /// The date that this account was last updated, in GMT in RFC 2822 format.
        date_updated : ?Text;
        /// A human readable description of this account, up to 64 characters long. By default the FriendlyName is your email address.
        friendly_name : ?Text;
        /// The unique 34 character id that represents the parent of this account. The OwnerAccountSid of a parent account is it's own sid.
        owner_account_sid : ?Text;
        /// A 34 character string that uniquely identifies this resource.
        sid : ?Text;
        status : ?AccountEnumStatus;
        /// A Map of various subresources available for the given Account Instance
        subresource_uris : ?Any;
        type_ : ?AccountEnumType;
        /// The URI for this resource, relative to `https://api.twilio.com`
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010Account type
        public type JSON = {
            auth_token : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            friendly_name : ?Text;
            owner_account_sid : ?Text;
            sid : ?Text;
            status : ?AccountEnumStatus.JSON;
            subresource_uris : ?Any;
            type_ : ?AccountEnumType.JSON;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010Account) : JSON = { value with
            status = do ? { AccountEnumStatus.toJSON(value.status!) };
            type_ = do ? { AccountEnumType.toJSON(value.type_!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010Account {
            ?{ json with
                status = do ? { AccountEnumStatus.fromJSON(json.status!)! };
                type_ = do ? { AccountEnumType.fromJSON(json.type_!)! };
            }
        };
    }
}
