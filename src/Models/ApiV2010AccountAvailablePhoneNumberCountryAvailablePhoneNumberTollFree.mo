
import { type ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberLocalCapabilities; JSON = ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberLocalCapabilities } "./ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberLocalCapabilities";

// ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberTollFree.mo

module {
    // User-facing type: what application code uses
    public type ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberTollFree = {
        /// A formatted version of the phone number.
        friendly_name : ?Text;
        /// The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.
        phone_number : ?Text;
        /// The [LATA](https://en.wikipedia.org/wiki/Local_access_and_transport_area) of this phone number. Available for only phone numbers from the US and Canada.
        lata : ?Text;
        /// The locality or city of this phone number's location.
        locality : ?Text;
        /// The [rate center](https://en.wikipedia.org/wiki/Telephone_exchange) of this phone number. Available for only phone numbers from the US and Canada.
        rate_center : ?Text;
        /// The latitude of this phone number's location. Available for only phone numbers from the US and Canada.
        latitude : ?Float;
        /// The longitude of this phone number's location. Available for only phone numbers from the US and Canada.
        longitude : ?Float;
        /// The two-letter state or province abbreviation of this phone number's location. Available for only phone numbers from the US and Canada.
        region_ : ?Text;
        /// The postal or ZIP code of this phone number's location. Available for only phone numbers from the US and Canada.
        postal_code : ?Text;
        /// The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of this phone number.
        iso_country : ?Text;
        /// The type of [Address](https://www.twilio.com/docs/usage/api/address) resource the phone number requires. Can be: `none`, `any`, `local`, or `foreign`. `none` means no address is required. `any` means an address is required, but it can be anywhere in the world. `local` means an address in the phone number's country is required. `foreign` means an address outside of the phone number's country is required.
        address_requirements : ?Text;
        /// Whether the phone number is new to the Twilio platform. Can be: `true` or `false`.
        beta : ?Bool;
        capabilities : ?ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberLocalCapabilities;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberTollFree type
        public type JSON = {
            friendly_name : ?Text;
            phone_number : ?Text;
            lata : ?Text;
            locality : ?Text;
            rate_center : ?Text;
            latitude : ?Float;
            longitude : ?Float;
            region_ : ?Text;
            postal_code : ?Text;
            iso_country : ?Text;
            address_requirements : ?Text;
            beta : ?Bool;
            capabilities : ?ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberLocalCapabilities;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberTollFree) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ApiV2010AccountAvailablePhoneNumberCountryAvailablePhoneNumberTollFree = ?json;
    }
}
