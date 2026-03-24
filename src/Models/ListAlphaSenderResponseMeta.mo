
// ListAlphaSenderResponseMeta.mo

module {
    // User-facing type: what application code uses
    public type ListAlphaSenderResponseMeta = {
        first_page_url : ?Text;
        key : ?Text;
        next_page_url : ?Text;
        page : ?Int;
        page_size : ?Int;
        previous_page_url : ?Text;
        url : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListAlphaSenderResponseMeta type
        public type JSON = {
            first_page_url : ?Text;
            key : ?Text;
            next_page_url : ?Text;
            page : ?Int;
            page_size : ?Int;
            previous_page_url : ?Text;
            url : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListAlphaSenderResponseMeta) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListAlphaSenderResponseMeta = ?json;
    }
}
