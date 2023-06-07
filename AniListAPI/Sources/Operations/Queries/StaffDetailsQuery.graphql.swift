// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class StaffDetailsQuery: GraphQLQuery {
  public static let operationName: String = "StaffDetails"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query StaffDetails($staffId: Int) {
        Staff(id: $staffId) {
          __typename
          id
          name {
            __typename
            userPreferred
            native
            alternative
          }
          image {
            __typename
            large
          }
          description(asHtml: true)
          primaryOccupations
          gender
          dateOfBirth {
            __typename
            ...FuzzyDateFragment
          }
          dateOfDeath {
            __typename
            ...FuzzyDateFragment
          }
          age
          yearsActive
          homeTown
          bloodType
          ...IsFavouriteStaff
          favourites
        }
      }
      """#,
      fragments: [FuzzyDateFragment.self, IsFavouriteStaff.self]
    ))

  public var staffId: GraphQLNullable<Int>

  public init(staffId: GraphQLNullable<Int>) {
    self.staffId = staffId
  }

  public var __variables: Variables? { ["staffId": staffId] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Query }
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

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Staff }
      public static var __selections: [ApolloAPI.Selection] { [
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
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var isFavouriteStaff: IsFavouriteStaff { _toFragment() }
      }

      /// Staff.Name
      ///
      /// Parent Type: `StaffName`
      public struct Name: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.StaffName }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("userPreferred", String?.self),
          .field("native", String?.self),
          .field("alternative", [String?]?.self),
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
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.StaffImage }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("large", String?.self),
        ] }

        /// The person's image of media at its largest size
        public var large: String? { __data["large"] }
      }

      /// Staff.DateOfBirth
      ///
      /// Parent Type: `FuzzyDate`
      public struct DateOfBirth: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(FuzzyDateFragment.self),
        ] }

        /// Numeric Day (24)
        public var day: Int? { __data["day"] }
        /// Numeric Month (3)
        public var month: Int? { __data["month"] }
        /// Numeric Year (2017)
        public var year: Int? { __data["year"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var fuzzyDateFragment: FuzzyDateFragment { _toFragment() }
        }
      }

      /// Staff.DateOfDeath
      ///
      /// Parent Type: `FuzzyDate`
      public struct DateOfDeath: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(FuzzyDateFragment.self),
        ] }

        /// Numeric Day (24)
        public var day: Int? { __data["day"] }
        /// Numeric Month (3)
        public var month: Int? { __data["month"] }
        /// Numeric Year (2017)
        public var year: Int? { __data["year"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var fuzzyDateFragment: FuzzyDateFragment { _toFragment() }
        }
      }
    }
  }
}
