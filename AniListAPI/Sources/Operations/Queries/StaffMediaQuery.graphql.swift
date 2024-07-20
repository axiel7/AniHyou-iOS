// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class StaffMediaQuery: GraphQLQuery {
  public static let operationName: String = "StaffMedia"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query StaffMedia($staffId: Int, $onList: Boolean, $page: Int, $perPage: Int) { Staff(id: $staffId) { __typename staffMedia( page: $page perPage: $perPage sort: [START_DATE_DESC] onList: $onList ) { __typename edges { __typename id node { __typename id title { __typename userPreferred } type coverImage { __typename large } mediaListEntry { __typename status } startDate { __typename ...FuzzyDateFragment } } staffRole } pageInfo { __typename currentPage hasNextPage } } } }"#,
      fragments: [FuzzyDateFragment.self]
    ))

  public var staffId: GraphQLNullable<Int>
  public var onList: GraphQLNullable<Bool>
  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>

  public init(
    staffId: GraphQLNullable<Int>,
    onList: GraphQLNullable<Bool>,
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>
  ) {
    self.staffId = staffId
    self.onList = onList
    self.page = page
    self.perPage = perPage
  }

  public var __variables: Variables? { [
    "staffId": staffId,
    "onList": onList,
    "page": page,
    "perPage": perPage
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Staff", Staff?.self, arguments: ["id": .variable("staffId")]),
    ] }

    /// Staff query
    public var staff: Staff? { __data["Staff"] }

    /// Staff
    ///
    /// Parent Type: `Staff`
    public struct Staff: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Staff }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("staffMedia", StaffMedia?.self, arguments: [
          "page": .variable("page"),
          "perPage": .variable("perPage"),
          "sort": ["START_DATE_DESC"],
          "onList": .variable("onList")
        ]),
      ] }

      /// Media where the staff member has a production role
      public var staffMedia: StaffMedia? { __data["staffMedia"] }

      /// Staff.StaffMedia
      ///
      /// Parent Type: `MediaConnection`
      public struct StaffMedia: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
          .field("pageInfo", PageInfo?.self),
        ] }

        public var edges: [Edge?]? { __data["edges"] }
        /// The pagination information
        public var pageInfo: PageInfo? { __data["pageInfo"] }

        /// Staff.StaffMedia.Edge
        ///
        /// Parent Type: `MediaEdge`
        public struct Edge: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaEdge }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("node", Node?.self),
            .field("staffRole", String?.self),
          ] }

          /// The id of the connection
          public var id: Int? { __data["id"] }
          public var node: Node? { __data["node"] }
          /// The role of the staff member in the production of the media
          public var staffRole: String? { __data["staffRole"] }

          /// Staff.StaffMedia.Edge.Node
          ///
          /// Parent Type: `Media`
          public struct Node: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
              .field("title", Title?.self),
              .field("type", GraphQLEnum<AniListAPI.MediaType>?.self),
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
            /// The cover images of the media
            public var coverImage: CoverImage? { __data["coverImage"] }
            /// The authenticated user's media list entry for the media
            public var mediaListEntry: MediaListEntry? { __data["mediaListEntry"] }
            /// The first official release date of the media
            public var startDate: StartDate? { __data["startDate"] }

            /// Staff.StaffMedia.Edge.Node.Title
            ///
            /// Parent Type: `MediaTitle`
            public struct Title: AniListAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("userPreferred", String?.self),
              ] }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }

            /// Staff.StaffMedia.Edge.Node.CoverImage
            ///
            /// Parent Type: `MediaCoverImage`
            public struct CoverImage: AniListAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("large", String?.self),
              ] }

              /// The cover image url of the media at a large size
              public var large: String? { __data["large"] }
            }

            /// Staff.StaffMedia.Edge.Node.MediaListEntry
            ///
            /// Parent Type: `MediaList`
            public struct MediaListEntry: AniListAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
              ] }

              /// The watching/reading status
              public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
            }

            /// Staff.StaffMedia.Edge.Node.StartDate
            ///
            /// Parent Type: `FuzzyDate`
            public struct StartDate: AniListAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .fragment(FuzzyDateFragment.self),
              ] }

              /// Numeric Day (24)
              public var day: Int? { __data["day"] }
              /// Numeric Month (3)
              public var month: Int? { __data["month"] }
              /// Numeric Year (2017)
              public var year: Int? { __data["year"] }

              public struct Fragments: FragmentContainer {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public var fuzzyDateFragment: FuzzyDateFragment { _toFragment() }
              }
            }
          }
        }

        /// Staff.StaffMedia.PageInfo
        ///
        /// Parent Type: `PageInfo`
        public struct PageInfo: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
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
}