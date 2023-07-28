// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ViewerQuery: GraphQLQuery {
  public static let operationName: String = "Viewer"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Viewer { Viewer { __typename ...UserInfo } }"#,
      fragments: [UserInfo.self]
    ))

  public init() {}

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Viewer", Viewer?.self),
    ] }

    /// Get the currently authenticated user
    public var viewer: Viewer? { __data["Viewer"] }

    /// Viewer
    ///
    /// Parent Type: `User`
    public struct Viewer: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(UserInfo.self),
      ] }

      /// The id of the user
      public var id: Int { __data["id"] }
      /// The name of the user
      public var name: String { __data["name"] }
      /// The user's avatar images
      public var avatar: UserInfo.Avatar? { __data["avatar"] }
      /// The user's banner images
      public var bannerImage: String? { __data["bannerImage"] }
      /// The bio written by user (Markdown)
      public var about: String? { __data["about"] }
      /// The user's general options
      public var options: UserInfo.Options? { __data["options"] }
      /// The user's media list options
      public var mediaListOptions: UserInfo.MediaListOptions? { __data["mediaListOptions"] }
      /// If the authenticated user if following this user
      public var isFollowing: Bool? { __data["isFollowing"] }
      /// If this user if following the authenticated user
      public var isFollower: Bool? { __data["isFollower"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var userInfo: UserInfo { _toFragment() }
      }
    }
  }
}
