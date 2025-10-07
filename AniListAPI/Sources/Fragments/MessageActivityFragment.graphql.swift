// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct MessageActivityFragment: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment MessageActivityFragment on MessageActivity { __typename id createdAt isLiked likeCount replyCount isPrivate isLocked message messengerId messenger { __typename name avatar { __typename medium } } }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MessageActivity }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("createdAt", Int.self),
    .field("isLiked", Bool?.self),
    .field("likeCount", Int.self),
    .field("replyCount", Int.self),
    .field("isPrivate", Bool?.self),
    .field("isLocked", Bool?.self),
    .field("message", String?.self),
    .field("messengerId", Int?.self),
    .field("messenger", Messenger?.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    MessageActivityFragment.self
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
  /// If the message is private and only viewable to the sender and recipients
  public var isPrivate: Bool? { __data["isPrivate"] }
  /// If the activity is locked and can receive replies
  public var isLocked: Bool? { __data["isLocked"] }
  /// The message text (Markdown)
  public var message: String? { __data["message"] }
  /// The user id of the activity's sender
  public var messengerId: Int? { __data["messengerId"] }
  /// The user who sent the activity message
  public var messenger: Messenger? { __data["messenger"] }

  /// Messenger
  ///
  /// Parent Type: `User`
  public struct Messenger: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("name", String.self),
      .field("avatar", Avatar?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      MessageActivityFragment.Messenger.self
    ] }

    /// The name of the user
    public var name: String { __data["name"] }
    /// The user's avatar images
    public var avatar: Avatar? { __data["avatar"] }

    /// Messenger.Avatar
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
        MessageActivityFragment.Messenger.Avatar.self
      ] }

      /// The avatar of user at medium size
      public var medium: String? { __data["medium"] }
    }
  }
}
