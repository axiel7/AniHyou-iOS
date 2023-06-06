// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct FuzzyDateFragment: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment FuzzyDateFragment on FuzzyDate {
      __typename
      day
      month
      year
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
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
