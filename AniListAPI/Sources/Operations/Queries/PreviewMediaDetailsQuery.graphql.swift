// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct PreviewMediaDetailsQuery: GraphQLQuery {
  public static let operationName: String = "PreviewMediaDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query PreviewMediaDetails($mediaId: Int) { Media(id: $mediaId) { __typename title { __typename userPreferred } coverImage { __typename large } meanScore format episodes chapters volumes genres nextAiringEpisode { __typename airingAt episode } mediaListEntry { __typename status progress } } }"#
    ))

  public var mediaId: GraphQLNullable<Int32>

  public init(mediaId: GraphQLNullable<Int32>) {
    self.mediaId = mediaId
  }

  @_spi(Unsafe) public var __variables: Variables? { ["mediaId": mediaId] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Media", Media?.self, arguments: ["id": .variable("mediaId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      PreviewMediaDetailsQuery.Data.self
    ] }

    /// Media query
    public var media: Media? { __data["Media"] }

    /// Media
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
        .field("format", GraphQLEnum<AniListAPI.MediaFormat>?.self),
        .field("episodes", Int?.self),
        .field("chapters", Int?.self),
        .field("volumes", Int?.self),
        .field("genres", [String?]?.self),
        .field("nextAiringEpisode", NextAiringEpisode?.self),
        .field("mediaListEntry", MediaListEntry?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        PreviewMediaDetailsQuery.Data.Media.self
      ] }

      /// The official titles of the media in various languages
      public var title: Title? { __data["title"] }
      /// The cover images of the media
      public var coverImage: CoverImage? { __data["coverImage"] }
      /// Mean score of all the user's scores of the media
      public var meanScore: Int? { __data["meanScore"] }
      /// The format the media was released in
      public var format: GraphQLEnum<AniListAPI.MediaFormat>? { __data["format"] }
      /// The amount of episodes the anime has when complete
      public var episodes: Int? { __data["episodes"] }
      /// The amount of chapters the manga has when complete
      public var chapters: Int? { __data["chapters"] }
      /// The amount of volumes the manga has when complete
      public var volumes: Int? { __data["volumes"] }
      /// The genres of the media
      public var genres: [String?]? { __data["genres"] }
      /// The media's next episode airing schedule
      public var nextAiringEpisode: NextAiringEpisode? { __data["nextAiringEpisode"] }
      /// The authenticated user's media list entry for the media
      public var mediaListEntry: MediaListEntry? { __data["mediaListEntry"] }

      /// Media.Title
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
          PreviewMediaDetailsQuery.Data.Media.Title.self
        ] }

        /// The currently authenticated users preferred title language. Default romaji for non-authenticated
        public var userPreferred: String? { __data["userPreferred"] }
      }

      /// Media.CoverImage
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
          PreviewMediaDetailsQuery.Data.Media.CoverImage.self
        ] }

        /// The cover image url of the media at a large size
        public var large: String? { __data["large"] }
      }

      /// Media.NextAiringEpisode
      ///
      /// Parent Type: `AiringSchedule`
      public struct NextAiringEpisode: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.AiringSchedule }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("airingAt", Int.self),
          .field("episode", Int.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          PreviewMediaDetailsQuery.Data.Media.NextAiringEpisode.self
        ] }

        /// The time the episode airs at
        public var airingAt: Int { __data["airingAt"] }
        /// The airing episode number
        public var episode: Int { __data["episode"] }
      }

      /// Media.MediaListEntry
      ///
      /// Parent Type: `MediaList`
      public struct MediaListEntry: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
          .field("progress", Int?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          PreviewMediaDetailsQuery.Data.Media.MediaListEntry.self
        ] }

        /// The watching/reading status
        public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
        /// The amount of episodes/chapters consumed by the user
        public var progress: Int? { __data["progress"] }
      }
    }
  }
}
