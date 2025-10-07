// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct ToggleFavouriteMutation: GraphQLMutation {
  public static let operationName: String = "ToggleFavourite"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation ToggleFavourite($animeId: Int, $mangaId: Int, $characterId: Int, $staffId: Int, $studioId: Int) { ToggleFavourite( animeId: $animeId mangaId: $mangaId characterId: $characterId staffId: $staffId studioId: $studioId ) { __typename anime { __typename pageInfo { __typename ...CommonPage } } } }"#,
      fragments: [CommonPage.self]
    ))

  public var animeId: GraphQLNullable<Int32>
  public var mangaId: GraphQLNullable<Int32>
  public var characterId: GraphQLNullable<Int32>
  public var staffId: GraphQLNullable<Int32>
  public var studioId: GraphQLNullable<Int32>

  public init(
    animeId: GraphQLNullable<Int32>,
    mangaId: GraphQLNullable<Int32>,
    characterId: GraphQLNullable<Int32>,
    staffId: GraphQLNullable<Int32>,
    studioId: GraphQLNullable<Int32>
  ) {
    self.animeId = animeId
    self.mangaId = mangaId
    self.characterId = characterId
    self.staffId = staffId
    self.studioId = studioId
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "animeId": animeId,
    "mangaId": mangaId,
    "characterId": characterId,
    "staffId": staffId,
    "studioId": studioId
  ] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("ToggleFavourite", ToggleFavourite?.self, arguments: [
        "animeId": .variable("animeId"),
        "mangaId": .variable("mangaId"),
        "characterId": .variable("characterId"),
        "staffId": .variable("staffId"),
        "studioId": .variable("studioId")
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      ToggleFavouriteMutation.Data.self
    ] }

    /// Favourite or unfavourite an anime, manga, character, staff member, or studio
    public var toggleFavourite: ToggleFavourite? { __data["ToggleFavourite"] }

    /// ToggleFavourite
    ///
    /// Parent Type: `Favourites`
    public struct ToggleFavourite: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Favourites }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("anime", Anime?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ToggleFavouriteMutation.Data.ToggleFavourite.self
      ] }

      /// Favourite anime
      public var anime: Anime? { __data["anime"] }

      /// ToggleFavourite.Anime
      ///
      /// Parent Type: `MediaConnection`
      public struct Anime: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaConnection }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("pageInfo", PageInfo?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          ToggleFavouriteMutation.Data.ToggleFavourite.Anime.self
        ] }

        /// The pagination information
        public var pageInfo: PageInfo? { __data["pageInfo"] }

        /// ToggleFavourite.Anime.PageInfo
        ///
        /// Parent Type: `PageInfo`
        public struct PageInfo: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(CommonPage.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            ToggleFavouriteMutation.Data.ToggleFavourite.Anime.PageInfo.self,
            CommonPage.self
          ] }

          /// The current page
          public var currentPage: Int? { __data["currentPage"] }
          /// If there is another page
          public var hasNextPage: Bool? { __data["hasNextPage"] }

          public struct Fragments: FragmentContainer {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            public var commonPage: CommonPage { _toFragment() }
          }
        }
      }
    }
  }
}
