// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct AiringEpisode: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment AiringEpisode on AiringSchedule { __typename episode airingAt }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.AiringSchedule }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("episode", Int.self),
    .field("airingAt", Int.self),
  ] }

  /// The airing episode number
  public var episode: Int { __data["episode"] }
  /// The time the episode airs at
  public var airingAt: Int { __data["airingAt"] }
}
