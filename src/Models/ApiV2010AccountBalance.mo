
// ApiV2010AccountBalance.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountBalance = {
        /// The unique SID identifier of the Account.
        account_sid : ?Text;
        /// The balance of the Account, in units specified by the unit parameter. Balance changes may not be reflected immediately. Child accounts do not contain balance information
        balance : ?Text;
        /// The units of currency for the account balance
        currency : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountBalance type
        public type JSON = {
            account_sid : ?Text;
            balance : ?Text;
            currency : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountBalance) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountBalance = ?json;
    }
}
