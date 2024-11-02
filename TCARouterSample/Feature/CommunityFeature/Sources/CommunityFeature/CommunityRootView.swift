// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import ComposableArchitecture

public struct CommunityRootView: View {
    var store: StoreOf<CommunityRoot>

    public init(store: StoreOf<CommunityRoot>) {
        self.store = store
    }

    public var body: some View {
        Text("CommunityRootView")
    }
}

#Preview {
    CommunityRootView(
        store: StoreOf<CommunityRoot>(initialState: CommunityRoot.State()) {
            CommunityRoot()
        }
    )
}
