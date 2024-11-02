//
//  NotificationRoot.swift
//  NotificationFeature
//
//  Created by sfurukawa on 2024/12/01.
//

import ComposableArchitecture

@Reducer
public struct NotificationRoot {
    public init() {}

    @ObservableState
    public struct State: Equatable {
        public init() {}
    }

    public enum Action {}

    public var body: some Reducer<State, Action> {
        Reduce { _, _ in
            return .none
        }
    }
}
