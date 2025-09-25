//
//  SearchViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/6/22.
//

import Foundation
import AniListAPI

@Observable class SearchViewModel {

    //var currentPage = 1
    //var hasNextPage = true
    private let perPage = 25

    var search: String = ""
    var isLoading = false
    var type: SearchType = .anime
    var sortMedia: MediaSort = .searchMatch
    var isAscending = false
    var selectedGenres = Set<String>()
    var selectedTags = Set<String>()
    var selectedGenresTagsJoined = ""
    var selectedMediaFormat = Set<MediaFormat>()
    var selectedMediaStatus = Set<MediaStatus>()
    var yearFrom: Int?
    var yearTo: Int?
    var season: MediaSeason?
    var mediaOnMyList: Bool?
    var isDoujinshi: Bool?
    var isAdult: Bool?
    var country: CountryOfOrigin?
    
    private var hasFilters: Bool {
        sortMedia != .searchMatch
        || !selectedGenres.isEmpty
        || !selectedTags.isEmpty
        || !selectedMediaFormat.isEmpty
        || !selectedMediaStatus.isEmpty
        || yearFrom != nil || yearTo != nil
        || season != nil
        || mediaOnMyList != nil
        || isDoujinshi != nil
        || isAdult != nil
    }
    
    func clearFilters() {
        selectedGenres.removeAll()
        selectedTags.removeAll()
        selectedGenresTagsJoined = ""
        selectedMediaFormat.removeAll()
        selectedMediaStatus.removeAll()
        yearFrom = nil
        yearTo = nil
        season = nil
        mediaOnMyList = nil
        isDoujinshi = nil
        isAdult = nil
        country = nil
    }
    
    var mediaType: MediaType {
        if type == .manga {
            .manga
        } else {
            .anime
        }
    }

    func runSearch() async {
        search = search.trimmingCharacters(in: .whitespaces)
        switch type {
        case .anime:
            await searchMedia(type: .anime)
        case .manga:
            await searchMedia(type: .manga)
        case .characters:
            await searchCharacters()
        case .staff:
            await searchStaff()
        case .studios:
            await searchStudios()
        case .users:
            await searchUsers()
        }
        // workaround for keep showing the searchingView when search text is empty
        // and a sheet or navigation link is being presented
        if search.isEmpty {
            search = " "
        }
    }

    // swiftlint:disable:next cyclomatic_complexity
    func onChangeSortOrder() async {
        switch sortMedia {
        case .popularity:
            sortMedia = .popularityDesc
        case .popularityDesc:
            sortMedia = .popularity
        case .score:
            sortMedia = .scoreDesc
        case .scoreDesc:
            sortMedia = .score
        case .trending:
            sortMedia = .trendingDesc
        case .trendingDesc:
            sortMedia = .trending
        case .favourites:
            sortMedia = .favouritesDesc
        case .favouritesDesc:
            sortMedia = .favourites
        case .startDate:
            sortMedia = .startDateDesc
        case .startDateDesc:
            sortMedia = .startDate
        default:
            sortMedia = .searchMatch
        }
        await runSearch()
    }

    var searchedMedia = [SearchMediaQuery.Data.Page.Medium]()

    private func searchMedia(type: MediaType) async {
        if search.isEmpty && !hasFilters { return }
        
        isLoading = true

        selectedGenresTagsJoined = (Array(selectedGenres) + selectedTags).joined(separator: ", ")

        //if no query provided but other filters applied and sort is set to default, set sort to popularity
        if
            search.isEmpty
            && sortMedia == .searchMatch
            && hasFilters
        {
            sortMedia = .popularityDesc
        }
        
        if let result = await MediaRepository.searchMedia(
            search: search,
            type: type,
            sort: [sortMedia],
            genreIn: Array(selectedGenres),
            tagIn: Array(selectedTags),
            formatIn: Array(selectedMediaFormat),
            statusIn: Array(selectedMediaStatus),
            startDateGreater: yearFrom,
            startDateLesser: yearTo,
            season: season,
            onList: mediaOnMyList,
            isLicensed: isDoujinshi?.not(),
            isAdult: isAdult,
            country: country,
            page: 1
        ) {
            searchedMedia = result.data
        }
        isLoading = false
    }

    var searchedCharacters = [SearchCharacterQuery.Data.Page.Character]()

    private func searchCharacters() async {
        if search.isEmpty { return }
        isLoading = true
        if let result = await CharacterRepository.searchCharacters(search: search, page: 1) {
            searchedCharacters = result.data
        }
        isLoading = false
    }

    var searchedStaff = [SearchStaffQuery.Data.Page.Staff]()

    private func searchStaff() async {
        if search.isEmpty { return }
        isLoading = true
        if let result = await StaffRepository.searchStaff(search: search, page: 1) {
            searchedStaff = result.data
        }
        isLoading = false
    }

    var searchedStudios = [SearchStudioQuery.Data.Page.Studio]()

    private func searchStudios() async {
        if search.isEmpty { return }
        isLoading = true
        if let result = await StudioRepository.searchStudios(search: search, page: 1) {
            searchedStudios = result.data
        }
        isLoading = false
    }

    var searchedUsers = [SearchUserQuery.Data.Page.User]()

    private func searchUsers() async {
        if search.isEmpty { return }
        isLoading = true
        if let result = await UserRepository.searchUser(search: search, page: 1) {
            searchedUsers = result.data
        }
        isLoading = false
    }

    var filterGenreTagText = ""
    var filteredGenres: [Genre] {
        guard let genreCollection else { return [] }
        if filterGenreTagText.isEmpty {
            return genreCollection
        } else {
            return genreCollection.filter { $0.id.lowercased().contains(filterGenreTagText.lowercased()) }
        }
    }
    var filteredTags: [Genre] {
        guard let tagCollection else { return [] }
        if filterGenreTagText.isEmpty {
            return tagCollection
        } else {
            return tagCollection.filter { $0.id.lowercased().contains(filterGenreTagText.lowercased()) }
        }
    }

    var genreCollection: [Genre]?
    var tagCollection: [Genre]?

    func getGenreTagCollection() {
        Network.shared.apollo.fetch(query: GenreTagCollectionQuery()) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    // Workaround: SwiftUI List item selection only works on Identifiable objects
                    if let genres = data.genreCollection {
                        self?.genreCollection = genres
                            .compactMap { $0 }
                            .compactMap { Genre(id: $0) }
                    }

                    if let tags = data.mediaTagCollection {
                        self?.tagCollection = tags
                            .compactMap { $0 }
                            .compactMap { Genre(id: $0.name) }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
