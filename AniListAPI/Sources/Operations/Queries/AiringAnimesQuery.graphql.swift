// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct AiringAnimesQuery: GraphQLQuery {
  public static let operationName: String = "AiringAnimes"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query AiringAnimes($page: Int, $perPage: Int, $sort: [AiringSort], $airingAtGreater: Int, $airingAtLesser: Int) { Page(page: $page, perPage: $perPage) { __typename airingSchedules( sort: $sort airingAt_greater: $airingAtGreater airingAt_lesser: $airingAtLesser ) { __typename id mediaId media { __typename title { __typename userPreferred } coverImage { __typename large } meanScore mediaListEntry { __typename status } } episode airingAt } pageInfo { __typename ...CommonPage } } }"#,
      fragments: [CommonPage.self]
    ))

  public var page: GraphQLNullable<Int32>
  public var perPage: GraphQLNullable<Int32>
  public var sort: GraphQLNullable<[GraphQLEnum<AiringSort>?]>
  public var airingAtGreater: GraphQLNullable<Int32>
  public var airingAtLesser: GraphQLNullable<Int32>

  public init(
    page: GraphQLNullable<Int32>,
    perPage: GraphQLNullable<Int32>,
    sort: GraphQLNullable<[GraphQLEnum<AiringSort>?]>,
    airingAtGreater: GraphQLNullable<Int32>,
    airingAtLesser: GraphQLNullable<Int32>
  ) {
    self.page = page
    self.perPage = perPage
    self.sort = sort
    self.airingAtGreater = airingAtGreater
    self.airingAtLesser = airingAtLesser
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "sort": sort,
    "airingAtGreater": airingAtGreater,
    "airingAtLesser": airingAtLesser
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
      AiringAnimesQuery.Data.self
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
        .field("airingSchedules", [AiringSchedule?]?.self, arguments: [
          "sort": .variable("sort"),
          "airingAt_greater": .variable("airingAtGreater"),
          "airingAt_lesser": .variable("airingAtLesser")
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        AiringAnimesQuery.Data.Page.self
      ] }

      public var airingSchedules: [AiringSchedule?]? { __data["airingSchedules"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.AiringSchedule
      ///
      /// Parent Type: `AiringSchedule`
      public struct AiringSchedule: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.AiringSchedule }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("mediaId", Int.self),
          .field("media", Media?.self),
          .field("episode", Int.self),
          .field("airingAt", Int.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          AiringAnimesQuery.Data.Page.AiringSchedule.self
        ] }

        /// The id of the airing schedule item
        public var id: Int { __data["id"] }
        /// The associate media id of the airing episode
        public var mediaId: Int { __data["mediaId"] }
        /// The associate media of the airing episode
        public var media: Media? { __data["media"] }
        /// The airing episode number
        public var episode: Int { __data["episode"] }
        /// The time the episode airs at
        public var airingAt: Int { __data["airingAt"] }

        /// Page.AiringSchedule.Media
        ///
        /// Parent Type: `Media`
        public struct Media: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("title", Title?.self),
            .field("coverImage", CoverImage?.self),
            .field("meanScore", Int?.self),
            .field("mediaListEntry", MediaListEntry?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            AiringAnimesQuery.Data.Page.AiringSchedule.Media.self
          ] }

          /// The official titles of the media in various languages
          public var title: Title? { __data["title"] }
          /// The cover images of the media
          public var coverImage: CoverImage? { __data["coverImage"] }
          /// Mean score of all the user's scores of the media
          public var meanScore: Int? { __data["meanScore"] }
          /// The authenticated user's media list entry for the media
          public var mediaListEntry: MediaListEntry? { __data["mediaListEntry"] }

          /// Page.AiringSchedule.Media.Title
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
              AiringAnimesQuery.Data.Page.AiringSchedule.Media.Title.self
            ] }

            /// The currently authenticated users preferred title language. Default romaji for non-authenticated
            public var userPreferred: String? { __data["userPreferred"] }
          }

          /// Page.AiringSchedule.Media.CoverImage
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
              AiringAnimesQuery.Data.Page.AiringSchedule.Media.CoverImage.self
            ] }

            /// The cover image url of the media at a large size
            public var large: String? { __data["large"] }
          }

          /// Page.AiringSchedule.Media.MediaListEntry
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
              AiringAnimesQuery.Data.Page.AiringSchedule.Media.MediaListEntry.self
            ] }

            /// The watching/reading status
            public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
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
          AiringAnimesQuery.Data.Page.PageInfo.self,
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
