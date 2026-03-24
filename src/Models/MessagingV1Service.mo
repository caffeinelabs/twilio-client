
import { type MessagingV1ServiceFallbackMethod; JSON = MessagingV1ServiceFallbackMethod } "./MessagingV1ServiceFallbackMethod";

import { type MessagingV1ServiceInboundMethod; JSON = MessagingV1ServiceInboundMethod } "./MessagingV1ServiceInboundMethod";

import { type ServiceEnumScanMessageContent; JSON = ServiceEnumScanMessageContent } "./ServiceEnumScanMessageContent";

// MessagingV1Service.mo

module {
    // User-facing type: what application code uses
    public type MessagingV1Service = {
        /// The unique string that we created to identify the Service resource.
        sid : ?Text;
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Service resource.
        account_sid : ?Text;
        /// The string that you assigned to describe the resource.
        friendly_name : ?Text;
        /// The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_created : ?Text;
        /// The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
        date_updated : ?Text;
        /// The URL we call using `inbound_method` when a message is received by any phone number or short code in the Service. When this property is `null`, receiving inbound messages is disabled. All messages sent to the Twilio phone number or short code will not be logged and received on the Account. If the `use_inbound_webhook_on_number` field is enabled then the webhook url defined on the phone number will override the `inbound_request_url` defined for the Messaging Service.
        inbound_request_url : ?Text;
        inbound_method : ?MessagingV1ServiceInboundMethod;
        /// The URL that we call using `fallback_method` if an error occurs while retrieving or executing the TwiML from the Inbound Request URL. If the `use_inbound_webhook_on_number` field is enabled then the webhook url defined on the phone number will override the `fallback_url` defined for the Messaging Service.
        fallback_url : ?Text;
        fallback_method : ?MessagingV1ServiceFallbackMethod;
        /// The URL we call to [pass status updates](https://www.twilio.com/docs/sms/api/message-resource#message-status-values) about message delivery.
        status_callback : ?Text;
        /// Whether to enable [Sticky Sender](https://www.twilio.com/docs/messaging/services#sticky-sender) on the Service instance.
        sticky_sender : ?Bool;
        /// Whether to enable the [MMS Converter](https://www.twilio.com/docs/messaging/services#mms-converter) for messages sent through the Service instance.
        mms_converter : ?Bool;
        /// Whether to enable [Smart Encoding](https://www.twilio.com/docs/messaging/services#smart-encoding) for messages sent through the Service instance.
        smart_encoding : ?Bool;
        scan_message_content : ?ServiceEnumScanMessageContent;
        /// [OBSOLETE] Former feature used to fallback to long code sender after certain short code message failures.
        fallback_to_long_code : ?Bool;
        /// Whether to enable [Area Code Geomatch](https://www.twilio.com/docs/messaging/services#area-code-geomatch) on the Service Instance.
        area_code_geomatch : ?Bool;
        /// Reserved.
        synchronous_validation : ?Bool;
        /// How long, in seconds, messages sent from the Service are valid. Can be an integer from `1` to `36,000`. Default value is `36,000`.
        validity_period : ?Int;
        /// The absolute URL of the Service resource.
        url : ?Text;
        /// The absolute URLs of related resources.
        links : ?Any;
        /// A string that describes the scenario in which the Messaging Service will be used. Possible values are `notifications`, `marketing`, `verification`, `discussion`, `poll`, `undeclared`.
        usecase : ?Text;
        /// Whether US A2P campaign is registered for this Service.
        us_app_to_person_registered : ?Bool;
        /// A boolean value that indicates either the webhook url configured on the phone number will be used or `inbound_request_url`/`fallback_url` url will be called when a message is received from the phone number. If this field is enabled then the webhook url defined on the phone number will override the `inbound_request_url`/`fallback_url` defined for the Messaging Service.
        use_inbound_webhook_on_number : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MessagingV1Service type
        public type JSON = {
            sid : ?Text;
            account_sid : ?Text;
            friendly_name : ?Text;
            date_created : ?Text;
            date_updated : ?Text;
            inbound_request_url : ?Text;
            inbound_method : ?MessagingV1ServiceInboundMethod.JSON;
            fallback_url : ?Text;
            fallback_method : ?MessagingV1ServiceFallbackMethod.JSON;
            status_callback : ?Text;
            sticky_sender : ?Bool;
            mms_converter : ?Bool;
            smart_encoding : ?Bool;
            scan_message_content : ?ServiceEnumScanMessageContent.JSON;
            fallback_to_long_code : ?Bool;
            area_code_geomatch : ?Bool;
            synchronous_validation : ?Bool;
            validity_period : ?Int;
            url : ?Text;
            links : ?Any;
            usecase : ?Text;
            us_app_to_person_registered : ?Bool;
            use_inbound_webhook_on_number : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MessagingV1Service) : JSON = { value with
            inbound_method = do ? { MessagingV1ServiceInboundMethod.toJSON(value.inbound_method!) };
            fallback_method = do ? { MessagingV1ServiceFallbackMethod.toJSON(value.fallback_method!) };
            scan_message_content = do ? { ServiceEnumScanMessageContent.toJSON(value.scan_message_content!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MessagingV1Service {
            ?{ json with
                inbound_method = do ? { MessagingV1ServiceInboundMethod.fromJSON(json.inbound_method!)! };
                fallback_method = do ? { MessagingV1ServiceFallbackMethod.fromJSON(json.fallback_method!)! };
                scan_message_content = do ? { ServiceEnumScanMessageContent.fromJSON(json.scan_message_content!)! };
            }
        };
    }
}
