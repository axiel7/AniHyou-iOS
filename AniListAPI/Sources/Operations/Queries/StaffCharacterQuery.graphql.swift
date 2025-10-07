// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct StaffCharacterQuery: GraphQLQuery {
  public static let operationName: String = "StaffCharacter"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query StaffCharacter($staffId: Int, $onList: Boolean, $page: Int, $perPage: Int) { Staff(id: $staffId) { __typename characterMedia( page: $page perPage: $perPage sort: [START_DATE_DESC] onList: $onList ) { __typename edges { __typename id node { __typename id title { __typename userPreferred } } characters { __typename id image { __typename large } name { __typename userPreferred } } } pageInfo { __typename ...CommonPage } } } }"#,
      fragments: [CommonPage.self]
    ))

  public var staffId: GraphQLNullable<Int32>
  public var onList: GraphQLNullable<Bool>
  public var page: GraphQLNullable<Int32>
  public var perPage: GraphQLNullable<Int32>

  public init(
    staffId: GraphQLNullable<Int32>,
    onList: GraphQLNullable<Bool>,
    page: GraphQLNullable<Int32>,
    perPage: GraphQLNullable<Int32>
  ) {
    self.staffId = staffId
    self.onList = onList
    self.page = page
    self.perPage = perPage
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "staffId": staffId,
    "onList": onList,
    "page": page,
    "perPage": perPage
  ] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Staff", Staff?.self, arguments: ["id": .variable("staffId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      StaffCharacterQuery.Data.self
    ] }

    /// Staff query
    public var staff: Staff? { __data["Staff"] }

    /// Staff
    ///
    /// Parent Type: `Staff`
    public struct Staff: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Staff }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("characterMedia", CharacterMedia?.self, arguments: [
          "page": .variable("page"),
          "perPage": .variable("perPage"),
          "sort": ["START_DATE_DESC"],
          "onList": .variable("onList")
        ]),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        StaffCharacterQuery.Data.Staff.self
      ] }

      /// Media the actor voiced characters in. (Same data as characters with media as node instead of characters)
      public var characterMedia: CharacterMedia? { __data["characterMedia"] }

      /// Staff.CharacterMedia
      ///
      /// Parent Type: `MediaConnection`
      public struct CharacterMedia: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaConnection }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
          .field("pageInfo", PageInfo?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          StaffCharacterQuery.Data.Staff.CharacterMedia.self
        ] }

        public var edges: [Edge?]? { __data["edges"] }
        /// The pagination information
        public var pageInfo: PageInfo? { __data["pageInfo"] }

        /// Staff.CharacterMedia.Edge
        ///
        /// Parent Type: `MediaEdge`
        public struct Edge: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaEdge }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("node", Node?.self),
            .field("characters", [Character?]?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            StaffCharacterQuery.Data.Staff.CharacterMedia.Edge.self
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
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
              .field("title", Title?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              StaffCharacterQuery.Data.Staff.CharacterMedia.Edge.Node.self
            ] }

            /// The id of the media
            public var id: Int { __data["id"] }
            /// The official titles of the media in various languages
            public var title: Title? { __data["title"] }

            /// Staff.CharacterMedia.Edge.Node.Title
            ///
            /// Parent Type: `MediaTitle`
            public struct Title: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("userPreferred", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                StaffCharacterQuery.Data.Staff.CharacterMedia.Edge.Node.Title.self
              ] }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }
          }

          /// Staff.CharacterMedia.Edge.Character
          ///
          /// Parent Type: `Character`
          public struct Character: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Character }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
              .field("image", Image?.self),
              .field("name", Name?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              StaffCharacterQuery.Data.Staff.CharacterMedia.Edge.Character.self
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
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.CharacterImage }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("large", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                StaffCharacterQuery.Data.Staff.CharacterMedia.Edge.Character.Image.self
              ] }

              /// The character's image of media at its largest size
              public var large: String? { __data["large"] }
            }

            /// Staff.CharacterMedia.Edge.Character.Name
            ///
            /// Parent Type: `CharacterName`
            public struct Name: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.CharacterName }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("userPreferred", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                StaffCharacterQuery.Data.Staff.CharacterMedia.Edge.Character.Name.self
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
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(CommonPage.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            StaffCharacterQuery.Data.Staff.CharacterMedia.PageInfo.self,
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
