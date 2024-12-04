//
//  HomeRouterView.swift
//  TCARouterSample
//
//  Created by sfurukawa on 2024/12/01.
//

import SwiftUI
import ComposableArchitecture
import HomeFeature
import SearchFeature
import CommunityFeature
import NotificationFeature
import MessageFeature

struct MainTabRouterView: View {
    @Bindable var store = StoreOf<MainTabRouter>(initialState: MainTabRouter.State()) {
        MainTabRouter()
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            TabView(selection: $store.selectedTab.sending(\.selectedTabChanged)) {
                HomeRootView(store: store.scope(state: \.home, action: \.home))
                    .tabItem {
                        Label("", systemImage: "house")
                    }
                    .tag(Tab.home)

                SearchRootView(store: store.scope(state: \.search, action: \.search))
                   .tabItem {
                       Label("", systemImage: "magnifyingglass")
                   }
                   .tag(Tab.search)

                CommunityRootView(store: store.scope(state: \.community, action: \.community))
                   .tabItem {
                       Label("", systemImage: "person.2")
                   }
                   .tag(Tab.community)

                NotificationRootView(store: store.scope(state: \.notification, action: \.notification))
                   .tabItem {
                       Label("", systemImage: "bell")
                   }
                   .tag(Tab.notification)

                MessageRootView(store: store.scope(state: \.message, action: \.message))
                   .tabItem {
                       Label("", systemImage: "envelope")
                   }
                   .tag(Tab.message)
            }

            // 左上に表示する番号とタイトル
            Text("3. MainTabRouterView")
                .font(.largeTitle)
                .foregroundColor(.green)
                .padding(EdgeInsets(top: 30, leading: 10, bottom: 0, trailing: 0))
        }
    }
}

#Preview {
    MainTabRouterView()
}
