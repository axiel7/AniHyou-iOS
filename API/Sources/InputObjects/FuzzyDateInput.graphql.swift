// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// Date object that allows for incomplete date values (fuzzy)
public struct FuzzyDateInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    year: GraphQLNullable<Int> = nil,
    month: GraphQLNullable<Int> = nil,
    day: GraphQLNullable<Int> = nil
  ) {
    __data = InputDict([
      "year": year,
      "month": month,
      "day": day
    ])
  }

  /// Numeric Year (2017)
  public var year: GraphQLNullable<Int> {
    get { __data.year }
    set { __data.year = newValue }
  }

  /// Numeric Month (3)
  public var month: GraphQLNullable<Int> {
    get { __data.month }
    set { __data.month = newValue }
  }

  /// Numeric Day (24)
  public var day: GraphQLNullable<Int> {
    get { __data.day }
    set { __data.day = newValue }
  }
}
