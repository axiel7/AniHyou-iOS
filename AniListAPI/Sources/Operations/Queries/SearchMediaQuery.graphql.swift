// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SearchMediaQuery: GraphQLQuery {
  public static let operationName: String = "SearchMedia"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query SearchMedia($page: Int, $perPage: Int, $search: String, $type: MediaType, $sort: [MediaSort], $genre_in: [String], $genre_not_in: [String], $tag_in: [String], $tag_not_in: [String], $format_in: [MediaFormat], $status_in: [MediaStatus], $startDateGreater: FuzzyDateInt, $startDateLesser: FuzzyDateInt, $onList: Boolean, $isLicensed: Boolean, $isAdult: Boolean, $country: CountryCode) { Page(page: $page, perPage: $perPage) { __typename media( search: $search type: $type sort: $sort genre_in: $genre_in genre_not_in: $genre_not_in tag_in: $tag_in tag_not_in: $tag_not_in format_in: $format_in status_in: $status_in startDate_greater: $startDateGreater startDate_lesser: $startDateLesser onList: $onList isLicensed: $isLicensed isAdult: $isAdult countryOfOrigin: $country ) { __typename id title { __typename userPreferred } type meanScore format coverImage { __typename large } mediaListEntry { __typename status } startDate { __typename year } } pageInfo { __typename currentPage hasNextPage } } }"#
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var search: GraphQLNullable<String>
  public var type: GraphQLNullable<GraphQLEnum<MediaType>>
  public var sort: GraphQLNullable<[GraphQLEnum<MediaSort>?]>
  public var genre_in: GraphQLNullable<[String?]>
  public var genre_not_in: GraphQLNullable<[String?]>
  public var tag_in: GraphQLNullable<[String?]>
  public var tag_not_in: GraphQLNullable<[String?]>
  public var format_in: GraphQLNullable<[GraphQLEnum<MediaFormat>?]>
  public var status_in: GraphQLNullable<[GraphQLEnum<MediaStatus>?]>
  public var startDateGreater: GraphQLNullable<FuzzyDateInt>
  public var startDateLesser: GraphQLNullable<FuzzyDateInt>
  public var onList: GraphQLNullable<Bool>
  public var isLicensed: GraphQLNullable<Bool>
  public var isAdult: GraphQLNullable<Bool>
  public var country: GraphQLNullable<CountryCode>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    search: GraphQLNullable<String>,
    type: GraphQLNullable<GraphQLEnum<MediaType>>,
    sort: GraphQLNullable<[GraphQLEnum<MediaSort>?]>,
    genre_in: GraphQLNullable<[String?]>,
    genre_not_in: GraphQLNullable<[String?]>,
    tag_in: GraphQLNullable<[String?]>,
    tag_not_in: GraphQLNullable<[String?]>,
    format_in: GraphQLNullable<[GraphQLEnum<MediaFormat>?]>,
    status_in: GraphQLNullable<[GraphQLEnum<MediaStatus>?]>,
    startDateGreater: GraphQLNullable<FuzzyDateInt>,
    startDateLesser: GraphQLNullable<FuzzyDateInt>,
    onList: GraphQLNullable<Bool>,
    isLicensed: GraphQLNullable<Bool>,
    isAdult: GraphQLNullable<Bool>,
    country: GraphQLNullable<CountryCode>
  ) {
    self.page = page
    self.perPage = perPage
    self.search = search
    self.type = type
    self.sort = sort
    self.genre_in = genre_in
    self.genre_not_in = genre_not_in
    self.tag_in = tag_in
    self.tag_not_in = tag_not_in
    self.format_in = format_in
    self.status_in = status_in
    self.startDateGreater = startDateGreater
    self.startDateLesser = startDateLesser
    self.onList = onList
    self.isLicensed = isLicensed
    self.isAdult = isAdult
    self.country = country
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "search": search,
    "type": type,
    "sort": sort,
    "genre_in": genre_in,
    "genre_not_in": genre_not_in,
    "tag_in": tag_in,
    "tag_not_in": tag_not_in,
    "format_in": format_in,
    "status_in": status_in,
    "startDateGreater": startDateGreater,
    "startDateLesser": startDateLesser,
    "onList": onList,
    "isLicensed": isLicensed,
    "isAdult": isAdult,
    "country": country
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": .variable("page"),
        "perPage": .variable("perPage")
      ]),
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("media", [Medium?]?.self, arguments: [
          "search": .variable("search"),
          "type": .variable("type"),
          "sort": .variable("sort"),
          "genre_in": .variable("genre_in"),
          "genre_not_in": .variable("genre_not_in"),
          "tag_in": .variable("tag_in"),
          "tag_not_in": .variable("tag_not_in"),
          "format_in": .variable("format_in"),
          "status_in": .variable("status_in"),
          "startDate_greater": .variable("startDateGreater"),
          "startDate_lesser": .variable("startDateLesser"),
          "onList": .variable("onList"),
          "isLicensed": .variable("isLicensed"),
          "isAdult": .variable("isAdult"),
          "countryOfOrigin": .variable("country")
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }

      public var media: [Medium?]? { __data["media"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("title", Title?.self),
          .field("type", GraphQLEnum<AniListAPI.MediaType>?.self),
          .field("meanScore", Int?.self),
          .field("format", GraphQLEnum<AniListAPI.MediaFormat>?.self),
          .field("coverImage", CoverImage?.self),
          .field("mediaListEntry", MediaListEntry?.self),
          .field("startDate", StartDate?.self),
        ] }

        /// The id of the media
        public var id: Int { __data["id"] }
        /// The official titles of the media in various languages
        public var title: Title? { __data["title"] }
        /// The type of the media; anime or manga
        public var type: GraphQLEnum<AniListAPI.MediaType>? { __data["type"] }
        /// Mean score of all the user's scores of the media
        public var meanScore: Int? { __data["meanScore"] }
        /// The format the media was released in
        public var format: GraphQLEnum<AniListAPI.MediaFormat>? { __data["format"] }
        /// The cover images of the media
        public var coverImage: CoverImage? { __data["coverImage"] }
        /// The authenticated user's media list entry for the media
        public var mediaListEntry: MediaListEntry? { __data["mediaListEntry"] }
        /// The first official release date of the media
        public var startDate: StartDate? { __data["startDate"] }

        /// Page.Medium.Title
        ///
        /// Parent Type: `MediaTitle`
        public struct Title: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("userPreferred", String?.self),
          ] }

          /// The currently authenticated users preferred title language. Default romaji for non-authenticated
          public var userPreferred: String? { __data["userPreferred"] }
        }

        /// Page.Medium.CoverImage
        ///
        /// Parent Type: `MediaCoverImage`
        public struct CoverImage: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("large", String?.self),
          ] }

          /// The cover image url of the media at a large size
          public var large: String? { __data["large"] }
        }

        /// Page.Medium.MediaListEntry
        ///
        /// Parent Type: `MediaList`
        public struct MediaListEntry: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
          ] }

          /// The watching/reading status
          public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
        }

        /// Page.Medium.StartDate
        ///
        /// Parent Type: `FuzzyDate`
        public struct StartDate: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("year", Int?.self),
          ] }

          /// Numeric Year (2017)
          public var year: Int? { __data["year"] }
        }
      }

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("currentPage", Int?.self),
          .field("hasNextPage", Bool?.self),
        ] }

        /// The current page
        public var currentPage: Int? { __data["currentPage"] }
        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }
    }
  }
}
