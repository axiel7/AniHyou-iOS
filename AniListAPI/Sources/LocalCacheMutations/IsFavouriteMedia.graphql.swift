// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct IsFavouriteMedia: AniListAPI.MutableSelectionSet, Fragment, Identifiable {
  public static var fragmentDefinition: StaticString {
    #"fragment IsFavouriteMedia on Media { __typename id isFavourite }"#
  }

  @_spi(Unsafe) public var __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("isFavourite", Bool.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    IsFavouriteMedia.self
  ] }

  /// The id of the media
  public var id: Int {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }
  /// If the media is marked as favourite by the current authenticated user
  public var isFavourite: Bool {
    get { __data["isFavourite"] }
    set { __data["isFavourite"] = newValue }
  }

  public init(
    id: Int,
    isFavourite: Bool
  ) {
    self.init(unsafelyWithData: [
      "__typename": AniListAPI.Objects.Media.typename,
      "id": id,
      "isFavourite": isFavourite,
    ])
  }
}
