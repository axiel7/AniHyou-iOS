// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct CommonReviewDetails: AniListAPI.MutableSelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment CommonReviewDetails on Review { __typename id summary body(asHtml: true) score rating ratingAmount userRating user { __typename id name avatar { __typename medium } } }"#
  }

  public var __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Review }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("summary", String?.self),
    .field("body", String?.self, arguments: ["asHtml": true]),
    .field("score", Int?.self),
    .field("rating", Int?.self),
    .field("ratingAmount", Int?.self),
    .field("userRating", GraphQLEnum<AniListAPI.ReviewRating>?.self),
    .field("user", User?.self),
  ] }

  /// The id of the review
  public var id: Int {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }
  /// A short summary of the review
  public var summary: String? {
    get { __data["summary"] }
    set { __data["summary"] = newValue }
  }
  /// The main review body text
  public var body: String? {
    get { __data["body"] }
    set { __data["body"] = newValue }
  }
  /// The review score of the media
  public var score: Int? {
    get { __data["score"] }
    set { __data["score"] = newValue }
  }
  /// The total user rating of the review
  public var rating: Int? {
    get { __data["rating"] }
    set { __data["rating"] = newValue }
  }
  /// The amount of user ratings of the review
  public var ratingAmount: Int? {
    get { __data["ratingAmount"] }
    set { __data["ratingAmount"] = newValue }
  }
  /// The rating of the review by currently authenticated user
  public var userRating: GraphQLEnum<AniListAPI.ReviewRating>? {
    get { __data["userRating"] }
    set { __data["userRating"] = newValue }
  }
  /// The creator of the review
  public var user: User? {
    get { __data["user"] }
    set { __data["user"] = newValue }
  }

  public init(
    id: Int,
    summary: String? = nil,
    body: String? = nil,
    score: Int? = nil,
    rating: Int? = nil,
    ratingAmount: Int? = nil,
    userRating: GraphQLEnum<AniListAPI.ReviewRating>? = nil,
    user: User? = nil
  ) {
    self.init(_dataDict: DataDict(
      data: [
        "__typename": AniListAPI.Objects.Review.typename,
        "id": id,
        "summary": summary,
        "body": body,
        "score": score,
        "rating": rating,
        "ratingAmount": ratingAmount,
        "userRating": userRating,
        "user": user._fieldData,
      ],
      fulfilledFragments: [
        ObjectIdentifier(CommonReviewDetails.self)
      ]
    ))
  }

  /// User
  ///
  /// Parent Type: `User`
  public struct User: AniListAPI.MutableSelectionSet {
    public var __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Int.self),
      .field("name", String.self),
      .field("avatar", Avatar?.self),
    ] }

    /// The id of the user
    public var id: Int {
      get { __data["id"] }
      set { __data["id"] = newValue }
    }
    /// The name of the user
    public var name: String {
      get { __data["name"] }
      set { __data["name"] = newValue }
    }
    /// The user's avatar images
    public var avatar: Avatar? {
      get { __data["avatar"] }
      set { __data["avatar"] = newValue }
    }

    public init(
      id: Int,
      name: String,
      avatar: Avatar? = nil
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": AniListAPI.Objects.User.typename,
          "id": id,
          "name": name,
          "avatar": avatar._fieldData,
        ],
        fulfilledFragments: [
          ObjectIdentifier(CommonReviewDetails.User.self)
        ]
      ))
    }

    /// User.Avatar
    ///
    /// Parent Type: `UserAvatar`
    public struct Avatar: AniListAPI.MutableSelectionSet {
      public var __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("medium", String?.self),
      ] }

      /// The avatar of user at medium size
      public var medium: String? {
        get { __data["medium"] }
        set { __data["medium"] = newValue }
      }

      public init(
        medium: String? = nil
      ) {
        self.init(_dataDict: DataDict(
          data: [
            "__typename": AniListAPI.Objects.UserAvatar.typename,
            "medium": medium,
          ],
          fulfilledFragments: [
            ObjectIdentifier(CommonReviewDetails.User.Avatar.self)
          ]
        ))
      }
    }
  }
}
