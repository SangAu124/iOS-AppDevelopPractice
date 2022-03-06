//
//  FruitReactor.swift
//  ReactorKitTutorial
//
//  Created by 김상금 on 2022/03/06.
//

import Foundation
import ReactorKit

class FruitReactor: Reactor {
    // MARK: - Actions
    enum Action  {
        case apple
        case banana
        case grapes
    }
    
    // MARK: - State
    struct State {
        var fruitName: String
        var isLoading: Bool
    }
    
    // MARK: -  Mutations
    enum Mutation {
        case changeLabelApple
        case changeLabelBanana
        case changeLabelGrapes
        case setLoading(Bool)
    }
    
    let initialState: State
    
    init() {
        self.initialState = State(fruitName: "선택되어진 과일 없음", isLoading: false)
    }
    
    // MARK: - Action -> Mutation
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .apple:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                Observable.just(Mutation.changeLabelApple).delay(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance),
                Observable.just(Mutation.setLoading(false))
            ])
        case .banana:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                Observable.just(Mutation.changeLabelBanana).delay(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance),
                Observable.just(Mutation.setLoading(false))
            ])
        case .grapes:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                Observable.just(Mutation.changeLabelGrapes).delay(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance),
                Observable.just(Mutation.setLoading(false))
            ])
        }
    }
    
    // MARK: - Mutation -> State
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .changeLabelApple:
            state.fruitName = "사과"
        case .changeLabelBanana:
            state.fruitName = "바나나"
        case .changeLabelGrapes:
            state.fruitName = "포도"
        case .setLoading(let val):
            state.isLoading = val
        }
        return state
    }
    
}
