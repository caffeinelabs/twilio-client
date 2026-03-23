
// ApiV2010AccountMessageMedia.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountMessageMedia = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) associated with this Media resource.
        account_sid : ?Text;
        /// The default [MIME type](https://en.wikipedia.org/wiki/Internet_media_type) of the media, for example `image/jpeg`, `image/png`, or `image/gif`.
        content_type : ?Text;
        /// The date and time in GMT when this Media resource was created, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT when this Media resource was last updated, specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The SID of the Message resource that is associated with this Media resource.
        parent_sid : ?Text;
        /// The unique string that identifies this Media resource.
        sid : ?Text;
        /// The URI of this Media resource, relative to `https://api.twilio.com`.
        uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountMessageMedia type
        public type JSON = {
            account_sid : ?Text;
            content_type : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            parent_sid : ?Text;
            sid : ?Text;
            uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountMessageMedia) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountMessageMedia = ?json;
    }
}
