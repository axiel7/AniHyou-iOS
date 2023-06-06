// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct UserFollow: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment UserFollow on User {
      __typename
      id
      name
      avatar {
        __typename
        large
      }
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.User }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("name", String.self),
    .field("avatar", Avatar?.self),
  ] }

  /// The id of the user
  public var id: Int { __data["id"] }
  /// The name of the user
  public var name: String { __data["name"] }
  /// The user's avatar images
  public var avatar: Avatar? { __data["avatar"] }

  /// Avatar
  ///
  /// Parent Type: `UserAvatar`
  public struct Avatar: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("large", String?.self),
    ] }

    /// The avatar of user at its largest size
    public var large: String? { __data["large"] }
  }
}
