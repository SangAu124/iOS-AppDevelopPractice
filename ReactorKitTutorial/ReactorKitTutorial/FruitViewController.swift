//
//  FruitViewController.swift
//  ReactorKitTutorial
//
//  Created by 김상금 on 2022/03/06.
//

import UIKit
import Then
import ReactorKit
import RxCocoa

class FruitViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var appleButton = UIButton(type: UIButton.ButtonType.system).then {
        $0.setTitle("사과", for: UIControl.State.normal)
    }
    private lazy var bananaButton = UIButton(type: UIButton.ButtonType.system).then {
        $0.setTitle("바나나", for: UIControl.State.normal)
    }
    private lazy var grapesButton = UIButton(type: UIButton.ButtonType.system).then {
        $0.setTitle("포도", for: UIControl.State.normal)
    }
    private lazy var selectedLabel = UILabel().then {
        $0.text = "선택되어진 과일 없음"
    }
    private lazy var stack = UIStackView(arrangedSubviews: [appleButton, bananaButton, grapesButton, selectedLabel]).then {
        $0.axis = .vertical
        $0.spacing = 20
    }
    
    // MARK: - Binding Properties
    let disposeBag = DisposeBag()
    let fruitReact = FruitReactor()
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind(reactor: fruitReact)
    }
    
    // MARK: - Configures
    func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    // MARK: - Helpers
    func bind(reactor: FruitReactor) {
        appleButton.rx.tap
            .map { FruitReactor.Action.apple }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        bananaButton.rx.tap
            .map { FruitReactor.Action.banana }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        grapesButton.rx.tap
            .map { FruitReactor.Action.grapes }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        reactor.state
            .map { $0.fruitName }
            .distinctUntilChanged()
            .map{ $0 }
            .subscribe(onNext: { val in
                self.selectedLabel.text = val
            })
            .disposed(by: disposeBag)
        reactor.state
            .map { $0.isLoading }
            .distinctUntilChanged()
            .map { $0 }
            .subscribe(onNext: { val in
                if val == true {
                    self.selectedLabel.text = "로딩중입니다"
                }
            })
            .disposed(by: disposeBag)
    }
}
