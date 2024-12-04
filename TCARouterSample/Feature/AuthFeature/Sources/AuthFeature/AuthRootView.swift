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
        ZStack(alignment: .topLeading) {
            VStack {
                Button("Go to Setup") {
                    store.send(.delegate(.toSetupButtonTapped))
                }
                Button("Go to MainTab") {
                    store.send(.delegate(.toMainTabButtonTapped))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // 左上に表示する番号とタイトル
            Text("1. AuthRootView")
                .font(.largeTitle)
                .foregroundColor(.red)
                .padding(.leading, 10)
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
