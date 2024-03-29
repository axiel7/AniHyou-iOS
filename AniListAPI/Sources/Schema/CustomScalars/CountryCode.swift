// @generated
// This file was automatically generated and can be edited to
// implement advanced custom scalar functionality.
//
// Any changes to this file will not be overwritten by future
// code generation execution.

import ApolloAPI

/// ISO 3166-1 alpha-2 country code
public typealias CountryCode = CountryOfOrigin

public enum CountryOfOrigin: String, CustomScalarType, CaseIterable, Hashable {
    case japan = "JP"
    case southKorea = "KR"
    case china = "CN"
    case taiwan = "TW"
    
    public init(_jsonValue value: JSONValue) throws {
        if 
            let rawValue = value as? String,
            let countryOfOrigin = CountryOfOrigin(rawValue: rawValue)
        {
            self = countryOfOrigin
        } else {
            throw JSONDecodingError.couldNotConvert(value: value, to: CountryOfOrigin.self)
        }
    }

    public var _jsonValue: JSONValue {
        self.rawValue
    }

    public static func == (lhs: CountryOfOrigin, rhs: CountryOfOrigin) -> Bool {
        lhs._jsonValue == rhs._jsonValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(_jsonValue)
    }
}
