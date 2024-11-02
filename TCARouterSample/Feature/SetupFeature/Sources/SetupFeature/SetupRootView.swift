// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import SwiftUI

public struct SetupRootView: View {
    @Bindable var store: StoreOf<SetupRoot>

    public init(store: StoreOf<SetupRoot>) {
        self.store = store
    }

    public var body: some View {
        VStack {
            Button("Go to MainTab") {
                store.send(.delegate(.toMainTabButtonTapped))
            }
        }
    }
}

#Preview {
    SetupRootView(
        store: StoreOf<SetupRoot>(initialState: SetupRoot.State()) {
            SetupRoot()
        }
    )
}
