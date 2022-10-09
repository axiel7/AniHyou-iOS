// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI
@_exported import enum ApolloAPI.GraphQLEnum
@_exported import enum ApolloAPI.GraphQLNullable
import API

public class ViewerQuery: GraphQLQuery {
  public static let operationName: String = "Viewer"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query Viewer {
        Viewer {
          __typename
          id
          name
          avatar {
            __typename
            large
          }
          bannerImage
          about
          options {
            __typename
            profileColor
          }
        }
      }
      """
    ))

  public init() {}

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.Query }
    public static var __selections: [Selection] { [
      .field("Viewer", Viewer?.self),
    ] }

    /// Get the currently authenticated user
    public var viewer: Viewer? { __data["Viewer"] }

    /// Viewer
    ///
    /// Parent Type: `User`
    public struct Viewer: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.User }
      public static var __selections: [Selection] { [
        .field("id", Int.self),
        .field("name", String.self),
        .field("avatar", Avatar?.self),
        .field("bannerImage", String?.self),
        .field("about", String?.self),
        .field("options", Options?.self),
      ] }

      /// The id of the user
      public var id: Int { __data["id"] }
      /// The name of the user
      public var name: String { __data["name"] }
      /// The user's avatar images
      public var avatar: Avatar? { __data["avatar"] }
      /// The user's banner images
      public var bannerImage: String? { __data["bannerImage"] }
      /// The bio written by user (Markdown)
      public var about: String? { __data["about"] }
      /// The user's general options
      public var options: Options? { __data["options"] }

      /// Viewer.Avatar
      ///
      /// Parent Type: `UserAvatar`
      public struct Avatar: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.UserAvatar }
        public static var __selections: [Selection] { [
          .field("large", String?.self),
        ] }

        /// The avatar of user at its largest size
        public var large: String? { __data["large"] }
      }

      /// Viewer.Options
      ///
      /// Parent Type: `UserOptions`
      public struct Options: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.UserOptions }
        public static var __selections: [Selection] { [
          .field("profileColor", String?.self),
        ] }

        /// Profile highlight color (blue, purple, pink, orange, red, green, gray)
        public var profileColor: String? { __data["profileColor"] }
      }
    }
  }
}