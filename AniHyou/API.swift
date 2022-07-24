// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

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

/// Source type the media was adapted from
public enum MediaSource: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// An original production not based of another work
  case original
  /// Asian comic book
  case manga
  /// Written work published in volumes
  case lightNovel
  /// Video game driven primary by text and narrative
  case visualNovel
  /// Video game
  case videoGame
  /// Other
  case other
  /// Version 2+ only. Written works not published in volumes
  case novel
  /// Version 2+ only. Self-published works
  case doujinshi
  /// Version 2+ only. Japanese Anime
  case anime
  /// Version 3 only. Written works published online
  case webNovel
  /// Version 3 only. Live action media such as movies or TV show
  case liveAction
  /// Version 3 only. Games excluding video games
  case game
  /// Version 3 only. Comics excluding manga
  case comic
  /// Version 3 only. Multimedia project
  case multimediaProject
  /// Version 3 only. Picture book
  case pictureBook
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ORIGINAL": self = .original
      case "MANGA": self = .manga
      case "LIGHT_NOVEL": self = .lightNovel
      case "VISUAL_NOVEL": self = .visualNovel
      case "VIDEO_GAME": self = .videoGame
      case "OTHER": self = .other
      case "NOVEL": self = .novel
      case "DOUJINSHI": self = .doujinshi
      case "ANIME": self = .anime
      case "WEB_NOVEL": self = .webNovel
      case "LIVE_ACTION": self = .liveAction
      case "GAME": self = .game
      case "COMIC": self = .comic
      case "MULTIMEDIA_PROJECT": self = .multimediaProject
      case "PICTURE_BOOK": self = .pictureBook
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .original: return "ORIGINAL"
      case .manga: return "MANGA"
      case .lightNovel: return "LIGHT_NOVEL"
      case .visualNovel: return "VISUAL_NOVEL"
      case .videoGame: return "VIDEO_GAME"
      case .other: return "OTHER"
      case .novel: return "NOVEL"
      case .doujinshi: return "DOUJINSHI"
      case .anime: return "ANIME"
      case .webNovel: return "WEB_NOVEL"
      case .liveAction: return "LIVE_ACTION"
      case .game: return "GAME"
      case .comic: return "COMIC"
      case .multimediaProject: return "MULTIMEDIA_PROJECT"
      case .pictureBook: return "PICTURE_BOOK"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaSource, rhs: MediaSource) -> Bool {
    switch (lhs, rhs) {
      case (.original, .original): return true
      case (.manga, .manga): return true
      case (.lightNovel, .lightNovel): return true
      case (.visualNovel, .visualNovel): return true
      case (.videoGame, .videoGame): return true
      case (.other, .other): return true
      case (.novel, .novel): return true
      case (.doujinshi, .doujinshi): return true
      case (.anime, .anime): return true
      case (.webNovel, .webNovel): return true
      case (.liveAction, .liveAction): return true
      case (.game, .game): return true
      case (.comic, .comic): return true
      case (.multimediaProject, .multimediaProject): return true
      case (.pictureBook, .pictureBook): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaSource] {
    return [
      .original,
      .manga,
      .lightNovel,
      .visualNovel,
      .videoGame,
      .other,
      .novel,
      .doujinshi,
      .anime,
      .webNovel,
      .liveAction,
      .game,
      .comic,
      .multimediaProject,
      .pictureBook,
    ]
  }
}

public enum ExternalLinkType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case info
  case streaming
  case social
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "INFO": self = .info
      case "STREAMING": self = .streaming
      case "SOCIAL": self = .social
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .info: return "INFO"
      case .streaming: return "STREAMING"
      case .social: return "SOCIAL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ExternalLinkType, rhs: ExternalLinkType) -> Bool {
    switch (lhs, rhs) {
      case (.info, .info): return true
      case (.streaming, .streaming): return true
      case (.social, .social): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ExternalLinkType] {
    return [
      .info,
      .streaming,
      .social,
    ]
  }
}

/// Date object that allows for incomplete date values (fuzzy)
public struct FuzzyDateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - year: Numeric Year (2017)
  ///   - month: Numeric Month (3)
  ///   - day: Numeric Day (24)
  public init(year: Swift.Optional<Int?> = nil, month: Swift.Optional<Int?> = nil, day: Swift.Optional<Int?> = nil) {
    graphQLMap = ["year": year, "month": month, "day": day]
  }

  /// Numeric Year (2017)
  public var year: Swift.Optional<Int?> {
    get {
      return graphQLMap["year"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "year")
    }
  }

  /// Numeric Month (3)
  public var month: Swift.Optional<Int?> {
    get {
      return graphQLMap["month"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "month")
    }
  }

  /// Numeric Day (24)
  public var day: Swift.Optional<Int?> {
    get {
      return graphQLMap["day"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "day")
    }
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

/// The role the character plays in the media
public enum CharacterRole: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// A primary character role in the media
  case main
  /// A supporting character role in the media
  case supporting
  /// A background character in the media
  case background
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MAIN": self = .main
      case "SUPPORTING": self = .supporting
      case "BACKGROUND": self = .background
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .main: return "MAIN"
      case .supporting: return "SUPPORTING"
      case .background: return "BACKGROUND"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CharacterRole, rhs: CharacterRole) -> Bool {
    switch (lhs, rhs) {
      case (.main, .main): return true
      case (.supporting, .supporting): return true
      case (.background, .background): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CharacterRole] {
    return [
      .main,
      .supporting,
      .background,
    ]
  }
}

/// Type of relation media has to its parent.
public enum MediaRelation: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// An adaption of this media into a different format
  case adaptation
  /// Released before the relation
  case prequel
  /// Released after the relation
  case sequel
  /// The media a side story is from
  case parent
  /// A side story of the parent media
  case sideStory
  /// Shares at least 1 character
  case character
  /// A shortened and summarized version
  case summary
  /// An alternative version of the same media
  case alternative
  /// An alternative version of the media with a different primary focus
  case spinOff
  /// Other
  case other
  /// Version 2 only. The source material the media was adapted from
  case source
  /// Version 2 only.
  case compilation
  /// Version 2 only.
  case contains
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ADAPTATION": self = .adaptation
      case "PREQUEL": self = .prequel
      case "SEQUEL": self = .sequel
      case "PARENT": self = .parent
      case "SIDE_STORY": self = .sideStory
      case "CHARACTER": self = .character
      case "SUMMARY": self = .summary
      case "ALTERNATIVE": self = .alternative
      case "SPIN_OFF": self = .spinOff
      case "OTHER": self = .other
      case "SOURCE": self = .source
      case "COMPILATION": self = .compilation
      case "CONTAINS": self = .contains
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .adaptation: return "ADAPTATION"
      case .prequel: return "PREQUEL"
      case .sequel: return "SEQUEL"
      case .parent: return "PARENT"
      case .sideStory: return "SIDE_STORY"
      case .character: return "CHARACTER"
      case .summary: return "SUMMARY"
      case .alternative: return "ALTERNATIVE"
      case .spinOff: return "SPIN_OFF"
      case .other: return "OTHER"
      case .source: return "SOURCE"
      case .compilation: return "COMPILATION"
      case .contains: return "CONTAINS"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaRelation, rhs: MediaRelation) -> Bool {
    switch (lhs, rhs) {
      case (.adaptation, .adaptation): return true
      case (.prequel, .prequel): return true
      case (.sequel, .sequel): return true
      case (.parent, .parent): return true
      case (.sideStory, .sideStory): return true
      case (.character, .character): return true
      case (.summary, .summary): return true
      case (.alternative, .alternative): return true
      case (.spinOff, .spinOff): return true
      case (.other, .other): return true
      case (.source, .source): return true
      case (.compilation, .compilation): return true
      case (.contains, .contains): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MediaRelation] {
    return [
      .adaptation,
      .prequel,
      .sequel,
      .parent,
      .sideStory,
      .character,
      .summary,
      .alternative,
      .spinOff,
      .other,
      .source,
      .compilation,
      .contains,
    ]
  }
}

