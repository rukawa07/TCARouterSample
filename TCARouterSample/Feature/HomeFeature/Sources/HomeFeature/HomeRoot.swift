//
//  HomeRoot.swift
//
//
//  Created by sfurukawa on 2024/11/17.
//

import ComposableArchitecture

@Reducer
public struct HomeRoot {
    public init() {}

    @Reducer
    public enum Path {
        case child(HomeChild)
    }

    @ObservableState
    public struct State: Equatable {
        public init() {}
        var path = StackState<Path.State>()
    }

    public enum Action {
        case path(StackActionOf<Path>)  // Child reducerのアクションを検知するためのアクション
        case toChild
        case delegate(Delegate)
        
        public enum Delegate {
            case backToFirstView
        }
    }

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .path(.element(id: _, action: .child(.delegate(.nextChildButtonTapped)))):
                state.path.append(.child(HomeChild.State()))
                return .none
            case .path:
                return .none
            case .toChild:
                state.path.append(.child(HomeChild.State()))
                return .none
            case .delegate(.backToFirstView):
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}
extension HomeRoot.Path.State: Equatable {}
