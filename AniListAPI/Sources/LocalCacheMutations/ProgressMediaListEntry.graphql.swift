// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct ProgressMediaListEntry: AniListAPI.MutableSelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment ProgressMediaListEntry on MediaList { __typename ...IdsMediaList progress progressVolumes }"#
  }

  public var __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("progress", Int?.self),
    .field("progressVolumes", Int?.self),
    .fragment(IdsMediaList.self),
  ] }

  /// The amount of episodes/chapters consumed by the user
  public var progress: Int? {
    get { __data["progress"] }
    set { __data["progress"] = newValue }
  }
  /// The amount of volumes read by the user
  public var progressVolumes: Int? {
    get { __data["progressVolumes"] }
    set { __data["progressVolumes"] = newValue }
  }
  /// The id of the list entry
  public var id: Int {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }
  /// The id of the media
  public var mediaId: Int {
    get { __data["mediaId"] }
    set { __data["mediaId"] = newValue }
  }

  public struct Fragments: FragmentContainer {
    public var __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public var idsMediaList: IdsMediaList {
      get { _toFragment() }
      _modify { var f = idsMediaList; yield &f; __data = f.__data }
      @available(*, unavailable, message: "mutate properties of the fragment instead.")
      set { preconditionFailure() }
    }
  }

  public init(
    progress: Int? = nil,
    progressVolumes: Int? = nil,
    id: Int,
    mediaId: Int
  ) {
    self.init(_dataDict: DataDict(
      data: [
        "__typename": AniListAPI.Objects.MediaList.typename,
        "progress": progress,
        "progressVolumes": progressVolumes,
        "id": id,
        "mediaId": mediaId,
      ],
      fulfilledFragments: [
        ObjectIdentifier(ProgressMediaListEntry.self),
        ObjectIdentifier(IdsMediaList.self)
      ]
    ))
  }
}
