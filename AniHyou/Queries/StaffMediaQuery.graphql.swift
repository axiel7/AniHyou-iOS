// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class StaffMediaQuery: GraphQLQuery {
  public static let operationName: String = "StaffMedia"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query StaffMedia($staffId: Int, $onList: Boolean, $page: Int, $perPage: Int) {
        Staff(id: $staffId) {
          __typename
          staffMedia(
            page: $page
            perPage: $perPage
            sort: [START_DATE_DESC]
            onList: $onList
          ) {
            __typename
            edges {
              __typename
              id
              node {
                __typename
                id
                title {
                  __typename
                  userPreferred
                }
                coverImage {
                  __typename
                  large
                }
              }
              staffRole
            }
            pageInfo {
              __typename
              currentPage
              hasNextPage
            }
          }
        }
      }
      """#
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

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Staff", Staff?.self, arguments: ["id": .variable("staffId")]),
    ] }

    /// Staff query
    public var staff: Staff? { __data["Staff"] }

    /// Staff
    ///
    /// Parent Type: `Staff`
    public struct Staff: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Staff }
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
      public struct StaffMedia: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaConnection }
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
        public struct Edge: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaEdge }
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
          public struct Node: API.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.Media }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
              .field("title", Title?.self),
              .field("coverImage", CoverImage?.self),
            ] }

            /// The id of the media
            public var id: Int { __data["id"] }
            /// The official titles of the media in various languages
            public var title: Title? { __data["title"] }
            /// The cover images of the media
            public var coverImage: CoverImage? { __data["coverImage"] }

            /// Staff.StaffMedia.Edge.Node.Title
            ///
            /// Parent Type: `MediaTitle`
            public struct Title: API.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaTitle }
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
            public struct CoverImage: API.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaCoverImage }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("large", String?.self),
              ] }

              /// The cover image url of the media at a large size
              public var large: String? { __data["large"] }
            }
          }
        }

        /// Staff.StaffMedia.PageInfo
        ///
        /// Parent Type: `PageInfo`
        public struct PageInfo: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.PageInfo }
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
