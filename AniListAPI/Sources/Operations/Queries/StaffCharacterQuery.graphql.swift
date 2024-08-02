// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class StaffCharacterQuery: GraphQLQuery {
  public static let operationName: String = "StaffCharacter"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query StaffCharacter($staffId: Int, $page: Int, $perPage: Int) { Staff(id: $staffId) { __typename characterMedia(page: $page, perPage: $perPage, sort: [START_DATE_DESC]) { __typename edges { __typename id node { __typename id title { __typename userPreferred } } characters { __typename id image { __typename large } name { __typename userPreferred } } } pageInfo { __typename currentPage hasNextPage } } } }"#
    ))

  public var staffId: GraphQLNullable<Int>
  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>

  public init(
    staffId: GraphQLNullable<Int>,
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>
  ) {
    self.staffId = staffId
    self.page = page
    self.perPage = perPage
  }

  public var __variables: Variables? { [
    "staffId": staffId,
    "page": page,
    "perPage": perPage
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Staff", Staff?.self, arguments: ["id": .variable("staffId")]),
    ] }

    /// Staff query
    public var staff: Staff? { __data["Staff"] }

    /// Staff
    ///
    /// Parent Type: `Staff`
    public struct Staff: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Staff }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("characterMedia", CharacterMedia?.self, arguments: [
          "page": .variable("page"),
          "perPage": .variable("perPage"),
          "sort": ["START_DATE_DESC"]
        ]),
      ] }

      /// Media the actor voiced characters in. (Same data as characters with media as node instead of characters)
      public var characterMedia: CharacterMedia? { __data["characterMedia"] }

      /// Staff.CharacterMedia
      ///
      /// Parent Type: `MediaConnection`
      public struct CharacterMedia: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
          .field("pageInfo", PageInfo?.self),
        ] }

        public var edges: [Edge?]? { __data["edges"] }
        /// The pagination information
        public var pageInfo: PageInfo? { __data["pageInfo"] }

        /// Staff.CharacterMedia.Edge
        ///
        /// Parent Type: `MediaEdge`
        public struct Edge: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaEdge }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("node", Node?.self),
            .field("characters", [Character?]?.self),
          ] }

          /// The id of the connection
          public var id: Int? { __data["id"] }
          public var node: Node? { __data["node"] }
          /// The characters in the media voiced by the parent actor
          public var characters: [Character?]? { __data["characters"] }

          /// Staff.CharacterMedia.Edge.Node
          ///
          /// Parent Type: `Media`
          public struct Node: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
              .field("title", Title?.self),
            ] }

            /// The id of the media
            public var id: Int { __data["id"] }
            /// The official titles of the media in various languages
            public var title: Title? { __data["title"] }

            /// Staff.CharacterMedia.Edge.Node.Title
            ///
            /// Parent Type: `MediaTitle`
            public struct Title: AniListAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("userPreferred", String?.self),
              ] }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }
          }

          /// Staff.CharacterMedia.Edge.Character
          ///
          /// Parent Type: `Character`
          public struct Character: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Character }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
              .field("image", Image?.self),
              .field("name", Name?.self),
            ] }

            /// The id of the character
            public var id: Int { __data["id"] }
            /// Character images
            public var image: Image? { __data["image"] }
            /// The names of the character
            public var name: Name? { __data["name"] }

            /// Staff.CharacterMedia.Edge.Character.Image
            ///
            /// Parent Type: `CharacterImage`
            public struct Image: AniListAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.CharacterImage }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("large", String?.self),
              ] }

              /// The character's image of media at its largest size
              public var large: String? { __data["large"] }
            }

            /// Staff.CharacterMedia.Edge.Character.Name
            ///
            /// Parent Type: `CharacterName`
            public struct Name: AniListAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.CharacterName }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("userPreferred", String?.self),
              ] }

              /// The currently authenticated users preferred name language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }
          }
        }

        /// Staff.CharacterMedia.PageInfo
        ///
        /// Parent Type: `PageInfo`
        public struct PageInfo: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("currentPage", Int?.self),
            .field("hasNextPage", Bool?.self),
          ] }

          /// The current page
          public var currentPage: Int? { __data["currentPage"] }
          /// If there is another page
          public var hasNextPage: Bool? { __data["hasNextPage"] }
        }
      }
    }
  }
}
