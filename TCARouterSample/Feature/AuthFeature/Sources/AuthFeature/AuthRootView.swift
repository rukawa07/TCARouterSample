// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import SwiftUI

public struct AuthRootView: View {
    @Bindable var store: StoreOf<AuthRoot>

    public init(store: StoreOf<AuthRoot>) {
        self.store = store
    }

    public var body: some View {
        VStack {
            Button("Go to Setup") {
                store.send(.delegate(.toSetupButtonTapped))
            }
            Button("Go to MainTab") {
                store.send(.delegate(.toMainTabButtonTapped))
            }
        }
    }
}

#Preview {
    AuthRootView(
        store: StoreOf<AuthRoot>(initialState: AuthRoot.State()) {
            AuthRoot()
        }
    )
}
