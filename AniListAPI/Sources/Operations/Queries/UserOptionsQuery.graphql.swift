// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct UserOptionsQuery: GraphQLQuery {
  public static let operationName: String = "UserOptions"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UserOptions { Viewer { __typename ...UserOptionsFragment } }"#,
      fragments: [UserOptionsFragment.self]
    ))

  public init() {}

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Viewer", Viewer?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      UserOptionsQuery.Data.self
    ] }

    /// Get the currently authenticated user
    public var viewer: Viewer? { __data["Viewer"] }

    /// Viewer
    ///
    /// Parent Type: `User`
    public struct Viewer: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(UserOptionsFragment.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        UserOptionsQuery.Data.Viewer.self,
        UserOptionsFragment.self
      ] }

      /// The id of the user
      public var id: Int { __data["id"] }
      /// The user's general options
      public var options: Options? { __data["options"] }
      /// The user's media list options
      public var mediaListOptions: MediaListOptions? { __data["mediaListOptions"] }

      public struct Fragments: FragmentContainer {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public var userOptionsFragment: UserOptionsFragment { _toFragment() }
      }

      public typealias Options = UserOptionsFragment.Options

      public typealias MediaListOptions = UserOptionsFragment.MediaListOptions
    }
  }
}
