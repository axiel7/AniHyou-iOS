//
//  ModelUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 04/10/2022.
//

import Foundation
import API

var MediaListStatusAllCases: [MediaListStatus] {
    return [MediaListStatus.current, MediaListStatus.planning, MediaListStatus.completed, MediaListStatus.dropped, MediaListStatus.paused, MediaListStatus.repeating]
}

