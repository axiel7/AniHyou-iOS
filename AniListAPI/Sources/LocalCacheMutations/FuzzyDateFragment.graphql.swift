// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct FuzzyDateFragment: AniListAPI.MutableSelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment FuzzyDateFragment on FuzzyDate { __typename day month year }"#
  }

  public var __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("day", Int?.self),
    .field("month", Int?.self),
    .field("year", Int?.self),
  ] }

  /// Numeric Day (24)
  public var day: Int? {
    get { __data["day"] }
    set { __data["day"] = newValue }
  }
  /// Numeric Month (3)
  public var month: Int? {
    get { __data["month"] }
    set { __data["month"] = newValue }
  }
  /// Numeric Year (2017)
  public var year: Int? {
    get { __data["year"] }
    set { __data["year"] = newValue }
  }

  public init(
    day: Int? = nil,
    month: Int? = nil,
    year: Int? = nil
  ) {
    self.init(_dataDict: DataDict(
      data: [
        "__typename": AniListAPI.Objects.FuzzyDate.typename,
        "day": day,
        "month": month,
        "year": year,
      ],
      fulfilledFragments: [
        ObjectIdentifier(FuzzyDateFragment.self)
      ]
    ))
  }
}
