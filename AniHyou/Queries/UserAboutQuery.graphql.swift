// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI
@_exported import enum ApolloAPI.GraphQLEnum
@_exported import enum ApolloAPI.GraphQLNullable
import API

public class UserAboutQuery: GraphQLQuery {
  public static let operationName: String = "UserAbout"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query UserAbout($userId: Int) {
        User(id: $userId) {
          __typename
          about(asHtml: true)
        }
      }
      """
    ))

  public var userId: GraphQLNullable<Int>

  public init(userId: GraphQLNullable<Int>) {
    self.userId = userId
  }

  public var __variables: Variables? { ["userId": userId] }

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
        .field("about", String?.self, arguments: ["asHtml": true]),
      ] }

      /// The bio written by user (Markdown)
      public var about: String? { __data["about"] }
    }
  }
}
