//
//  ObservableScrollView.swift
//  AniHyou
//
//  Created by Axel Lopez on 29/05/2023.
//

import SwiftUI

private let namespace = "scrollView"

// A ScrollView wrapper that tracks scroll offset changes.
struct ScrollViewWithOffset<Content>: View where Content: View {
    
    private let axes: Axis.Set
    private let showsIndicators: Bool
    private let onScroll: ScrollAction
    private let content: () -> Content

    public init(
        _ axes: Axis.Set = .vertical,
        showsIndicators: Bool = true,
        onScroll: ScrollAction? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.onScroll = onScroll ?? { _ in }
        self.content = content
    }
    
    public typealias ScrollAction = (_ offset: CGPoint) -> Void

    public var body: some View {
        ScrollView(axes, showsIndicators: showsIndicators) {
            content()
                .background(GeometryReader { proxy -> Color in
                    DispatchQueue.main.async {
                        onScroll(proxy.frame(in: .named(namespace)).origin)
                    }
                    return Color.clear
                })
        }
        .coordinateSpace(.named(namespace))
    }
}
