
import { type ApiV2010AccountQueueMember; JSON = ApiV2010AccountQueueMember } "./ApiV2010AccountQueueMember";

// ListMemberResponse.mo

module {
    // User-facing type: what application code uses
    public type ListMemberResponse = {
        queue_members : ?[ApiV2010AccountQueueMember];
        end : ?Int;
        first_page_uri : ?Text;
        next_page_uri : ?Text;
        page : ?Int;
        page_size : ?Int;
        previous_page_uri : ?Text;
        start : ?Int;
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ListMemberResponse type
        public type JSON = {
            queue_members : ?[ApiV2010AccountQueueMember];
            end : ?Int;
            first_page_uri : ?Text;
            next_page_uri : ?Text;
            page : ?Int;
            page_size : ?Int;
            previous_page_uri : ?Text;
            start : ?Int;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ListMemberResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ListMemberResponse = ?json;
    }
}
