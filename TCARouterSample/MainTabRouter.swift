//
//  HomeRouter.swift
//  TCARouterSample
//
//  Created by sfurukawa on 2024/12/01.
//

import CommunityFeature
import ComposableArchitecture
import Foundation
import HomeFeature
import MessageFeature
import NotificationFeature
import SearchFeature

typealias Tab = MainTabRouter.State.Tab

@Reducer
struct MainTabRouter {
    @ObservableState
    struct State: Equatable {
        public init() {}

        var home = HomeRoot.State()
        var search = SearchRoot.State()
        var community = CommunityRoot.State()
        var notification = NotificationRoot.State()
        var message = MessageRoot.State()
        var selectedTab = Tab.home
        enum Tab: Equatable {
            case home
            case search
            case community
            case notification
            case message
        }
    }

    enum Action {
        case home(HomeRoot.Action)
        case search(SearchRoot.Action)
        case community(CommunityRoot.Action)
        case notification(NotificationRoot.Action)
        case message(MessageRoot.Action)
        case selectedTabChanged(State.Tab) // タブ切り替え用アクション
        case delegate(Delegate)

        public enum Delegate {
            case backToFirstView
        }
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .home(.delegate(.backToFirstView)):
                return .send(.delegate(.backToFirstView))
            case .home:
                return .none
            case .search:
                return .none
            case .community:
                return .none
            case .notification:
                return .none
            case .message:
                return .none
            case let .selectedTabChanged(nextTab):
                // 現在表示しているタブと同じ場合
                if nextTab == state.selectedTab {
                    if case .home = nextTab {
                        // 状態を初期化(NavigationStackを空にする)
                        state.home = HomeRoot.State()
                    }
                }
                state.selectedTab = nextTab
                return .none
            case .delegate(.backToFirstView):
                return .none
            }
        }
        Scope(state: \.home, action: \.home) {
            HomeRoot()
        }
        Scope(state: \.search, action: \.search) {
            SearchRoot()
        }
        Scope(state: \.community, action: \.community) {
            CommunityRoot()
        }
        Scope(state: \.notification, action: \.notification) {
            NotificationRoot()
        }
        Scope(state: \.message, action: \.message) {
            MessageRoot()
        }
    }
}
