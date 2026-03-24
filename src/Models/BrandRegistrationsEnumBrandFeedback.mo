
// BrandRegistrationsEnumBrandFeedback.mo
/// DEPRECATED. Feedback on how to improve brand score
/// Enum values: #tax_id, #stock_symbol, #nonprofit, #government_entity, #others

module {
    // User-facing type: type-safe variants for application code
    public type BrandRegistrationsEnumBrandFeedback = {
        #tax_id;
        #stock_symbol;
        #nonprofit;
        #government_entity;
        #others;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer BrandRegistrationsEnumBrandFeedback type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : BrandRegistrationsEnumBrandFeedback) : JSON =
            switch (value) {
                case (#tax_id) "TAX_ID";
                case (#stock_symbol) "STOCK_SYMBOL";
                case (#nonprofit) "NONPROFIT";
                case (#government_entity) "GOVERNMENT_ENTITY";
                case (#others) "OTHERS";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?BrandRegistrationsEnumBrandFeedback =
            switch (json) {
                case "TAX_ID" ?#tax_id;
                case "STOCK_SYMBOL" ?#stock_symbol;
                case "NONPROFIT" ?#nonprofit;
                case "GOVERNMENT_ENTITY" ?#government_entity;
                case "OTHERS" ?#others;
                case _ null;
            };
    }
}
