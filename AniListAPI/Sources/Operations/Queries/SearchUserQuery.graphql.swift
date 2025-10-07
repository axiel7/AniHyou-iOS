// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct SearchUserQuery: GraphQLQuery {
  public static let operationName: String = "SearchUser"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query SearchUser($page: Int, $perPage: Int, $search: String) { Page(page: $page, perPage: $perPage) { __typename users(search: $search, sort: SEARCH_MATCH) { __typename id name avatar { __typename medium } } pageInfo { __typename hasNextPage } } }"#
    ))

  public var page: GraphQLNullable<Int32>
  public var perPage: GraphQLNullable<Int32>
  public var search: GraphQLNullable<String>

  public init(
    page: GraphQLNullable<Int32>,
    perPage: GraphQLNullable<Int32>,
    search: GraphQLNullable<String>
  ) {
    self.page = page
    self.perPage = perPage
    self.search = search
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "search": search
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
      SearchUserQuery.Data.self
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
        .field("users", [User?]?.self, arguments: [
          "search": .variable("search"),
          "sort": "SEARCH_MATCH"
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        SearchUserQuery.Data.Page.self
      ] }

      public var users: [User?]? { __data["users"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.User
      ///
      /// Parent Type: `User`
      public struct User: AniListAPI.SelectionSet {
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
          SearchUserQuery.Data.Page.User.self
        ] }

        /// The id of the user
        public var id: Int { __data["id"] }
        /// The name of the user
        public var name: String { __data["name"] }
        /// The user's avatar images
        public var avatar: Avatar? { __data["avatar"] }

        /// Page.User.Avatar
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
            SearchUserQuery.Data.Page.User.Avatar.self
          ] }

          /// The avatar of user at medium size
          public var medium: String? { __data["medium"] }
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
          .field("hasNextPage", Bool?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          SearchUserQuery.Data.Page.PageInfo.self
        ] }

        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }
    }
  }
}
