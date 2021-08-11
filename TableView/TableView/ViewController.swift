//
//  ViewController.swift
//  TableView
//
//  Created by DGSW on 2021/08/11.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //몇개?  숫자
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //무엇?  반복 10번?
        //2가지!
        
        //1번 방법 - 임의의 셀 만들기
        //2번 방법 - 스토리보드 + id -> 실전
        
//        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
//        cell.textLabel?.text = "\(indexPath.row)"
        
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        //as? as! - 부모, 자식 친자확인.
        
        cell.LabelText.text = "\(indexPath.row)"
        return cell
    }
    
    //클릭
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
    }


    //TableView 테이블로 된 뷰 - 여러개의 행이 모여있는 목록 뷰(화면)
    //목적 1.  정갈하게 보여줄려고~ ex) 전화번호부
    
    //1. 데이터 무엇? - 전화번호부
    //2. 데이커 개수? - 100, 10000
    //3.(옵션) 데이터 행 눌렀다! - 클릭
    
}

