// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct MediaCharactersAndStaffQuery: GraphQLQuery {
  public static let operationName: String = "MediaCharactersAndStaff"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MediaCharactersAndStaff($mediaId: Int) { Media(id: $mediaId) { __typename characters(page: 1, perPage: 25, sort: [RELEVANCE, ROLE, FAVOURITES_DESC]) { __typename edges { __typename ...MediaCharacter } } staff(page: 1, perPage: 25, sort: [RELEVANCE, ROLE]) { __typename edges { __typename ...MediaStaff } } } }"#,
      fragments: [MediaCharacter.self, MediaStaff.self]
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
      MediaCharactersAndStaffQuery.Data.self
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
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        MediaCharactersAndStaffQuery.Data.Media.self
      ] }

      /// The characters in the media
      public var characters: Characters? { __data["characters"] }
      /// The staff who produced the media
      public var staff: Staff? { __data["staff"] }

      /// Media.Characters
      ///
      /// Parent Type: `CharacterConnection`
      public struct Characters: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.CharacterConnection }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MediaCharactersAndStaffQuery.Data.Media.Characters.self
        ] }

        public var edges: [Edge?]? { __data["edges"] }

        /// Media.Characters.Edge
        ///
        /// Parent Type: `CharacterEdge`
        public struct Edge: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.CharacterEdge }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(MediaCharacter.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            MediaCharactersAndStaffQuery.Data.Media.Characters.Edge.self,
            MediaCharacter.self
          ] }

          /// The id of the connection
          public var id: Int? { __data["id"] }
          /// The characters role in the media
          public var role: GraphQLEnum<AniListAPI.CharacterRole>? { __data["role"] }
          public var node: Node? { __data["node"] }
          /// The voice actors of the character
          public var voiceActors: [VoiceActor?]? { __data["voiceActors"] }

          public struct Fragments: FragmentContainer {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

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
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.StaffConnection }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MediaCharactersAndStaffQuery.Data.Media.Staff.self
        ] }

        public var edges: [Edge?]? { __data["edges"] }

        /// Media.Staff.Edge
        ///
        /// Parent Type: `StaffEdge`
        public struct Edge: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.StaffEdge }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(MediaStaff.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            MediaCharactersAndStaffQuery.Data.Media.Staff.Edge.self,
            MediaStaff.self
          ] }

          /// The id of the connection
          public var id: Int? { __data["id"] }
          /// The role of the staff member in the production of the media
          public var role: String? { __data["role"] }
          public var node: Node? { __data["node"] }

          public struct Fragments: FragmentContainer {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            public var mediaStaff: MediaStaff { _toFragment() }
          }

          public typealias Node = MediaStaff.Node
        }
      }
    }
  }
}
