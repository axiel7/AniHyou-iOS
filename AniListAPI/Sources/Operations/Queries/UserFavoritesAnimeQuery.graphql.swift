// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct UserFavoritesAnimeQuery: GraphQLQuery {
  public static let operationName: String = "UserFavoritesAnime"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UserFavoritesAnime($userId: Int, $page: Int, $perPage: Int) { User(id: $userId) { __typename favourites { __typename anime(page: $page, perPage: $perPage) { __typename nodes { __typename id title { __typename userPreferred } coverImage { __typename large } mediaListEntry { __typename status } } pageInfo { __typename currentPage hasNextPage } } } } }"#
    ))

  public var userId: GraphQLNullable<Int32>
  public var page: GraphQLNullable<Int32>
  public var perPage: GraphQLNullable<Int32>

  public init(
    userId: GraphQLNullable<Int32>,
    page: GraphQLNullable<Int32>,
    perPage: GraphQLNullable<Int32>
  ) {
    self.userId = userId
    self.page = page
    self.perPage = perPage
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "userId": userId,
    "page": page,
    "perPage": perPage
  ] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("User", User?.self, arguments: ["id": .variable("userId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      UserFavoritesAnimeQuery.Data.self
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
        .field("favourites", Favourites?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        UserFavoritesAnimeQuery.Data.User.self
      ] }

      /// The users favourites
      public var favourites: Favourites? { __data["favourites"] }

      /// User.Favourites
      ///
      /// Parent Type: `Favourites`
      public struct Favourites: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Favourites }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("anime", Anime?.self, arguments: [
            "page": .variable("page"),
            "perPage": .variable("perPage")
          ]),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          UserFavoritesAnimeQuery.Data.User.Favourites.self
        ] }

        /// Favourite anime
        public var anime: Anime? { __data["anime"] }

        /// User.Favourites.Anime
        ///
        /// Parent Type: `MediaConnection`
        public struct Anime: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaConnection }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("nodes", [Node?]?.self),
            .field("pageInfo", PageInfo?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            UserFavoritesAnimeQuery.Data.User.Favourites.Anime.self
          ] }

          public var nodes: [Node?]? { __data["nodes"] }
          /// The pagination information
          public var pageInfo: PageInfo? { __data["pageInfo"] }

          /// User.Favourites.Anime.Node
          ///
          /// Parent Type: `Media`
          public struct Node: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
              .field("title", Title?.self),
              .field("coverImage", CoverImage?.self),
              .field("mediaListEntry", MediaListEntry?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              UserFavoritesAnimeQuery.Data.User.Favourites.Anime.Node.self
            ] }

            /// The id of the media
            public var id: Int { __data["id"] }
            /// The official titles of the media in various languages
            public var title: Title? { __data["title"] }
            /// The cover images of the media
            public var coverImage: CoverImage? { __data["coverImage"] }
            /// The authenticated user's media list entry for the media
            public var mediaListEntry: MediaListEntry? { __data["mediaListEntry"] }

            /// User.Favourites.Anime.Node.Title
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
                UserFavoritesAnimeQuery.Data.User.Favourites.Anime.Node.Title.self
              ] }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }

            /// User.Favourites.Anime.Node.CoverImage
            ///
            /// Parent Type: `MediaCoverImage`
            public struct CoverImage: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("large", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                UserFavoritesAnimeQuery.Data.User.Favourites.Anime.Node.CoverImage.self
              ] }

              /// The cover image url of the media at a large size
              public var large: String? { __data["large"] }
            }

            /// User.Favourites.Anime.Node.MediaListEntry
            ///
            /// Parent Type: `MediaList`
            public struct MediaListEntry: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                UserFavoritesAnimeQuery.Data.User.Favourites.Anime.Node.MediaListEntry.self
              ] }

              /// The watching/reading status
              public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
            }
          }

          /// User.Favourites.Anime.PageInfo
          ///
          /// Parent Type: `PageInfo`
          public struct PageInfo: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("currentPage", Int?.self),
              .field("hasNextPage", Bool?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              UserFavoritesAnimeQuery.Data.User.Favourites.Anime.PageInfo.self
            ] }

            /// The current page
            public var currentPage: Int? { __data["currentPage"] }
            /// If there is another page
            public var hasNextPage: Bool? { __data["hasNextPage"] }
          }
        }
      }
    }
  }
}
