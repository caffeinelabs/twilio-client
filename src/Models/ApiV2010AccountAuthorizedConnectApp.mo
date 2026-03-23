
import { type AuthorizedConnectAppEnumPermission; JSON = AuthorizedConnectAppEnumPermission } "./AuthorizedConnectAppEnumPermission";

// ApiV2010AccountAuthorizedConnectApp.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountAuthorizedConnectApp = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the AuthorizedConnectApp resource.
        account_sid : ?Text;
        /// The company name set for the Connect App.
        connect_app_company_name : ?Text;
        /// A detailed description of the Connect App.
        connect_app_description : ?Text;
        /// The name of the Connect App.
        connect_app_friendly_name : ?Text;
        /// The public URL for the Connect App.
        connect_app_homepage_url : ?Text;
        /// The SID that we assigned to the Connect App.
        connect_app_sid : ?Text;
        /// The set of permissions that you authorized for the Connect App.  Can be: `get-all` or `post-all`.
        permissions : ?[AuthorizedConnectAppEnumPermission];
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountAuthorizedConnectApp type
        public type JSON = {
            account_sid : ?Text;
            connect_app_company_name : ?Text;
            connect_app_description : ?Text;
            connect_app_friendly_name : ?Text;
            connect_app_homepage_url : ?Text;
            connect_app_sid : ?Text;
            permissions : ?[AuthorizedConnectAppEnumPermission];
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountAuthorizedConnectApp) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountAuthorizedConnectApp = ?json;
    }
}
