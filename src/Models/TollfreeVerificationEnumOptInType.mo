
// TollfreeVerificationEnumOptInType.mo
/// Describe how a user opts-in to text messages.
/// Enum values: #verbal, #web_form, #paper_form, #via_text, #mobile_qr_code, #import_, #import_please_replace

module {
    // User-facing type: type-safe variants for application code
    public type TollfreeVerificationEnumOptInType = {
        #verbal;
        #web_form;
        #paper_form;
        #via_text;
        #mobile_qr_code;
        #import_;
        #import_please_replace;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TollfreeVerificationEnumOptInType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TollfreeVerificationEnumOptInType) : JSON =
            switch (value) {
                case (#verbal) "VERBAL";
                case (#web_form) "WEB_FORM";
                case (#paper_form) "PAPER_FORM";
                case (#via_text) "VIA_TEXT";
                case (#mobile_qr_code) "MOBILE_QR_CODE";
                case (#import_) "IMPORT";
                case (#import_please_replace) "IMPORT_PLEASE_REPLACE";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TollfreeVerificationEnumOptInType =
            switch (json) {
                case "VERBAL" ?#verbal;
                case "WEB_FORM" ?#web_form;
                case "PAPER_FORM" ?#paper_form;
                case "VIA_TEXT" ?#via_text;
                case "MOBILE_QR_CODE" ?#mobile_qr_code;
                case "IMPORT" ?#import_;
                case "IMPORT_PLEASE_REPLACE" ?#import_please_replace;
                case _ null;
            };
    }
}
