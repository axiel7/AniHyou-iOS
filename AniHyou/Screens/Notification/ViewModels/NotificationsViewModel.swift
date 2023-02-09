//
//  NotificationsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 23/7/22.
//

import Foundation

class NotificationsViewModel: ObservableObject {
    
    @Published var notifications = [GenericNotification]()
    var currentPage = 1
    var hasNextPage = true
    
    func getNotifications() {
        Network.shared.apollo.fetch(query: NotificationsQuery(page: .some(currentPage), perPage: .some(20))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let notifications = page.notifications {
                        var tempList = [GenericNotification]()
                        notifications.forEach {
                            if let noti = $0?.asAiringNotification {
                                let text = "\(noti.contexts?[safe: 0] ?? "")\(noti.episode)\(noti.contexts?[safe: 1] ?? "")\(noti.media?.title?.userPreferred ?? "")\(noti.contexts?[safe: 2] ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.media?.coverImage?.medium, contentId: noti.animeId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asFollowingNotification {
                                let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.user?.avatar?.medium, contentId: noti.userId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asActivityMessageNotification {
                                let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.user?.avatar?.medium, contentId: noti.activityId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asActivityMentionNotification {
                                let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.user?.avatar?.medium, contentId: noti.activityId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asActivityReplyNotification {
                                let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.user?.avatar?.medium, contentId: noti.activityId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asActivityReplySubscribedNotification {
                                let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.user?.avatar?.medium, contentId: noti.activityId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asActivityLikeNotification {
                                let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.user?.avatar?.medium, contentId: noti.activityId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asActivityReplyLikeNotification {
                                let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.user?.avatar?.medium, contentId: noti.activityId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asThreadCommentMentionNotification {
                                let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.user?.avatar?.medium, contentId: noti.commentId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asThreadCommentReplyNotification {
                                let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.user?.avatar?.medium, contentId: noti.commentId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asThreadCommentSubscribedNotification {
                                let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.user?.avatar?.medium, contentId: noti.commentId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asThreadCommentLikeNotification {
                                let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.user?.avatar?.medium, contentId: noti.commentId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asThreadLikeNotification {
                                let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.user?.avatar?.medium, contentId: noti.threadId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asRelatedMediaAdditionNotification {
                                let text = "\(noti.media?.title?.userPreferred ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.media?.coverImage?.medium, contentId: noti.mediaId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asMediaDataChangeNotification {
                                let text = "\(noti.media?.title?.userPreferred ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.media?.coverImage?.medium, contentId: noti.mediaId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asMediaMergeNotification {
                                let text = "\(noti.media?.title?.userPreferred ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: noti.media?.coverImage?.medium, contentId: noti.mediaId, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                            else if let noti = $0?.asMediaDeletionNotification {
                                let text = "\(noti.deletedMediaTitle ?? "")\(noti.context ?? "")"
                                tempList.append(GenericNotification(id: noti.id, text: text, imageUrl: nil, contentId: 0, type: noti.type!.value!, createdAt: noti.createdAt ?? 0))
                            }
                        }
                        
                        tempList.sort(by: { a, b in a.createdAt > b.createdAt })
                        
                        self?.notifications.append(contentsOf: tempList)
                    }
                    self?.currentPage += 1
                    self?.hasNextPage = page.pageInfo?.hasNextPage ?? false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