public final class AiringAnimesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AiringAnimes($page: Int, $perPage: Int, $sort: [AiringSort], $airingAtGreater: Int) {
      Page(page: $page, perPage: $perPage) {
        __typename
        airingSchedules(sort: $sort, airingAt_greater: $airingAtGreater) {
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

  public let operationName: String = "AiringAnimes"

  public let operationIdentifier: String? = "6b1b4855bda9e3a63b690fcbf7aa72767f8dae71be9fb65266329cdd3a560e86"

  public var page: Int?
  public var perPage: Int?
  public var sort: [AiringSort?]?
  public var airingAtGreater: Int?

  public init(page: Int? = nil, perPage: Int? = nil, sort: [AiringSort?]? = nil, airingAtGreater: Int? = nil) {
    self.page = page
    self.perPage = perPage
    self.sort = sort
    self.airingAtGreater = airingAtGreater
  }

  public var variables: GraphQLMap? {
    return ["page": page, "perPage": perPage, "sort": sort, "airingAtGreater": airingAtGreater]
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
          GraphQLField("airingSchedules", arguments: ["sort": GraphQLVariable("sort"), "airingAt_greater": GraphQLVariable("airingAtGreater")], type: .list(.object(AiringSchedule.selections))),
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

public final class AnimesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Animes($page: Int, $perPage: Int, $sort: [MediaSort]) {
      Page(page: $page, perPage: $perPage) {
        __typename
        media(type: ANIME, sort: $sort) {
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

  public let operationIdentifier: String? = "af08a183a12daf451c727ad622b7a2111f850a7f83f45e7de00dd9259cc74716"

  public var page: Int?
  public var perPage: Int?
  public var sort: [MediaSort?]?

  public init(page: Int? = nil, perPage: Int? = nil, sort: [MediaSort?]? = nil) {
    self.page = page
    self.perPage = perPage
    self.sort = sort
  }

  public var variables: GraphQLMap? {
    return ["page": page, "perPage": perPage, "sort": sort]
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
          GraphQLField("media", arguments: ["type": "ANIME", "sort": GraphQLVariable("sort")], type: .list(.object(Medium.selections))),
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

public final class MediaCharactersAndStaffQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MediaCharactersAndStaff($mediaId: Int) {
      Media(id: $mediaId) {
        __typename
        characters(page: 1, perPage: 25) {
          __typename
          edges {
            __typename
            ...MediaCharacter
          }
        }
        staff(page: 1, perPage: 25) {
          __typename
          edges {
            __typename
            ...MediaStaff
          }
        }
      }
    }
    """

  public let operationName: String = "MediaCharactersAndStaff"

  public let operationIdentifier: String? = "aa70f90140c6e0c7fc9e3e4b959f1482d5599475b0cf5a0d9f59fe3d90573043"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + MediaCharacter.fragmentDefinition)
    document.append("\n" + MediaStaff.fragmentDefinition)
    return document
  }

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
          GraphQLField("characters", arguments: ["page": 1, "perPage": 25], type: .object(Character.selections)),
          GraphQLField("staff", arguments: ["page": 1, "perPage": 25], type: .object(Staff.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(characters: Character? = nil, staff: Staff? = nil) {
        self.init(unsafeResultMap: ["__typename": "Media", "characters": characters.flatMap { (value: Character) -> ResultMap in value.resultMap }, "staff": staff.flatMap { (value: Staff) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The characters in the media
      public var characters: Character? {
        get {
          return (resultMap["characters"] as? ResultMap).flatMap { Character(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "characters")
        }
      }

      /// The staff who produced the media
      public var staff: Staff? {
        get {
          return (resultMap["staff"] as? ResultMap).flatMap { Staff(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "staff")
        }
      }

      public struct Character: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CharacterConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "CharacterConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CharacterEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("role", type: .scalar(CharacterRole.self)),
              GraphQLField("node", type: .object(Node.selections)),
              GraphQLField("voiceActors", arguments: ["language": "JAPANESE"], type: .list(.object(VoiceActor.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(role: CharacterRole? = nil, node: Node? = nil, voiceActors: [VoiceActor?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "CharacterEdge", "role": role, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }, "voiceActors": voiceActors.flatMap { (value: [VoiceActor?]) -> [ResultMap?] in value.map { (value: VoiceActor?) -> ResultMap? in value.flatMap { (value: VoiceActor) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The characters role in the media
          public var role: CharacterRole? {
            get {
              return resultMap["role"] as? CharacterRole
            }
            set {
              resultMap.updateValue(newValue, forKey: "role")
            }
          }

          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          /// The voice actors of the character
          public var voiceActors: [VoiceActor?]? {
            get {
              return (resultMap["voiceActors"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [VoiceActor?] in value.map { (value: ResultMap?) -> VoiceActor? in value.flatMap { (value: ResultMap) -> VoiceActor in VoiceActor(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [VoiceActor?]) -> [ResultMap?] in value.map { (value: VoiceActor?) -> ResultMap? in value.flatMap { (value: VoiceActor) -> ResultMap in value.resultMap } } }, forKey: "voiceActors")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var mediaCharacter: MediaCharacter {
              get {
                return MediaCharacter(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Character"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("name", type: .object(Name.selections)),
                GraphQLField("image", type: .object(Image.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: Name? = nil, image: Image? = nil) {
              self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the character
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The names of the character
            public var name: Name? {
              get {
                return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "name")
              }
            }

            /// Character images
            public var image: Image? {
              get {
                return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "image")
              }
            }

            public struct Name: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["CharacterName"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("full", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(full: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "CharacterName", "full": full])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The character's first and last name
              public var full: String? {
                get {
                  return resultMap["full"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "full")
                }
              }
            }

            public struct Image: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["CharacterImage"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("medium", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(medium: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "CharacterImage", "medium": medium])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The character's image of media at medium size
              public var medium: String? {
                get {
                  return resultMap["medium"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "medium")
                }
              }
            }
          }

          public struct VoiceActor: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Staff"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("name", type: .object(Name.selections)),
                GraphQLField("image", type: .object(Image.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: Name? = nil, image: Image? = nil) {
              self.init(unsafeResultMap: ["__typename": "Staff", "id": id, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the staff member
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The names of the staff member
            public var name: Name? {
              get {
                return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "name")
              }
            }

            /// The staff images
            public var image: Image? {
              get {
                return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "image")
              }
            }

            public struct Name: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["StaffName"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("full", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(full: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "StaffName", "full": full])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The person's first and last name
              public var full: String? {
                get {
                  return resultMap["full"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "full")
                }
              }
            }

            public struct Image: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["StaffImage"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("medium", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(medium: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "StaffImage", "medium": medium])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The person's image of media at medium size
              public var medium: String? {
                get {
                  return resultMap["medium"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "medium")
                }
              }
            }
          }
        }
      }

      public struct Staff: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["StaffConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "StaffConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["StaffEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("role", type: .scalar(String.self)),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(role: String? = nil, node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "StaffEdge", "role": role, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The role of the staff member in the production of the media
          public var role: String? {
            get {
              return resultMap["role"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "role")
            }
          }

          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var mediaStaff: MediaStaff {
              get {
                return MediaStaff(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Staff"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("name", type: .object(Name.selections)),
                GraphQLField("image", type: .object(Image.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: Name? = nil, image: Image? = nil) {
              self.init(unsafeResultMap: ["__typename": "Staff", "id": id, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The id of the staff member
            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The names of the staff member
            public var name: Name? {
              get {
                return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "name")
              }
            }

            /// The staff images
            public var image: Image? {
              get {
                return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "image")
              }
            }

            public struct Name: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["StaffName"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("full", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(full: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "StaffName", "full": full])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The person's first and last name
              public var full: String? {
                get {
                  return resultMap["full"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "full")
                }
              }
            }

            public struct Image: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["StaffImage"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("medium", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(medium: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "StaffImage", "medium": medium])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The person's image of media at medium size
              public var medium: String? {
                get {
                  return resultMap["medium"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "medium")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class MediaChartQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MediaChart($page: Int, $perPage: Int, $sort: [MediaSort], $type: MediaType) {
      Page(page: $page, perPage: $perPage) {
        __typename
        media(sort: $sort, type: $type) {
          __typename
          id
          title {
            __typename
            romaji
          }
          format
          startDate {
            __typename
            year
          }
          coverImage {
            __typename
            large
          }
        }
        pageInfo {
          __typename
          hasNextPage
          currentPage
        }
      }
    }
    """

  public let operationName: String = "MediaChart"

  public let operationIdentifier: String? = "74e9be4ba7204d8c7373f611b329f0e4f4250b08c1ec31fc1b292c10d4d627ce"

  public var page: Int?
  public var perPage: Int?
  public var sort: [MediaSort?]?
  public var type: MediaType?

  public init(page: Int? = nil, perPage: Int? = nil, sort: [MediaSort?]? = nil, type: MediaType? = nil) {
    self.page = page
    self.perPage = perPage
    self.sort = sort
    self.type = type
  }

  public var variables: GraphQLMap? {
    return ["page": page, "perPage": perPage, "sort": sort, "type": type]
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
          GraphQLField("media", arguments: ["sort": GraphQLVariable("sort"), "type": GraphQLVariable("type")], type: .list(.object(Medium.selections))),
          GraphQLField("pageInfo", type: .object(PageInfo.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(media: [Medium?]? = nil, pageInfo: PageInfo? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "media": media.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }])
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

      /// The pagination information
      public var pageInfo: PageInfo? {
        get {
          return (resultMap["pageInfo"] as? ResultMap).flatMap { PageInfo(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pageInfo")
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("title", type: .object(Title.selections)),
            GraphQLField("format", type: .scalar(MediaFormat.self)),
            GraphQLField("startDate", type: .object(StartDate.selections)),
            GraphQLField("coverImage", type: .object(CoverImage.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, title: Title? = nil, format: MediaFormat? = nil, startDate: StartDate? = nil, coverImage: CoverImage? = nil) {
          self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "format": format, "startDate": startDate.flatMap { (value: StartDate) -> ResultMap in value.resultMap }, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
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

        /// The format the media was released in
        public var format: MediaFormat? {
          get {
            return resultMap["format"] as? MediaFormat
          }
          set {
            resultMap.updateValue(newValue, forKey: "format")
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

        public struct StartDate: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FuzzyDate"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("year", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(year: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "FuzzyDate", "year": year])
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

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hasNextPage", type: .scalar(Bool.self)),
            GraphQLField("currentPage", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasNextPage: Bool? = nil, currentPage: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "currentPage": currentPage])
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

        /// The current page
        public var currentPage: Int? {
          get {
            return resultMap["currentPage"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "currentPage")
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
          id
          status
          score
          progress
          progressVolumes
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
          icon
        }
      }
    }
    """

  public let operationName: String = "MediaDetails"

  public let operationIdentifier: String? = "ce17f7f6664ed29558afabb9ed511c7333b7f9519b0869fa46c6fb04eabc963a"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + FuzzyDate.fragmentDefinition)
    return document
  }

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
          GraphQLField("format", type: .scalar(MediaFormat.self)),
          GraphQLField("status", type: .scalar(MediaStatus.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("startDate", type: .object(StartDate.selections)),
          GraphQLField("endDate", type: .object(EndDate.selections)),
          GraphQLField("season", type: .scalar(MediaSeason.self)),
          GraphQLField("seasonYear", type: .scalar(Int.self)),
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
          GraphQLField("studios", type: .object(Studio.selections)),
          GraphQLField("favourites", type: .scalar(Int.self)),
          GraphQLField("type", type: .scalar(MediaType.self)),
          GraphQLField("nextAiringEpisode", type: .object(NextAiringEpisode.selections)),
          GraphQLField("mediaListEntry", type: .object(MediaListEntry.selections)),
          GraphQLField("source", type: .scalar(MediaSource.self)),
          GraphQLField("externalLinks", type: .list(.object(ExternalLink.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: Title? = nil, format: MediaFormat? = nil, status: MediaStatus? = nil, description: String? = nil, startDate: StartDate? = nil, endDate: EndDate? = nil, season: MediaSeason? = nil, seasonYear: Int? = nil, episodes: Int? = nil, duration: Int? = nil, chapters: Int? = nil, volumes: Int? = nil, coverImage: CoverImage? = nil, bannerImage: String? = nil, averageScore: Int? = nil, meanScore: Int? = nil, popularity: Int? = nil, genres: [String?]? = nil, studios: Studio? = nil, favourites: Int? = nil, type: MediaType? = nil, nextAiringEpisode: NextAiringEpisode? = nil, mediaListEntry: MediaListEntry? = nil, source: MediaSource? = nil, externalLinks: [ExternalLink?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Media", "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "format": format, "status": status, "description": description, "startDate": startDate.flatMap { (value: StartDate) -> ResultMap in value.resultMap }, "endDate": endDate.flatMap { (value: EndDate) -> ResultMap in value.resultMap }, "season": season, "seasonYear": seasonYear, "episodes": episodes, "duration": duration, "chapters": chapters, "volumes": volumes, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }, "bannerImage": bannerImage, "averageScore": averageScore, "meanScore": meanScore, "popularity": popularity, "genres": genres, "studios": studios.flatMap { (value: Studio) -> ResultMap in value.resultMap }, "favourites": favourites, "type": type, "nextAiringEpisode": nextAiringEpisode.flatMap { (value: NextAiringEpisode) -> ResultMap in value.resultMap }, "mediaListEntry": mediaListEntry.flatMap { (value: MediaListEntry) -> ResultMap in value.resultMap }, "source": source, "externalLinks": externalLinks.flatMap { (value: [ExternalLink?]) -> [ResultMap?] in value.map { (value: ExternalLink?) -> ResultMap? in value.flatMap { (value: ExternalLink) -> ResultMap in value.resultMap } } }])
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

      /// The season year the media was initially released in
      public var seasonYear: Int? {
        get {
          return resultMap["seasonYear"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "seasonYear")
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

      /// The companies who produced the media
      public var studios: Studio? {
        get {
          return (resultMap["studios"] as? ResultMap).flatMap { Studio(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "studios")
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

      /// The type of the media; anime or manga
      public var type: MediaType? {
        get {
          return resultMap["type"] as? MediaType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
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

      /// The authenticated user's media list entry for the media
      public var mediaListEntry: MediaListEntry? {
        get {
          return (resultMap["mediaListEntry"] as? ResultMap).flatMap { MediaListEntry(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mediaListEntry")
        }
      }

      /// Source type the media was adapted from.
      public var source: MediaSource? {
        get {
          return resultMap["source"] as? MediaSource
        }
        set {
          resultMap.updateValue(newValue, forKey: "source")
        }
      }

      /// External links to another site related to the media
      public var externalLinks: [ExternalLink?]? {
        get {
          return (resultMap["externalLinks"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ExternalLink?] in value.map { (value: ResultMap?) -> ExternalLink? in value.flatMap { (value: ResultMap) -> ExternalLink in ExternalLink(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ExternalLink?]) -> [ResultMap?] in value.map { (value: ExternalLink?) -> ResultMap? in value.flatMap { (value: ExternalLink) -> ResultMap in value.resultMap } } }, forKey: "externalLinks")
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
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("day", type: .scalar(Int.self)),
            GraphQLField("month", type: .scalar(Int.self)),
            GraphQLField("year", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(day: Int? = nil, month: Int? = nil, year: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "FuzzyDate", "day": day, "month": month, "year": year])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        /// Numeric Month (3)
        public var month: Int? {
          get {
            return resultMap["month"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "month")
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

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fuzzyDate: FuzzyDate {
            get {
              return FuzzyDate(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct EndDate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FuzzyDate"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("day", type: .scalar(Int.self)),
            GraphQLField("month", type: .scalar(Int.self)),
            GraphQLField("year", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(day: Int? = nil, month: Int? = nil, year: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "FuzzyDate", "day": day, "month": month, "year": year])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        /// Numeric Month (3)
        public var month: Int? {
          get {
            return resultMap["month"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "month")
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

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fuzzyDate: FuzzyDate {
            get {
              return FuzzyDate(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct CoverImage: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaCoverImage"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("large", type: .scalar(String.self)),
            GraphQLField("extraLarge", type: .scalar(String.self)),
            GraphQLField("color", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(large: String? = nil, extraLarge: String? = nil, color: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaCoverImage", "large": large, "extraLarge": extraLarge, "color": color])
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

        /// The cover image url of the media at its largest size. If this size isn't available, large will be provided instead.
        public var extraLarge: String? {
          get {
            return resultMap["extraLarge"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "extraLarge")
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

      public struct Studio: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["StudioConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "StudioConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Studio"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("isAnimationStudio", type: .nonNull(.scalar(Bool.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, isAnimationStudio: Bool) {
            self.init(unsafeResultMap: ["__typename": "Studio", "name": name, "isAnimationStudio": isAnimationStudio])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of the studio
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// If the studio is an animation studio or a different kind of company
          public var isAnimationStudio: Bool {
            get {
              return resultMap["isAnimationStudio"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isAnimationStudio")
            }
          }
        }
      }

      public struct NextAiringEpisode: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AiringSchedule"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("timeUntilAiring", type: .nonNull(.scalar(Int.self))),
            GraphQLField("episode", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(timeUntilAiring: Int, episode: Int) {
          self.init(unsafeResultMap: ["__typename": "AiringSchedule", "timeUntilAiring": timeUntilAiring, "episode": episode])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        /// The airing episode number
        public var episode: Int {
          get {
            return resultMap["episode"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "episode")
          }
        }
      }

      public struct MediaListEntry: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaList"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("status", type: .scalar(MediaListStatus.self)),
            GraphQLField("score", type: .scalar(Double.self)),
            GraphQLField("progress", type: .scalar(Int.self)),
            GraphQLField("progressVolumes", type: .scalar(Int.self)),
            GraphQLField("startedAt", type: .object(StartedAt.selections)),
            GraphQLField("completedAt", type: .object(CompletedAt.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, status: MediaListStatus? = nil, score: Double? = nil, progress: Int? = nil, progressVolumes: Int? = nil, startedAt: StartedAt? = nil, completedAt: CompletedAt? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaList", "id": id, "status": status, "score": score, "progress": progress, "progressVolumes": progressVolumes, "startedAt": startedAt.flatMap { (value: StartedAt) -> ResultMap in value.resultMap }, "completedAt": completedAt.flatMap { (value: CompletedAt) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the list entry
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
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

        /// When the entry was started by the user
        public var startedAt: StartedAt? {
          get {
            return (resultMap["startedAt"] as? ResultMap).flatMap { StartedAt(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "startedAt")
          }
        }

        /// When the entry was completed by the user
        public var completedAt: CompletedAt? {
          get {
            return (resultMap["completedAt"] as? ResultMap).flatMap { CompletedAt(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "completedAt")
          }
        }

        public struct StartedAt: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FuzzyDate"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("day", type: .scalar(Int.self)),
              GraphQLField("month", type: .scalar(Int.self)),
              GraphQLField("year", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(day: Int? = nil, month: Int? = nil, year: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "FuzzyDate", "day": day, "month": month, "year": year])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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

          /// Numeric Month (3)
          public var month: Int? {
            get {
              return resultMap["month"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "month")
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

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var fuzzyDate: FuzzyDate {
              get {
                return FuzzyDate(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public struct CompletedAt: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FuzzyDate"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("day", type: .scalar(Int.self)),
              GraphQLField("month", type: .scalar(Int.self)),
              GraphQLField("year", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(day: Int? = nil, month: Int? = nil, year: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "FuzzyDate", "day": day, "month": month, "year": year])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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

          /// Numeric Month (3)
          public var month: Int? {
            get {
              return resultMap["month"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "month")
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

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var fuzzyDate: FuzzyDate {
              get {
                return FuzzyDate(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct ExternalLink: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaExternalLink"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("site", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .scalar(ExternalLinkType.self)),
            GraphQLField("icon", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, url: String? = nil, site: String, type: ExternalLinkType? = nil, icon: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaExternalLink", "id": id, "url": url, "site": site, "type": type, "icon": icon])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the external link
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The url of the external link or base url of link source
        public var url: String? {
          get {
            return resultMap["url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }

        /// The links website site name
        public var site: String {
          get {
            return resultMap["site"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site")
          }
        }

        public var type: ExternalLinkType? {
          get {
            return resultMap["type"] as? ExternalLinkType
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        /// The icon image url of the site. Not available for all links. Transparent PNG 64x64
        public var icon: String? {
          get {
            return resultMap["icon"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "icon")
          }
        }
      }
    }
  }
}

public final class MediaRelationsAndRecommendationsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MediaRelationsAndRecommendations($mediaId: Int) {
      Media(id: $mediaId) {
        __typename
        relations {
          __typename
          edges {
            __typename
            ...MediaRelated
          }
        }
        recommendations(page: 1, sort: RATING_DESC) {
          __typename
          nodes {
            __typename
            ...MediaRecommended
          }
        }
      }
    }
    """

  public let operationName: String = "MediaRelationsAndRecommendations"

  public let operationIdentifier: String? = "17ea6fb12df12741c68325b6610f351ae2032d69ce0d47d6767110aa03f5dee2"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + MediaRelated.fragmentDefinition)
    document.append("\n" + MediaRecommended.fragmentDefinition)
    return document
  }

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
          GraphQLField("relations", type: .object(Relation.selections)),
          GraphQLField("recommendations", arguments: ["page": 1, "sort": "RATING_DESC"], type: .object(Recommendation.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(relations: Relation? = nil, recommendations: Recommendation? = nil) {
        self.init(unsafeResultMap: ["__typename": "Media", "relations": relations.flatMap { (value: Relation) -> ResultMap in value.resultMap }, "recommendations": recommendations.flatMap { (value: Recommendation) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Other media in the same or connecting franchise
      public var relations: Relation? {
        get {
          return (resultMap["relations"] as? ResultMap).flatMap { Relation(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "relations")
        }
      }

      /// User recommendations for similar media
      public var recommendations: Recommendation? {
        get {
          return (resultMap["recommendations"] as? ResultMap).flatMap { Recommendation(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "recommendations")
        }
      }

      public struct Relation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MediaConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MediaEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("relationType", type: .scalar(MediaRelation.self)),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(relationType: MediaRelation? = nil, node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaEdge", "relationType": relationType, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The type of relation to the parent model
          public var relationType: MediaRelation? {
            get {
              return resultMap["relationType"] as? MediaRelation
            }
            set {
              resultMap.updateValue(newValue, forKey: "relationType")
            }
          }

          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var mediaRelated: MediaRelated {
              get {
                return MediaRelated(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("title", type: .object(Title.selections)),
                GraphQLField("format", type: .scalar(MediaFormat.self)),
                GraphQLField("coverImage", type: .object(CoverImage.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, title: Title? = nil, format: MediaFormat? = nil, coverImage: CoverImage? = nil) {
              self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "format": format, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
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

            /// The format the media was released in
            public var format: MediaFormat? {
              get {
                return resultMap["format"] as? MediaFormat
              }
              set {
                resultMap.updateValue(newValue, forKey: "format")
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

      public struct Recommendation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["RecommendationConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "RecommendationConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Recommendation"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("mediaRecommendation", type: .object(MediaRecommendation.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(mediaRecommendation: MediaRecommendation? = nil) {
            self.init(unsafeResultMap: ["__typename": "Recommendation", "mediaRecommendation": mediaRecommendation.flatMap { (value: MediaRecommendation) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The recommended media
          public var mediaRecommendation: MediaRecommendation? {
            get {
              return (resultMap["mediaRecommendation"] as? ResultMap).flatMap { MediaRecommendation(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "mediaRecommendation")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var mediaRecommended: MediaRecommended {
              get {
                return MediaRecommended(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }

          public struct MediaRecommendation: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("title", type: .object(Title.selections)),
                GraphQLField("format", type: .scalar(MediaFormat.self)),
                GraphQLField("coverImage", type: .object(CoverImage.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, title: Title? = nil, format: MediaFormat? = nil, coverImage: CoverImage? = nil) {
              self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "format": format, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
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

            /// The format the media was released in
            public var format: MediaFormat? {
              get {
                return resultMap["format"] as? MediaFormat
              }
              set {
                resultMap.updateValue(newValue, forKey: "format")
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
}

public final class MediaReviewsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MediaReviews($mediaId: Int, $page: Int, $perPage: Int) {
      Media(id: $mediaId) {
        __typename
        reviews(page: $page, perPage: $perPage, sort: RATING_DESC) {
          __typename
          nodes {
            __typename
            id
            summary
            score
            user {
              __typename
              name
            }
          }
        }
      }
    }
    """

  public let operationName: String = "MediaReviews"

  public let operationIdentifier: String? = "8a4fd56dbde9b8f53464ed4f7f249918516182c115bce363ba5ee84495ab566b"

  public var mediaId: Int?
  public var page: Int?
  public var perPage: Int?

  public init(mediaId: Int? = nil, page: Int? = nil, perPage: Int? = nil) {
    self.mediaId = mediaId
    self.page = page
    self.perPage = perPage
  }

  public var variables: GraphQLMap? {
    return ["mediaId": mediaId, "page": page, "perPage": perPage]
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
          GraphQLField("reviews", arguments: ["page": GraphQLVariable("page"), "perPage": GraphQLVariable("perPage"), "sort": "RATING_DESC"], type: .object(Review.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(reviews: Review? = nil) {
        self.init(unsafeResultMap: ["__typename": "Media", "reviews": reviews.flatMap { (value: Review) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// User reviews of the media
      public var reviews: Review? {
        get {
          return (resultMap["reviews"] as? ResultMap).flatMap { Review(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "reviews")
        }
      }

      public struct Review: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ReviewConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .list(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "ReviewConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Review"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("summary", type: .scalar(String.self)),
              GraphQLField("score", type: .scalar(Int.self)),
              GraphQLField("user", type: .object(User.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, summary: String? = nil, score: Int? = nil, user: User? = nil) {
            self.init(unsafeResultMap: ["__typename": "Review", "id": id, "summary": summary, "score": score, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the review
          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// A short summary of the review
          public var summary: String? {
            get {
              return resultMap["summary"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "summary")
            }
          }

          /// The review score of the media
          public var score: Int? {
            get {
              return resultMap["score"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "score")
            }
          }

          /// The creator of the review
          public var user: User? {
            get {
              return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "user")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "User", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
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
          }
        }
      }
    }
  }
}

public final class ReviewDetailsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ReviewDetails($reviewId: Int) {
      Review(id: $reviewId) {
        __typename
        id
        body(asHtml: true)
        score
        rating
        ratingAmount
        user {
          __typename
          name
          avatar {
            __typename
            medium
          }
        }
      }
    }
    """

  public let operationName: String = "ReviewDetails"

  public let operationIdentifier: String? = "4d0a080dcf952285a7c12973499caa09a096433fb477b6a3d02d92c91695584a"

  public var reviewId: Int?

  public init(reviewId: Int? = nil) {
    self.reviewId = reviewId
  }

  public var variables: GraphQLMap? {
    return ["reviewId": reviewId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Review", arguments: ["id": GraphQLVariable("reviewId")], type: .object(Review.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(review: Review? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Review": review.flatMap { (value: Review) -> ResultMap in value.resultMap }])
    }

    /// Review query
    public var review: Review? {
      get {
        return (resultMap["Review"] as? ResultMap).flatMap { Review(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Review")
      }
    }

    public struct Review: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Review"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("body", arguments: ["asHtml": true], type: .scalar(String.self)),
          GraphQLField("score", type: .scalar(Int.self)),
          GraphQLField("rating", type: .scalar(Int.self)),
          GraphQLField("ratingAmount", type: .scalar(Int.self)),
          GraphQLField("user", type: .object(User.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, body: String? = nil, score: Int? = nil, rating: Int? = nil, ratingAmount: Int? = nil, user: User? = nil) {
        self.init(unsafeResultMap: ["__typename": "Review", "id": id, "body": body, "score": score, "rating": rating, "ratingAmount": ratingAmount, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the review
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The main review body text
      public var body: String? {
        get {
          return resultMap["body"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "body")
        }
      }

      /// The review score of the media
      public var score: Int? {
        get {
          return resultMap["score"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "score")
        }
      }

      /// The total user rating of the review
      public var rating: Int? {
        get {
          return resultMap["rating"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "rating")
        }
      }

      /// The amount of user ratings of the review
      public var ratingAmount: Int? {
        get {
          return resultMap["ratingAmount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "ratingAmount")
        }
      }

      /// The creator of the review
      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatar", type: .object(Avatar.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, avatar: Avatar? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public struct Avatar: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["UserAvatar"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("medium", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(medium: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "UserAvatar", "medium": medium])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The avatar of user at medium size
          public var medium: String? {
            get {
              return resultMap["medium"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "medium")
            }
          }
        }
      }
    }
  }
}

public final class SearchMediaQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SearchMedia($page: Int, $perPage: Int, $search: String, $type: MediaType) {
      Page(page: $page, perPage: $perPage) {
        __typename
        pageInfo {
          __typename
          hasNextPage
        }
        media(search: $search, type: $type, sort: SEARCH_MATCH) {
          __typename
          id
          title {
            __typename
            romaji
          }
          format
          coverImage {
            __typename
            large
          }
          startDate {
            __typename
            year
          }
        }
      }
    }
    """

  public let operationName: String = "SearchMedia"

  public let operationIdentifier: String? = "0a0687c1fa0d4b34f19bec7d84de3a1a69498f3e8babe7c8f405d51dcc9088ae"

  public var page: Int?
  public var perPage: Int?
  public var search: String?
  public var type: MediaType?

  public init(page: Int? = nil, perPage: Int? = nil, search: String? = nil, type: MediaType? = nil) {
    self.page = page
    self.perPage = perPage
    self.search = search
    self.type = type
  }

  public var variables: GraphQLMap? {
    return ["page": page, "perPage": perPage, "search": search, "type": type]
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
          GraphQLField("pageInfo", type: .object(PageInfo.selections)),
          GraphQLField("media", arguments: ["search": GraphQLVariable("search"), "type": GraphQLVariable("type"), "sort": "SEARCH_MATCH"], type: .list(.object(Medium.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pageInfo: PageInfo? = nil, media: [Medium?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Page", "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }, "media": media.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      public var media: [Medium?]? {
        get {
          return (resultMap["media"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Medium?] in value.map { (value: ResultMap?) -> Medium? in value.flatMap { (value: ResultMap) -> Medium in Medium(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Medium?]) -> [ResultMap?] in value.map { (value: Medium?) -> ResultMap? in value.flatMap { (value: Medium) -> ResultMap in value.resultMap } } }, forKey: "media")
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

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("title", type: .object(Title.selections)),
            GraphQLField("format", type: .scalar(MediaFormat.self)),
            GraphQLField("coverImage", type: .object(CoverImage.selections)),
            GraphQLField("startDate", type: .object(StartDate.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, title: Title? = nil, format: MediaFormat? = nil, coverImage: CoverImage? = nil, startDate: StartDate? = nil) {
          self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "format": format, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }, "startDate": startDate.flatMap { (value: StartDate) -> ResultMap in value.resultMap }])
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

        /// The format the media was released in
        public var format: MediaFormat? {
          get {
            return resultMap["format"] as? MediaFormat
          }
          set {
            resultMap.updateValue(newValue, forKey: "format")
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

        /// The first official release date of the media
        public var startDate: StartDate? {
          get {
            return (resultMap["startDate"] as? ResultMap).flatMap { StartDate(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "startDate")
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

        public struct StartDate: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FuzzyDate"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("year", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(year: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "FuzzyDate", "year": year])
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

public final class UpdateEntryMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateEntry($mediaId: Int, $status: MediaListStatus, $score: Float, $progress: Int, $progressVolumes: Int, $startedAt: FuzzyDateInput, $completedAt: FuzzyDateInput) {
      SaveMediaListEntry(
        mediaId: $mediaId
        status: $status
        score: $score
        progress: $progress
        progressVolumes: $progressVolumes
        startedAt: $startedAt
        completedAt: $completedAt
      ) {
        __typename
        id
        mediaId
        status
        score
        progress
        progressVolumes
        startedAt {
          __typename
          ...FuzzyDate
        }
        completedAt {
          __typename
          ...FuzzyDate
        }
      }
    }
    """

  public let operationName: String = "UpdateEntry"

  public let operationIdentifier: String? = "d55e64437153ce6137aa5eb8f1c899db6262e2c6f9a63a69b84883ee42cf6dcb"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + FuzzyDate.fragmentDefinition)
    return document
  }

  public var mediaId: Int?
  public var status: MediaListStatus?
  public var score: Double?
  public var progress: Int?
  public var progressVolumes: Int?
  public var startedAt: FuzzyDateInput?
  public var completedAt: FuzzyDateInput?

  public init(mediaId: Int? = nil, status: MediaListStatus? = nil, score: Double? = nil, progress: Int? = nil, progressVolumes: Int? = nil, startedAt: FuzzyDateInput? = nil, completedAt: FuzzyDateInput? = nil) {
    self.mediaId = mediaId
    self.status = status
    self.score = score
    self.progress = progress
    self.progressVolumes = progressVolumes
    self.startedAt = startedAt
    self.completedAt = completedAt
  }

  public var variables: GraphQLMap? {
    return ["mediaId": mediaId, "status": status, "score": score, "progress": progress, "progressVolumes": progressVolumes, "startedAt": startedAt, "completedAt": completedAt]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("SaveMediaListEntry", arguments: ["mediaId": GraphQLVariable("mediaId"), "status": GraphQLVariable("status"), "score": GraphQLVariable("score"), "progress": GraphQLVariable("progress"), "progressVolumes": GraphQLVariable("progressVolumes"), "startedAt": GraphQLVariable("startedAt"), "completedAt": GraphQLVariable("completedAt")], type: .object(SaveMediaListEntry.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(saveMediaListEntry: SaveMediaListEntry? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "SaveMediaListEntry": saveMediaListEntry.flatMap { (value: SaveMediaListEntry) -> ResultMap in value.resultMap }])
    }

    /// Create or update a media list entry
    public var saveMediaListEntry: SaveMediaListEntry? {
      get {
        return (resultMap["SaveMediaListEntry"] as? ResultMap).flatMap { SaveMediaListEntry(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "SaveMediaListEntry")
      }
    }

    public struct SaveMediaListEntry: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MediaList"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("mediaId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .scalar(MediaListStatus.self)),
          GraphQLField("score", type: .scalar(Double.self)),
          GraphQLField("progress", type: .scalar(Int.self)),
          GraphQLField("progressVolumes", type: .scalar(Int.self)),
          GraphQLField("startedAt", type: .object(StartedAt.selections)),
          GraphQLField("completedAt", type: .object(CompletedAt.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, mediaId: Int, status: MediaListStatus? = nil, score: Double? = nil, progress: Int? = nil, progressVolumes: Int? = nil, startedAt: StartedAt? = nil, completedAt: CompletedAt? = nil) {
        self.init(unsafeResultMap: ["__typename": "MediaList", "id": id, "mediaId": mediaId, "status": status, "score": score, "progress": progress, "progressVolumes": progressVolumes, "startedAt": startedAt.flatMap { (value: StartedAt) -> ResultMap in value.resultMap }, "completedAt": completedAt.flatMap { (value: CompletedAt) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the list entry
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The id of the media
      public var mediaId: Int {
        get {
          return resultMap["mediaId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "mediaId")
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

      /// When the entry was started by the user
      public var startedAt: StartedAt? {
        get {
          return (resultMap["startedAt"] as? ResultMap).flatMap { StartedAt(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "startedAt")
        }
      }

      /// When the entry was completed by the user
      public var completedAt: CompletedAt? {
        get {
          return (resultMap["completedAt"] as? ResultMap).flatMap { CompletedAt(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "completedAt")
        }
      }

      public struct StartedAt: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FuzzyDate"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("day", type: .scalar(Int.self)),
            GraphQLField("month", type: .scalar(Int.self)),
            GraphQLField("year", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(day: Int? = nil, month: Int? = nil, year: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "FuzzyDate", "day": day, "month": month, "year": year])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        /// Numeric Month (3)
        public var month: Int? {
          get {
            return resultMap["month"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "month")
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

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fuzzyDate: FuzzyDate {
            get {
              return FuzzyDate(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct CompletedAt: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FuzzyDate"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("day", type: .scalar(Int.self)),
            GraphQLField("month", type: .scalar(Int.self)),
            GraphQLField("year", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(day: Int? = nil, month: Int? = nil, year: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "FuzzyDate", "day": day, "month": month, "year": year])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        /// Numeric Month (3)
        public var month: Int? {
          get {
            return resultMap["month"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "month")
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

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fuzzyDate: FuzzyDate {
            get {
              return FuzzyDate(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class UpdateEntryProgressMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateEntryProgress($saveMediaListEntryId: Int, $progress: Int) {
      SaveMediaListEntry(id: $saveMediaListEntryId, progress: $progress) {
        __typename
        id
        mediaId
        progress
      }
    }
    """

  public let operationName: String = "UpdateEntryProgress"

  public let operationIdentifier: String? = "7396f24139df2cefaa5ffd9649c325c5e39768fde4f258866dedb9799736a938"

  public var saveMediaListEntryId: Int?
  public var progress: Int?

  public init(saveMediaListEntryId: Int? = nil, progress: Int? = nil) {
    self.saveMediaListEntryId = saveMediaListEntryId
    self.progress = progress
  }

  public var variables: GraphQLMap? {
    return ["saveMediaListEntryId": saveMediaListEntryId, "progress": progress]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("SaveMediaListEntry", arguments: ["id": GraphQLVariable("saveMediaListEntryId"), "progress": GraphQLVariable("progress")], type: .object(SaveMediaListEntry.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(saveMediaListEntry: SaveMediaListEntry? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "SaveMediaListEntry": saveMediaListEntry.flatMap { (value: SaveMediaListEntry) -> ResultMap in value.resultMap }])
    }

    /// Create or update a media list entry
    public var saveMediaListEntry: SaveMediaListEntry? {
      get {
        return (resultMap["SaveMediaListEntry"] as? ResultMap).flatMap { SaveMediaListEntry(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "SaveMediaListEntry")
      }
    }

    public struct SaveMediaListEntry: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MediaList"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("mediaId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("progress", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, mediaId: Int, progress: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "MediaList", "id": id, "mediaId": mediaId, "progress": progress])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the list entry
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The id of the media
      public var mediaId: Int {
        get {
          return resultMap["mediaId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "mediaId")
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
    }
  }
}

public final class UserAboutQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query UserAbout($userId: Int) {
      User(id: $userId) {
        __typename
        about(asHtml: true)
      }
    }
    """

  public let operationName: String = "UserAbout"

  public let operationIdentifier: String? = "d6c550e6d5a329e28112cd372b62a36078803d0f2bcf632626151a2126f9a4f0"

  public var userId: Int?

  public init(userId: Int? = nil) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("User", arguments: ["id": GraphQLVariable("userId")], type: .object(User.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "User": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    /// User query
    public var user: User? {
      get {
        return (resultMap["User"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "User")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("about", arguments: ["asHtml": true], type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(about: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "about": about])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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
          id
          mediaId
          status
          score
          progress
          progressVolumes
          media {
            __typename
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
              timeUntilAiring
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

  public let operationIdentifier: String? = "e5445a2a14bf782846fc03704dba21ffef5c3002db04e265373f7169c95d1a46"

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
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("mediaId", type: .nonNull(.scalar(Int.self))),
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

        public init(id: Int, mediaId: Int, status: MediaListStatus? = nil, score: Double? = nil, progress: Int? = nil, progressVolumes: Int? = nil, media: Medium? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaList", "id": id, "mediaId": mediaId, "status": status, "score": score, "progress": progress, "progressVolumes": progressVolumes, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the list entry
        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The id of the media
        public var mediaId: Int {
          get {
            return resultMap["mediaId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "mediaId")
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

          public init(title: Title? = nil, episodes: Int? = nil, chapters: Int? = nil, volumes: Int? = nil, coverImage: CoverImage? = nil, nextAiringEpisode: NextAiringEpisode? = nil, status: MediaStatus? = nil, type: MediaType? = nil) {
            self.init(unsafeResultMap: ["__typename": "Media", "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "episodes": episodes, "chapters": chapters, "volumes": volumes, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }, "nextAiringEpisode": nextAiringEpisode.flatMap { (value: NextAiringEpisode) -> ResultMap in value.resultMap }, "status": status, "type": type])
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
                GraphQLField("timeUntilAiring", type: .nonNull(.scalar(Int.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(episode: Int, timeUntilAiring: Int) {
              self.init(unsafeResultMap: ["__typename": "AiringSchedule", "episode": episode, "timeUntilAiring": timeUntilAiring])
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

            /// Seconds until episode starts airing
            public var timeUntilAiring: Int {
              get {
                return resultMap["timeUntilAiring"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "timeUntilAiring")
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

public struct MediaCharacter: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment MediaCharacter on CharacterEdge {
      __typename
      role
      node {
        __typename
        id
        name {
          __typename
          full
        }
        image {
          __typename
          medium
        }
      }
      voiceActors(language: JAPANESE) {
        __typename
        id
        name {
          __typename
          full
        }
        image {
          __typename
          medium
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["CharacterEdge"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("role", type: .scalar(CharacterRole.self)),
      GraphQLField("node", type: .object(Node.selections)),
      GraphQLField("voiceActors", arguments: ["language": "JAPANESE"], type: .list(.object(VoiceActor.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(role: CharacterRole? = nil, node: Node? = nil, voiceActors: [VoiceActor?]? = nil) {
    self.init(unsafeResultMap: ["__typename": "CharacterEdge", "role": role, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }, "voiceActors": voiceActors.flatMap { (value: [VoiceActor?]) -> [ResultMap?] in value.map { (value: VoiceActor?) -> ResultMap? in value.flatMap { (value: VoiceActor) -> ResultMap in value.resultMap } } }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The characters role in the media
  public var role: CharacterRole? {
    get {
      return resultMap["role"] as? CharacterRole
    }
    set {
      resultMap.updateValue(newValue, forKey: "role")
    }
  }

  public var node: Node? {
    get {
      return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "node")
    }
  }

  /// The voice actors of the character
  public var voiceActors: [VoiceActor?]? {
    get {
      return (resultMap["voiceActors"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [VoiceActor?] in value.map { (value: ResultMap?) -> VoiceActor? in value.flatMap { (value: ResultMap) -> VoiceActor in VoiceActor(unsafeResultMap: value) } } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [VoiceActor?]) -> [ResultMap?] in value.map { (value: VoiceActor?) -> ResultMap? in value.flatMap { (value: VoiceActor) -> ResultMap in value.resultMap } } }, forKey: "voiceActors")
    }
  }

  public struct Node: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Character"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("name", type: .object(Name.selections)),
        GraphQLField("image", type: .object(Image.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: Int, name: Name? = nil, image: Image? = nil) {
      self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The id of the character
    public var id: Int {
      get {
        return resultMap["id"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    /// The names of the character
    public var name: Name? {
      get {
        return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "name")
      }
    }

    /// Character images
    public var image: Image? {
      get {
        return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "image")
      }
    }

    public struct Name: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CharacterName"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("full", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(full: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "CharacterName", "full": full])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The character's first and last name
      public var full: String? {
        get {
          return resultMap["full"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "full")
        }
      }
    }

    public struct Image: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CharacterImage"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("medium", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(medium: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "CharacterImage", "medium": medium])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The character's image of media at medium size
      public var medium: String? {
        get {
          return resultMap["medium"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "medium")
        }
      }
    }
  }

  public struct VoiceActor: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Staff"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("name", type: .object(Name.selections)),
        GraphQLField("image", type: .object(Image.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: Int, name: Name? = nil, image: Image? = nil) {
      self.init(unsafeResultMap: ["__typename": "Staff", "id": id, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The id of the staff member
    public var id: Int {
      get {
        return resultMap["id"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    /// The names of the staff member
    public var name: Name? {
      get {
        return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "name")
      }
    }

    /// The staff images
    public var image: Image? {
      get {
        return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "image")
      }
    }

    public struct Name: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["StaffName"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("full", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(full: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "StaffName", "full": full])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The person's first and last name
      public var full: String? {
        get {
          return resultMap["full"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "full")
        }
      }
    }

    public struct Image: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["StaffImage"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("medium", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(medium: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "StaffImage", "medium": medium])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The person's image of media at medium size
      public var medium: String? {
        get {
          return resultMap["medium"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "medium")
        }
      }
    }
  }
}

public struct MediaStaff: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment MediaStaff on StaffEdge {
      __typename
      role
      node {
        __typename
        id
        name {
          __typename
          full
        }
        image {
          __typename
          medium
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["StaffEdge"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("role", type: .scalar(String.self)),
      GraphQLField("node", type: .object(Node.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(role: String? = nil, node: Node? = nil) {
    self.init(unsafeResultMap: ["__typename": "StaffEdge", "role": role, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The role of the staff member in the production of the media
  public var role: String? {
    get {
      return resultMap["role"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "role")
    }
  }

  public var node: Node? {
    get {
      return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "node")
    }
  }

  public struct Node: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Staff"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("name", type: .object(Name.selections)),
        GraphQLField("image", type: .object(Image.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: Int, name: Name? = nil, image: Image? = nil) {
      self.init(unsafeResultMap: ["__typename": "Staff", "id": id, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }, "image": image.flatMap { (value: Image) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The id of the staff member
    public var id: Int {
      get {
        return resultMap["id"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    /// The names of the staff member
    public var name: Name? {
      get {
        return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "name")
      }
    }

    /// The staff images
    public var image: Image? {
      get {
        return (resultMap["image"] as? ResultMap).flatMap { Image(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "image")
      }
    }

    public struct Name: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["StaffName"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("full", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(full: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "StaffName", "full": full])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The person's first and last name
      public var full: String? {
        get {
          return resultMap["full"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "full")
        }
      }
    }

    public struct Image: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["StaffImage"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("medium", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(medium: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "StaffImage", "medium": medium])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The person's image of media at medium size
      public var medium: String? {
        get {
          return resultMap["medium"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "medium")
        }
      }
    }
  }
}

public struct FuzzyDate: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment FuzzyDate on FuzzyDate {
      __typename
      day
      month
      year
    }
    """

  public static let possibleTypes: [String] = ["FuzzyDate"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("day", type: .scalar(Int.self)),
      GraphQLField("month", type: .scalar(Int.self)),
      GraphQLField("year", type: .scalar(Int.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(day: Int? = nil, month: Int? = nil, year: Int? = nil) {
    self.init(unsafeResultMap: ["__typename": "FuzzyDate", "day": day, "month": month, "year": year])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
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

  /// Numeric Month (3)
  public var month: Int? {
    get {
      return resultMap["month"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "month")
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
}

public struct MediaRelated: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment MediaRelated on MediaEdge {
      __typename
      relationType
      node {
        __typename
        id
        title {
          __typename
          romaji
        }
        format
        coverImage {
          __typename
          large
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["MediaEdge"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("relationType", type: .scalar(MediaRelation.self)),
      GraphQLField("node", type: .object(Node.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(relationType: MediaRelation? = nil, node: Node? = nil) {
    self.init(unsafeResultMap: ["__typename": "MediaEdge", "relationType": relationType, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The type of relation to the parent model
  public var relationType: MediaRelation? {
    get {
      return resultMap["relationType"] as? MediaRelation
    }
    set {
      resultMap.updateValue(newValue, forKey: "relationType")
    }
  }

  public var node: Node? {
    get {
      return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "node")
    }
  }

  public struct Node: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Media"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("title", type: .object(Title.selections)),
        GraphQLField("format", type: .scalar(MediaFormat.self)),
        GraphQLField("coverImage", type: .object(CoverImage.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: Int, title: Title? = nil, format: MediaFormat? = nil, coverImage: CoverImage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "format": format, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
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

    /// The format the media was released in
    public var format: MediaFormat? {
      get {
        return resultMap["format"] as? MediaFormat
      }
      set {
        resultMap.updateValue(newValue, forKey: "format")
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

public struct MediaRecommended: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment MediaRecommended on Recommendation {
      __typename
      mediaRecommendation {
        __typename
        id
        title {
          __typename
          romaji
        }
        format
        coverImage {
          __typename
          large
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["Recommendation"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("mediaRecommendation", type: .object(MediaRecommendation.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(mediaRecommendation: MediaRecommendation? = nil) {
    self.init(unsafeResultMap: ["__typename": "Recommendation", "mediaRecommendation": mediaRecommendation.flatMap { (value: MediaRecommendation) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The recommended media
  public var mediaRecommendation: MediaRecommendation? {
    get {
      return (resultMap["mediaRecommendation"] as? ResultMap).flatMap { MediaRecommendation(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "mediaRecommendation")
    }
  }

  public struct MediaRecommendation: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Media"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("title", type: .object(Title.selections)),
        GraphQLField("format", type: .scalar(MediaFormat.self)),
        GraphQLField("coverImage", type: .object(CoverImage.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: Int, title: Title? = nil, format: MediaFormat? = nil, coverImage: CoverImage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "format": format, "coverImage": coverImage.flatMap { (value: CoverImage) -> ResultMap in value.resultMap }])
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

    /// The format the media was released in
    public var format: MediaFormat? {
      get {
        return resultMap["format"] as? MediaFormat
      }
      set {
        resultMap.updateValue(newValue, forKey: "format")
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
