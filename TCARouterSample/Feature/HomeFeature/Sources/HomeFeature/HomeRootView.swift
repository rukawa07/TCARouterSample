// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import ComposableArchitecture

public struct HomeRootView: View {
    @Bindable var store: StoreOf<HomeRoot>

    public init(store: StoreOf<HomeRoot>) {
        self.store = store
    }

    public var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            VStack {
                Text("HomeRootView")
                Button("Go to Child") {
                    store.send(.toChild)
                }
                Button("Back to First View") {
                    store.send(.delegate(.backToFirstView))
                }
            }
        } destination: { store in
            switch store.case {
            case .child(let store):
                HomeChildView(store: store)
            }
        }
    }
}

#Preview {
    HomeRootView(
        store: StoreOf<HomeRoot>(initialState: HomeRoot.State()) {
            HomeRoot()
        }
    )
}
