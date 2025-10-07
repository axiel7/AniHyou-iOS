// @generated
// This file was automatically generated and can be edited to
// implement advanced custom scalar functionality.
//
// Any changes to this file will not be overwritten by future
// code generation execution.

@_spi(Execution) @_spi(Internal) import ApolloAPI

public typealias Json = CustomJSON

public enum CustomJSON: CustomScalarType, Hashable {
    case dictionary([String: JSONValue])
    case array([[String: JSONValue]])

    public init(_jsonValue value: JSONValue) throws {
        if let dict = value as? [String: JSONValue] {
            self = .dictionary(dict)
        } else if let array = value as? [[String: JSONValue]] {
            self = .array(array)
        } else {
            throw JSONDecodingError.couldNotConvert(value: value, to: CustomJSON.self)
        }
    }

    public var _jsonValue: JSONValue {
        switch self {
        case .dictionary(let dictionary):
            dictionary as JSONValue
        case .array(let array):
            array as JSONValue
        }
    }

    public static func == (lhs: CustomJSON, rhs: CustomJSON) -> Bool {
        lhs._jsonValue.hashValue == rhs._jsonValue.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(_jsonValue)
    }
}
