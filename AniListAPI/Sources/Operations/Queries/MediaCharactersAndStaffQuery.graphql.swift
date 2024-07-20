// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MediaCharactersAndStaffQuery: GraphQLQuery {
  public static let operationName: String = "MediaCharactersAndStaff"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MediaCharactersAndStaff($mediaId: Int) { Media(id: $mediaId) { __typename characters(page: 1, perPage: 25, sort: [RELEVANCE, ROLE, FAVOURITES_DESC]) { __typename edges { __typename ...MediaCharacter } } staff(page: 1, perPage: 25, sort: [RELEVANCE, ROLE]) { __typename edges { __typename ...MediaStaff } } } }"#,
      fragments: [MediaCharacter.self, MediaStaff.self]
    ))

  public var mediaId: GraphQLNullable<Int>

  public init(mediaId: GraphQLNullable<Int>) {
    self.mediaId = mediaId
  }

  public var __variables: Variables? { ["mediaId": mediaId] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
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

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("characters", Characters?.self, arguments: [
          "page": 1,
          "perPage": 25,
          "sort": ["RELEVANCE", "ROLE", "FAVOURITES_DESC"]
        ]),
        .field("staff", Staff?.self, arguments: [
          "page": 1,
          "perPage": 25,
          "sort": ["RELEVANCE", "ROLE"]
        ]),
      ] }

      /// The characters in the media
      public var characters: Characters? { __data["characters"] }
      /// The staff who produced the media
      public var staff: Staff? { __data["staff"] }

      /// Media.Characters
      ///
      /// Parent Type: `CharacterConnection`
      public struct Characters: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.CharacterConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
        ] }

        public var edges: [Edge?]? { __data["edges"] }

        /// Media.Characters.Edge
        ///
        /// Parent Type: `CharacterEdge`
        public struct Edge: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.CharacterEdge }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(MediaCharacter.self),
          ] }

          /// The id of the connection
          public var id: Int? { __data["id"] }
          /// The characters role in the media
          public var role: GraphQLEnum<AniListAPI.CharacterRole>? { __data["role"] }
          public var node: Node? { __data["node"] }
          /// The voice actors of the character
          public var voiceActors: [VoiceActor?]? { __data["voiceActors"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var mediaCharacter: MediaCharacter { _toFragment() }
          }

          public typealias Node = MediaCharacter.Node

          public typealias VoiceActor = MediaCharacter.VoiceActor
        }
      }

      /// Media.Staff
      ///
      /// Parent Type: `StaffConnection`
      public struct Staff: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.StaffConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
        ] }

        public var edges: [Edge?]? { __data["edges"] }

        /// Media.Staff.Edge
        ///
        /// Parent Type: `StaffEdge`
        public struct Edge: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.StaffEdge }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(MediaStaff.self),
          ] }

          /// The id of the connection
          public var id: Int? { __data["id"] }
          /// The role of the staff member in the production of the media
          public var role: String? { __data["role"] }
          public var node: Node? { __data["node"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var mediaStaff: MediaStaff { _toFragment() }
          }

          public typealias Node = MediaStaff.Node
        }
      }
    }
  }
}