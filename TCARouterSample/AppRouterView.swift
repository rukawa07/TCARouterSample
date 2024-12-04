//
//  ContentView.swift
//  TCARouterSample
//
//  Created by sfurukawa on 2024/11/02.
//

import AuthFeature
import ComposableArchitecture
import SetupFeature
import SwiftUI

struct AppRouterView: View {
    @Bindable var store = StoreOf<AppRouter>(initialState: AppRouter.State()) {
        AppRouter()
            ._printChanges()
    }

    var body: some View {
        switch store.destination {
        case .none:
            // 初期画面
            AuthRootView(store: store.scope(state: \.auth, action: \.auth))
        case .setup:
            if let store = store.scope(state: \.destination?.setup, action: \.destination.setup) {
                // セットアップ画面
                SetupRootView(store: store)
            }
        case .mainTab:
            if let store = store.scope(state: \.destination?.mainTab, action: \.destination.mainTab) {
                // メインタブ画面
                MainTabRouterView(store: store)
            }
        }
    }
}

#Preview {
    AppRouterView()
}
