# ![app-icon](https://github.com/axiel7/AniHyou/blob/main/AniHyou/Assets.xcassets/AppIcon.appiconset/AniHyou%20logo%2040.png) AniHyou

[![Donate](https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg)](https://ko-fi.com/axiel7)

### Another unofficial iOS AniList client

[<img alt="App Store" height="80" src="https://github.com/axiel7/AniHyou/blob/main/AppStore-badge.png?raw=true"/>](https://apps.apple.com/us/app/anihyou/id1635777325)

Try the beta on [TestFlight](https://testflight.apple.com/join/Om3OIlKd)

Follow the development on the official Discord server:

[![Discord Banner 3](https://discordapp.com/api/guilds/741059285122940928/widget.png?style=banner3)](https://discord.gg/CTv3WdfxHh)

**⌚️There's a watchOS version!**

![screenshots](https://axiel7.github.io/assets/anihyou.58717379ec9cfda91ca1c970f44d2ce6.png)

## Current features
- Animes airing soon and weekly calendar
- Seasonal animes
- Trending animes
- Anime/Manga info, tags, characters, staff, recommendations, relations, reviews, stats...
- Manage Anime/Manga list (status, progress, score, dates, repeat)
- Search animes, mangas, characters, staff, studios and users
- Anime and Manga charts (top and popular)
- User profile info (activity, bio, favorites)
- Airing animes Widget

## Coming features
- [See project](https://github.com/users/axiel7/projects/2/views/1)

## Technologies used
- [AniList GraphQL API](https://github.com/AniList/ApiV2-GraphQL-Docs)
- [Apollo iOS Client](https://github.com/apollographql/apollo-ios)
- [Kingfisher](https://github.com/onevcat/Kingfisher)
- [KeychainSwift](https://github.com/evgenyneu/keychain-swift)
- [RichText](https://github.com/NuPlay/RichText)

## Building
- Create a file `AniHyou/Config.xcconfig` and put your AniList client ID:
```
ANILIST_CLIENT_ID = XXXX
