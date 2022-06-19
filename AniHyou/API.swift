// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// Media type enum, anime or manga.
public enum MediaType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Japanese Anime
  case anime
  /// Asian comic
  case manga
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ANIME": self = .anime
      case "MANGA": self = .manga
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .anime: return "ANIME"
      case .manga: return "MANGA"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaType, rhs: MediaType) -> Bool {
    switch (lhs, rhs) {
      case (.anime, .anime): return true
      case (.manga, .manga): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaType] {
    return [
      .anime,
      .manga,
    ]
  }
}

/// The format the media was released in
public enum MediaFormat: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Anime broadcast on television
  case tv
  /// Anime which are under 15 minutes in length and broadcast on television
  case tvShort
  /// Anime movies with a theatrical release
  case movie
  /// Special episodes that have been included in DVD/Blu-ray releases, picture dramas, pilots, etc
  case special
  /// (Original Video Animation) Anime that have been released directly on DVD/Blu-ray without originally going through a theatrical release or television broadcast
  case ova
  /// (Original Net Animation) Anime that have been originally released online or are only available through streaming services.
  case ona
  /// Short anime released as a music video
  case music
  /// Professionally published manga with more than one chapter
  case manga
  /// Written books released as a series of light novels
  case novel
  /// Manga with just one chapter
  case oneShot
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "TV": self = .tv
      case "TV_SHORT": self = .tvShort
      case "MOVIE": self = .movie
      case "SPECIAL": self = .special
      case "OVA": self = .ova
      case "ONA": self = .ona
      case "MUSIC": self = .music
      case "MANGA": self = .manga
      case "NOVEL": self = .novel
      case "ONE_SHOT": self = .oneShot
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .tv: return "TV"
      case .tvShort: return "TV_SHORT"
      case .movie: return "MOVIE"
      case .special: return "SPECIAL"
      case .ova: return "OVA"
      case .ona: return "ONA"
      case .music: return "MUSIC"
      case .manga: return "MANGA"
      case .novel: return "NOVEL"
      case .oneShot: return "ONE_SHOT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaFormat, rhs: MediaFormat) -> Bool {
    switch (lhs, rhs) {
      case (.tv, .tv): return true
      case (.tvShort, .tvShort): return true
      case (.movie, .movie): return true
      case (.special, .special): return true
      case (.ova, .ova): return true
      case (.ona, .ona): return true
      case (.music, .music): return true
      case (.manga, .manga): return true
      case (.novel, .novel): return true
      case (.oneShot, .oneShot): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaFormat] {
    return [
      .tv,
      .tvShort,
      .movie,
      .special,
      .ova,
      .ona,
      .music,
      .manga,
      .novel,
      .oneShot,
    ]
  }
}

/// The current releasing status of the media
public enum MediaStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Has completed and is no longer being released
  case finished
  /// Currently releasing
  case releasing
  /// To be released at a later date
  case notYetReleased
  /// Ended before the work could be finished
  case cancelled
  /// Version 2 only. Is currently paused from releasing and will resume at a later date
  case hiatus
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "FINISHED": self = .finished
      case "RELEASING": self = .releasing
      case "NOT_YET_RELEASED": self = .notYetReleased
      case "CANCELLED": self = .cancelled
      case "HIATUS": self = .hiatus
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .finished: return "FINISHED"
      case .releasing: return "RELEASING"
      case .notYetReleased: return "NOT_YET_RELEASED"
      case .cancelled: return "CANCELLED"
      case .hiatus: return "HIATUS"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaStatus, rhs: MediaStatus) -> Bool {
    switch (lhs, rhs) {
      case (.finished, .finished): return true
      case (.releasing, .releasing): return true
      case (.notYetReleased, .notYetReleased): return true
      case (.cancelled, .cancelled): return true
      case (.hiatus, .hiatus): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaStatus] {
    return [
      .finished,
      .releasing,
      .notYetReleased,
      .cancelled,
      .hiatus,
    ]
  }
}

public enum MediaSeason: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Months December to February
  case winter
  /// Months March to May
  case spring
  /// Months June to August
  case summer
  /// Months September to November
  case fall
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "WINTER": self = .winter
      case "SPRING": self = .spring
      case "SUMMER": self = .summer
      case "FALL": self = .fall
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .winter: return "WINTER"
      case .spring: return "SPRING"
      case .summer: return "SUMMER"
      case .fall: return "FALL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaSeason, rhs: MediaSeason) -> Bool {
    switch (lhs, rhs) {
      case (.winter, .winter): return true
      case (.spring, .spring): return true
      case (.summer, .summer): return true
      case (.fall, .fall): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaSeason] {
    return [
      .winter,
      .spring,
      .summer,
      .fall,
    ]
  }
}

