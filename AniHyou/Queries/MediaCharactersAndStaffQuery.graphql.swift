// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class MediaCharactersAndStaffQuery: GraphQLQuery {
  public static let operationName: String = "MediaCharactersAndStaff"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
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
      """,
      fragments: [MediaCharacter.self, MediaStaff.self]
    ))

  public var mediaId: GraphQLNullable<Int>

  public init(mediaId: GraphQLNullable<Int>) {
    self.mediaId = mediaId
  }

  public var __variables: Variables? { ["mediaId": mediaId] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.Query }
    public static var __selections: [Selection] { [
      .field("Media", Media?.self, arguments: ["id": .variable("mediaId")]),
    ] }

    /// Media query
    public var media: Media? { __data["Media"] }

    /// Media
    ///
    /// Parent Type: `Media`
    public struct Media: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.Media }
      public static var __selections: [Selection] { [
        .field("characters", Characters?.self, arguments: [
          "page": 1,
          "perPage": 25
        ]),
        .field("staff", Staff?.self, arguments: [
          "page": 1,
          "perPage": 25
        ]),
      ] }

      /// The characters in the media
      public var characters: Characters? { __data["characters"] }
      /// The staff who produced the media
      public var staff: Staff? { __data["staff"] }

      /// Media.Characters
      ///
      /// Parent Type: `CharacterConnection`
      public struct Characters: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.CharacterConnection }
        public static var __selections: [Selection] { [
          .field("edges", [Edge?]?.self),
        ] }

        public var edges: [Edge?]? { __data["edges"] }

        /// Media.Characters.Edge
        ///
        /// Parent Type: `CharacterEdge`
        public struct Edge: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { API.Objects.CharacterEdge }
          public static var __selections: [Selection] { [
            .fragment(MediaCharacter.self),
          ] }

          /// The characters role in the media
          public var role: GraphQLEnum<API.CharacterRole>? { __data["role"] }
          public var node: MediaCharacter.Node? { __data["node"] }
          /// The voice actors of the character
          public var voiceActors: [MediaCharacter.VoiceActor?]? { __data["voiceActors"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public var mediaCharacter: MediaCharacter { _toFragment() }
          }
        }
      }

      /// Media.Staff
      ///
      /// Parent Type: `StaffConnection`
      public struct Staff: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.StaffConnection }
        public static var __selections: [Selection] { [
          .field("edges", [Edge?]?.self),
        ] }

        public var edges: [Edge?]? { __data["edges"] }

        /// Media.Staff.Edge
        ///
        /// Parent Type: `StaffEdge`
        public struct Edge: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { API.Objects.StaffEdge }
          public static var __selections: [Selection] { [
            .fragment(MediaStaff.self),
          ] }

          /// The role of the staff member in the production of the media
          public var role: String? { __data["role"] }
          public var node: MediaStaff.Node? { __data["node"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public var mediaStaff: MediaStaff { _toFragment() }
          }
        }
      }
    }
  }
}
