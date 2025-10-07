// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct StaffDetailsQuery: GraphQLQuery {
  public static let operationName: String = "StaffDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query StaffDetails($staffId: Int) { Staff(id: $staffId) { __typename id name { __typename userPreferred native alternative } image { __typename large } description(asHtml: true) primaryOccupations gender dateOfBirth { __typename ...FuzzyDateFragment } dateOfDeath { __typename ...FuzzyDateFragment } age yearsActive homeTown bloodType ...IsFavouriteStaff favourites } }"#,
      fragments: [FuzzyDateFragment.self, IsFavouriteStaff.self]
    ))

  public var staffId: GraphQLNullable<Int32>

  public init(staffId: GraphQLNullable<Int32>) {
    self.staffId = staffId
  }

  @_spi(Unsafe) public var __variables: Variables? { ["staffId": staffId] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Staff", Staff?.self, arguments: ["id": .variable("staffId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      StaffDetailsQuery.Data.self
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
        .field("id", Int.self),
        .field("name", Name?.self),
        .field("image", Image?.self),
        .field("description", String?.self, arguments: ["asHtml": true]),
        .field("primaryOccupations", [String?]?.self),
        .field("gender", String?.self),
        .field("dateOfBirth", DateOfBirth?.self),
        .field("dateOfDeath", DateOfDeath?.self),
        .field("age", Int?.self),
        .field("yearsActive", [Int?]?.self),
        .field("homeTown", String?.self),
        .field("bloodType", String?.self),
        .field("favourites", Int?.self),
        .fragment(IsFavouriteStaff.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        StaffDetailsQuery.Data.Staff.self,
        IsFavouriteStaff.self
      ] }

      /// The id of the staff member
      public var id: Int { __data["id"] }
      /// The names of the staff member
      public var name: Name? { __data["name"] }
      /// The staff images
      public var image: Image? { __data["image"] }
      /// A general description of the staff member
      public var description: String? { __data["description"] }
      /// The person's primary occupations
      public var primaryOccupations: [String?]? { __data["primaryOccupations"] }
      /// The staff's gender. Usually Male, Female, or Non-binary but can be any string.
      public var gender: String? { __data["gender"] }
      public var dateOfBirth: DateOfBirth? { __data["dateOfBirth"] }
      public var dateOfDeath: DateOfDeath? { __data["dateOfDeath"] }
      /// The person's age in years
      public var age: Int? { __data["age"] }
      /// [startYear, endYear] (If the 2nd value is not present staff is still active)
      public var yearsActive: [Int?]? { __data["yearsActive"] }
      /// The persons birthplace or hometown
      public var homeTown: String? { __data["homeTown"] }
      /// The persons blood type
      public var bloodType: String? { __data["bloodType"] }
      /// The amount of user's who have favourited the staff member
      public var favourites: Int? { __data["favourites"] }
      /// If the staff member is marked as favourite by the currently authenticated user
      public var isFavourite: Bool { __data["isFavourite"] }

      public struct Fragments: FragmentContainer {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public var isFavouriteStaff: IsFavouriteStaff { _toFragment() }
      }

      /// Staff.Name
      ///
      /// Parent Type: `StaffName`
      public struct Name: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.StaffName }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("userPreferred", String?.self),
          .field("native", String?.self),
          .field("alternative", [String?]?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          StaffDetailsQuery.Data.Staff.Name.self
        ] }

        /// The currently authenticated users preferred name language. Default romaji for non-authenticated
        public var userPreferred: String? { __data["userPreferred"] }
        /// The person's full name in their native language
        public var native: String? { __data["native"] }
        /// Other names the staff member might be referred to as (pen names)
        public var alternative: [String?]? { __data["alternative"] }
      }

      /// Staff.Image
      ///
      /// Parent Type: `StaffImage`
      public struct Image: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.StaffImage }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("large", String?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          StaffDetailsQuery.Data.Staff.Image.self
        ] }

        /// The person's image of media at its largest size
        public var large: String? { __data["large"] }
      }

      /// Staff.DateOfBirth
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
          StaffDetailsQuery.Data.Staff.DateOfBirth.self,
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

      /// Staff.DateOfDeath
      ///
      /// Parent Type: `FuzzyDate`
      public struct DateOfDeath: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(FuzzyDateFragment.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          StaffDetailsQuery.Data.Staff.DateOfDeath.self,
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
