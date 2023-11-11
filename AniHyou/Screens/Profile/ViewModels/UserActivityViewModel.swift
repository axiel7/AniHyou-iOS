//
//  UserActivityViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import Foundation
import AniListAPI

class UserActivityViewModel: ObservableObject {

    var currentPage = 1
    var hasNextPage = true

    @Published var activities = [UserActivityQuery.Data.Page.Activity?]()

    func getUserActivity(userId: Int) {
        Network.shared.apollo.fetch(query: UserActivityQuery(
            page: .some(currentPage),
            perPage: .some(20),
            userId: .some(userId),
            sort: .some([.case(.idDesc)])
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let data = page.activities {
                        self?.activities.append(contentsOf: data)
                        self?.currentPage += 1
                        self?.hasNextPage = page.pageInfo?.hasNextPage ?? false
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension UserActivityQuery.Data.Page.Activity {
    var id: Int {
        if let list = asListActivity {
            return list.id
        } else if let text = asTextActivity {
            return text.id
        } else if let message = asMessageActivity {
            return message.id
        } else {
            return 0
        }
    }
}