/// Media sort enums
public enum MediaSort: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case id
  case idDesc
  case titleRomaji
  case titleRomajiDesc
  case titleEnglish
  case titleEnglishDesc
  case titleNative
  case titleNativeDesc
  case type
  case typeDesc
  case format
  case formatDesc
  case startDate
  case startDateDesc
  case endDate
  case endDateDesc
  case score
  case scoreDesc
  case popularity
  case popularityDesc
  case trending
  case trendingDesc
  case episodes
  case episodesDesc
  case duration
  case durationDesc
  case status
  case statusDesc
  case chapters
  case chaptersDesc
  case volumes
  case volumesDesc
  case updatedAt
  case updatedAtDesc
  case searchMatch
  case favourites
  case favouritesDesc
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ID": self = .id
      case "ID_DESC": self = .idDesc
      case "TITLE_ROMAJI": self = .titleRomaji
      case "TITLE_ROMAJI_DESC": self = .titleRomajiDesc
      case "TITLE_ENGLISH": self = .titleEnglish
      case "TITLE_ENGLISH_DESC": self = .titleEnglishDesc
      case "TITLE_NATIVE": self = .titleNative
      case "TITLE_NATIVE_DESC": self = .titleNativeDesc
      case "TYPE": self = .type
      case "TYPE_DESC": self = .typeDesc
      case "FORMAT": self = .format
      case "FORMAT_DESC": self = .formatDesc
      case "START_DATE": self = .startDate
      case "START_DATE_DESC": self = .startDateDesc
      case "END_DATE": self = .endDate
      case "END_DATE_DESC": self = .endDateDesc
      case "SCORE": self = .score
      case "SCORE_DESC": self = .scoreDesc
      case "POPULARITY": self = .popularity
      case "POPULARITY_DESC": self = .popularityDesc
      case "TRENDING": self = .trending
      case "TRENDING_DESC": self = .trendingDesc
      case "EPISODES": self = .episodes
      case "EPISODES_DESC": self = .episodesDesc
      case "DURATION": self = .duration
      case "DURATION_DESC": self = .durationDesc
      case "STATUS": self = .status
      case "STATUS_DESC": self = .statusDesc
      case "CHAPTERS": self = .chapters
      case "CHAPTERS_DESC": self = .chaptersDesc
      case "VOLUMES": self = .volumes
      case "VOLUMES_DESC": self = .volumesDesc
      case "UPDATED_AT": self = .updatedAt
      case "UPDATED_AT_DESC": self = .updatedAtDesc
      case "SEARCH_MATCH": self = .searchMatch
      case "FAVOURITES": self = .favourites
      case "FAVOURITES_DESC": self = .favouritesDesc
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .id: return "ID"
      case .idDesc: return "ID_DESC"
      case .titleRomaji: return "TITLE_ROMAJI"
      case .titleRomajiDesc: return "TITLE_ROMAJI_DESC"
      case .titleEnglish: return "TITLE_ENGLISH"
      case .titleEnglishDesc: return "TITLE_ENGLISH_DESC"
      case .titleNative: return "TITLE_NATIVE"
      case .titleNativeDesc: return "TITLE_NATIVE_DESC"
      case .type: return "TYPE"
      case .typeDesc: return "TYPE_DESC"
      case .format: return "FORMAT"
      case .formatDesc: return "FORMAT_DESC"
      case .startDate: return "START_DATE"
      case .startDateDesc: return "START_DATE_DESC"
      case .endDate: return "END_DATE"
      case .endDateDesc: return "END_DATE_DESC"
      case .score: return "SCORE"
      case .scoreDesc: return "SCORE_DESC"
      case .popularity: return "POPULARITY"
      case .popularityDesc: return "POPULARITY_DESC"
      case .trending: return "TRENDING"
      case .trendingDesc: return "TRENDING_DESC"
      case .episodes: return "EPISODES"
      case .episodesDesc: return "EPISODES_DESC"
      case .duration: return "DURATION"
      case .durationDesc: return "DURATION_DESC"
      case .status: return "STATUS"
      case .statusDesc: return "STATUS_DESC"
      case .chapters: return "CHAPTERS"
      case .chaptersDesc: return "CHAPTERS_DESC"
      case .volumes: return "VOLUMES"
      case .volumesDesc: return "VOLUMES_DESC"
      case .updatedAt: return "UPDATED_AT"
      case .updatedAtDesc: return "UPDATED_AT_DESC"
      case .searchMatch: return "SEARCH_MATCH"
      case .favourites: return "FAVOURITES"
      case .favouritesDesc: return "FAVOURITES_DESC"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaSort, rhs: MediaSort) -> Bool {
    switch (lhs, rhs) {
      case (.id, .id): return true
      case (.idDesc, .idDesc): return true
      case (.titleRomaji, .titleRomaji): return true
      case (.titleRomajiDesc, .titleRomajiDesc): return true
      case (.titleEnglish, .titleEnglish): return true
      case (.titleEnglishDesc, .titleEnglishDesc): return true
      case (.titleNative, .titleNative): return true
      case (.titleNativeDesc, .titleNativeDesc): return true
      case (.type, .type): return true
      case (.typeDesc, .typeDesc): return true
      case (.format, .format): return true
      case (.formatDesc, .formatDesc): return true
      case (.startDate, .startDate): return true
      case (.startDateDesc, .startDateDesc): return true
      case (.endDate, .endDate): return true
      case (.endDateDesc, .endDateDesc): return true
      case (.score, .score): return true
      case (.scoreDesc, .scoreDesc): return true
      case (.popularity, .popularity): return true
      case (.popularityDesc, .popularityDesc): return true
      case (.trending, .trending): return true
      case (.trendingDesc, .trendingDesc): return true
      case (.episodes, .episodes): return true
      case (.episodesDesc, .episodesDesc): return true
      case (.duration, .duration): return true
      case (.durationDesc, .durationDesc): return true
      case (.status, .status): return true
      case (.statusDesc, .statusDesc): return true
      case (.chapters, .chapters): return true
      case (.chaptersDesc, .chaptersDesc): return true
      case (.volumes, .volumes): return true
      case (.volumesDesc, .volumesDesc): return true
      case (.updatedAt, .updatedAt): return true
      case (.updatedAtDesc, .updatedAtDesc): return true
      case (.searchMatch, .searchMatch): return true
      case (.favourites, .favourites): return true
      case (.favouritesDesc, .favouritesDesc): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaSort] {
    return [
      .id,
      .idDesc,
      .titleRomaji,
      .titleRomajiDesc,
      .titleEnglish,
      .titleEnglishDesc,
      .titleNative,
      .titleNativeDesc,
      .type,
      .typeDesc,
      .format,
      .formatDesc,
      .startDate,
      .startDateDesc,
      .endDate,
      .endDateDesc,
      .score,
      .scoreDesc,
      .popularity,
      .popularityDesc,
      .trending,
      .trendingDesc,
      .episodes,
      .episodesDesc,
      .duration,
      .durationDesc,
      .status,
      .statusDesc,
      .chapters,
      .chaptersDesc,
      .volumes,
      .volumesDesc,
      .updatedAt,
      .updatedAtDesc,
      .searchMatch,
      .favourites,
      .favouritesDesc,
    ]
  }
}

