//
//  SearchViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/6/22.
//

import Foundation
import AniListAPI

// swiftlint:disable:next type_body_length
class SearchViewModel: ObservableObject {

    //var currentPage = 1
    //var hasNextPage = true
    private let perPage = 25

    var search: String = ""
    @Published var isLoading = false
    @Published var type: SearchType = .anime
    @Published var sortMedia: MediaSort = .searchMatch
    @Published var isAscending = false
    @Published var selectedGenres = Set<String>()
    @Published var selectedTags = Set<String>()
    @Published var selectedGenresTagsJoined = ""
    @Published var selectedMediaFormat = Set<MediaFormat>()
    @Published var selectedMediaStatus = Set<MediaStatus>()
    @Published var yearFrom: Int?
    @Published var yearTo: Int?
    @Published var mediaOnMyList: Bool?
    @Published var isDoujinshi: Bool?
    @Published var isAdult: Bool?
    @Published var country: CountryOfOrigin?
    
    private var hasFilters: Bool {
        return sortMedia != .searchMatch
        || !selectedGenres.isEmpty
        || !selectedTags.isEmpty
        || !selectedMediaFormat.isEmpty
        || !selectedMediaStatus.isEmpty
        || yearFrom != nil || yearTo != nil
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
        mediaOnMyList = nil
        isDoujinshi = nil
        isAdult = nil
        country = nil
    }
    
    var mediaType: MediaType {
        if type == .manga {
            return .manga
        } else {
            return .anime
        }
    }

    func runSearch() {
        switch type {
        case .anime:
            searchMedia(type: .anime)
        case .manga:
            searchMedia(type: .manga)
        case .characters:
            searchCharacters()
        case .staff:
            searchStaff()
        case .studios:
            searchStudios()
        case .users:
            searchUsers()
        }
    }

    // swiftlint:disable:next cyclomatic_complexity
    func onChangeSortOrder() {
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
        runSearch()
    }

    @Published var searchedMedia = [SearchMediaQuery.Data.Page.Medium?]()

    private func searchMedia(type: MediaType) {
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

        Network.shared.apollo.fetch(query: SearchMediaQuery(
            page: .some(1),
            perPage: .some(perPage),
            search: someIfNotEmpty(search),
            type: .some(.case(type)),
            sort: .some([.case(sortMedia)]),
            genre_in: someIfNotEmpty(Array(selectedGenres)),
            genre_not_in: .none,
            tag_in: someIfNotEmpty(Array(selectedTags)),
            tag_not_in: .none,
            format_in: someEnumArrayIfNotEmpty(Array(selectedMediaFormat)),
            status_in: someEnumArrayIfNotEmpty(Array(selectedMediaStatus)),
            startDateGreater: someIfNotNil(yearFrom?.toFuzzyDateInt()),
            startDateLesser: someIfNotNil(yearTo?.toFuzzyDateInt()),
            onList: someIfNotNil(mediaOnMyList),
            isLicensed: someIfNotNil(isDoujinshi?.not()),
            isAdult: someIfNotNil(isAdult),
            country: someIfNotNil(country)
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let media = page.media {
                        self?.searchedMedia = media
                        //self.currentPage += 1
                        //self.hasNextPage = page.pageInfo?.hasNextPage == true
                    }
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }

    @Published var searchedCharacters = [SearchCharacterQuery.Data.Page.Character?]()

    private func searchCharacters() {
        if search.isEmpty { return }
        isLoading = true
        Network.shared.apollo.fetch(query: SearchCharacterQuery(
            page: .some(1),
            perPage: .some(perPage),
            search: .some(search)
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let characters = page.characters {
                        self?.searchedCharacters = characters
                    }
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }

    @Published var searchedStaff = [SearchStaffQuery.Data.Page.Staff?]()

    private func searchStaff() {
        if search.isEmpty { return }
        isLoading = true
        Network.shared.apollo.fetch(query: SearchStaffQuery(
            page: .some(1),
            perPage: .some(perPage),
            search: .some(search)
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let staff = page.staff {
                        self?.searchedStaff = staff
                    }
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }

    @Published var searchedStudios = [SearchStudioQuery.Data.Page.Studio?]()

    private func searchStudios() {
        if search.isEmpty { return }
        isLoading = true
        Network.shared.apollo.fetch(query: SearchStudioQuery(
            page: .some(1),
            perPage: .some(perPage),
            search: .some(search)
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let studios = page.studios {
                        self?.searchedStudios = studios
                    }
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }

    @Published var searchedUsers = [SearchUserQuery.Data.Page.User?]()

    private func searchUsers() {
        if search.isEmpty { return }
        isLoading = true
        Network.shared.apollo.fetch(query: SearchUserQuery(
            page: .some(1),
            perPage: .some(perPage),
            search: .some(search)
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let users = page.users {
                        self?.searchedUsers = users
                    }
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }

    @Published var filterGenreTagText = ""
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

    @Published var genreCollection: [Genre]?
    @Published var tagCollection: [Genre]?

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
