//
//  AppRouter.swift
//  TCARouterSample
//
//  Created by sfurukawa on 2024/11/14.
//

import SwiftUI
import AuthFeature
import SetupFeature
import HomeFeature
import ComposableArchitecture

@Reducer
struct AppRouter {
    @Reducer
    enum Destination {
        case auth(AuthRoot)
        case setup(SetupRoot)
        case mainTab(MainTabRouter)
    }

    @ObservableState
    struct State: Equatable {
        // 初期画面のStateをdestinationの初期値にする
        @Presents var destination: Destination.State? = .auth(AuthRoot.State())
    }
    
    enum Action {
        case destination(PresentationAction<Destination.Action>) // 後続画面のAction
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .destination(.presented(.auth(.delegate(.toSetupButtonTapped)))):
                // Auth画面からSetup画面へ遷移
                state.destination = .setup(SetupRoot.State())
                return .none
            case .destination(.presented(.auth(.delegate(.toMainTabButtonTapped)))):
                // Auth画面からMainTab画面へ遷移
                state.destination = .mainTab(MainTabRouter.State())
                return .none
            case .destination(.presented(.setup(.delegate(.toMainTabButtonTapped)))):
                // Setup画面からMainTab画面へ遷移
                state.destination = .mainTab(MainTabRouter.State())
                return .none
            case .destination(.presented(.mainTab(.delegate(.backToFirstView)))):
                // MainTab画面から初期画面(Auth画面)へ遷移
                state.destination = .auth(AuthRoot.State())
                return .none
            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }
}
extension AppRouter.Destination.State: Equatable {}
