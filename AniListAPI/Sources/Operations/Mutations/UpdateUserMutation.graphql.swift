// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdateUserMutation: GraphQLMutation {
  public static let operationName: String = "UpdateUser"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation UpdateUser($displayAdultContent: Boolean, $titleLanguage: UserTitleLanguage, $staffNameLanguage: UserStaffNameLanguage, $scoreFormat: ScoreFormat, $airingNotifications: Boolean, $animeListOptions: MediaListOptionsInput, $mangaListOptions: MediaListOptionsInput) { UpdateUser( displayAdultContent: $displayAdultContent titleLanguage: $titleLanguage staffNameLanguage: $staffNameLanguage scoreFormat: $scoreFormat airingNotifications: $airingNotifications animeListOptions: $animeListOptions mangaListOptions: $mangaListOptions ) { __typename ...UserOptionsFragment } }"#,
      fragments: [UserOptionsFragment.self]
    ))

  public var displayAdultContent: GraphQLNullable<Bool>
  public var titleLanguage: GraphQLNullable<GraphQLEnum<UserTitleLanguage>>
  public var staffNameLanguage: GraphQLNullable<GraphQLEnum<UserStaffNameLanguage>>
  public var scoreFormat: GraphQLNullable<GraphQLEnum<ScoreFormat>>
  public var airingNotifications: GraphQLNullable<Bool>
  public var animeListOptions: GraphQLNullable<MediaListOptionsInput>
  public var mangaListOptions: GraphQLNullable<MediaListOptionsInput>

  public init(
    displayAdultContent: GraphQLNullable<Bool>,
    titleLanguage: GraphQLNullable<GraphQLEnum<UserTitleLanguage>>,
    staffNameLanguage: GraphQLNullable<GraphQLEnum<UserStaffNameLanguage>>,
    scoreFormat: GraphQLNullable<GraphQLEnum<ScoreFormat>>,
    airingNotifications: GraphQLNullable<Bool>,
    animeListOptions: GraphQLNullable<MediaListOptionsInput>,
    mangaListOptions: GraphQLNullable<MediaListOptionsInput>
  ) {
    self.displayAdultContent = displayAdultContent
    self.titleLanguage = titleLanguage
    self.staffNameLanguage = staffNameLanguage
    self.scoreFormat = scoreFormat
    self.airingNotifications = airingNotifications
    self.animeListOptions = animeListOptions
    self.mangaListOptions = mangaListOptions
  }

  public var __variables: Variables? { [
    "displayAdultContent": displayAdultContent,
    "titleLanguage": titleLanguage,
    "staffNameLanguage": staffNameLanguage,
    "scoreFormat": scoreFormat,
    "airingNotifications": airingNotifications,
    "animeListOptions": animeListOptions,
    "mangaListOptions": mangaListOptions
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("UpdateUser", UpdateUser?.self, arguments: [
        "displayAdultContent": .variable("displayAdultContent"),
        "titleLanguage": .variable("titleLanguage"),
        "staffNameLanguage": .variable("staffNameLanguage"),
        "scoreFormat": .variable("scoreFormat"),
        "airingNotifications": .variable("airingNotifications"),
        "animeListOptions": .variable("animeListOptions"),
        "mangaListOptions": .variable("mangaListOptions")
      ]),
    ] }

    public var updateUser: UpdateUser? { __data["UpdateUser"] }

    /// UpdateUser
    ///
    /// Parent Type: `User`
    public struct UpdateUser: AniListAPI.SelectionSet {
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
      public var options: UserOptionsFragment.Options? { __data["options"] }
      /// The user's media list options
      public var mediaListOptions: UserOptionsFragment.MediaListOptions? { __data["mediaListOptions"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var userOptionsFragment: UserOptionsFragment { _toFragment() }
      }
    }
  }
}
