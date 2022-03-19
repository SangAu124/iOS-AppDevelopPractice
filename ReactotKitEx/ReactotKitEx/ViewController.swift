//
//  ViewController.swift
//  ReactotKitEx
//
//  Created by 김상금 on 2022/03/19.
//

import UIKit
import ReactorKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController, StoryboardView {
    
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var increaseButton: UIButton!
    @IBOutlet var decreaseButton: UIButton!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    var disposeBag = DisposeBag()
    
    func bind(reactor: CounterViewReactor) {
        // Action
        increaseButton.rx.tap
            .map { Reactor.Action.increase }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        decreaseButton.rx.tap
            .map { Reactor.Action.decrease }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // State
        
        reactor.state
            .map { $0.value }
            .distinctUntilChanged()
            .map { "\($0)" }
            .bind(to: valueLabel.rx.text)
            .disposed(by: disposeBag)
        
    }

}

