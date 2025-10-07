// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct StudioMediaQuery: GraphQLQuery {
  public static let operationName: String = "StudioMedia"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query StudioMedia($studioId: Int, $page: Int, $perPage: Int) { Studio(id: $studioId) { __typename media(isMain: true, page: $page, perPage: $perPage, sort: [START_DATE_DESC]) { __typename nodes { __typename ...StudioMedia } pageInfo { __typename hasNextPage } } } }"#,
      fragments: [StudioMedia.self]
    ))

  public var studioId: GraphQLNullable<Int32>
  public var page: GraphQLNullable<Int32>
  public var perPage: GraphQLNullable<Int32>

  public init(
    studioId: GraphQLNullable<Int32>,
    page: GraphQLNullable<Int32>,
    perPage: GraphQLNullable<Int32>
  ) {
    self.studioId = studioId
    self.page = page
    self.perPage = perPage
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "studioId": studioId,
    "page": page,
    "perPage": perPage
  ] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Studio", Studio?.self, arguments: ["id": .variable("studioId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      StudioMediaQuery.Data.self
    ] }

    /// Studio query
    public var studio: Studio? { __data["Studio"] }

    /// Studio
    ///
    /// Parent Type: `Studio`
    public struct Studio: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Studio }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("media", Media?.self, arguments: [
          "isMain": true,
          "page": .variable("page"),
          "perPage": .variable("perPage"),
          "sort": ["START_DATE_DESC"]
        ]),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        StudioMediaQuery.Data.Studio.self
      ] }

      /// The media the studio has worked on
      public var media: Media? { __data["media"] }

      /// Studio.Media
      ///
      /// Parent Type: `MediaConnection`
      public struct Media: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaConnection }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node?]?.self),
          .field("pageInfo", PageInfo?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          StudioMediaQuery.Data.Studio.Media.self
        ] }

        public var nodes: [Node?]? { __data["nodes"] }
        /// The pagination information
        public var pageInfo: PageInfo? { __data["pageInfo"] }

        /// Studio.Media.Node
        ///
        /// Parent Type: `Media`
        public struct Node: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(StudioMedia.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            StudioMediaQuery.Data.Studio.Media.Node.self,
            StudioMedia.self
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
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

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
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("hasNextPage", Bool?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            StudioMediaQuery.Data.Studio.Media.PageInfo.self
          ] }

          /// If there is another page
          public var hasNextPage: Bool? { __data["hasNextPage"] }
        }
      }
    }
  }
}
