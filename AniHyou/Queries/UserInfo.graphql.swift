// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public struct UserInfo: API.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment UserInfo on User {
      __typename
      id
      name
      avatar {
        __typename
        large
      }
      bannerImage
      about
      options {
        __typename
        profileColor
      }
    }
    """ }

  public let __data: DataDict
  public init(data: DataDict) { __data = data }

  public static var __parentType: ParentType { API.Objects.User }
  public static var __selections: [Selection] { [
    .field("id", Int.self),
    .field("name", String.self),
    .field("avatar", Avatar?.self),
    .field("bannerImage", String?.self),
    .field("about", String?.self),
    .field("options", Options?.self),
  ] }

  /// The id of the user
  public var id: Int { __data["id"] }
  /// The name of the user
  public var name: String { __data["name"] }
  /// The user's avatar images
  public var avatar: Avatar? { __data["avatar"] }
  /// The user's banner images
  public var bannerImage: String? { __data["bannerImage"] }
  /// The bio written by user (Markdown)
  public var about: String? { __data["about"] }
  /// The user's general options
  public var options: Options? { __data["options"] }

  /// Avatar
  ///
  /// Parent Type: `UserAvatar`
  public struct Avatar: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.UserAvatar }
    public static var __selections: [Selection] { [
      .field("large", String?.self),
    ] }

    /// The avatar of user at its largest size
    public var large: String? { __data["large"] }
  }

  /// Options
  ///
  /// Parent Type: `UserOptions`
  public struct Options: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.UserOptions }
    public static var __selections: [Selection] { [
      .field("profileColor", String?.self),
    ] }

    /// Profile highlight color (blue, purple, pink, orange, red, green, gray)
    public var profileColor: String? { __data["profileColor"] }
  }
}