/// Airing schedule sort enums
public enum AiringSort: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case id
  case idDesc
  case mediaId
  case mediaIdDesc
  case time
  case timeDesc
  case episode
  case episodeDesc
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ID": self = .id
      case "ID_DESC": self = .idDesc
      case "MEDIA_ID": self = .mediaId
      case "MEDIA_ID_DESC": self = .mediaIdDesc
      case "TIME": self = .time
      case "TIME_DESC": self = .timeDesc
      case "EPISODE": self = .episode
      case "EPISODE_DESC": self = .episodeDesc
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .id: return "ID"
      case .idDesc: return "ID_DESC"
      case .mediaId: return "MEDIA_ID"
      case .mediaIdDesc: return "MEDIA_ID_DESC"
      case .time: return "TIME"
      case .timeDesc: return "TIME_DESC"
      case .episode: return "EPISODE"
      case .episodeDesc: return "EPISODE_DESC"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: AiringSort, rhs: AiringSort) -> Bool {
    switch (lhs, rhs) {
      case (.id, .id): return true
      case (.idDesc, .idDesc): return true
      case (.mediaId, .mediaId): return true
      case (.mediaIdDesc, .mediaIdDesc): return true
      case (.time, .time): return true
      case (.timeDesc, .timeDesc): return true
      case (.episode, .episode): return true
      case (.episodeDesc, .episodeDesc): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [AiringSort] {
    return [
      .id,
      .idDesc,
      .mediaId,
      .mediaIdDesc,
      .time,
      .timeDesc,
      .episode,
      .episodeDesc,
    ]
  }
}

/// Media list watching/reading status enum.
public enum MediaListStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Currently watching/reading
  case current
  /// Planning to watch/read
  case planning
  /// Finished watching/reading
  case completed
  /// Stopped watching/reading before completing
  case dropped
  /// Paused watching/reading
  case paused
  /// Re-watching/reading
  case repeating
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "CURRENT": self = .current
      case "PLANNING": self = .planning
      case "COMPLETED": self = .completed
      case "DROPPED": self = .dropped
      case "PAUSED": self = .paused
      case "REPEATING": self = .repeating
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .current: return "CURRENT"
      case .planning: return "PLANNING"
      case .completed: return "COMPLETED"
      case .dropped: return "DROPPED"
      case .paused: return "PAUSED"
      case .repeating: return "REPEATING"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaListStatus, rhs: MediaListStatus) -> Bool {
    switch (lhs, rhs) {
      case (.current, .current): return true
      case (.planning, .planning): return true
      case (.completed, .completed): return true
      case (.dropped, .dropped): return true
      case (.paused, .paused): return true
      case (.repeating, .repeating): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaListStatus] {
    return [
      .current,
      .planning,
      .completed,
      .dropped,
      .paused,
      .repeating,
    ]
  }
}

/// Media list sort enums
public enum MediaListSort: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case mediaId
  case mediaIdDesc
  case score
  case scoreDesc
  case status
  case statusDesc
  case progress
  case progressDesc
  case progressVolumes
  case progressVolumesDesc
  case `repeat`
  case repeatDesc
  case priority
  case priorityDesc
  case startedOn
  case startedOnDesc
  case finishedOn
  case finishedOnDesc
  case addedTime
  case addedTimeDesc
  case updatedTime
  case updatedTimeDesc
  case mediaTitleRomaji
  case mediaTitleRomajiDesc
  case mediaTitleEnglish
  case mediaTitleEnglishDesc
  case mediaTitleNative
  case mediaTitleNativeDesc
  case mediaPopularity
  case mediaPopularityDesc
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MEDIA_ID": self = .mediaId
      case "MEDIA_ID_DESC": self = .mediaIdDesc
      case "SCORE": self = .score
      case "SCORE_DESC": self = .scoreDesc
      case "STATUS": self = .status
      case "STATUS_DESC": self = .statusDesc
      case "PROGRESS": self = .progress
      case "PROGRESS_DESC": self = .progressDesc
      case "PROGRESS_VOLUMES": self = .progressVolumes
      case "PROGRESS_VOLUMES_DESC": self = .progressVolumesDesc
      case "REPEAT": self = .repeat
      case "REPEAT_DESC": self = .repeatDesc
      case "PRIORITY": self = .priority
      case "PRIORITY_DESC": self = .priorityDesc
      case "STARTED_ON": self = .startedOn
      case "STARTED_ON_DESC": self = .startedOnDesc
      case "FINISHED_ON": self = .finishedOn
      case "FINISHED_ON_DESC": self = .finishedOnDesc
      case "ADDED_TIME": self = .addedTime
      case "ADDED_TIME_DESC": self = .addedTimeDesc
      case "UPDATED_TIME": self = .updatedTime
      case "UPDATED_TIME_DESC": self = .updatedTimeDesc
      case "MEDIA_TITLE_ROMAJI": self = .mediaTitleRomaji
      case "MEDIA_TITLE_ROMAJI_DESC": self = .mediaTitleRomajiDesc
      case "MEDIA_TITLE_ENGLISH": self = .mediaTitleEnglish
      case "MEDIA_TITLE_ENGLISH_DESC": self = .mediaTitleEnglishDesc
      case "MEDIA_TITLE_NATIVE": self = .mediaTitleNative
      case "MEDIA_TITLE_NATIVE_DESC": self = .mediaTitleNativeDesc
      case "MEDIA_POPULARITY": self = .mediaPopularity
      case "MEDIA_POPULARITY_DESC": self = .mediaPopularityDesc
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .mediaId: return "MEDIA_ID"
      case .mediaIdDesc: return "MEDIA_ID_DESC"
      case .score: return "SCORE"
      case .scoreDesc: return "SCORE_DESC"
      case .status: return "STATUS"
      case .statusDesc: return "STATUS_DESC"
      case .progress: return "PROGRESS"
      case .progressDesc: return "PROGRESS_DESC"
      case .progressVolumes: return "PROGRESS_VOLUMES"
      case .progressVolumesDesc: return "PROGRESS_VOLUMES_DESC"
      case .repeat: return "REPEAT"
      case .repeatDesc: return "REPEAT_DESC"
      case .priority: return "PRIORITY"
      case .priorityDesc: return "PRIORITY_DESC"
      case .startedOn: return "STARTED_ON"
      case .startedOnDesc: return "STARTED_ON_DESC"
      case .finishedOn: return "FINISHED_ON"
      case .finishedOnDesc: return "FINISHED_ON_DESC"
      case .addedTime: return "ADDED_TIME"
      case .addedTimeDesc: return "ADDED_TIME_DESC"
      case .updatedTime: return "UPDATED_TIME"
      case .updatedTimeDesc: return "UPDATED_TIME_DESC"
      case .mediaTitleRomaji: return "MEDIA_TITLE_ROMAJI"
      case .mediaTitleRomajiDesc: return "MEDIA_TITLE_ROMAJI_DESC"
      case .mediaTitleEnglish: return "MEDIA_TITLE_ENGLISH"
      case .mediaTitleEnglishDesc: return "MEDIA_TITLE_ENGLISH_DESC"
      case .mediaTitleNative: return "MEDIA_TITLE_NATIVE"
      case .mediaTitleNativeDesc: return "MEDIA_TITLE_NATIVE_DESC"
      case .mediaPopularity: return "MEDIA_POPULARITY"
      case .mediaPopularityDesc: return "MEDIA_POPULARITY_DESC"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaListSort, rhs: MediaListSort) -> Bool {
    switch (lhs, rhs) {
      case (.mediaId, .mediaId): return true
      case (.mediaIdDesc, .mediaIdDesc): return true
      case (.score, .score): return true
      case (.scoreDesc, .scoreDesc): return true
      case (.status, .status): return true
      case (.statusDesc, .statusDesc): return true
      case (.progress, .progress): return true
      case (.progressDesc, .progressDesc): return true
      case (.progressVolumes, .progressVolumes): return true
      case (.progressVolumesDesc, .progressVolumesDesc): return true
      case (.repeat, .repeat): return true
      case (.repeatDesc, .repeatDesc): return true
      case (.priority, .priority): return true
      case (.priorityDesc, .priorityDesc): return true
      case (.startedOn, .startedOn): return true
      case (.startedOnDesc, .startedOnDesc): return true
      case (.finishedOn, .finishedOn): return true
      case (.finishedOnDesc, .finishedOnDesc): return true
      case (.addedTime, .addedTime): return true
      case (.addedTimeDesc, .addedTimeDesc): return true
      case (.updatedTime, .updatedTime): return true
      case (.updatedTimeDesc, .updatedTimeDesc): return true
      case (.mediaTitleRomaji, .mediaTitleRomaji): return true
      case (.mediaTitleRomajiDesc, .mediaTitleRomajiDesc): return true
      case (.mediaTitleEnglish, .mediaTitleEnglish): return true
      case (.mediaTitleEnglishDesc, .mediaTitleEnglishDesc): return true
      case (.mediaTitleNative, .mediaTitleNative): return true
      case (.mediaTitleNativeDesc, .mediaTitleNativeDesc): return true
      case (.mediaPopularity, .mediaPopularity): return true
      case (.mediaPopularityDesc, .mediaPopularityDesc): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaListSort] {
    return [
      .mediaId,
      .mediaIdDesc,
      .score,
      .scoreDesc,
      .status,
      .statusDesc,
      .progress,
      .progressDesc,
      .progressVolumes,
      .progressVolumesDesc,
      .repeat,
      .repeatDesc,
      .priority,
      .priorityDesc,
      .startedOn,
      .startedOnDesc,
      .finishedOn,
      .finishedOnDesc,
      .addedTime,
      .addedTimeDesc,
      .updatedTime,
      .updatedTimeDesc,
      .mediaTitleRomaji,
      .mediaTitleRomajiDesc,
      .mediaTitleEnglish,
      .mediaTitleEnglishDesc,
      .mediaTitleNative,
      .mediaTitleNativeDesc,
      .mediaPopularity,
      .mediaPopularityDesc,
    ]
  }
}

