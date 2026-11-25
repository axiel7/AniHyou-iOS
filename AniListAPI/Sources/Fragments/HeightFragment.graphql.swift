// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct HeightFragment: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment HeightFragment on Height { __typename initial { __typename imperial metric } min { __typename imperial metric } max { __typename imperial metric } }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Height }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("initial", Initial?.self),
    .field("min", Min?.self),
    .field("max", Max?.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    HeightFragment.self
  ] }

  /// The height when first introduced, if it changes later. Min and max are null when this is set.
  public var initial: Initial? { __data["initial"] }
  /// The lowest height in the range
  public var min: Min? { __data["min"] }
  /// The highest height in the range
  public var max: Max? { __data["max"] }

  /// Initial
  ///
  /// Parent Type: `HeightValue`
  nonisolated public struct Initial: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.HeightValue }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("imperial", String?.self),
      .field("metric", Double?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      HeightFragment.Initial.self
    ] }

    /// Height in feet and inches, rounded to the nearest inch (5'7")
    public var imperial: String? { __data["imperial"] }
    /// Height in centimetres (169.5)
    public var metric: Double? { __data["metric"] }
  }

  /// Min
  ///
  /// Parent Type: `HeightValue`
  nonisolated public struct Min: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.HeightValue }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("imperial", String?.self),
      .field("metric", Double?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      HeightFragment.Min.self
    ] }

    /// Height in feet and inches, rounded to the nearest inch (5'7")
    public var imperial: String? { __data["imperial"] }
    /// Height in centimetres (169.5)
    public var metric: Double? { __data["metric"] }
  }

  /// Max
  ///
  /// Parent Type: `HeightValue`
  nonisolated public struct Max: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.HeightValue }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("imperial", String?.self),
      .field("metric", Double?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      HeightFragment.Max.self
    ] }

    /// Height in feet and inches, rounded to the nearest inch (5'7")
    public var imperial: String? { __data["imperial"] }
    /// Height in centimetres (169.5)
    public var metric: Double? { __data["metric"] }
  }
}
