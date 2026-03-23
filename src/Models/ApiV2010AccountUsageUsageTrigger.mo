
import { type ApiV2010AccountUsageUsageTriggerCallbackMethod; JSON = ApiV2010AccountUsageUsageTriggerCallbackMethod } "./ApiV2010AccountUsageUsageTriggerCallbackMethod";

import { type UsageTriggerEnumRecurring; JSON = UsageTriggerEnumRecurring } "./UsageTriggerEnumRecurring";

import { type UsageTriggerEnumTriggerField; JSON = UsageTriggerEnumTriggerField } "./UsageTriggerEnumTriggerField";

// ApiV2010AccountUsageUsageTrigger.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountUsageUsageTrigger = {
        /// The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that the trigger monitors.
        account_sid : ?Text;
        /// The API version used to create the resource.
        api_version : ?Text;
        callback_method : ?ApiV2010AccountUsageUsageTriggerCallbackMethod;
        /// The URL we call using the `callback_method` when the trigger fires.
        callback_url : ?Text;
        /// The current value of the field the trigger is watching.
        current_value : ?Text;
        /// The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_created : ?Text;
        /// The date and time in GMT that the trigger was last fired specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_fired : ?Text;
        /// The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
        date_updated : ?Text;
        /// The string that you assigned to describe the trigger.
        friendly_name : ?Text;
        recurring : ?UsageTriggerEnumRecurring;
        /// The unique string that that we created to identify the UsageTrigger resource.
        sid : ?Text;
        trigger_by : ?UsageTriggerEnumTriggerField;
        /// The value at which the trigger will fire.  Must be a positive, numeric value.
        trigger_value : ?Text;
        /// The URI of the resource, relative to `https://api.twilio.com`.
        uri : ?Text;
        /// The usage category the trigger watches. Must be one of the supported [usage categories](https://www.twilio.com/docs/usage/api/usage-record#usage-categories).
        usage_category : ?Text;
        /// The URI of the [UsageRecord](https://www.twilio.com/docs/usage/api/usage-record) resource this trigger watches, relative to `https://api.twilio.com`.
        usage_record_uri : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountUsageUsageTrigger type
        public type JSON = {
            account_sid : ?Text;
            api_version : ?Text;
            callback_method : ?ApiV2010AccountUsageUsageTriggerCallbackMethod.JSON;
            callback_url : ?Text;
            current_value : ?Text;
            date_created : ?Text;
            date_fired : ?Text;
            date_updated : ?Text;
            friendly_name : ?Text;
            recurring : ?UsageTriggerEnumRecurring.JSON;
            sid : ?Text;
            trigger_by : ?UsageTriggerEnumTriggerField.JSON;
            trigger_value : ?Text;
            uri : ?Text;
            usage_category : ?Text;
            usage_record_uri : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountUsageUsageTrigger) : JSON = { value with
            callback_method = do ? { ApiV2010AccountUsageUsageTriggerCallbackMethod.toJSON(value.callback_method!) };
            recurring = do ? { UsageTriggerEnumRecurring.toJSON(value.recurring!) };
            trigger_by = do ? { UsageTriggerEnumTriggerField.toJSON(value.trigger_by!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountUsageUsageTrigger {
            ?{ json with
                callback_method = do ? { ApiV2010AccountUsageUsageTriggerCallbackMethod.fromJSON(json.callback_method!)! };
                recurring = do ? { UsageTriggerEnumRecurring.fromJSON(json.recurring!)! };
                trigger_by = do ? { UsageTriggerEnumTriggerField.fromJSON(json.trigger_by!)! };
            }
        };
    }
}
