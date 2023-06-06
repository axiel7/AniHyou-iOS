// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct UserInfo: AniListAPI.SelectionSet, Fragment {
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
        staffNameLanguage
        titleLanguage
      }
      mediaListOptions {
        __typename
        scoreFormat
      }
      unreadNotificationCount
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
    .field("bannerImage", String?.self),
    .field("about", String?.self),
    .field("options", Options?.self),
    .field("mediaListOptions", MediaListOptions?.self),
    .field("unreadNotificationCount", Int?.self),
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
  /// The user's media list options
  public var mediaListOptions: MediaListOptions? { __data["mediaListOptions"] }
  /// The number of unread notifications the user has
  public var unreadNotificationCount: Int? { __data["unreadNotificationCount"] }

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

  /// Options
  ///
  /// Parent Type: `UserOptions`
  public struct Options: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserOptions }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("profileColor", String?.self),
      .field("staffNameLanguage", GraphQLEnum<AniListAPI.UserStaffNameLanguage>?.self),
      .field("titleLanguage", GraphQLEnum<AniListAPI.UserTitleLanguage>?.self),
    ] }

    /// Profile highlight color (blue, purple, pink, orange, red, green, gray)
    public var profileColor: String? { __data["profileColor"] }
    /// The language the user wants to see staff and character names in
    public var staffNameLanguage: GraphQLEnum<AniListAPI.UserStaffNameLanguage>? { __data["staffNameLanguage"] }
    /// The language the user wants to see media titles in
    public var titleLanguage: GraphQLEnum<AniListAPI.UserTitleLanguage>? { __data["titleLanguage"] }
  }

  /// MediaListOptions
  ///
  /// Parent Type: `MediaListOptions`
  public struct MediaListOptions: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaListOptions }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("scoreFormat", GraphQLEnum<AniListAPI.ScoreFormat>?.self),
    ] }

    /// The score format the user is using for media lists
    public var scoreFormat: GraphQLEnum<AniListAPI.ScoreFormat>? { __data["scoreFormat"] }
  }
}
