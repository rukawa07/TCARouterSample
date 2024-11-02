//
//  SwiftUIView.swift
//  HomeFeature
//
//  Created by sfurukawa on 2024/12/01.
//

import SwiftUI
import ComposableArchitecture

public struct HomeChildView: View {
    var store: StoreOf<HomeChild>

    public init(store: StoreOf<HomeChild>) {
        self.store = store
    }

    public var body: some View {
        VStack {
            Text("HomeChildView")
            Button("Go to Next Child") {
                store.send(.delegate(.nextChildButtonTapped))
            }
        }
    }
}

#Preview {
    HomeChildView(
        store: StoreOf<HomeChild>(initialState: HomeChild.State()) {
            HomeChild()
        }
    )
}
