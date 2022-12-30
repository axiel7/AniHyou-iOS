// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class ViewerIdQuery: GraphQLQuery {
  public static let operationName: String = "ViewerId"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query ViewerId {
        Viewer {
          __typename
          id
          options {
            __typename
            profileColor
            staffNameLanguage
            titleLanguage
          }
          mediaListOptions {
            __typename
            scoreFormat
          }
        }
      }
      """
    ))

  public init() {}

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.Query }
    public static var __selections: [Selection] { [
      .field("Viewer", Viewer?.self),
    ] }

    /// Get the currently authenticated user
    public var viewer: Viewer? { __data["Viewer"] }

    /// Viewer
    ///
    /// Parent Type: `User`
    public struct Viewer: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.User }
      public static var __selections: [Selection] { [
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
      public struct Options: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.UserOptions }
        public static var __selections: [Selection] { [
          .field("profileColor", String?.self),
          .field("staffNameLanguage", GraphQLEnum<API.UserStaffNameLanguage>?.self),
          .field("titleLanguage", GraphQLEnum<API.UserTitleLanguage>?.self),
        ] }

        /// Profile highlight color (blue, purple, pink, orange, red, green, gray)
        public var profileColor: String? { __data["profileColor"] }
        /// The language the user wants to see staff and character names in
        public var staffNameLanguage: GraphQLEnum<API.UserStaffNameLanguage>? { __data["staffNameLanguage"] }
        /// The language the user wants to see media titles in
        public var titleLanguage: GraphQLEnum<API.UserTitleLanguage>? { __data["titleLanguage"] }
      }

      /// Viewer.MediaListOptions
      ///
      /// Parent Type: `MediaListOptions`
      public struct MediaListOptions: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.MediaListOptions }
        public static var __selections: [Selection] { [
          .field("scoreFormat", GraphQLEnum<API.ScoreFormat>?.self),
        ] }

        /// The score format the user is using for media lists
        public var scoreFormat: GraphQLEnum<API.ScoreFormat>? { __data["scoreFormat"] }
      }
    }
  }
}
