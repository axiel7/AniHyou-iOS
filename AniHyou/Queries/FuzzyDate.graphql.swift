// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public struct FuzzyDate: API.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment FuzzyDate on FuzzyDate {
      __typename
      day
      month
      year
    }
    """ }

  public let __data: DataDict
  public init(data: DataDict) { __data = data }

  public static var __parentType: ApolloAPI.ParentType { API.Objects.FuzzyDate }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("day", Int?.self),
    .field("month", Int?.self),
    .field("year", Int?.self),
  ] }

  /// Numeric Day (24)
  public var day: Int? { __data["day"] }
  /// Numeric Month (3)
  public var month: Int? { __data["month"] }
  /// Numeric Year (2017)
  public var year: Int? { __data["year"] }
}
