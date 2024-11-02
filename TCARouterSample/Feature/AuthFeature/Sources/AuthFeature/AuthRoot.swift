//
//  AuthRoot.swift
//
//
//  Created by sfurukawa on 2024/11/17.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct AuthRoot {
    public init() {}

    @ObservableState
    public struct State: Equatable {
        public init() {}
    }

    public enum Action {
        case delegate(Delegate)
        
        public enum Delegate: Equatable {
            case toSetupButtonTapped
            case toMainTabButtonTapped
        }
    }

    public var body: some Reducer<State, Action> {
        Reduce { _, action in
            switch action {
            case .delegate(.toSetupButtonTapped):
                return .none
            case .delegate(.toMainTabButtonTapped):
                return .none
            }
        }
    }
}
