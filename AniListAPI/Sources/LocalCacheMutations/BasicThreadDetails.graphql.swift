// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct BasicThreadDetails: AniListAPI.MutableSelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment BasicThreadDetails on Thread { __typename id title body viewCount likeCount isLiked isSubscribed replyCount isLocked user { __typename id name avatar { __typename medium } } createdAt }"#
  }

  public var __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Thread }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("title", String?.self),
    .field("body", String?.self),
    .field("viewCount", Int?.self),
    .field("likeCount", Int.self),
    .field("isLiked", Bool?.self),
    .field("isSubscribed", Bool?.self),
    .field("replyCount", Int?.self),
    .field("isLocked", Bool?.self),
    .field("user", User?.self),
    .field("createdAt", Int.self),
  ] }

  /// The id of the thread
  public var id: Int {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }
  /// The title of the thread
  public var title: String? {
    get { __data["title"] }
    set { __data["title"] = newValue }
  }
  /// The text body of the thread (Markdown)
  public var body: String? {
    get { __data["body"] }
    set { __data["body"] = newValue }
  }
  /// The number of times users have viewed the thread
  public var viewCount: Int? {
    get { __data["viewCount"] }
    set { __data["viewCount"] = newValue }
  }
  /// The amount of likes the thread has
  public var likeCount: Int {
    get { __data["likeCount"] }
    set { __data["likeCount"] = newValue }
  }
  /// If the currently authenticated user liked the thread
  public var isLiked: Bool? {
    get { __data["isLiked"] }
    set { __data["isLiked"] = newValue }
  }
  /// If the currently authenticated user is subscribed to the thread
  public var isSubscribed: Bool? {
    get { __data["isSubscribed"] }
    set { __data["isSubscribed"] = newValue }
  }
  /// The number of comments on the thread
  public var replyCount: Int? {
    get { __data["replyCount"] }
    set { __data["replyCount"] = newValue }
  }
  /// If the thread is locked and can receive comments
  public var isLocked: Bool? {
    get { __data["isLocked"] }
    set { __data["isLocked"] = newValue }
  }
  /// The owner of the thread
  public var user: User? {
    get { __data["user"] }
    set { __data["user"] = newValue }
  }
  /// The time of the thread creation
  public var createdAt: Int {
    get { __data["createdAt"] }
    set { __data["createdAt"] = newValue }
  }

  public init(
    id: Int,
    title: String? = nil,
    body: String? = nil,
    viewCount: Int? = nil,
    likeCount: Int,
    isLiked: Bool? = nil,
    isSubscribed: Bool? = nil,
    replyCount: Int? = nil,
    isLocked: Bool? = nil,
    user: User? = nil,
    createdAt: Int
  ) {
    self.init(_dataDict: DataDict(
      data: [
        "__typename": AniListAPI.Objects.Thread.typename,
        "id": id,
        "title": title,
        "body": body,
        "viewCount": viewCount,
        "likeCount": likeCount,
        "isLiked": isLiked,
        "isSubscribed": isSubscribed,
        "replyCount": replyCount,
        "isLocked": isLocked,
        "user": user._fieldData,
        "createdAt": createdAt,
      ],
      fulfilledFragments: [
        ObjectIdentifier(BasicThreadDetails.self)
      ]
    ))
  }

  /// User
  ///
  /// Parent Type: `User`
  public struct User: AniListAPI.MutableSelectionSet {
    public var __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Int.self),
      .field("name", String.self),
      .field("avatar", Avatar?.self),
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

    public init(
      id: Int,
      name: String,
      avatar: Avatar? = nil
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": AniListAPI.Objects.User.typename,
          "id": id,
          "name": name,
          "avatar": avatar._fieldData,
        ],
        fulfilledFragments: [
          ObjectIdentifier(BasicThreadDetails.User.self)
        ]
      ))
    }

    /// User.Avatar
    ///
    /// Parent Type: `UserAvatar`
    public struct Avatar: AniListAPI.MutableSelectionSet {
      public var __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("medium", String?.self),
      ] }

      /// The avatar of user at medium size
      public var medium: String? {
        get { __data["medium"] }
        set { __data["medium"] = newValue }
      }

      public init(
        medium: String? = nil
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": AniListAPI.Objects.UserAvatar.typename,
            "medium": medium,
          ],
          fulfilledFragments: [
            ObjectIdentifier(BasicThreadDetails.User.Avatar.self)
          ]
        ))
      }
    }
  }
}
