// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ToggleFavouriteMutation: GraphQLMutation {
  public static let operationName: String = "ToggleFavourite"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation ToggleFavourite($animeId: Int, $mangaId: Int, $characterId: Int, $staffId: Int, $studioId: Int) { ToggleFavourite( animeId: $animeId mangaId: $mangaId characterId: $characterId staffId: $staffId studioId: $studioId ) { __typename anime { __typename pageInfo { __typename currentPage } } } }"#
    ))

  public var animeId: GraphQLNullable<Int>
  public var mangaId: GraphQLNullable<Int>
  public var characterId: GraphQLNullable<Int>
  public var staffId: GraphQLNullable<Int>
  public var studioId: GraphQLNullable<Int>

  public init(
    animeId: GraphQLNullable<Int>,
    mangaId: GraphQLNullable<Int>,
    characterId: GraphQLNullable<Int>,
    staffId: GraphQLNullable<Int>,
    studioId: GraphQLNullable<Int>
  ) {
    self.animeId = animeId
    self.mangaId = mangaId
    self.characterId = characterId
    self.staffId = staffId
    self.studioId = studioId
  }

  public var __variables: Variables? { [
    "animeId": animeId,
    "mangaId": mangaId,
    "characterId": characterId,
    "staffId": staffId,
    "studioId": studioId
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("ToggleFavourite", ToggleFavourite?.self, arguments: [
        "animeId": .variable("animeId"),
        "mangaId": .variable("mangaId"),
        "characterId": .variable("characterId"),
        "staffId": .variable("staffId"),
        "studioId": .variable("studioId")
      ]),
    ] }

    /// Favourite or unfavourite an anime, manga, character, staff member, or studio
    public var toggleFavourite: ToggleFavourite? { __data["ToggleFavourite"] }

    /// ToggleFavourite
    ///
    /// Parent Type: `Favourites`
    public struct ToggleFavourite: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Favourites }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("anime", Anime?.self),
      ] }

      /// Favourite anime
      public var anime: Anime? { __data["anime"] }

      /// ToggleFavourite.Anime
      ///
      /// Parent Type: `MediaConnection`
      public struct Anime: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("pageInfo", PageInfo?.self),
        ] }

        /// The pagination information
        public var pageInfo: PageInfo? { __data["pageInfo"] }

        /// ToggleFavourite.Anime.PageInfo
        ///
        /// Parent Type: `PageInfo`
        public struct PageInfo: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("currentPage", Int?.self),
          ] }

          /// The current page
          public var currentPage: Int? { __data["currentPage"] }
        }
      }
    }
  }
}
