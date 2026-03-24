
// TollfreeVerificationEnumBusinessType.mo
/// The type of business, valid values are PRIVATE_PROFIT, PUBLIC_PROFIT, NON_PROFIT, SOLE_PROPRIETOR, GOVERNMENT. Required field.
/// Enum values: #private_profit, #public_profit, #sole_proprietor, #non_profit, #government

module {
    // User-facing type: type-safe variants for application code
    public type TollfreeVerificationEnumBusinessType = {
        #private_profit;
        #public_profit;
        #sole_proprietor;
        #non_profit;
        #government;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TollfreeVerificationEnumBusinessType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TollfreeVerificationEnumBusinessType) : JSON =
            switch (value) {
                case (#private_profit) "PRIVATE_PROFIT";
                case (#public_profit) "PUBLIC_PROFIT";
                case (#sole_proprietor) "SOLE_PROPRIETOR";
                case (#non_profit) "NON_PROFIT";
                case (#government) "GOVERNMENT";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TollfreeVerificationEnumBusinessType =
            switch (json) {
                case "PRIVATE_PROFIT" ?#private_profit;
                case "PUBLIC_PROFIT" ?#public_profit;
                case "SOLE_PROPRIETOR" ?#sole_proprietor;
                case "NON_PROFIT" ?#non_profit;
                case "GOVERNMENT" ?#government;
                case _ null;
            };
    }
}
