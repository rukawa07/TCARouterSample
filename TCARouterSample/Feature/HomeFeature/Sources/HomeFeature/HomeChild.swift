//
//  File.swift
//  HomeFeature
//
//  Created by sfurukawa on 2024/12/01.
//

import ComposableArchitecture

@Reducer
public struct HomeChild {
    public init() {}

    @ObservableState
    public struct State: Equatable {
        public init() {}
    }

    public enum Action {
        case delegate(Delegate)
        
        public enum Delegate {
            case nextChildButtonTapped
        }
    }

    public var body: some Reducer<State, Action> {
        Reduce { _, action in
            switch action {
            case .delegate(.nextChildButtonTapped):
                return .none
            }
        }
    }
}
