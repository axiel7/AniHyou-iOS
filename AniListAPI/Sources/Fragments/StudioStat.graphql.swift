// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct StudioStat: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment StudioStat on UserStudioStatistic { __typename studio { __typename id name } count meanScore minutesWatched chaptersRead }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserStudioStatistic }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("studio", Studio?.self),
    .field("count", Int.self),
    .field("meanScore", Double.self),
    .field("minutesWatched", Int.self),
    .field("chaptersRead", Int.self),
  ] }

  public var studio: Studio? { __data["studio"] }
  public var count: Int { __data["count"] }
  public var meanScore: Double { __data["meanScore"] }
  public var minutesWatched: Int { __data["minutesWatched"] }
  public var chaptersRead: Int { __data["chaptersRead"] }

  /// Studio
  ///
  /// Parent Type: `Studio`
  public struct Studio: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Studio }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Int.self),
      .field("name", String.self),
    ] }

    /// The id of the studio
    public var id: Int { __data["id"] }
    /// The name of the studio
    public var name: String { __data["name"] }
  }
}
