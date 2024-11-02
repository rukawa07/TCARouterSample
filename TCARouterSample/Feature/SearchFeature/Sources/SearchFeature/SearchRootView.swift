// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import ComposableArchitecture

public struct SearchRootView: View {
    var store: StoreOf<SearchRoot>

    public init(store: StoreOf<SearchRoot>) {
        self.store = store
    }

    public var body: some View {
        Text("SearchRootView")
    }
}

#Preview {
    SearchRootView(
        store: StoreOf<SearchRoot>(initialState: SearchRoot.State()) {
            SearchRoot()
        }
    )
}
