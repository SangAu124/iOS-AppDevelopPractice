//
//  MainReactor.swift
//  ReactotKitEx
//
//  Created by 김상금 on 2022/03/19.
//

import Foundation
import ReactorKit
import RxSwift

final class CounterViewReactor: Reactor {
    enum Action {
        case increase
        case decrease
    }
    enum Mutation {
        case increaseValue
        case decreaseValue
    }
    struct State {
        var value: Int = 0
    }
    
    let initialState: State = State()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .increase:
            return Observable.just(Mutation.increaseValue)
            
        case .decrease:
            return Observable.just(Mutation.decreaseValue)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .increaseValue:
            newState.value += 1
        case .decreaseValue:
            newState.value -= 1
        }
        return newState
    }
}
 






