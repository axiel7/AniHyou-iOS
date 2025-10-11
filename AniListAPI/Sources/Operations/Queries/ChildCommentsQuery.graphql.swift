// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct ChildCommentsQuery: GraphQLQuery {
  public static let operationName: String = "ChildComments"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ChildComments($page: Int, $perPage: Int, $threadId: Int) { Page(page: $page, perPage: $perPage) { __typename threadComments(threadId: $threadId) { __typename id comment likeCount isLiked createdAt isLocked user { __typename id name avatar { __typename medium } } childComments } pageInfo { __typename ...CommonPage } } }"#,
      fragments: [CommonPage.self]
    ))

  public var page: GraphQLNullable<Int32>
  public var perPage: GraphQLNullable<Int32>
  public var threadId: GraphQLNullable<Int32>

  public init(
    page: GraphQLNullable<Int32>,
    perPage: GraphQLNullable<Int32>,
    threadId: GraphQLNullable<Int32>
  ) {
    self.page = page
    self.perPage = perPage
    self.threadId = threadId
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "threadId": threadId
  ] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": .variable("page"),
        "perPage": .variable("perPage")
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      ChildCommentsQuery.Data.self
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Page }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("threadComments", [ThreadComment?]?.self, arguments: ["threadId": .variable("threadId")]),
        .field("pageInfo", PageInfo?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ChildCommentsQuery.Data.Page.self
      ] }

      public var threadComments: [ThreadComment?]? { __data["threadComments"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.ThreadComment
      ///
      /// Parent Type: `ThreadComment`
      public struct ThreadComment: AniListAPI.SelectionSet, Identifiable {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ThreadComment }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("comment", String?.self),
          .field("likeCount", Int.self),
          .field("isLiked", Bool?.self),
          .field("createdAt", Int.self),
          .field("isLocked", Bool?.self),
          .field("user", User?.self),
          .field("childComments", AniListAPI.Json?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          ChildCommentsQuery.Data.Page.ThreadComment.self
        ] }

        /// The id of the comment
        public var id: Int { __data["id"] }
        /// The text content of the comment (Markdown)
        public var comment: String? { __data["comment"] }
        /// The amount of likes the comment has
        public var likeCount: Int { __data["likeCount"] }
        /// If the currently authenticated user liked the comment
        public var isLiked: Bool? { __data["isLiked"] }
        /// The time of the comments creation
        public var createdAt: Int { __data["createdAt"] }
        /// If the comment tree is locked and may not receive replies or edits
        public var isLocked: Bool? { __data["isLocked"] }
        /// The user who created the comment
        public var user: User? { __data["user"] }
        /// The comment's child reply comments
        public var childComments: AniListAPI.Json? { __data["childComments"] }

        /// Page.ThreadComment.User
        ///
        /// Parent Type: `User`
        public struct User: AniListAPI.SelectionSet, Identifiable {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int.self),
            .field("name", String.self),
            .field("avatar", Avatar?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            ChildCommentsQuery.Data.Page.ThreadComment.User.self
          ] }

          /// The id of the user
          public var id: Int { __data["id"] }
          /// The name of the user
          public var name: String { __data["name"] }
          /// The user's avatar images
          public var avatar: Avatar? { __data["avatar"] }

          /// Page.ThreadComment.User.Avatar
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
              ChildCommentsQuery.Data.Page.ThreadComment.User.Avatar.self
            ] }

            /// The avatar of user at medium size
            public var medium: String? { __data["medium"] }
          }
        }
      }

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(CommonPage.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          ChildCommentsQuery.Data.Page.PageInfo.self,
          CommonPage.self
        ] }

        /// The current page
        public var currentPage: Int? { __data["currentPage"] }
        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var commonPage: CommonPage { _toFragment() }
        }
      }
    }
  }
}
