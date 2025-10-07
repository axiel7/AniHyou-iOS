// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct CharacterDetailsQuery: GraphQLQuery {
  public static let operationName: String = "CharacterDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query CharacterDetails($characterId: Int) { Character(id: $characterId) { __typename id name { __typename userPreferred native alternative alternativeSpoiler } image { __typename large } description(asHtml: true) gender dateOfBirth { __typename ...FuzzyDateFragment } age bloodType ...IsFavouriteCharacter favourites } }"#,
      fragments: [FuzzyDateFragment.self, IsFavouriteCharacter.self]
    ))

  public var characterId: GraphQLNullable<Int32>

  public init(characterId: GraphQLNullable<Int32>) {
    self.characterId = characterId
  }

  @_spi(Unsafe) public var __variables: Variables? { ["characterId": characterId] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Character", Character?.self, arguments: ["id": .variable("characterId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      CharacterDetailsQuery.Data.self
    ] }

    /// Character query
    public var character: Character? { __data["Character"] }

    /// Character
    ///
    /// Parent Type: `Character`
    public struct Character: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Character }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("name", Name?.self),
        .field("image", Image?.self),
        .field("description", String?.self, arguments: ["asHtml": true]),
        .field("gender", String?.self),
        .field("dateOfBirth", DateOfBirth?.self),
        .field("age", String?.self),
        .field("bloodType", String?.self),
        .field("favourites", Int?.self),
        .fragment(IsFavouriteCharacter.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        CharacterDetailsQuery.Data.Character.self,
        IsFavouriteCharacter.self
      ] }

      /// The id of the character
      public var id: Int { __data["id"] }
      /// The names of the character
      public var name: Name? { __data["name"] }
      /// Character images
      public var image: Image? { __data["image"] }
      /// A general description of the character
      public var description: String? { __data["description"] }
      /// The character's gender. Usually Male, Female, or Non-binary but can be any string.
      public var gender: String? { __data["gender"] }
      /// The character's birth date
      public var dateOfBirth: DateOfBirth? { __data["dateOfBirth"] }
      /// The character's age. Note this is a string, not an int, it may contain further text and additional ages.
      public var age: String? { __data["age"] }
      /// The characters blood type
      public var bloodType: String? { __data["bloodType"] }
      /// The amount of user's who have favourited the character
      public var favourites: Int? { __data["favourites"] }
      /// If the character is marked as favourite by the currently authenticated user
      public var isFavourite: Bool { __data["isFavourite"] }

      public struct Fragments: FragmentContainer {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public var isFavouriteCharacter: IsFavouriteCharacter { _toFragment() }
      }

      /// Character.Name
      ///
      /// Parent Type: `CharacterName`
      public struct Name: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.CharacterName }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("userPreferred", String?.self),
          .field("native", String?.self),
          .field("alternative", [String?]?.self),
          .field("alternativeSpoiler", [String?]?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          CharacterDetailsQuery.Data.Character.Name.self
        ] }

        /// The currently authenticated users preferred name language. Default romaji for non-authenticated
        public var userPreferred: String? { __data["userPreferred"] }
        /// The character's full name in their native language
        public var native: String? { __data["native"] }
        /// Other names the character might be referred to as
        public var alternative: [String?]? { __data["alternative"] }
        /// Other names the character might be referred to as but are spoilers
        public var alternativeSpoiler: [String?]? { __data["alternativeSpoiler"] }
      }

      /// Character.Image
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
          CharacterDetailsQuery.Data.Character.Image.self
        ] }

        /// The character's image of media at its largest size
        public var large: String? { __data["large"] }
      }

      /// Character.DateOfBirth
      ///
      /// Parent Type: `FuzzyDate`
      public struct DateOfBirth: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(FuzzyDateFragment.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          CharacterDetailsQuery.Data.Character.DateOfBirth.self,
          FuzzyDateFragment.self
        ] }

        /// Numeric Day (24)
        public var day: Int? { __data["day"] }
        /// Numeric Month (3)
        public var month: Int? { __data["month"] }
        /// Numeric Year (2017)
        public var year: Int? { __data["year"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var fuzzyDateFragment: FuzzyDateFragment { _toFragment() }
        }
      }
    }
  }
}
