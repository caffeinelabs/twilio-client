
// TollfreeVerificationEnumBusinessRegistrationAuthority.mo
/// The organizational authority for business registrations. Required for all business types except SOLE_PROPRIETOR.
/// Enum values: #ein, #cbn, #crn, #provincial_number, #vat, #acn, #abn, #brn, #siren, #siret, #nzbn, #ust_idnr, #cif, #nif, #cnpj, #uid, #neq, #other

module {
    // User-facing type: type-safe variants for application code
    public type TollfreeVerificationEnumBusinessRegistrationAuthority = {
        #ein;
        #cbn;
        #crn;
        #provincial_number;
        #vat;
        #acn;
        #abn;
        #brn;
        #siren;
        #siret;
        #nzbn;
        #ust_idnr;
        #cif;
        #nif;
        #cnpj;
        #uid;
        #neq;
        #other;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TollfreeVerificationEnumBusinessRegistrationAuthority type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TollfreeVerificationEnumBusinessRegistrationAuthority) : JSON =
            switch (value) {
                case (#ein) "EIN";
                case (#cbn) "CBN";
                case (#crn) "CRN";
                case (#provincial_number) "PROVINCIAL_NUMBER";
                case (#vat) "VAT";
                case (#acn) "ACN";
                case (#abn) "ABN";
                case (#brn) "BRN";
                case (#siren) "SIREN";
                case (#siret) "SIRET";
                case (#nzbn) "NZBN";
                case (#ust_idnr) "USt-IdNr";
                case (#cif) "CIF";
                case (#nif) "NIF";
                case (#cnpj) "CNPJ";
                case (#uid) "UID";
                case (#neq) "NEQ";
                case (#other) "OTHER";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TollfreeVerificationEnumBusinessRegistrationAuthority =
            switch (json) {
                case "EIN" ?#ein;
                case "CBN" ?#cbn;
                case "CRN" ?#crn;
                case "PROVINCIAL_NUMBER" ?#provincial_number;
                case "VAT" ?#vat;
                case "ACN" ?#acn;
                case "ABN" ?#abn;
                case "BRN" ?#brn;
                case "SIREN" ?#siren;
                case "SIRET" ?#siret;
                case "NZBN" ?#nzbn;
                case "USt-IdNr" ?#ust_idnr;
                case "CIF" ?#cif;
                case "NIF" ?#nif;
                case "CNPJ" ?#cnpj;
                case "UID" ?#uid;
                case "NEQ" ?#neq;
                case "OTHER" ?#other;
                case _ null;
            };
    }
}
