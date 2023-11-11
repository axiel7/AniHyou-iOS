// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct UserOptionsFragment: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment UserOptionsFragment on User { __typename id options { __typename displayAdultContent profileColor staffNameLanguage titleLanguage airingNotifications } mediaListOptions { __typename scoreFormat animeList { __typename advancedScoringEnabled advancedScoring } mangaList { __typename advancedScoringEnabled advancedScoring } } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.User }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("options", Options?.self),
    .field("mediaListOptions", MediaListOptions?.self),
  ] }

  /// The id of the user
  public var id: Int { __data["id"] }
  /// The user's general options
  public var options: Options? { __data["options"] }
  /// The user's media list options
  public var mediaListOptions: MediaListOptions? { __data["mediaListOptions"] }

  /// Options
  ///
  /// Parent Type: `UserOptions`
  public struct Options: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserOptions }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("displayAdultContent", Bool?.self),
      .field("profileColor", String?.self),
      .field("staffNameLanguage", GraphQLEnum<AniListAPI.UserStaffNameLanguage>?.self),
      .field("titleLanguage", GraphQLEnum<AniListAPI.UserTitleLanguage>?.self),
      .field("airingNotifications", Bool?.self),
    ] }

    /// Whether the user has enabled viewing of 18+ content
    public var displayAdultContent: Bool? { __data["displayAdultContent"] }
    /// Profile highlight color (blue, purple, pink, orange, red, green, gray)
    public var profileColor: String? { __data["profileColor"] }
    /// The language the user wants to see staff and character names in
    public var staffNameLanguage: GraphQLEnum<AniListAPI.UserStaffNameLanguage>? { __data["staffNameLanguage"] }
    /// The language the user wants to see media titles in
    public var titleLanguage: GraphQLEnum<AniListAPI.UserTitleLanguage>? { __data["titleLanguage"] }
    /// Whether the user receives notifications when a show they are watching aires
    public var airingNotifications: Bool? { __data["airingNotifications"] }
  }

  /// MediaListOptions
  ///
  /// Parent Type: `MediaListOptions`
  public struct MediaListOptions: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaListOptions }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("scoreFormat", GraphQLEnum<AniListAPI.ScoreFormat>?.self),
      .field("animeList", AnimeList?.self),
      .field("mangaList", MangaList?.self),
    ] }

    /// The score format the user is using for media lists
    public var scoreFormat: GraphQLEnum<AniListAPI.ScoreFormat>? { __data["scoreFormat"] }
    /// The user's anime list options
    public var animeList: AnimeList? { __data["animeList"] }
    /// The user's manga list options
    public var mangaList: MangaList? { __data["mangaList"] }

    /// MediaListOptions.AnimeList
    ///
    /// Parent Type: `MediaListTypeOptions`
    public struct AnimeList: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaListTypeOptions }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("advancedScoringEnabled", Bool?.self),
        .field("advancedScoring", [String?]?.self),
      ] }

      /// If advanced scoring is enabled
      public var advancedScoringEnabled: Bool? { __data["advancedScoringEnabled"] }
      /// The names of the user's advanced scoring sections
      public var advancedScoring: [String?]? { __data["advancedScoring"] }
    }

    /// MediaListOptions.MangaList
    ///
    /// Parent Type: `MediaListTypeOptions`
    public struct MangaList: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaListTypeOptions }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("advancedScoringEnabled", Bool?.self),
        .field("advancedScoring", [String?]?.self),
      ] }

      /// If advanced scoring is enabled
      public var advancedScoringEnabled: Bool? { __data["advancedScoringEnabled"] }
      /// The names of the user's advanced scoring sections
      public var advancedScoring: [String?]? { __data["advancedScoring"] }
    }
  }
}
