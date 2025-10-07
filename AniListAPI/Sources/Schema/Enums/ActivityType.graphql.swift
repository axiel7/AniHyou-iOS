// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) import ApolloAPI

/// Activity type enum.
public enum ActivityType: String, EnumType {
  /// A text activity
  case text = "TEXT"
  /// A anime list update activity
  case animeList = "ANIME_LIST"
  /// A manga list update activity
  case mangaList = "MANGA_LIST"
  /// A text message activity sent to another user
  case message = "MESSAGE"
  /// Anime & Manga list update, only used in query arguments
  case mediaList = "MEDIA_LIST"
}
