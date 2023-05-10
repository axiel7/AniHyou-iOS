// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class MediaDetailsQuery: GraphQLQuery {
  public static let operationName: String = "MediaDetails"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query MediaDetails($mediaId: Int) {
        Media(id: $mediaId) {
          __typename
          id
          title {
            __typename
            userPreferred
            romaji
            english
            native
          }
          format
          status
          description
          startDate {
            __typename
            ...FuzzyDate
          }
          endDate {
            __typename
            ...FuzzyDate
          }
          season
          seasonYear
          episodes
          duration
          chapters
          volumes
          coverImage {
            __typename
            large
            extraLarge
            color
          }
          bannerImage
          averageScore
          meanScore
          popularity
          genres
          studios {
            __typename
            nodes {
              __typename
              name
              isAnimationStudio
            }
          }
          favourites
          type
          nextAiringEpisode {
            __typename
            timeUntilAiring
            episode
          }
          mediaListEntry {
            __typename
            ...BasicMediaListEntry
            startedAt {
              __typename
              ...FuzzyDate
            }
            completedAt {
              __typename
              ...FuzzyDate
            }
          }
          source
          externalLinks {
            __typename
            id
            url
            site
            type
          }
          trailer {
            __typename
            id
            site
            thumbnail
          }
          streamingEpisodes {
            __typename
            url
            title
            site
            thumbnail
          }
          tags {
            __typename
            id
            name
            rank
            isMediaSpoiler
          }
        }
      }
      """#,
      fragments: [FuzzyDate.self, BasicMediaListEntry.self]
    ))

  public var mediaId: GraphQLNullable<Int>

  public init(mediaId: GraphQLNullable<Int>) {
    self.mediaId = mediaId
  }

  public var __variables: Variables? { ["mediaId": mediaId] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Media", Media?.self, arguments: ["id": .variable("mediaId")]),
    ] }

    /// Media query
    public var media: Media? { __data["Media"] }

    /// Media
    ///
    /// Parent Type: `Media`
    public struct Media: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Media }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("title", Title?.self),
        .field("format", GraphQLEnum<API.MediaFormat>?.self),
        .field("status", GraphQLEnum<API.MediaStatus>?.self),
        .field("description", String?.self),
        .field("startDate", StartDate?.self),
        .field("endDate", EndDate?.self),
        .field("season", GraphQLEnum<API.MediaSeason>?.self),
        .field("seasonYear", Int?.self),
        .field("episodes", Int?.self),
        .field("duration", Int?.self),
        .field("chapters", Int?.self),
        .field("volumes", Int?.self),
        .field("coverImage", CoverImage?.self),
        .field("bannerImage", String?.self),
        .field("averageScore", Int?.self),
        .field("meanScore", Int?.self),
        .field("popularity", Int?.self),
        .field("genres", [String?]?.self),
        .field("studios", Studios?.self),
        .field("favourites", Int?.self),
        .field("type", GraphQLEnum<API.MediaType>?.self),
        .field("nextAiringEpisode", NextAiringEpisode?.self),
        .field("mediaListEntry", MediaListEntry?.self),
        .field("source", GraphQLEnum<API.MediaSource>?.self),
        .field("externalLinks", [ExternalLink?]?.self),
        .field("trailer", Trailer?.self),
        .field("streamingEpisodes", [StreamingEpisode?]?.self),
        .field("tags", [Tag?]?.self),
      ] }

      /// The id of the media
      public var id: Int { __data["id"] }
      /// The official titles of the media in various languages
      public var title: Title? { __data["title"] }
      /// The format the media was released in
      public var format: GraphQLEnum<API.MediaFormat>? { __data["format"] }
      /// The current releasing status of the media
      public var status: GraphQLEnum<API.MediaStatus>? { __data["status"] }
      /// Short description of the media's story and characters
      public var description: String? { __data["description"] }
      /// The first official release date of the media
      public var startDate: StartDate? { __data["startDate"] }
      /// The last official release date of the media
      public var endDate: EndDate? { __data["endDate"] }
      /// The season the media was initially released in
      public var season: GraphQLEnum<API.MediaSeason>? { __data["season"] }
      /// The season year the media was initially released in
      public var seasonYear: Int? { __data["seasonYear"] }
      /// The amount of episodes the anime has when complete
      public var episodes: Int? { __data["episodes"] }
      /// The general length of each anime episode in minutes
      public var duration: Int? { __data["duration"] }
      /// The amount of chapters the manga has when complete
      public var chapters: Int? { __data["chapters"] }
      /// The amount of volumes the manga has when complete
      public var volumes: Int? { __data["volumes"] }
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
      /// The type of the media; anime or manga
      public var type: GraphQLEnum<API.MediaType>? { __data["type"] }
      /// The media's next episode airing schedule
      public var nextAiringEpisode: NextAiringEpisode? { __data["nextAiringEpisode"] }
      /// The authenticated user's media list entry for the media
      public var mediaListEntry: MediaListEntry? { __data["mediaListEntry"] }
      /// Source type the media was adapted from.
      public var source: GraphQLEnum<API.MediaSource>? { __data["source"] }
      /// External links to another site related to the media
      public var externalLinks: [ExternalLink?]? { __data["externalLinks"] }
      /// Media trailer or advertisement
      public var trailer: Trailer? { __data["trailer"] }
      /// Data and links to legal streaming episodes on external sites
      public var streamingEpisodes: [StreamingEpisode?]? { __data["streamingEpisodes"] }
      /// List of tags that describes elements and themes of the media
      public var tags: [Tag?]? { __data["tags"] }

      /// Media.Title
      ///
      /// Parent Type: `MediaTitle`
      public struct Title: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaTitle }
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
      public struct StartDate: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.FuzzyDate }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(FuzzyDate.self),
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

          public var fuzzyDate: FuzzyDate { _toFragment() }
        }
      }

      /// Media.EndDate
      ///
      /// Parent Type: `FuzzyDate`
      public struct EndDate: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.FuzzyDate }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(FuzzyDate.self),
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

          public var fuzzyDate: FuzzyDate { _toFragment() }
        }
      }

      /// Media.CoverImage
      ///
      /// Parent Type: `MediaCoverImage`
      public struct CoverImage: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaCoverImage }
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
      public struct Studios: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.StudioConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node?]?.self),
        ] }

        public var nodes: [Node?]? { __data["nodes"] }

        /// Media.Studios.Node
        ///
        /// Parent Type: `Studio`
        public struct Node: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.Studio }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
            .field("isAnimationStudio", Bool.self),
          ] }

          /// The name of the studio
          public var name: String { __data["name"] }
          /// If the studio is an animation studio or a different kind of company
          public var isAnimationStudio: Bool { __data["isAnimationStudio"] }
        }
      }

      /// Media.NextAiringEpisode
      ///
      /// Parent Type: `AiringSchedule`
      public struct NextAiringEpisode: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.AiringSchedule }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("timeUntilAiring", Int.self),
          .field("episode", Int.self),
        ] }

        /// Seconds until episode starts airing
        public var timeUntilAiring: Int { __data["timeUntilAiring"] }
        /// The airing episode number
        public var episode: Int { __data["episode"] }
      }

      /// Media.MediaListEntry
      ///
      /// Parent Type: `MediaList`
      public struct MediaListEntry: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaList }
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
        /// The watching/reading status
        public var status: GraphQLEnum<API.MediaListStatus>? { __data["status"] }
        /// The score of the entry
        public var score: Double? { __data["score"] }
        /// The amount of episodes/chapters consumed by the user
        public var progress: Int? { __data["progress"] }
        /// The amount of volumes read by the user
        public var progressVolumes: Int? { __data["progressVolumes"] }
        /// The amount of times the user has rewatched/read the media
        public var `repeat`: Int? { __data["repeat"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var basicMediaListEntry: BasicMediaListEntry { _toFragment() }
        }

        /// Media.MediaListEntry.StartedAt
        ///
        /// Parent Type: `FuzzyDate`
        public struct StartedAt: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.FuzzyDate }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(FuzzyDate.self),
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

            public var fuzzyDate: FuzzyDate { _toFragment() }
          }
        }

        /// Media.MediaListEntry.CompletedAt
        ///
        /// Parent Type: `FuzzyDate`
        public struct CompletedAt: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.FuzzyDate }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(FuzzyDate.self),
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

            public var fuzzyDate: FuzzyDate { _toFragment() }
          }
        }
      }

      /// Media.ExternalLink
      ///
      /// Parent Type: `MediaExternalLink`
      public struct ExternalLink: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaExternalLink }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("url", String?.self),
          .field("site", String.self),
          .field("type", GraphQLEnum<API.ExternalLinkType>?.self),
        ] }

        /// The id of the external link
        public var id: Int { __data["id"] }
        /// The url of the external link or base url of link source
        public var url: String? { __data["url"] }
        /// The links website site name
        public var site: String { __data["site"] }
        public var type: GraphQLEnum<API.ExternalLinkType>? { __data["type"] }
      }

      /// Media.Trailer
      ///
      /// Parent Type: `MediaTrailer`
      public struct Trailer: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaTrailer }
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
      public struct StreamingEpisode: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaStreamingEpisode }
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
      public struct Tag: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaTag }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("name", String.self),
          .field("rank", Int?.self),
          .field("isMediaSpoiler", Bool?.self),
        ] }

        /// The id of the tag
        public var id: Int { __data["id"] }
        /// The name of the tag
        public var name: String { __data["name"] }
        /// The relevance ranking of the tag out of the 100 for this media
        public var rank: Int? { __data["rank"] }
        /// If the tag is a spoiler for this media
        public var isMediaSpoiler: Bool? { __data["isMediaSpoiler"] }
      }
    }
  }
}
