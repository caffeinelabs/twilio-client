
// MessageEnumStatus.mo
/// The status of the Message. Possible values: `accepted`, `scheduled`, `canceled`, `queued`, `sending`, `sent`, `failed`, `delivered`, `undelivered`, `receiving`, `received`, or `read` (WhatsApp only). For more information, See [detailed descriptions](https://www.twilio.com/docs/sms/api/message-resource#message-status-values).
/// Enum values: #queued, #sending, #sent, #failed, #delivered, #undelivered, #receiving, #received, #accepted, #scheduled, #read, #partially_delivered, #canceled

module {
    // User-facing type: type-safe variants for application code
    public type MessageEnumStatus = {
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
        // Named "JSON" to avoid shadowing the outer MessageEnumStatus type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessageEnumStatus) : JSON =
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
        public func fromJSON(json : JSON) : ?MessageEnumStatus =
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
