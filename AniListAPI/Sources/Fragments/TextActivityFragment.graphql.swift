// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct TextActivityFragment: AniListAPI.SelectionSet, Fragment, Identifiable {
  public static var fragmentDefinition: StaticString {
    #"fragment TextActivityFragment on TextActivity { __typename id createdAt isLiked likeCount replyCount isLocked text userId user { __typename name avatar { __typename medium } } }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.TextActivity }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("createdAt", Int.self),
    .field("isLiked", Bool?.self),
    .field("likeCount", Int.self),
    .field("replyCount", Int.self),
    .field("isLocked", Bool?.self),
    .field("text", String?.self),
    .field("userId", Int?.self),
    .field("user", User?.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    TextActivityFragment.self
  ] }

  /// The id of the activity
  public var id: Int { __data["id"] }
  /// The time the activity was created at
  public var createdAt: Int { __data["createdAt"] }
  /// If the currently authenticated user liked the activity
  public var isLiked: Bool? { __data["isLiked"] }
  /// The amount of likes the activity has
  public var likeCount: Int { __data["likeCount"] }
  /// The number of activity replies
  public var replyCount: Int { __data["replyCount"] }
  /// If the activity is locked and can receive replies
  public var isLocked: Bool? { __data["isLocked"] }
  /// The status text (Markdown)
  public var text: String? { __data["text"] }
  /// The user id of the activity's creator
  public var userId: Int? { __data["userId"] }
  /// The user who created the activity
  public var user: User? { __data["user"] }

  /// User
  ///
  /// Parent Type: `User`
  public struct User: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("name", String.self),
      .field("avatar", Avatar?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      TextActivityFragment.User.self
    ] }

    /// The name of the user
    public var name: String { __data["name"] }
    /// The user's avatar images
    public var avatar: Avatar? { __data["avatar"] }

    /// User.Avatar
    ///
    /// Parent Type: `UserAvatar`
    public struct Avatar: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("medium", String?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        TextActivityFragment.User.Avatar.self
      ] }

      /// The avatar of user at medium size
      public var medium: String? { __data["medium"] }
    }
  }
}
