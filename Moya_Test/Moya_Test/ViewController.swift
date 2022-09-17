//
//  ViewController.swift
//  Moya_Test
//
//  Created by 김상금 on 2022/09/17.
//

import UIKit
import Moya

class ViewController: UIViewController {
    @IBOutlet weak var jokeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let provider = MoyaProvider<JokeAPI>()
        provider.request(.randomJokes("GilDong", "Hong")) { (result) in
            switch result {
            case let .success(response):
                let result = try? response.map(Joke.self)
                self.jokeTextView.text = result?.value.joke
            case let .failure(error):
                print("ㅋㅋ 실패 ㅋ")
                print(error.localizedDescription)
            }
        }
    }


}

