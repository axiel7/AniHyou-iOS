//
//  ModelUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 04/10/2022.
//

import AniListAPI

func someIfNotNil<T>(_ value: T?) -> GraphQLNullable<T> {
    guard let value else { return .none }
    return .some(value)
}

func someIfNotNil<T>(_ value: (any EnumType)?) -> GraphQLNullable<GraphQLEnum<T>> {
    guard let value = value as? T else { return .none }
    return .some(.case(value))
}

func someIfNotEmpty<T>(_ value: [T]?) -> GraphQLNullable<[T]> {
    guard let value, !value.isEmpty else { return .none }
    return .some(value)
}

func someIfNotEmpty<T>(_ value: [T?]?) -> GraphQLNullable<[T?]> {
    guard let value, !value.isEmpty else { return .none }
    return .some(value)
}

func someEnumArrayIfNotEmpty<T>(_ value: [any EnumType]?) -> GraphQLNullable<[GraphQLEnum<T>?]> {
    guard let value, !value.isEmpty else { return .none }
    guard let value = value as? [T] else { return .none }
    return .some(value.map { .case($0) })
}

func someIfNotEmpty(_ value: String?) -> GraphQLNullable<String> {
    guard let value, !value.isEmpty else { return .none }
    return .some(value)
}

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Bool {
    // so we can negate nullable booleans. Idea stolen from kotlin :)
    func not() -> Bool {
        !self
    }
}

extension Sequence {
    func asyncCompactMap<T>(
        _ transform: (Element) async throws -> T?
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            if let transformed = try await transform(element) {
                values.append(transformed)
            }
        }

        return values
    }
}
