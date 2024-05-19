// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ViewerIdQuery: GraphQLQuery {
  public static let operationName: String = "ViewerId"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ViewerId { Viewer { __typename id options { __typename profileColor staffNameLanguage titleLanguage } mediaListOptions { __typename scoreFormat animeList { __typename advancedScoring advancedScoringEnabled customLists } mangaList { __typename customLists } } } }"#
    ))

  public init() {}

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Viewer", Viewer?.self),
    ] }

    /// Get the currently authenticated user
    public var viewer: Viewer? { __data["Viewer"] }

    /// Viewer
    ///
    /// Parent Type: `User`
    public struct Viewer: AniListAPI.SelectionSet {
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

      /// Viewer.Options
      ///
      /// Parent Type: `UserOptions`
      public struct Options: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserOptions }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("profileColor", String?.self),
          .field("staffNameLanguage", GraphQLEnum<AniListAPI.UserStaffNameLanguage>?.self),
          .field("titleLanguage", GraphQLEnum<AniListAPI.UserTitleLanguage>?.self),
        ] }

        /// Profile highlight color (blue, purple, pink, orange, red, green, gray)
        public var profileColor: String? { __data["profileColor"] }
        /// The language the user wants to see staff and character names in
        public var staffNameLanguage: GraphQLEnum<AniListAPI.UserStaffNameLanguage>? { __data["staffNameLanguage"] }
        /// The language the user wants to see media titles in
        public var titleLanguage: GraphQLEnum<AniListAPI.UserTitleLanguage>? { __data["titleLanguage"] }
      }

      /// Viewer.MediaListOptions
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

        /// Viewer.MediaListOptions.AnimeList
        ///
        /// Parent Type: `MediaListTypeOptions`
        public struct AnimeList: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaListTypeOptions }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("advancedScoring", [String?]?.self),
            .field("advancedScoringEnabled", Bool?.self),
            .field("customLists", [String?]?.self),
          ] }

          /// The names of the user's advanced scoring sections
          public var advancedScoring: [String?]? { __data["advancedScoring"] }
          /// If advanced scoring is enabled
          public var advancedScoringEnabled: Bool? { __data["advancedScoringEnabled"] }
          /// The names of the user's custom lists
          public var customLists: [String?]? { __data["customLists"] }
        }

        /// Viewer.MediaListOptions.MangaList
        ///
        /// Parent Type: `MediaListTypeOptions`
        public struct MangaList: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaListTypeOptions }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("customLists", [String?]?.self),
          ] }

          /// The names of the user's custom lists
          public var customLists: [String?]? { __data["customLists"] }
        }
      }
    }
  }
}
