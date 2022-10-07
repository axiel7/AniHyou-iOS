// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI
@_exported import enum ApolloAPI.GraphQLEnum
@_exported import enum ApolloAPI.GraphQLNullable
import API

public class UserFavoritesStaffQuery: GraphQLQuery {
  public static let operationName: String = "UserFavoritesStaff"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query UserFavoritesStaff($userId: Int, $page: Int, $perPage: Int) {
        User(id: $userId) {
          __typename
          favourites {
            __typename
            staff(page: $page, perPage: $perPage) {
              __typename
              nodes {
                __typename
                id
                name {
                  __typename
                  userPreferred
                }
                image {
                  __typename
                  large
                }
              }
              pageInfo {
                __typename
                currentPage
                hasNextPage
              }
            }
          }
        }
      }
      """
    ))

  public var userId: GraphQLNullable<Int>
  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>

  public init(
    userId: GraphQLNullable<Int>,
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>
  ) {
    self.userId = userId
    self.page = page
    self.perPage = perPage
  }

  public var __variables: Variables? { [
    "userId": userId,
    "page": page,
    "perPage": perPage
  ] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.Query }
    public static var __selections: [Selection] { [
      .field("User", User?.self, arguments: ["id": .variable("userId")]),
    ] }

    /// User query
    public var user: User? { __data["User"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.User }
      public static var __selections: [Selection] { [
        .field("favourites", Favourites?.self),
      ] }

      /// The users favourites
      public var favourites: Favourites? { __data["favourites"] }

      /// User.Favourites
      ///
      /// Parent Type: `Favourites`
      public struct Favourites: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.Favourites }
        public static var __selections: [Selection] { [
          .field("staff", Staff?.self, arguments: [
            "page": .variable("page"),
            "perPage": .variable("perPage")
          ]),
        ] }

        /// Favourite staff
        public var staff: Staff? { __data["staff"] }

        /// User.Favourites.Staff
        ///
        /// Parent Type: `StaffConnection`
        public struct Staff: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { API.Objects.StaffConnection }
          public static var __selections: [Selection] { [
            .field("nodes", [Node?]?.self),
            .field("pageInfo", PageInfo?.self),
          ] }

          public var nodes: [Node?]? { __data["nodes"] }
          /// The pagination information
          public var pageInfo: PageInfo? { __data["pageInfo"] }

          /// User.Favourites.Staff.Node
          ///
          /// Parent Type: `Staff`
          public struct Node: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { API.Objects.Staff }
            public static var __selections: [Selection] { [
              .field("id", Int.self),
              .field("name", Name?.self),
              .field("image", Image?.self),
            ] }

            /// The id of the staff member
            public var id: Int { __data["id"] }
            /// The names of the staff member
            public var name: Name? { __data["name"] }
            /// The staff images
            public var image: Image? { __data["image"] }

            /// User.Favourites.Staff.Node.Name
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

            /// User.Favourites.Staff.Node.Image
            ///
            /// Parent Type: `StaffImage`
            public struct Image: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ParentType { API.Objects.StaffImage }
              public static var __selections: [Selection] { [
                .field("large", String?.self),
              ] }

              /// The person's image of media at its largest size
              public var large: String? { __data["large"] }
            }
          }

          /// User.Favourites.Staff.PageInfo
          ///
          /// Parent Type: `PageInfo`
          public struct PageInfo: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { API.Objects.PageInfo }
            public static var __selections: [Selection] { [
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
}
