
import { type ApiV2010AccountConnectAppDeauthorizeCallbackMethod; JSON = ApiV2010AccountConnectAppDeauthorizeCallbackMethod } "./ApiV2010AccountConnectAppDeauthorizeCallbackMethod";

import { type ConnectAppEnumPermission; JSON = ConnectAppEnumPermission } "./ConnectAppEnumPermission";

// ApiV2010AccountConnectApp.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountConnectApp = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the ConnectApp resource.
        account_sid : ?Text;
        /// The URL we redirect the user to after we authenticate the user and obtain authorization to access the Connect App.
        authorize_redirect_url : ?Text;
        /// The company name set for the Connect App.
        company_name : ?Text;
        deauthorize_callback_method : ?ApiV2010AccountConnectAppDeauthorizeCallbackMethod;
        /// The URL we call using the `deauthorize_callback_method` to de-authorize the Connect App.
        deauthorize_callback_url : ?Text;
        /// The description of the Connect App.
        description : ?Text;
        /// The string that you assigned to describe the resource.
        friendly_name : ?Text;
        /// The public URL where users can obtain more information about this Connect App.
        homepage_url : ?Text;
        /// The set of permissions that your ConnectApp requests.
        permissions : ?[ConnectAppEnumPermission];
        /// The unique string that that we created to identify the ConnectApp resource.
        sid : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountConnectApp type
        public type JSON = {
            account_sid : ?Text;
            authorize_redirect_url : ?Text;
            company_name : ?Text;
            deauthorize_callback_method : ?ApiV2010AccountConnectAppDeauthorizeCallbackMethod.JSON;
            deauthorize_callback_url : ?Text;
            description : ?Text;
            friendly_name : ?Text;
            homepage_url : ?Text;
            permissions : ?[ConnectAppEnumPermission];
            sid : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountConnectApp) : JSON = { value with
            deauthorize_callback_method = do ? { ApiV2010AccountConnectAppDeauthorizeCallbackMethod.toJSON(value.deauthorize_callback_method!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountConnectApp {
            ?{ json with
                deauthorize_callback_method = do ? { ApiV2010AccountConnectAppDeauthorizeCallbackMethod.fromJSON(json.deauthorize_callback_method!)! };
            }
        };
    }
}
