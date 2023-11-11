// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct IdsMediaList: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment IdsMediaList on MediaList { __typename id mediaId }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("mediaId", Int.self),
  ] }

  /// The id of the list entry
  public var id: Int { __data["id"] }
  /// The id of the media
  public var mediaId: Int { __data["mediaId"] }
}
