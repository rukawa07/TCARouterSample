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
        ZStack(alignment: .topLeading) {
            VStack {
                Button("Go to MainTab") {
                    store.send(.delegate(.toMainTabButtonTapped))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // 左上に表示する番号とタイトル
            Text("2. SetupRootView")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding(.leading, 10)
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
