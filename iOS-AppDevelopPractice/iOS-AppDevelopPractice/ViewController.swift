//
//  ViewController.swift
//  iOS-AppDevelopPractice
//
//  Created by DGSW on 2021/08/03.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func Click_MoveBtn(_ sender: Any) {
        
        // storyboard find controller: DetailController
        
        //nil (null) o, x
        //옵셔널 바인딩
        if let DetailController = self.storyboard?.instantiateViewController(identifier: "DetailController"){
            // move controller -> push, add(?) controller = navi
            self.navigationController?.pushViewController(DetailController, animated: true)
        }
        
        //move controller
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

