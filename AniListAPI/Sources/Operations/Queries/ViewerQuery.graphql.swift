// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct ViewerQuery: GraphQLQuery {
  public static let operationName: String = "Viewer"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Viewer { Viewer { __typename ...UserInfo } }"#,
      fragments: [UserInfo.self]
    ))

  public init() {}

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Viewer", Viewer?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      ViewerQuery.Data.self
    ] }

    /// Get the currently authenticated user
    public var viewer: Viewer? { __data["Viewer"] }

    /// Viewer
    ///
    /// Parent Type: `User`
    public struct Viewer: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(UserInfo.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ViewerQuery.Data.Viewer.self,
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
