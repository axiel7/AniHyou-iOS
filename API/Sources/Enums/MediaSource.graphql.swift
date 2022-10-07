// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// Source type the media was adapted from
public enum MediaSource: String, EnumType {
  /// An original production not based of another work
  case original = "ORIGINAL"
  /// Asian comic book
  case manga = "MANGA"
  /// Written work published in volumes
  case lightNovel = "LIGHT_NOVEL"
  /// Video game driven primary by text and narrative
  case visualNovel = "VISUAL_NOVEL"
  /// Video game
  case videoGame = "VIDEO_GAME"
  /// Other
  case other = "OTHER"
  /// Version 2+ only. Written works not published in volumes
  case novel = "NOVEL"
  /// Version 2+ only. Self-published works
  case doujinshi = "DOUJINSHI"
  /// Version 2+ only. Japanese Anime
  case anime = "ANIME"
  /// Version 3 only. Written works published online
  case webNovel = "WEB_NOVEL"
  /// Version 3 only. Live action media such as movies or TV show
  case liveAction = "LIVE_ACTION"
  /// Version 3 only. Games excluding video games
  case game = "GAME"
  /// Version 3 only. Comics excluding manga
  case comic = "COMIC"
  /// Version 3 only. Multimedia project
  case multimediaProject = "MULTIMEDIA_PROJECT"
  /// Version 3 only. Picture book
  case pictureBook = "PICTURE_BOOK"
}
