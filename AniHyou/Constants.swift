//
//  Constants.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation

// swiftlint:disable identifier_name
// AniList urls
let ANILIST_URL = "https://anilist.co"
let ANILIST_API_URL = "\(ANILIST_URL)/api/v2"
let ANILIST_AUTH_URL = "\(ANILIST_API_URL)/oauth/authorize"
let ANIHYOU_SCHEME = "anihyou"
let ANILIST_CALLBACK_URL = "\(ANIHYOU_SCHEME)://auth-response"
let ANILIST_GRAPHQL = "https://graphql.anilist.co/graphql"

let ANILIST_ANIME_URL = "\(ANILIST_URL)/anime/"
let ANILIST_MANGA_URL = "\(ANILIST_URL)/manga/"

let YOUTUBE_VIDEO_URL = "https://www.youtube.com/watch?v="
let DAILYMOTION_VIDEO_URL = "https://www.dailymotion.com/video/"

// Preferences keys
let LOGGED_IN_KEY = "is_logged_in"
let USER_TOKEN_KEY = "user_token"
let USER_ID_KEY = "user_id"
let USER_COLOR_KEY = "user_color"
let USER_SCORE_KEY = "user_score"
let ADVANCED_SCORES_KEY = "advanced_scores"
let ADVANCED_SCORING_ENABLED_KEY = "advanced_scoring_enabled"
let USER_TITLE_LANG_KEY = "user_title_lang"
let USER_NAMES_LANG_KEY = "user_names_lang"
let SELECTED_TAB_KEY = "selected_tab_index"
let LIST_STATUS_KEY = "list_status"
let LIST_STYLE_KEY = "list_style"
let LIST_SORT = "list_sort"
let LIST_SORT_ORDER = "list_sort_order"
let ACCENT_COLOR_KEY = "accent_color"
let ACCENT_COLOR_MODE_KEY = "accent_color_mode"
let CUSTOM_ACCENT_COLOR_KEY = "custom_accent_color"
let AIRING_ON_MY_LIST_KEY = "airing_on_my_list"
let INCREMENT_LONG_SWIPE_DIRECTION_KEY = "increment_long_swipe_direction"
let HAS_DONATED_KEY = "has_donated"
let APP_ICON_KEY = "app_icon"
let HOME_TAB_KEY = "home_tab"

let ANIHYOU_COLOR = "#526CFD"
let ANIHYOU_GROUP = "group.com.axiel7.AniHyou"

let UNKNOWN_CHAR = "─"

let AIRING_WIDGET_KIND = "AniHyou_Widget"
let ANIME_BEHIND_WIDGET_KIND = "AniHyou_Anime_Behind_Widget"
let MEDIA_LIST_WIDGET_KIND = "AniHyou_MediaList_Widget"
// swiftlint:enable identifier_name
