// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import SwiftUI

public struct MessageRootView: View {
    var store: StoreOf<MessageRoot>

    public init(store: StoreOf<MessageRoot>) {
        self.store = store
    }

    public var body: some View {
        Text("MessageRootView")
    }
}

#Preview {
    MessageRootView(
        store: StoreOf<MessageRoot>(initialState: MessageRoot.State()) {
            MessageRoot()
        }
    )
}
