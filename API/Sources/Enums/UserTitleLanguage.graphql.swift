// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The language the user wants to see media titles in
public enum UserTitleLanguage: String, EnumType {
  /// The romanization of the native language title
  case romaji = "ROMAJI"
  /// The official english title
  case english = "ENGLISH"
  /// Official title in it's native language
  case native = "NATIVE"
  /// The romanization of the native language title, stylised by media creator
  case romajiStylised = "ROMAJI_STYLISED"
  /// The official english title, stylised by media creator
  case englishStylised = "ENGLISH_STYLISED"
  /// Official title in it's native language, stylised by media creator
  case nativeStylised = "NATIVE_STYLISED"
}
