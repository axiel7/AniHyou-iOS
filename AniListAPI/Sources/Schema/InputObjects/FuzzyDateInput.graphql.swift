// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

/// Date object that allows for incomplete date values (fuzzy)
public struct FuzzyDateInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    year: GraphQLNullable<Int32> = nil,
    month: GraphQLNullable<Int32> = nil,
    day: GraphQLNullable<Int32> = nil
  ) {
    __data = InputDict([
      "year": year,
      "month": month,
      "day": day
    ])
  }

  /// Numeric Year (2017)
  public var year: GraphQLNullable<Int32> {
    get { __data["year"] }
    set { __data["year"] = newValue }
  }

  /// Numeric Month (3)
  public var month: GraphQLNullable<Int32> {
    get { __data["month"] }
    set { __data["month"] = newValue }
  }

  /// Numeric Day (24)
  public var day: GraphQLNullable<Int32> {
    get { __data["day"] }
    set { __data["day"] = newValue }
  }
}
