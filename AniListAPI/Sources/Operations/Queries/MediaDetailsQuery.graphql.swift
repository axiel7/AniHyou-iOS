// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MediaDetailsQuery: GraphQLQuery {
  public static let operationName: String = "MediaDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MediaDetails($mediaId: Int) { Media(id: $mediaId) { __typename ...BasicMediaDetails title { __typename userPreferred romaji english native } synonyms format status(version: 2) description(asHtml: true) startDate { __typename ...FuzzyDateFragment } endDate { __typename ...FuzzyDateFragment } season seasonYear duration coverImage { __typename large extraLarge color } bannerImage averageScore meanScore popularity genres studios { __typename nodes { __typename id name isAnimationStudio } } favourites ...IsFavouriteMedia nextAiringEpisode { __typename airingAt episode } mediaListEntry { __typename ...BasicMediaListEntry startedAt { __typename ...FuzzyDateFragment } completedAt { __typename ...FuzzyDateFragment } } source externalLinks { __typename id url site type language } trailer { __typename id site thumbnail } streamingEpisodes { __typename url title site thumbnail } tags { __typename id name description rank isMediaSpoiler } } }"#,
      fragments: [BasicMediaDetails.self, BasicMediaListEntry.self, FuzzyDateFragment.self, IsFavouriteMedia.self]
    ))

  public var mediaId: GraphQLNullable<Int>

  public init(mediaId: GraphQLNullable<Int>) {
    self.mediaId = mediaId
  }

  public var __variables: Variables? { ["mediaId": mediaId] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Media", Media?.self, arguments: ["id": .variable("mediaId")]),
    ] }

    /// Media query
    public var media: Media? { __data["Media"] }

    /// Media
    ///
    /// Parent Type: `Media`
    public struct Media: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Media }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("title", Title?.self),
        .field("synonyms", [String?]?.self),
        .field("format", GraphQLEnum<AniListAPI.MediaFormat>?.self),
        .field("status", GraphQLEnum<AniListAPI.MediaStatus>?.self, arguments: ["version": 2]),
        .field("description", String?.self, arguments: ["asHtml": true]),
        .field("startDate", StartDate?.self),
        .field("endDate", EndDate?.self),
        .field("season", GraphQLEnum<AniListAPI.MediaSeason>?.self),
        .field("seasonYear", Int?.self),
        .field("duration", Int?.self),
        .field("coverImage", CoverImage?.self),
        .field("bannerImage", String?.self),
        .field("averageScore", Int?.self),
        .field("meanScore", Int?.self),
        .field("popularity", Int?.self),
        .field("genres", [String?]?.self),
        .field("studios", Studios?.self),
        .field("favourites", Int?.self),
        .field("nextAiringEpisode", NextAiringEpisode?.self),
        .field("mediaListEntry", MediaListEntry?.self),
        .field("source", GraphQLEnum<AniListAPI.MediaSource>?.self),
        .field("externalLinks", [ExternalLink?]?.self),
        .field("trailer", Trailer?.self),
        .field("streamingEpisodes", [StreamingEpisode?]?.self),
        .field("tags", [Tag?]?.self),
        .fragment(BasicMediaDetails.self),
        .fragment(IsFavouriteMedia.self),
      ] }

      /// The official titles of the media in various languages
      public var title: Title? { __data["title"] }
      /// Alternative titles of the media
      public var synonyms: [String?]? { __data["synonyms"] }
      /// The format the media was released in
      public var format: GraphQLEnum<AniListAPI.MediaFormat>? { __data["format"] }
      /// The current releasing status of the media
      public var status: GraphQLEnum<AniListAPI.MediaStatus>? { __data["status"] }
      /// Short description of the media's story and characters
      public var description: String? { __data["description"] }
      /// The first official release date of the media
      public var startDate: StartDate? { __data["startDate"] }
      /// The last official release date of the media
      public var endDate: EndDate? { __data["endDate"] }
      /// The season the media was initially released in
      public var season: GraphQLEnum<AniListAPI.MediaSeason>? { __data["season"] }
      /// The season year the media was initially released in
      public var seasonYear: Int? { __data["seasonYear"] }
      /// The general length of each anime episode in minutes
      public var duration: Int? { __data["duration"] }
      /// The cover images of the media
      public var coverImage: CoverImage? { __data["coverImage"] }
      /// The banner image of the media
      public var bannerImage: String? { __data["bannerImage"] }
      /// A weighted average score of all the user's scores of the media
      public var averageScore: Int? { __data["averageScore"] }
      /// Mean score of all the user's scores of the media
      public var meanScore: Int? { __data["meanScore"] }
      /// The number of users with the media on their list
      public var popularity: Int? { __data["popularity"] }
      /// The genres of the media
      public var genres: [String?]? { __data["genres"] }
      /// The companies who produced the media
      public var studios: Studios? { __data["studios"] }
      /// The amount of user's who have favourited the media
      public var favourites: Int? { __data["favourites"] }
      /// The media's next episode airing schedule
      public var nextAiringEpisode: NextAiringEpisode? { __data["nextAiringEpisode"] }
      /// The authenticated user's media list entry for the media
      public var mediaListEntry: MediaListEntry? { __data["mediaListEntry"] }
      /// Source type the media was adapted from.
      public var source: GraphQLEnum<AniListAPI.MediaSource>? { __data["source"] }
      /// External links to another site related to the media
      public var externalLinks: [ExternalLink?]? { __data["externalLinks"] }
      /// Media trailer or advertisement
      public var trailer: Trailer? { __data["trailer"] }
      /// Data and links to legal streaming episodes on external sites
      public var streamingEpisodes: [StreamingEpisode?]? { __data["streamingEpisodes"] }
      /// List of tags that describes elements and themes of the media
      public var tags: [Tag?]? { __data["tags"] }
      /// The id of the media
      public var id: Int { __data["id"] }
      /// The amount of episodes the anime has when complete
      public var episodes: Int? { __data["episodes"] }
      /// The amount of chapters the manga has when complete
      public var chapters: Int? { __data["chapters"] }
      /// The amount of volumes the manga has when complete
      public var volumes: Int? { __data["volumes"] }
      /// The type of the media; anime or manga
      public var type: GraphQLEnum<AniListAPI.MediaType>? { __data["type"] }
      /// If the media is marked as favourite by the current authenticated user
      public var isFavourite: Bool { __data["isFavourite"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var basicMediaDetails: BasicMediaDetails { _toFragment() }
        public var isFavouriteMedia: IsFavouriteMedia { _toFragment() }
      }

      /// Media.Title
      ///
      /// Parent Type: `MediaTitle`
      public struct Title: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("userPreferred", String?.self),
          .field("romaji", String?.self),
          .field("english", String?.self),
          .field("native", String?.self),
        ] }

        /// The currently authenticated users preferred title language. Default romaji for non-authenticated
        public var userPreferred: String? { __data["userPreferred"] }
        /// The romanization of the native language title
        public var romaji: String? { __data["romaji"] }
        /// The official english title
        public var english: String? { __data["english"] }
        /// Official title in it's native language
        public var native: String? { __data["native"] }
      }

      /// Media.StartDate
      ///
      /// Parent Type: `FuzzyDate`
      public struct StartDate: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
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

      /// Media.EndDate
      ///
      /// Parent Type: `FuzzyDate`
      public struct EndDate: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
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

      /// Media.CoverImage
      ///
      /// Parent Type: `MediaCoverImage`
      public struct CoverImage: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("large", String?.self),
          .field("extraLarge", String?.self),
          .field("color", String?.self),
        ] }

        /// The cover image url of the media at a large size
        public var large: String? { __data["large"] }
        /// The cover image url of the media at its largest size. If this size isn't available, large will be provided instead.
        public var extraLarge: String? { __data["extraLarge"] }
        /// Average #hex color of cover image
        public var color: String? { __data["color"] }
      }

      /// Media.Studios
      ///
      /// Parent Type: `StudioConnection`
      public struct Studios: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.StudioConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node?]?.self),
        ] }

        public var nodes: [Node?]? { __data["nodes"] }

        /// Media.Studios.Node
        ///
        /// Parent Type: `Studio`
        public struct Node: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Studio }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int.self),
            .field("name", String.self),
            .field("isAnimationStudio", Bool.self),
          ] }

          /// The id of the studio
          public var id: Int { __data["id"] }
          /// The name of the studio
          public var name: String { __data["name"] }
          /// If the studio is an animation studio or a different kind of company
          public var isAnimationStudio: Bool { __data["isAnimationStudio"] }
        }
      }

      /// Media.NextAiringEpisode
      ///
      /// Parent Type: `AiringSchedule`
      public struct NextAiringEpisode: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.AiringSchedule }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("airingAt", Int.self),
          .field("episode", Int.self),
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
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("startedAt", StartedAt?.self),
          .field("completedAt", CompletedAt?.self),
          .fragment(BasicMediaListEntry.self),
        ] }

        /// When the entry was started by the user
        public var startedAt: StartedAt? { __data["startedAt"] }
        /// When the entry was completed by the user
        public var completedAt: CompletedAt? { __data["completedAt"] }
        /// The id of the list entry
        public var id: Int { __data["id"] }
        /// The id of the media
        public var mediaId: Int { __data["mediaId"] }
        /// The amount of episodes/chapters consumed by the user
        public var progress: Int? { __data["progress"] }
        /// The amount of volumes read by the user
        public var progressVolumes: Int? { __data["progressVolumes"] }
        /// The watching/reading status
        public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
        /// The score of the entry
        public var score: Double? { __data["score"] }
        /// Map of advanced scores with name keys
        public var advancedScores: AniListAPI.Json? { __data["advancedScores"] }
        /// The amount of times the user has rewatched/read the media
        public var `repeat`: Int? { __data["repeat"] }
        /// If the entry should only be visible to authenticated user
        public var `private`: Bool? { __data["private"] }
        /// If the entry shown be hidden from non-custom lists
        public var hiddenFromStatusLists: Bool? { __data["hiddenFromStatusLists"] }
        /// Text notes
        public var notes: String? { __data["notes"] }
        /// Map of booleans for which custom lists the entry are in
        public var customLists: AniListAPI.Json? { __data["customLists"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var basicMediaListEntry: BasicMediaListEntry { _toFragment() }
        }

        /// Media.MediaListEntry.StartedAt
        ///
        /// Parent Type: `FuzzyDate`
        public struct StartedAt: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
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

        /// Media.MediaListEntry.CompletedAt
        ///
        /// Parent Type: `FuzzyDate`
        public struct CompletedAt: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
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

      /// Media.ExternalLink
      ///
      /// Parent Type: `MediaExternalLink`
      public struct ExternalLink: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaExternalLink }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("url", String?.self),
          .field("site", String.self),
          .field("type", GraphQLEnum<AniListAPI.ExternalLinkType>?.self),
          .field("language", String?.self),
        ] }

        /// The id of the external link
        public var id: Int { __data["id"] }
        /// The url of the external link or base url of link source
        public var url: String? { __data["url"] }
        /// The links website site name
        public var site: String { __data["site"] }
        public var type: GraphQLEnum<AniListAPI.ExternalLinkType>? { __data["type"] }
        /// Language the site content is in. See Staff language field for values.
        public var language: String? { __data["language"] }
      }

      /// Media.Trailer
      ///
      /// Parent Type: `MediaTrailer`
      public struct Trailer: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaTrailer }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", String?.self),
          .field("site", String?.self),
          .field("thumbnail", String?.self),
        ] }

        /// The trailer video id
        public var id: String? { __data["id"] }
        /// The site the video is hosted by (Currently either youtube or dailymotion)
        public var site: String? { __data["site"] }
        /// The url for the thumbnail image of the video
        public var thumbnail: String? { __data["thumbnail"] }
      }

      /// Media.StreamingEpisode
      ///
      /// Parent Type: `MediaStreamingEpisode`
      public struct StreamingEpisode: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaStreamingEpisode }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("url", String?.self),
          .field("title", String?.self),
          .field("site", String?.self),
          .field("thumbnail", String?.self),
        ] }

        /// The url of the episode
        public var url: String? { __data["url"] }
        /// Title of the episode
        public var title: String? { __data["title"] }
        /// The site location of the streaming episodes
        public var site: String? { __data["site"] }
        /// Url of episode image thumbnail
        public var thumbnail: String? { __data["thumbnail"] }
      }

      /// Media.Tag
      ///
      /// Parent Type: `MediaTag`
      public struct Tag: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaTag }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("name", String.self),
          .field("description", String?.self),
          .field("rank", Int?.self),
          .field("isMediaSpoiler", Bool?.self),
        ] }

        /// The id of the tag
        public var id: Int { __data["id"] }
        /// The name of the tag
        public var name: String { __data["name"] }
        /// A general description of the tag
        public var description: String? { __data["description"] }
        /// The relevance ranking of the tag out of the 100 for this media
        public var rank: Int? { __data["rank"] }
        /// If the tag is a spoiler for this media
        public var isMediaSpoiler: Bool? { __data["isMediaSpoiler"] }
      }
    }
  }
}
