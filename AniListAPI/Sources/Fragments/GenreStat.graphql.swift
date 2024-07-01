// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct GenreStat: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment GenreStat on UserGenreStatistic { __typename genre count meanScore minutesWatched chaptersRead }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserGenreStatistic }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("genre", String?.self),
    .field("count", Int.self),
    .field("meanScore", Double.self),
    .field("minutesWatched", Int.self),
    .field("chaptersRead", Int.self),
  ] }

  public var genre: String? { __data["genre"] }
  public var count: Int { __data["count"] }
  public var meanScore: Double { __data["meanScore"] }
  public var minutesWatched: Int { __data["minutesWatched"] }
  public var chaptersRead: Int { __data["chaptersRead"] }
}
