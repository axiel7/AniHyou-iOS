// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class StudioMediaQuery: GraphQLQuery {
  public static let operationName: String = "StudioMedia"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query StudioMedia($studioId: Int, $page: Int, $perPage: Int) { Studio(id: $studioId) { __typename media(isMain: true, page: $page, perPage: $perPage, sort: [START_DATE_DESC]) { __typename nodes { __typename ...StudioMedia } pageInfo { __typename hasNextPage } } } }"#,
      fragments: [StudioMedia.self]
    ))

  public var studioId: GraphQLNullable<Int>
  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>

  public init(
    studioId: GraphQLNullable<Int>,
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>
  ) {
    self.studioId = studioId
    self.page = page
    self.perPage = perPage
  }

  public var __variables: Variables? { [
    "studioId": studioId,
    "page": page,
    "perPage": perPage
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Studio", Studio?.self, arguments: ["id": .variable("studioId")]),
    ] }

    /// Studio query
    public var studio: Studio? { __data["Studio"] }

    /// Studio
    ///
    /// Parent Type: `Studio`
    public struct Studio: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Studio }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("media", Media?.self, arguments: [
          "isMain": true,
          "page": .variable("page"),
          "perPage": .variable("perPage"),
          "sort": ["START_DATE_DESC"]
        ]),
      ] }

      /// The media the studio has worked on
      public var media: Media? { __data["media"] }

      /// Studio.Media
      ///
      /// Parent Type: `MediaConnection`
      public struct Media: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node?]?.self),
          .field("pageInfo", PageInfo?.self),
        ] }

        public var nodes: [Node?]? { __data["nodes"] }
        /// The pagination information
        public var pageInfo: PageInfo? { __data["pageInfo"] }

        /// Studio.Media.Node
        ///
        /// Parent Type: `Media`
        public struct Node: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(StudioMedia.self),
          ] }

          /// The id of the media
          public var id: Int { __data["id"] }
          /// The cover images of the media
          public var coverImage: CoverImage? { __data["coverImage"] }
          /// The official titles of the media in various languages
          public var title: Title? { __data["title"] }
          /// The type of the media; anime or manga
          public var type: GraphQLEnum<AniListAPI.MediaType>? { __data["type"] }
          /// The authenticated user's media list entry for the media
          public var mediaListEntry: MediaListEntry? { __data["mediaListEntry"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var studioMedia: StudioMedia { _toFragment() }
          }

          public typealias CoverImage = StudioMedia.CoverImage

          public typealias Title = StudioMedia.Title

          public typealias MediaListEntry = StudioMedia.MediaListEntry
        }

        /// Studio.Media.PageInfo
        ///
        /// Parent Type: `PageInfo`
        public struct PageInfo: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("hasNextPage", Bool?.self),
          ] }

          /// If there is another page
          public var hasNextPage: Bool? { __data["hasNextPage"] }
        }
      }
    }
  }
}