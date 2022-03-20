//
//  SignInViewController.swift
//  SignInUpEx
//
//  Created by 김상금 on 2022/03/20.
//

import UIKit
import PinLayout
import FlexLayout
import ReactorKit
import RxSwift
import Then

class SignInViewController: UIViewController, View {
    var disposeBag = DisposeBag()
    
    typealias Reactor = SignInReactor
    
    // MARK: - Properties
    private let rootContainer = UIView()
    private let titleLabel = UILabel().then {
        $0.text = "로그인"
        $0.numberOfLines = 1
        $0.font = .systemFont(ofSize: 35, weight: .bold)
        $0.textAlignment = .center
    }
    private let idTextField = UITextField().then {
        $0.placeholder = "아이디를 입력하세요."
        $0.autocapitalizationType = .none
        $0.layer.cornerRadius = 5
        $0.font = .systemFont(ofSize: 16)
    }
    private let pwTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력하세요."
        $0.autocapitalizationType = .none
        $0.layer.cornerRadius = 5
        $0.font = .systemFont(ofSize: 16)
    }
    private let SignInButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 5
    }
    private let Button = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.backgroundColor = .none
    }
    
    // MARK: - UI
    private func setUp() {
        view.addSubview(rootContainer)
    }
    private func setLayoutSubViews() {
        rootContainer.pin.all(view.pin.safeArea)
        rootContainer.flex.layout()
    }
    private func setLayout() {
        rootContainer.flex.define { flex in
            
        }
    }


    func bind(reactor: SignInReactor) {
        
    }

}

