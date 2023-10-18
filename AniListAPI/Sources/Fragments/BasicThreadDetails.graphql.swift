// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct BasicThreadDetails: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment BasicThreadDetails on Thread { __typename id title body viewCount likeCount isLiked replyCount isLocked user { __typename id name avatar { __typename medium } } createdAt }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Thread }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("title", String?.self),
    .field("body", String?.self),
    .field("viewCount", Int?.self),
    .field("likeCount", Int.self),
    .field("isLiked", Bool?.self),
    .field("replyCount", Int?.self),
    .field("isLocked", Bool?.self),
    .field("user", User?.self),
    .field("createdAt", Int.self),
  ] }

  /// The id of the thread
  public var id: Int { __data["id"] }
  /// The title of the thread
  public var title: String? { __data["title"] }
  /// The text body of the thread (Markdown)
  public var body: String? { __data["body"] }
  /// The number of times users have viewed the thread
  public var viewCount: Int? { __data["viewCount"] }
  /// The amount of likes the thread has
  public var likeCount: Int { __data["likeCount"] }
  /// If the currently authenticated user liked the thread
  public var isLiked: Bool? { __data["isLiked"] }
  /// The number of comments on the thread
  public var replyCount: Int? { __data["replyCount"] }
  /// If the thread is locked and can receive comments
  public var isLocked: Bool? { __data["isLocked"] }
  /// The owner of the thread
  public var user: User? { __data["user"] }
  /// The time of the thread creation
  public var createdAt: Int { __data["createdAt"] }

  /// User
  ///
  /// Parent Type: `User`
  public struct User: AniListAPI.SelectionSet {
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

    /// User.Avatar
    ///
    /// Parent Type: `UserAvatar`
    public struct Avatar: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("medium", String?.self),
      ] }

      /// The avatar of user at medium size
      public var medium: String? { __data["medium"] }
    }
  }
}
