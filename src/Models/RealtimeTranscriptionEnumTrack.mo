
// RealtimeTranscriptionEnumTrack.mo
/// One of `inbound_track`, `outbound_track`, `both_tracks`.
/// Enum values: #inbound_track, #outbound_track, #both_tracks

module {
    // User-facing type: type-safe variants for application code
    public type RealtimeTranscriptionEnumTrack = {
        #inbound_track;
        #outbound_track;
        #both_tracks;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer RealtimeTranscriptionEnumTrack type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : RealtimeTranscriptionEnumTrack) : JSON =
            switch (value) {
                case (#inbound_track) "inbound_track";
                case (#outbound_track) "outbound_track";
                case (#both_tracks) "both_tracks";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?RealtimeTranscriptionEnumTrack =
            switch (json) {
                case "inbound_track" ?#inbound_track;
                case "outbound_track" ?#outbound_track;
                case "both_tracks" ?#both_tracks;
                case _ null;
            };
    }
}
