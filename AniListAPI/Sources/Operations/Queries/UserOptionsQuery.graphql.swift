// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UserOptionsQuery: GraphQLQuery {
  public static let operationName: String = "UserOptions"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UserOptions { Viewer { __typename ...UserOptionsFragment } }"#,
      fragments: [UserOptionsFragment.self]
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
        .fragment(UserOptionsFragment.self),
      ] }

      /// The id of the user
      public var id: Int { __data["id"] }
      /// The user's general options
      public var options: Options? { __data["options"] }
      /// The user's media list options
      public var mediaListOptions: MediaListOptions? { __data["mediaListOptions"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var userOptionsFragment: UserOptionsFragment { _toFragment() }
      }

      public typealias Options = UserOptionsFragment.Options

      public typealias MediaListOptions = UserOptionsFragment.MediaListOptions
    }
  }
}
