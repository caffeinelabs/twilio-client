
// StreamEnumTrack.mo
/// The tracks to be included in the Stream. Possible values are `inbound_track`, `outbound_track`, `both_tracks`. Default value is `inbound_track`.
/// Enum values: #inbound_track, #outbound_track, #both_tracks

module {
    // User-facing type: type-safe variants for application code
    public type StreamEnumTrack = {
        #inbound_track;
        #outbound_track;
        #both_tracks;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer StreamEnumTrack type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : StreamEnumTrack) : JSON =
            switch (value) {
                case (#inbound_track) "inbound_track";
                case (#outbound_track) "outbound_track";
                case (#both_tracks) "both_tracks";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?StreamEnumTrack =
            switch (json) {
                case "inbound_track" ?#inbound_track;
                case "outbound_track" ?#outbound_track;
                case "both_tracks" ?#both_tracks;
                case _ null;
            };
    }
}
