// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct UserInfo: AniListAPI.MutableSelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment UserInfo on User { __typename id name avatar { __typename large } bannerImage about(asHtml: true) options { __typename profileColor staffNameLanguage titleLanguage } mediaListOptions { __typename scoreFormat } isFollowing isFollower }"#
  }

  public var __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.User }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("name", String.self),
    .field("avatar", Avatar?.self),
    .field("bannerImage", String?.self),
    .field("about", String?.self, arguments: ["asHtml": true]),
    .field("options", Options?.self),
    .field("mediaListOptions", MediaListOptions?.self),
    .field("isFollowing", Bool?.self),
    .field("isFollower", Bool?.self),
  ] }

  /// The id of the user
  public var id: Int {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }
  /// The name of the user
  public var name: String {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }
  /// The user's avatar images
  public var avatar: Avatar? {
    get { __data["avatar"] }
    set { __data["avatar"] = newValue }
  }
  /// The user's banner images
  public var bannerImage: String? {
    get { __data["bannerImage"] }
    set { __data["bannerImage"] = newValue }
  }
  /// The bio written by user (Markdown)
  public var about: String? {
    get { __data["about"] }
    set { __data["about"] = newValue }
  }
  /// The user's general options
  public var options: Options? {
    get { __data["options"] }
    set { __data["options"] = newValue }
  }
  /// The user's media list options
  public var mediaListOptions: MediaListOptions? {
    get { __data["mediaListOptions"] }
    set { __data["mediaListOptions"] = newValue }
  }
  /// If the authenticated user if following this user
  public var isFollowing: Bool? {
    get { __data["isFollowing"] }
    set { __data["isFollowing"] = newValue }
  }
  /// If this user if following the authenticated user
  public var isFollower: Bool? {
    get { __data["isFollower"] }
    set { __data["isFollower"] = newValue }
  }

  public init(
    id: Int,
    name: String,
    avatar: Avatar? = nil,
    bannerImage: String? = nil,
    about: String? = nil,
    options: Options? = nil,
    mediaListOptions: MediaListOptions? = nil,
    isFollowing: Bool? = nil,
    isFollower: Bool? = nil
  ) {
    self.init(_dataDict: DataDict(
      data: [
        "__typename": AniListAPI.Objects.User.typename,
        "id": id,
        "name": name,
        "avatar": avatar._fieldData,
        "bannerImage": bannerImage,
        "about": about,
        "options": options._fieldData,
        "mediaListOptions": mediaListOptions._fieldData,
        "isFollowing": isFollowing,
        "isFollower": isFollower,
      ],
      fulfilledFragments: [
        ObjectIdentifier(UserInfo.self)
      ]
    ))
  }

  /// Avatar
  ///
  /// Parent Type: `UserAvatar`
  public struct Avatar: AniListAPI.MutableSelectionSet {
    public var __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("large", String?.self),
    ] }

    /// The avatar of user at its largest size
    public var large: String? {
      get { __data["large"] }
      set { __data["large"] = newValue }
    }

    public init(
      large: String? = nil
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": AniListAPI.Objects.UserAvatar.typename,
          "large": large,
        ],
        fulfilledFragments: [
          ObjectIdentifier(UserInfo.Avatar.self)
        ]
      ))
    }
  }

  /// Options
  ///
  /// Parent Type: `UserOptions`
  public struct Options: AniListAPI.MutableSelectionSet {
    public var __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserOptions }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("profileColor", String?.self),
      .field("staffNameLanguage", GraphQLEnum<AniListAPI.UserStaffNameLanguage>?.self),
      .field("titleLanguage", GraphQLEnum<AniListAPI.UserTitleLanguage>?.self),
    ] }

    /// Profile highlight color (blue, purple, pink, orange, red, green, gray)
    public var profileColor: String? {
      get { __data["profileColor"] }
      set { __data["profileColor"] = newValue }
    }
    /// The language the user wants to see staff and character names in
    public var staffNameLanguage: GraphQLEnum<AniListAPI.UserStaffNameLanguage>? {
      get { __data["staffNameLanguage"] }
      set { __data["staffNameLanguage"] = newValue }
    }
    /// The language the user wants to see media titles in
    public var titleLanguage: GraphQLEnum<AniListAPI.UserTitleLanguage>? {
      get { __data["titleLanguage"] }
      set { __data["titleLanguage"] = newValue }
    }

    public init(
      profileColor: String? = nil,
      staffNameLanguage: GraphQLEnum<AniListAPI.UserStaffNameLanguage>? = nil,
      titleLanguage: GraphQLEnum<AniListAPI.UserTitleLanguage>? = nil
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": AniListAPI.Objects.UserOptions.typename,
          "profileColor": profileColor,
          "staffNameLanguage": staffNameLanguage,
          "titleLanguage": titleLanguage,
        ],
        fulfilledFragments: [
          ObjectIdentifier(UserInfo.Options.self)
        ]
      ))
    }
  }

  /// MediaListOptions
  ///
  /// Parent Type: `MediaListOptions`
  public struct MediaListOptions: AniListAPI.MutableSelectionSet {
    public var __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaListOptions }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("scoreFormat", GraphQLEnum<AniListAPI.ScoreFormat>?.self),
    ] }

    /// The score format the user is using for media lists
    public var scoreFormat: GraphQLEnum<AniListAPI.ScoreFormat>? {
      get { __data["scoreFormat"] }
      set { __data["scoreFormat"] = newValue }
    }

    public init(
      scoreFormat: GraphQLEnum<AniListAPI.ScoreFormat>? = nil
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": AniListAPI.Objects.MediaListOptions.typename,
          "scoreFormat": scoreFormat,
        ],
        fulfilledFragments: [
          ObjectIdentifier(UserInfo.MediaListOptions.self)
        ]
      ))
    }
  }
}
