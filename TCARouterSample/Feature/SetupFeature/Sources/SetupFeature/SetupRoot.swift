//
//  SetupRoot.swift
//
//
//  Created by sfurukawa on 2024/11/17.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct SetupRoot {
    public init() {}

    @ObservableState
    public struct State: Equatable {
        public init() {}
    }

    public enum Action {
        case delegate(Delegate)
        
        public enum Delegate: Equatable {
            case toMainTabButtonTapped
        }
    }

    public var body: some Reducer<State, Action> {
        Reduce { _, action in
            switch action {
            case .delegate(.toMainTabButtonTapped):
                return .none
            }
        }
    }
}
