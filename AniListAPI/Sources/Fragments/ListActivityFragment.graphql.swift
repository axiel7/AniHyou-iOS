// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct ListActivityFragment: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment ListActivityFragment on ListActivity { __typename id createdAt isLiked likeCount replyCount isLocked type progress status userId user { __typename name avatar { __typename medium } } media { __typename id title { __typename userPreferred } coverImage { __typename medium } } }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ListActivity }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("createdAt", Int.self),
    .field("isLiked", Bool?.self),
    .field("likeCount", Int.self),
    .field("replyCount", Int.self),
    .field("isLocked", Bool?.self),
    .field("type", GraphQLEnum<AniListAPI.ActivityType>?.self),
    .field("progress", String?.self),
    .field("status", String?.self),
    .field("userId", Int?.self),
    .field("user", User?.self),
    .field("media", Media?.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    ListActivityFragment.self
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
  /// The type of activity
  public var type: GraphQLEnum<AniListAPI.ActivityType>? { __data["type"] }
  /// The list progress made
  public var progress: String? { __data["progress"] }
  /// The list item's textual status
  public var status: String? { __data["status"] }
  /// The user id of the activity's creator
  public var userId: Int? { __data["userId"] }
  /// The owner of the activity
  public var user: User? { __data["user"] }
  /// The associated media to the activity update
  public var media: Media? { __data["media"] }

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
      ListActivityFragment.User.self
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
        ListActivityFragment.User.Avatar.self
      ] }

      /// The avatar of user at medium size
      public var medium: String? { __data["medium"] }
    }
  }

  /// Media
  ///
  /// Parent Type: `Media`
  public struct Media: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Int.self),
      .field("title", Title?.self),
      .field("coverImage", CoverImage?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      ListActivityFragment.Media.self
    ] }

    /// The id of the media
    public var id: Int { __data["id"] }
    /// The official titles of the media in various languages
    public var title: Title? { __data["title"] }
    /// The cover images of the media
    public var coverImage: CoverImage? { __data["coverImage"] }

    /// Media.Title
    ///
    /// Parent Type: `MediaTitle`
    public struct Title: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("userPreferred", String?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ListActivityFragment.Media.Title.self
      ] }

      /// The currently authenticated users preferred title language. Default romaji for non-authenticated
      public var userPreferred: String? { __data["userPreferred"] }
    }

    /// Media.CoverImage
    ///
    /// Parent Type: `MediaCoverImage`
    public struct CoverImage: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("medium", String?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ListActivityFragment.Media.CoverImage.self
      ] }

      /// The cover image url of the media at medium size
      public var medium: String? { __data["medium"] }
    }
  }
}
