
import { type MessageEnumDirection; JSON = MessageEnumDirection } "./MessageEnumDirection";

import { type MessageEnumStatus; JSON = MessageEnumStatus } "./MessageEnumStatus";

// ApiV2010AccountMessage.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountMessage = {
        /// The text content of the message
        body : ?Text;
        /// The number of segments that make up the complete message. SMS message bodies that exceed the [character limit](https://www.twilio.com/docs/glossary/what-sms-character-limit) are segmented and charged as multiple messages. Note: For messages sent via a Messaging Service, `num_segments` is initially `0`, since a sender hasn't yet been assigned.
        num_segments : ?Text;
        direction : ?MessageEnumDirection;
        /// The sender's phone number (in [E.164](https://en.wikipedia.org/wiki/E.164) format), [alphanumeric sender ID](https://www.twilio.com/docs/sms/quickstart), [Wireless SIM](https://www.twilio.com/docs/iot/wireless/programmable-wireless-send-machine-machine-sms-commands), [short code](https://www.twilio.com/en-us/messaging/channels/sms/short-codes), or  [channel address](https://www.twilio.com/docs/messaging/channels) (e.g., `whatsapp:+15554449999`). For incoming messages, this is the number or channel address of the sender. For outgoing messages, this value is a Twilio phone number, alphanumeric sender ID, short code, or channel address from which the message is sent.
        from : ?Text;
        /// The recipient's phone number (in [E.164](https://en.wikipedia.org/wiki/E.164) format) or [channel address](https://www.twilio.com/docs/messaging/channels) (e.g. `whatsapp:+15552229999`)
        to : ?Text;
        /// The [RFC 2822](https://datatracker.ietf.org/doc/html/rfc2822#section-3.3) timestamp (in GMT) of when the Message resource was last updated
        date_updated : ?Text;
        /// The amount billed for the message in the currency specified by `price_unit`. The `price` is populated after the message has been sent/received, and may not be immediately availalble. View the [Pricing page](https://www.twilio.com/en-us/pricing) for more details.
        price : ?Text;
        /// The description of the `error_code` if the Message `status` is `failed` or `undelivered`. If no error was encountered, the value is `null`. The value returned in this field for a specific error cause is subject to change as Twilio improves errors. Users should not use the `error_code` and `error_message` fields programmatically.
        error_message : ?Text;
        /// The URI of the Message resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) associated with the Message resource
        account_sid : ?Text;
        /// The number of media files associated with the Message resource.
        num_media : ?Text;
        status : ?MessageEnumStatus;
        /// The SID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) associated with the Message resource. A unique default value is assigned if a Messaging Service is not used.
        messaging_service_sid : ?Text;
        /// The unique, Twilio-provided string that identifies the Message resource.
        sid : ?Text;
        /// The [RFC 2822](https://datatracker.ietf.org/doc/html/rfc2822#section-3.3) timestamp (in GMT) of when the Message was sent. For an outgoing message, this is when Twilio sent the message. For an incoming message, this is when Twilio sent the HTTP request to your incoming message webhook URL.
        date_sent : ?Text;
        /// The [RFC 2822](https://datatracker.ietf.org/doc/html/rfc2822#section-3.3) timestamp (in GMT) of when the Message resource was created
        date_created : ?Text;
        /// The [error code](https://www.twilio.com/docs/api/errors) returned if the Message `status` is `failed` or `undelivered`. If no error was encountered, the value is `null`. The value returned in this field for a specific error cause is subject to change as Twilio improves errors. Users should not use the `error_code` and `error_message` fields programmatically.
        error_code : ?Int;
        /// The currency in which `price` is measured, in [ISO 4127](https://www.iso.org/iso/home/standards/currency_codes.htm) format (e.g. `usd`, `eur`, `jpy`).
        price_unit : ?Text;
        /// The API version used to process the Message
        api_version : ?Text;
        /// A list of related resources identified by their URIs relative to `https://api.twilio.com`
        subresource_uris : ?Any;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountMessage type
        public type JSON = {
            body : ?Text;
            num_segments : ?Text;
            direction : ?MessageEnumDirection.JSON;
            from : ?Text;
            to : ?Text;
            date_updated : ?Text;
            price : ?Text;
            error_message : ?Text;
            uri : ?Text;
            account_sid : ?Text;
            num_media : ?Text;
            status : ?MessageEnumStatus.JSON;
            messaging_service_sid : ?Text;
            sid : ?Text;
            date_sent : ?Text;
            date_created : ?Text;
            error_code : ?Int;
            price_unit : ?Text;
            api_version : ?Text;
            subresource_uris : ?Any;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountMessage) : JSON = { value with
            direction = do ? { MessageEnumDirection.toJSON(value.direction!) };
            status = do ? { MessageEnumStatus.toJSON(value.status!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountMessage {
            ?{ json with
                direction = do ? { MessageEnumDirection.fromJSON(json.direction!)! };
                status = do ? { MessageEnumStatus.fromJSON(json.status!)! };
            }
        };
    }
}