public final class AnimesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Animes($page: Int, $perPage: Int) {
      Page(page: $page, perPage: $perPage) {
        __typename
        media(type: ANIME) {
          __typename
          id
          title {
            __typename
            romaji
          }
          coverImage {
            __typename
            large
          }
        }
      }
    }
    """

  public let operationName: String = "Animes"

  public let operationIdentifier: String? = "86739110cc7be4b02b9154330ae817fbe49bd6385369bb1008d36725cfb84689"

  public var page: Int?
  public var perPage: Int?

  public init(page: Int? = nil, perPage: Int? = nil) {
    self.page = page
    self.perPage = perPage
  }

  public var variables: GraphQLMap? {
    return ["page": page, "perPage": perPage]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", arguments: ["page": GraphQLVariable("page"), "perPage": GraphQLVariable("perPage")], type: .object(Page.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(page: Page? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Page": page.flatMap { (value: Page) -> ResultMap in value.resultMap }])
    }

    public var page: Page? {
      get {
        return (resultMap["Page"] as? ResultMap).flatMap { Page(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Page")
      }
    }

    public struct Page: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Page"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("media", arguments: ["type": "ANIME"], type: .list(.object(Medium.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(media: [Medium?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "media": media.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var media: [Medium?]? {
        get {
          return (resultMap["media"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Medium?] in value.map { (value: ResultMap?) -> Medium? in value.flatMap { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }, forKey: "media")
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("title", type: .object(Title.selections)),
            GraphQLField("coverImage", type: .object(CoverImage.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, title: Title? = nil, coverImage: CoverImage? = nil) {
          self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the media
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The official titles of the media in various languages
        public var title: Title? {
          get {
            return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "title")
          }
        }

        /// The cover images of the media
        public var coverImage: CoverImage? {
          get {
            return (resultMap["coverImage"] as? ResultMap).flatMap { CoverImage(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "coverImage")
          }
        }

        public struct Title: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaTitle"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("romaji", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(romaji: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaTitle", "romaji": romaji])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The romanization of the native language title
          public var romaji: String? {
            get {
              return resultMap["romaji"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "romaji")
            }
          }
        }

        public struct CoverImage: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaCoverImage"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("large", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(large: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "large": large])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The cover image url of the media at a large size
          public var large: String? {
            get {
              return resultMap["large"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "large")
            }
          }
        }
      }
    }
  }
}

public final class MediaDetailsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MediaDetails($mediaId: Int) {
      Media(id: $mediaId) {
        __typename
        title {
          __typename
          romaji
          english
          native
        }
        type
        format
        status
        description
        startDate {
          __typename
          year
          month
          day
        }
        endDate {
          __typename
          year
          month
          day
        }
        season
        episodes
        duration
        chapters
        volumes
        coverImage {
          __typename
          large
          color
        }
        bannerImage
        averageScore
        meanScore
        popularity
        genres
        synonyms
        favourites
      }
    }
    """

  public let operationName: String = "MediaDetails"

  public let operationIdentifier: String? = "b6c7682cd49985237926bb003209d2bd04b4e5b718f17058b9df2c17ae2ef80e"

  public var mediaId: Int?

  public init(mediaId: Int? = nil) {
    self.mediaId = mediaId
  }

  public var variables: GraphQLMap? {
    return ["mediaId": mediaId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Media", arguments: ["id": GraphQLVariable("mediaId")], type: .object(Medium.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(media: Medium? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
    }

    /// Media query
    public var media: Medium? {
      get {
        return (resultMap["Media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Media")
      }
    }

    public struct Medium: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Media"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .object(Title.selections)),
          GraphQLField("type", type: .scalar(MediaType.self)),
          GraphQLField("format", type: .scalar(MediaFormat.self)),
          GraphQLField("status", type: .scalar(MediaStatus.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("startDate", type: .object(StartDate.selections)),
          GraphQLField("endDate", type: .object(EndDate.selections)),
          GraphQLField("season", type: .scalar(MediaSeason.self)),
          GraphQLField("episodes", type: .scalar(Int.self)),
          GraphQLField("duration", type: .scalar(Int.self)),
          GraphQLField("chapters", type: .scalar(Int.self)),
          GraphQLField("volumes", type: .scalar(Int.self)),
          GraphQLField("coverImage", type: .object(CoverImage.selections)),
          GraphQLField("bannerImage", type: .scalar(String.self)),
          GraphQLField("averageScore", type: .scalar(Int.self)),
          GraphQLField("meanScore", type: .scalar(Int.self)),
          GraphQLField("popularity", type: .scalar(Int.self)),
          GraphQLField("genres", type: .list(.scalar(String.self))),
          GraphQLField("synonyms", type: .list(.scalar(String.self))),
          GraphQLField("favourites", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: Title? = nil, type: MediaType? = nil, format: MediaFormat? = nil, status: MediaStatus? = nil, description: String? = nil, startDate: StartDate? = nil, endDate: EndDate? = nil, season: MediaSeason? = nil, episodes: Int? = nil, duration: Int? = nil, chapters: Int? = nil, volumes: Int? = nil, coverImage: CoverImage? = nil, bannerImage: String? = nil, averageScore: Int? = nil, meanScore: Int? = nil, popularity: Int? = nil, genres: [String?]? = nil, synonyms: [String?]? = nil, favourites: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Media", "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "type": type, "format": format, "status": status, "description": description, "startDate": startDate.flatMap { (value: StartDate) -> ResultMap in value.resultMap }, "endDate": endDate.flatMap { (value: EndDate) -> ResultMap in value.resultMap }, "season": season, "episodes": episodes, "duration": duration, "chapters": chapters, "volumes": volumes, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }, "bannerImage": bannerImage, "averageScore": averageScore, "meanScore": meanScore, "popularity": popularity, "genres": genres, "synonyms": synonyms, "favourites": favourites])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The official titles of the media in various languages
      public var title: Title? {
        get {
          return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "title")
        }
      }

      /// The type of the media; anime or manga
      public var type: MediaType? {
        get {
          return resultMap["type"] as? MediaType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      /// The format the media was released in
      public var format: MediaFormat? {
        get {
          return resultMap["format"] as? MediaFormat
        }
        set {
          resultMap.updateValue(newValue, forKey: "format")
        }
      }

      /// The current releasing status of the media
      public var status: MediaStatus? {
        get {
          return resultMap["status"] as? MediaStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      /// Short description of the media's story and characters
      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      /// The first official release date of the media
      public var startDate: StartDate? {
        get {
          return (resultMap["startDate"] as? ResultMap).flatMap { StartDate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "startDate")
        }
      }

      /// The last official release date of the media
      public var endDate: EndDate? {
        get {
          return (resultMap["endDate"] as? ResultMap).flatMap { EndDate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "endDate")
        }
      }

      /// The season the media was initially released in
      public var season: MediaSeason? {
        get {
          return resultMap["season"] as? MediaSeason
        }
        set {
          resultMap.updateValue(newValue, forKey: "season")
        }
      }

      /// The amount of episodes the anime has when complete
      public var episodes: Int? {
        get {
          return resultMap["episodes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "episodes")
        }
      }

      /// The general length of each anime episode in minutes
      public var duration: Int? {
        get {
          return resultMap["duration"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "duration")
        }
      }

      /// The amount of chapters the manga has when complete
      public var chapters: Int? {
        get {
          return resultMap["chapters"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "chapters")
        }
      }

      /// The amount of volumes the manga has when complete
      public var volumes: Int? {
        get {
          return resultMap["volumes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "volumes")
        }
      }

      /// The cover images of the media
      public var coverImage: CoverImage? {
        get {
          return (resultMap["coverImage"] as? ResultMap).flatMap { CoverImage(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "coverImage")
        }
      }

      /// The banner image of the media
      public var bannerImage: String? {
        get {
          return resultMap["bannerImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bannerImage")
        }
      }

      /// A weighted average score of all the user's scores of the media
      public var averageScore: Int? {
        get {
          return resultMap["averageScore"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "averageScore")
        }
      }

      /// Mean score of all the user's scores of the media
      public var meanScore: Int? {
        get {
          return resultMap["meanScore"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "meanScore")
        }
      }

      /// The number of users with the media on their list
      public var popularity: Int? {
        get {
          return resultMap["popularity"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "popularity")
        }
      }

      /// The genres of the media
      public var genres: [String?]? {
        get {
          return resultMap["genres"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "genres")
        }
      }

      /// Alternative titles of the media
      public var synonyms: [String?]? {
        get {
          return resultMap["synonyms"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "synonyms")
        }
      }

      /// The amount of user's who have favourited the media
      public var favourites: Int? {
        get {
          return resultMap["favourites"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "favourites")
        }
      }

      public struct Title: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaTitle"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("romaji", type: .scalar(String.self)),
            GraphQLField("english", type: .scalar(String.self)),
            GraphQLField("native", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(romaji: String? = nil, english: String? = nil, native: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaTitle", "romaji": romaji, "english": english, "native": native])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The romanization of the native language title
        public var romaji: String? {
          get {
            return resultMap["romaji"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "romaji")
          }
        }

        /// The official english title
        public var english: String? {
          get {
            return resultMap["english"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "english")
          }
        }

        /// Official title in it's native language
        public var native: String? {
          get {
            return resultMap["native"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "native")
          }
        }
      }

      public struct StartDate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FuzzyDate"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("year", type: .scalar(Int.self)),
            GraphQLField("month", type: .scalar(Int.self)),
            GraphQLField("day", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(year: Int? = nil, month: Int? = nil, day: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "FuzzyDate", "year": year, "month": month, "day": day])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Numeric Year (2017)
        public var year: Int? {
          get {
            return resultMap["year"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "year")
          }
        }

        /// Numeric Month (3)
        public var month: Int? {
          get {
            return resultMap["month"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "month")
          }
        }

        /// Numeric Day (24)
        public var day: Int? {
          get {
            return resultMap["day"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "day")
          }
        }
      }

      public struct EndDate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FuzzyDate"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("year", type: .scalar(Int.self)),
            GraphQLField("month", type: .scalar(Int.self)),
            GraphQLField("day", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(year: Int? = nil, month: Int? = nil, day: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "FuzzyDate", "year": year, "month": month, "day": day])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Numeric Year (2017)
        public var year: Int? {
          get {
            return resultMap["year"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "year")
          }
        }

        /// Numeric Month (3)
        public var month: Int? {
          get {
            return resultMap["month"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "month")
          }
        }

        /// Numeric Day (24)
        public var day: Int? {
          get {
            return resultMap["day"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "day")
          }
        }
      }

      public struct CoverImage: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaCoverImage"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("large", type: .scalar(String.self)),
            GraphQLField("color", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(large: String? = nil, color: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "large": large, "color": color])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The cover image url of the media at a large size
        public var large: String? {
          get {
            return resultMap["large"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "large")
          }
        }

        /// Average #hex color of cover image
        public var color: String? {
          get {
            return resultMap["color"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "color")
          }
        }
      }
    }
  }
}

public final class SeasonalAnimeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SeasonalAnime($page: Int, $perPage: Int, $season: MediaSeason, $seasonYear: Int, $sort: [MediaSort]) {
      Page(page: $page, perPage: $perPage) {
        __typename
        media(season: $season, seasonYear: $seasonYear, sort: $sort) {
          __typename
          id
          title {
            __typename
            romaji
          }
          coverImage {
            __typename
            large
          }
        }
      }
    }
    """

  public let operationName: String = "SeasonalAnime"

  public let operationIdentifier: String? = "c70aa2eb985f619b2b31205d7933f8c23f9f7223a5c873a60f466a345431902d"

  public var page: Int?
  public var perPage: Int?
  public var season: MediaSeason?
  public var seasonYear: Int?
  public var sort: [MediaSort?]?

  public init(page: Int? = nil, perPage: Int? = nil, season: MediaSeason? = nil, seasonYear: Int? = nil, sort: [MediaSort?]? = nil) {
    self.page = page
    self.perPage = perPage
    self.season = season
    self.seasonYear = seasonYear
    self.sort = sort
  }

  public var variables: GraphQLMap? {
    return ["page": page, "perPage": perPage, "season": season, "seasonYear": seasonYear, "sort": sort]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", arguments: ["page": GraphQLVariable("page"), "perPage": GraphQLVariable("perPage")], type: .object(Page.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(page: Page? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Page": page.flatMap { (value: Page) -> ResultMap in value.resultMap }])
    }

    public var page: Page? {
      get {
        return (resultMap["Page"] as? ResultMap).flatMap { Page(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Page")
      }
    }

    public struct Page: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Page"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("media", arguments: ["season": GraphQLVariable("season"), "seasonYear": GraphQLVariable("seasonYear"), "sort": GraphQLVariable("sort")], type: .list(.object(Medium.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(media: [Medium?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "media": media.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var media: [Medium?]? {
        get {
          return (resultMap["media"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Medium?] in value.map { (value: ResultMap?) -> Medium? in value.flatMap { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }, forKey: "media")
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("title", type: .object(Title.selections)),
            GraphQLField("coverImage", type: .object(CoverImage.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, title: Title? = nil, coverImage: CoverImage? = nil) {
          self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the media
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The official titles of the media in various languages
        public var title: Title? {
          get {
            return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "title")
          }
        }

        /// The cover images of the media
        public var coverImage: CoverImage? {
          get {
            return (resultMap["coverImage"] as? ResultMap).flatMap { CoverImage(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "coverImage")
          }
        }

        public struct Title: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaTitle"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("romaji", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(romaji: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaTitle", "romaji": romaji])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The romanization of the native language title
          public var romaji: String? {
            get {
              return resultMap["romaji"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "romaji")
            }
          }
        }

        public struct CoverImage: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaCoverImage"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("large", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(large: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "large": large])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The cover image url of the media at a large size
          public var large: String? {
            get {
              return resultMap["large"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "large")
            }
          }
        }
      }
    }
  }
}

public final class TodayAiringAnimesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query TodayAiringAnimes($page: Int, $perPage: Int, $sort: [AiringSort], $airingAtGreater: Int, $airingAtLesser: Int) {
      Page(page: $page, perPage: $perPage) {
        __typename
        airingSchedules(
          sort: $sort
          airingAt_greater: $airingAtGreater
          airingAt_lesser: $airingAtLesser
        ) {
          __typename
          media {
            __typename
            id
            title {
              __typename
              romaji
            }
            coverImage {
              __typename
              large
            }
          }
          timeUntilAiring
        }
      }
    }
    """

  public let operationName: String = "TodayAiringAnimes"

  public let operationIdentifier: String? = "5f582fe74d9c97dd0b26578014b739bea5a8c6ab54dd26c694303c09addc5325"

  public var page: Int?
  public var perPage: Int?
  public var sort: [AiringSort?]?
  public var airingAtGreater: Int?
  public var airingAtLesser: Int?

  public init(page: Int? = nil, perPage: Int? = nil, sort: [AiringSort?]? = nil, airingAtGreater: Int? = nil, airingAtLesser: Int? = nil) {
    self.page = page
    self.perPage = perPage
    self.sort = sort
    self.airingAtGreater = airingAtGreater
    self.airingAtLesser = airingAtLesser
  }

  public var variables: GraphQLMap? {
    return ["page": page, "perPage": perPage, "sort": sort, "airingAtGreater": airingAtGreater, "airingAtLesser": airingAtLesser]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", arguments: ["page": GraphQLVariable("page"), "perPage": GraphQLVariable("perPage")], type: .object(Page.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(page: Page? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Page": page.flatMap { (value: Page) -> ResultMap in value.resultMap }])
    }

    public var page: Page? {
      get {
        return (resultMap["Page"] as? ResultMap).flatMap { Page(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Page")
      }
    }

    public struct Page: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Page"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("airingSchedules", arguments: ["sort": GraphQLVariable("sort"), "airingAt_greater": GraphQLVariable("airingAtGreater"), "airingAt_lesser": GraphQLVariable("airingAtLesser")], type: .list(.object(AiringSchedule.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(airingSchedules: [AiringSchedule?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "airingSchedules": airingSchedules.flatMap { (value: [AiringSchedule?]) -> [ResultMap?] in value.map { (value: AiringSchedule?) -> ResultMap? in value.flatMap { (value: AiringSchedule) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var airingSchedules: [AiringSchedule?]? {
        get {
          return (resultMap["airingSchedules"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AiringSchedule?] in value.map { (value: ResultMap?) -> AiringSchedule? in value.flatMap { (value: ResultMap) -> AiringSchedule in AiringSchedule(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [AiringSchedule?]) -> [ResultMap?] in value.map { (value: AiringSchedule?) -> ResultMap? in value.flatMap { (value: AiringSchedule) -> ResultMap in value.resultMap } } }, forKey: "airingSchedules")
        }
      }

      public struct AiringSchedule: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AiringSchedule"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .object(Medium.selections)),
            GraphQLField("timeUntilAiring", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(media: Medium? = nil, timeUntilAiring: Int) {
          self.init(unsafeResultMap: ["__typename": "AiringSchedule", "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "timeUntilAiring": timeUntilAiring])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The associate media of the airing episode
        public var media: Medium? {
          get {
            return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "media")
          }
        }

        /// Seconds until episode starts airing
        public var timeUntilAiring: Int {
          get {
            return resultMap["timeUntilAiring"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "timeUntilAiring")
          }
        }

        public struct Medium: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Media"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("title", type: .object(Title.selections)),
              GraphQLField("coverImage", type: .object(CoverImage.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, title: Title? = nil, coverImage: CoverImage? = nil) {
            self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the media
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The official titles of the media in various languages
          public var title: Title? {
            get {
              return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "title")
            }
          }

          /// The cover images of the media
          public var coverImage: CoverImage? {
            get {
              return (resultMap["coverImage"] as? ResultMap).flatMap { CoverImage(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "coverImage")
            }
          }

          public struct Title: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["MediaTitle"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("romaji", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(romaji: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "MediaTitle", "romaji": romaji])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The romanization of the native language title
            public var romaji: String? {
              get {
                return resultMap["romaji"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "romaji")
              }
            }
          }

          public struct CoverImage: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["MediaCoverImage"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("large", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(large: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "large": large])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The cover image url of the media at a large size
            public var large: String? {
              get {
                return resultMap["large"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "large")
              }
            }
          }
        }
      }
    }
  }
}

public final class UserMediaListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query UserMediaList($page: Int, $perPage: Int, $userId: Int, $type: MediaType, $status: MediaListStatus, $sort: [MediaListSort]) {
      Page(page: $page, perPage: $perPage) {
        __typename
        mediaList(userId: $userId, type: $type, status: $status, sort: $sort) {
          __typename
          status
          score
          progress
          progressVolumes
          media {
            __typename
            id
            title {
              __typename
              userPreferred
            }
            episodes
            chapters
            volumes
            coverImage {
              __typename
              large
            }
            nextAiringEpisode {
              __typename
              episode
              airingAt
            }
            status
            type
          }
        }
        pageInfo {
          __typename
          hasNextPage
        }
      }
    }
    """

  public let operationName: String = "UserMediaList"

  public let operationIdentifier: String? = "5b8e6d0ad7da6e3a682dbfdea8f066bd31364b8803f816c7514fbb8d09104b5f"

  public var page: Int?
  public var perPage: Int?
  public var userId: Int?
  public var type: MediaType?
  public var status: MediaListStatus?
  public var sort: [MediaListSort?]?

  public init(page: Int? = nil, perPage: Int? = nil, userId: Int? = nil, type: MediaType? = nil, status: MediaListStatus? = nil, sort: [MediaListSort?]? = nil) {
    self.page = page
    self.perPage = perPage
    self.userId = userId
    self.type = type
    self.status = status
    self.sort = sort
  }

  public var variables: GraphQLMap? {
    return ["page": page, "perPage": perPage, "userId": userId, "type": type, "status": status, "sort": sort]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Page", arguments: ["page": GraphQLVariable("page"), "perPage": GraphQLVariable("perPage")], type: .object(Page.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(page: Page? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Page": page.flatMap { (value: Page) -> ResultMap in value.resultMap }])
    }

    public var page: Page? {
      get {
        return (resultMap["Page"] as? ResultMap).flatMap { Page(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Page")
      }
    }

    public struct Page: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Page"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mediaList", arguments: ["userId": GraphQLVariable("userId"), "type": GraphQLVariable("type"), "status": GraphQLVariable("status"), "sort": GraphQLVariable("sort")], type: .list(.object(MediaList.selections))),
          GraphQLField("pageInfo", type: .object(PageInfo.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(mediaList: [MediaList?]? = nil, pageInfo: PageInfo? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "mediaList": mediaList.flatMap { (value: [MediaList?]) -> [ResultMap?] in value.map { (value: MediaList?) -> ResultMap? in value.flatMap { (value: MediaList) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mediaList: [MediaList?]? {
        get {
          return (resultMap["mediaList"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [MediaList?] in value.map { (value: ResultMap?) -> MediaList? in value.flatMap { (value: ResultMap) -> MediaList in MediaList(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [MediaList?]) -> [ResultMap?] in value.map { (value: MediaList?) -> ResultMap? in value.flatMap { (value: MediaList) -> ResultMap in value.resultMap } } }, forKey: "mediaList")
        }
      }

      /// The pagination information
      public var pageInfo: PageInfo? {
        get {
          return (resultMap["pageInfo"] as? ResultMap).flatMap { PageInfo(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pageInfo")
        }
      }

      public struct MediaList: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaList"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("status", type: .scalar(MediaListStatus.self)),
            GraphQLField("score", type: .scalar(Double.self)),
            GraphQLField("progress", type: .scalar(Int.self)),
            GraphQLField("progressVolumes", type: .scalar(Int.self)),
            GraphQLField("media", type: .object(Medium.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(status: MediaListStatus? = nil, score: Double? = nil, progress: Int? = nil, progressVolumes: Int? = nil, media: Medium? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaList", "status": status, "score": score, "progress": progress, "progressVolumes": progressVolumes, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The watching/reading status
        public var status: MediaListStatus? {
          get {
            return resultMap["status"] as? MediaListStatus
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        /// The score of the entry
        public var score: Double? {
          get {
            return resultMap["score"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "score")
          }
        }

        /// The amount of episodes/chapters consumed by the user
        public var progress: Int? {
          get {
            return resultMap["progress"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "progress")
          }
        }

        /// The amount of volumes read by the user
        public var progressVolumes: Int? {
          get {
            return resultMap["progressVolumes"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "progressVolumes")
          }
        }

        public var media: Medium? {
          get {
            return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "media")
          }
        }

        public struct Medium: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Media"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("title", type: .object(Title.selections)),
              GraphQLField("episodes", type: .scalar(Int.self)),
              GraphQLField("chapters", type: .scalar(Int.self)),
              GraphQLField("volumes", type: .scalar(Int.self)),
              GraphQLField("coverImage", type: .object(CoverImage.selections)),
              GraphQLField("nextAiringEpisode", type: .object(NextAiringEpisode.selections)),
              GraphQLField("status", type: .scalar(MediaStatus.self)),
              GraphQLField("type", type: .scalar(MediaType.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, title: Title? = nil, episodes: Int? = nil, chapters: Int? = nil, volumes: Int? = nil, coverImage: CoverImage? = nil, nextAiringEpisode: NextAiringEpisode? = nil, status: MediaStatus? = nil, type: MediaType? = nil) {
            self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "episodes": episodes, "chapters": chapters, "volumes": volumes, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }, "nextAiringEpisode": nextAiringEpisode.flatMap { (value: NextAiringEpisode) -> ResultMap in value.resultMap }, "status": status, "type": type])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the media
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The official titles of the media in various languages
          public var title: Title? {
            get {
              return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "title")
            }
          }

          /// The amount of episodes the anime has when complete
          public var episodes: Int? {
            get {
              return resultMap["episodes"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "episodes")
            }
          }

          /// The amount of chapters the manga has when complete
          public var chapters: Int? {
            get {
              return resultMap["chapters"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "chapters")
            }
          }

          /// The amount of volumes the manga has when complete
          public var volumes: Int? {
            get {
              return resultMap["volumes"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "volumes")
            }
          }

          /// The cover images of the media
          public var coverImage: CoverImage? {
            get {
              return (resultMap["coverImage"] as? ResultMap).flatMap { CoverImage(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "coverImage")
            }
          }

          /// The media's next episode airing schedule
          public var nextAiringEpisode: NextAiringEpisode? {
            get {
              return (resultMap["nextAiringEpisode"] as? ResultMap).flatMap { NextAiringEpisode(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "nextAiringEpisode")
            }
          }

          /// The current releasing status of the media
          public var status: MediaStatus? {
            get {
              return resultMap["status"] as? MediaStatus
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          /// The type of the media; anime or manga
          public var type: MediaType? {
            get {
              return resultMap["type"] as? MediaType
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public struct Title: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["MediaTitle"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("userPreferred", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(userPreferred: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "MediaTitle", "userPreferred": userPreferred])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The currently authenticated users preferred title language. Default romaji for non-authenticated
            public var userPreferred: String? {
              get {
                return resultMap["userPreferred"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "userPreferred")
              }
            }
          }

          public struct CoverImage: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["MediaCoverImage"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("large", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(large: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "large": large])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The cover image url of the media at a large size
            public var large: String? {
              get {
                return resultMap["large"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "large")
              }
            }
          }

          public struct NextAiringEpisode: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["AiringSchedule"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("episode", type: .nonNull(.scalar(Int.self))),
                GraphQLField("airingAt", type: .nonNull(.scalar(Int.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(episode: Int, airingAt: Int) {
              self.init(unsafeResultMap: ["__typename": "AiringSchedule", "episode": episode, "airingAt": airingAt])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The airing episode number
            public var episode: Int {
              get {
                return resultMap["episode"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "episode")
              }
            }

            /// The time the episode airs at
            public var airingAt: Int {
              get {
                return resultMap["airingAt"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "airingAt")
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hasNextPage", type: .scalar(Bool.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasNextPage: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// If there is another page
        public var hasNextPage: Bool? {
          get {
            return resultMap["hasNextPage"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}

public final class ViewerQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Viewer {
      Viewer {
        __typename
        id
        name
        avatar {
          __typename
          large
        }
        bannerImage
        about
        options {
          __typename
          profileColor
        }
      }
    }
    """

  public let operationName: String = "Viewer"

  public let operationIdentifier: String? = "90c42616ac03e8025c7d6b7f45168f6411dc6325c98da4914b04564ad675b2e9"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Viewer", type: .object(Viewer.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Viewer": viewer.flatMap { (value: Viewer) -> ResultMap in value.resultMap }])
    }

    /// Get the currently authenticated user
    public var viewer: Viewer? {
      get {
        return (resultMap["Viewer"] as? ResultMap).flatMap { Viewer(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .object(Avatar.selections)),
          GraphQLField("bannerImage", type: .scalar(String.self)),
          GraphQLField("about", type: .scalar(String.self)),
          GraphQLField("options", type: .object(Option.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, avatar: Avatar? = nil, bannerImage: String? = nil, about: String? = nil, options: Option? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }, "bannerImage": bannerImage, "about": about, "options": options.flatMap { (value: Option) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the user
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the user
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The user's avatar images
      public var avatar: Avatar? {
        get {
          return (resultMap["avatar"] as? ResultMap).flatMap { Avatar(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "avatar")
        }
      }

      /// The user's banner images
      public var bannerImage: String? {
        get {
          return resultMap["bannerImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bannerImage")
        }
      }

      /// The bio written by user (Markdown)
      public var about: String? {
        get {
          return resultMap["about"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "about")
        }
      }

      /// The user's general options
      public var options: Option? {
        get {
          return (resultMap["options"] as? ResultMap).flatMap { Option(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "options")
        }
      }

      public struct Avatar: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["UserAvatar"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("large", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(large: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserAvatar", "large": large])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The avatar of user at its largest size
        public var large: String? {
          get {
            return resultMap["large"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "large")
          }
        }
      }

      public struct Option: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["UserOptions"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("profileColor", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(profileColor: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserOptions", "profileColor": profileColor])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Profile highlight color (blue, purple, pink, orange, red, green, gray)
        public var profileColor: String? {
          get {
            return resultMap["profileColor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profileColor")
          }
        }
      }
    }
  }
}

public final class ViewerIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ViewerId {
      Viewer {
        __typename
        id
      }
    }
    """

  public let operationName: String = "ViewerId"

  public let operationIdentifier: String? = "5682e020cd7301f0cec94e49dc3cadd809c6f6dea6fdfe29bc03d2a110c46acd"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Viewer", type: .object(Viewer.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Viewer": viewer.flatMap { (value: Viewer) -> ResultMap in value.resultMap }])
    }

    /// Get the currently authenticated user
    public var viewer: Viewer? {
      get {
        return (resultMap["Viewer"] as? ResultMap).flatMap { Viewer(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the user
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}
