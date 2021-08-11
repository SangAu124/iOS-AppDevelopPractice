//
//  ViewController.swift
//  TableView
//
//  Created by DGSW on 2021/08/11.
//

import UIKit

//1. http 통신 방법 - urlsession
//2. JSON 데이터 형태 - {"키(key)": 값(value)} - 뉴스
//3. 테이블뷰의 데이터 매칭!!

//  {
//      [
//          ""키(key)": 값(value)",
//          ""키(key)": 값(value)",
//          ""키(key)": 값(value)"
//      ]
//  }

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    var newsData: Array<Dictionary<String, Any>>?
    
    func getNews(){
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=072f95fb106742f8b116b2ca59a4763f")!) { (data, response, error) in
            
            if let dataJson = data{
                //Json Pasing
                do {
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    print(json)
                    //Dictionary
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
                    print(articles )
                    self.newsData = articles
//                   for(idx, value) in articles.enumerated() {
//                        if let v = value as? Dictionary<String, Any>{
//                            print("\(v["title"])")
//                            v["description"]
//                        }
//                    }
                }
                catch {}
            }
        }
        task.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        cell.LabelText.text = "\(indexPath.row)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
        getNews()
    }}

