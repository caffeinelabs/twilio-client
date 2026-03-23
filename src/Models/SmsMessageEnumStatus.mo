
// SmsMessageEnumStatus.mo
/// Enum values: #queued, #sending, #sent, #failed, #delivered, #undelivered, #receiving, #received, #accepted, #scheduled, #read, #partially_delivered, #canceled

module {
    // User-facing type: type-safe variants for application code
    public type SmsMessageEnumStatus = {
        #queued;
        #sending;
        #sent;
        #failed;
        #delivered;
        #undelivered;
        #receiving;
        #received;
        #accepted;
        #scheduled;
        #read;
        #partially_delivered;
        #canceled;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SmsMessageEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SmsMessageEnumStatus) : JSON =
            switch (value) {
                case (#queued) "queued";
                case (#sending) "sending";
                case (#sent) "sent";
                case (#failed) "failed";
                case (#delivered) "delivered";
                case (#undelivered) "undelivered";
                case (#receiving) "receiving";
                case (#received) "received";
                case (#accepted) "accepted";
                case (#scheduled) "scheduled";
                case (#read) "read";
                case (#partially_delivered) "partially_delivered";
                case (#canceled) "canceled";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SmsMessageEnumStatus =
            switch (json) {
                case "queued" ?#queued;
                case "sending" ?#sending;
                case "sent" ?#sent;
                case "failed" ?#failed;
                case "delivered" ?#delivered;
                case "undelivered" ?#undelivered;
                case "receiving" ?#receiving;
                case "received" ?#received;
                case "accepted" ?#accepted;
                case "scheduled" ?#scheduled;
                case "read" ?#read;
                case "partially_delivered" ?#partially_delivered;
                case "canceled" ?#canceled;
                case _ null;
            };
    }
}
