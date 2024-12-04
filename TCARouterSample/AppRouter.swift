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
        case setup(SetupRoot)
        case mainTab(MainTabRouter)
    }

    @ObservableState
    struct State: Equatable {
        var auth = AuthRoot.State() // 初期画面のState
        @Presents var destination: Destination.State? // 後続画面のState
    }
    
    enum Action {
        case auth(AuthRoot.Action) // 初期画面のAction
        case destination(PresentationAction<Destination.Action>) // 後続画面のAction
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .auth(.delegate(.toSetupButtonTapped)):
                // Auth画面からSetup画面へ遷移
                state.destination = .setup(SetupRoot.State())
                return .none
            case .auth(.delegate(.toMainTabButtonTapped)):
                // Auth画面からMainTab画面へ遷移
                state.destination = .mainTab(MainTabRouter.State())
                return .none
            case .destination(.presented(.setup(.delegate(.toMainTabButtonTapped)))):
                // Setup画面からMainTab画面へ遷移
                state.destination = .mainTab(MainTabRouter.State())
                return .none
            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }
}
extension AppRouter.Destination.State: Equatable {}
