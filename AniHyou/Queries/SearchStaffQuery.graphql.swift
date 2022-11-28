// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class SearchStaffQuery: GraphQLQuery {
  public static let operationName: String = "SearchStaff"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query SearchStaff($page: Int, $perPage: Int, $search: String) {
        Page(page: $page, perPage: $perPage) {
          __typename
          staff(search: $search, sort: SEARCH_MATCH) {
            __typename
            id
            name {
              __typename
              userPreferred
            }
            image {
              __typename
              medium
            }
            primaryOccupations
          }
          pageInfo {
            __typename
            hasNextPage
          }
        }
      }
      """
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var search: GraphQLNullable<String>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    search: GraphQLNullable<String>
  ) {
    self.page = page
    self.perPage = perPage
    self.search = search
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "search": search
  ] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.Query }
    public static var __selections: [Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": .variable("page"),
        "perPage": .variable("perPage")
      ]),
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.Page }
      public static var __selections: [Selection] { [
        .field("staff", [Staff?]?.self, arguments: [
          "search": .variable("search"),
          "sort": "SEARCH_MATCH"
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }

      public var staff: [Staff?]? { __data["staff"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.Staff
      ///
      /// Parent Type: `Staff`
      public struct Staff: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.Staff }
        public static var __selections: [Selection] { [
          .field("id", Int.self),
          .field("name", Name?.self),
          .field("image", Image?.self),
          .field("primaryOccupations", [String?]?.self),
        ] }

        /// The id of the staff member
        public var id: Int { __data["id"] }
        /// The names of the staff member
        public var name: Name? { __data["name"] }
        /// The staff images
        public var image: Image? { __data["image"] }
        /// The person's primary occupations
        public var primaryOccupations: [String?]? { __data["primaryOccupations"] }

        /// Page.Staff.Name
        ///
        /// Parent Type: `StaffName`
        public struct Name: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { API.Objects.StaffName }
          public static var __selections: [Selection] { [
            .field("userPreferred", String?.self),
          ] }

          /// The currently authenticated users preferred name language. Default romaji for non-authenticated
          public var userPreferred: String? { __data["userPreferred"] }
        }

        /// Page.Staff.Image
        ///
        /// Parent Type: `StaffImage`
        public struct Image: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { API.Objects.StaffImage }
          public static var __selections: [Selection] { [
            .field("medium", String?.self),
          ] }

          /// The person's image of media at medium size
          public var medium: String? { __data["medium"] }
        }
      }

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.PageInfo }
        public static var __selections: [Selection] { [
          .field("hasNextPage", Bool?.self),
        ] }

        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }
    }
  }
}
