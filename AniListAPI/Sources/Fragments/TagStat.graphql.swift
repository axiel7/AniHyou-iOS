// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct TagStat: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment TagStat on UserTagStatistic { __typename tag { __typename id name } count meanScore minutesWatched chaptersRead }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserTagStatistic }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("tag", Tag?.self),
    .field("count", Int.self),
    .field("meanScore", Double.self),
    .field("minutesWatched", Int.self),
    .field("chaptersRead", Int.self),
  ] }

  public var tag: Tag? { __data["tag"] }
  public var count: Int { __data["count"] }
  public var meanScore: Double { __data["meanScore"] }
  public var minutesWatched: Int { __data["minutesWatched"] }
  public var chaptersRead: Int { __data["chaptersRead"] }

  /// Tag
  ///
  /// Parent Type: `MediaTag`
  public struct Tag: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaTag }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Int.self),
      .field("name", String.self),
    ] }

    /// The id of the tag
    public var id: Int { __data["id"] }
    /// The name of the tag
    public var name: String { __data["name"] }
  }
}
