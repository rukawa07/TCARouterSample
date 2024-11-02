// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import ComposableArchitecture

public struct NotificationRootView: View {
    var store: StoreOf<NotificationRoot>

    public init(store: StoreOf<NotificationRoot>) {
        self.store = store
    }

    public var body: some View {
        Text("NotificationRootView")
    }
}

#Preview {
    NotificationRootView(
        store: StoreOf<NotificationRoot>(initialState: NotificationRoot.State()) {
            NotificationRoot()
        }
    )
}
