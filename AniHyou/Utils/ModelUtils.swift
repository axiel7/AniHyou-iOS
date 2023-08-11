//
//  ModelUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 04/10/2022.
//

import AniListAPI

func someIfNotNil<T>(_ value: T?) -> GraphQLNullable<T> {
    guard value != nil else { return .none }
    return .some(value!)
}

func someIfNotNil<T>(_ value: (any EnumType)?) -> GraphQLNullable<GraphQLEnum<T>> {
    guard value != nil else { return .none }
    guard let value = value as? T else { return .none }
    return .some(.case(value))
}

func someIfNotEmpty<T>(_ value: [T]?) -> GraphQLNullable<[T]> {
    guard value != nil else { return .none }
    if value!.isEmpty { return .none }
    return .some(value!)
}

func someIfNotEmpty<T>(_ value: [T?]?) -> GraphQLNullable<[T?]> {
    guard value != nil else { return .none }
    if value!.isEmpty { return .none }
    return .some(value!)
}

func someEnumArrayIfNotEmpty<T>(_ value: [any EnumType]?) -> GraphQLNullable<[GraphQLEnum<T>?]> {
    guard value != nil else { return .none }
    if value!.isEmpty { return .none }
    guard let value = value as? [T] else { return .none }
    return .some(value.map { .case($0) })
}

func someIfNotEmpty(_ value: String?) -> GraphQLNullable<String> {
    guard value != nil else { return .none }
    if value!.isEmpty { return .none }
    return .some(value!)
}
