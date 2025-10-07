// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct UserBasicInfoQuery: GraphQLQuery {
  public static let operationName: String = "UserBasicInfo"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UserBasicInfo($userId: Int) { User(id: $userId) { __typename ...UserInfo } }"#,
      fragments: [UserInfo.self]
    ))

  public var userId: GraphQLNullable<Int32>

  public init(userId: GraphQLNullable<Int32>) {
    self.userId = userId
  }

  @_spi(Unsafe) public var __variables: Variables? { ["userId": userId] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("User", User?.self, arguments: ["id": .variable("userId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      UserBasicInfoQuery.Data.self
    ] }

    /// User query
    public var user: User? { __data["User"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(UserInfo.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        UserBasicInfoQuery.Data.User.self,
        UserInfo.self
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
      /// If the authenticated user if following this user
      public var isFollowing: Bool? { __data["isFollowing"] }
      /// If this user if following the authenticated user
      public var isFollower: Bool? { __data["isFollower"] }
      /// Custom donation badge text
      public var donatorBadge: String? { __data["donatorBadge"] }
      /// The donation tier of the user
      public var donatorTier: Int? { __data["donatorTier"] }

      public struct Fragments: FragmentContainer {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public var userInfo: UserInfo { _toFragment() }
      }

      public typealias Avatar = UserInfo.Avatar

      public typealias Options = UserInfo.Options

      public typealias MediaListOptions = UserInfo.MediaListOptions
    }
  }
}
