//
//  Constants.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation

// AniList urls
let ANILIST_URL = "https://anilist.co"
let ANILIST_API_URL = "\(ANILIST_URL)/api/v2"
let ANILIST_AUTH_URL = "\(ANILIST_API_URL)/oauth/authorize"
let ANIHYOU_SCHEME = "anihyou"
let ANILIST_CALLBACK_URL = "\(ANIHYOU_SCHEME)://auth-response"
let ANILIST_GRAPHQL = "https://graphql.anilist.co/graphql"

let ANILIST_ANIME_URL = "\(ANILIST_URL)/anime/"
let ANILIST_MANGA_URL = "\(ANILIST_URL)/manga/"

// Preferences keys
let USER_TOKEN_KEY = "user_token"
let USER_ID_KEY = "user_id"
let USER_COLOR_KEY = "user_color"
let USER_SCORE_KEY = "user_score"
let USER_TITLE_LANG_KEY = "user_title_lang"
let USER_NAMES_LANG_KEY = "user_names_lang"
