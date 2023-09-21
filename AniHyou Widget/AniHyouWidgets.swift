//
//  AniHyouWidgets.swift
//  AniHyou Widgets
//
//  Created by Axel Lopez on 01/05/2023.
//

import WidgetKit
import SwiftUI

@main
struct AniHyouWidgets {
    static func main() {
        if #available(iOSApplicationExtension 17.0, *) {
            AniHyouWidgets17.main()
        } else {
            AniHyouWidgets16.main()
        }
    }
}

struct AniHyouWidgets16: WidgetBundle {
    var body: some Widget {
        AiringWidget()
    }
}

@available(iOSApplicationExtension 17.0, *)
struct AniHyouWidgets17: WidgetBundle {
    var body: some Widget {
        AiringWidget()
        AnimeBehindWidget()
        MediaListWidget()
    }
}
