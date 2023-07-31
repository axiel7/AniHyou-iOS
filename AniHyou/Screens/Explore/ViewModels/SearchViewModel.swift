//
//  SearchViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/6/22.
//

import Foundation
import AniListAPI

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
    @Published var selectedMediaFormatJoined = ""
    @Published var selectedMediaStatus = Set<MediaStatus>()
    @Published var selectedMediaStatusJoined = ""
    @Published var selectedYear: Int?
    @Published var mediaOnMyList = false

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

    // swiftlint:disable cyclomatic_complexity
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
    // swiftlint:enable cyclomatic_complexity

    @Published var searchedMedia = [SearchMediaQuery.Data.Page.Medium?]()

    private func searchMedia(type: MediaType) {
        isLoading = true

        selectedGenresTagsJoined = (Array(selectedGenres) + selectedTags).joined(separator: ", ")
        selectedMediaFormatJoined = selectedMediaFormat.map { $0.localizedName }.joined(separator: ", ")
        selectedMediaStatusJoined = selectedMediaStatus.map { $0.localizedName }.joined(separator: ", ")

        //if no query provided but other filters applied and sort is set to default, set sort to popularity
        if
            search.isEmpty
            && sortMedia == .searchMatch
            && (
                !selectedGenres.isEmpty
                || !selectedTags.isEmpty
                || !selectedMediaFormat.isEmpty
                || !selectedMediaStatus.isEmpty
                || selectedYear != nil
                || mediaOnMyList
            )
        {
            sortMedia = .popularityDesc
        }

        var mediaOnListValue = GraphQLNullable<Bool>.none
        if mediaOnMyList { mediaOnListValue = .some(true) }

        Network.shared.apollo.fetch(query: SearchMediaQuery(
            page: .some(1),
            perPage: .some(perPage),
            search: someIfNotEmpty(search),
            type: .some(.case(type)),
            sort: .some([.case(sortMedia)]),
            genre_in: someIfNotEmpty(Array(selectedGenres)),
            tag_in: someIfNotEmpty(Array(selectedTags)),
            format_in: someEnumArrayIfNotEmpty(Array(selectedMediaFormat)),
            status_in: someEnumArrayIfNotEmpty(Array(selectedMediaStatus)),
            seasonYear: someIfNotNil(selectedYear),
            onList: mediaOnListValue
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
        guard genreCollection != nil else { return [] }
        if filterGenreTagText.isEmpty {
            return genreCollection!
        } else {
            return genreCollection!.filter { $0.id.lowercased().contains(filterGenreTagText.lowercased()) }
        }
    }
    var filteredTags: [Genre] {
        guard tagCollection != nil else { return [] }
        if filterGenreTagText.isEmpty {
            return tagCollection!
        } else {
            return tagCollection!.filter { $0.id.lowercased().contains(filterGenreTagText.lowercased()) }
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
