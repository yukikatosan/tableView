//
//  ViewController.swift
//  tableView
//
//  Created by teraoka on 2020/02/10.
//  Copyright © 2020 yukikato. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    var tableView: UITableView!
    let textArray: [String] =
        ["First Cell",
         "Second Cell",
         "Third Cell",
         "Fourth Cell",
         "Laaaaaaaaaaaaaaaaast Ceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeell!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        self.view.addSubview(tableView)
       
        
        
        
        
    }

    //セクション内のセル数を設定 ※必須
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
       }
    
    //セルの生成 ※必須
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "test")
        cell.textLabel?.text = "セクション番号: \(indexPath.row)"
        cell.detailTextLabel?.text = textArray[indexPath.row]
        cell.detailTextLabel?.numberOfLines = 0
        //cell.imageView?.image = UIImage(named: "")
        return cell
       }
    /*
    //セルの高さを設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    */
    
    //セクションのタイトルを設定
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "第\(section + 1)セクション"
    }
    
    //セクション数を設定
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //セクションの高さを設定
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return CGFloat(50)
    }
   
    
    //セル選択時のイベント
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("第\(indexPath.section)セクションの\(indexPath.row)番セルが選択されました")
    }
    
   
}

/*
 1. デリゲートメソッドを2個記述
 2. TableViewのインスタンスを作成 var tableView: UITableView!
 3. デリゲートを設定 tableView.delegate = self , tableView.datasource = self
 4. テーブルや中に配置するメソッドを定義する各種メソッドを定義
    必須のデリゲートが2つある
    他のメソッドは記述しなければデフォルト値が使われる
 
 -----------
 
 ○ 境界線を指定
 tableView.separatorStyle = .none
 tableView.separatorColor = UIColor.red
 
 ○ TableViewをリロードするメソッド
 tableView.reloadData()
 テーブル内のどこかを編集した後などにこのメソッドを呼んでテーブルの再描画をしてもらう
 
 ○ 一律でテーブルのセルの高さを自動調整する方法
 セル内のUILabelの文字数が多かった場合に備えて
 tableView.estimatedRowHeight = 100
 tableView.rowHeight = UITableView.automaticDimension
 
 1行目は推定のセルの高さをあらかじめ指定しておくことでTableViewのロード時間が早くなるのでいいとされている
 テーブルの高さが可変の場合は高さを計算するのに時間がかかるので、ここで推定高さを指定するといい
 そしてセルの中のUILabelについても行数を可変にする処理を入れる
 
 cell.detailTextLabel?.numberOfLines = 0
 cell.detailTextLabel?.text =　"aaaaaaaaaaaaaaaaaaaaaaaaaaaa"
 
 セルを生成するときに中に表示する詳細のラベルの行数を無制限(0)にしておいて、textプロパティに文字列を代入する
 
 ○ tableViewメソッドが呼ばれるタイミング
 self.view.addSubView(tableView)や
 tableView.reloadData()が
 実行された後
 
 numbersOfSectionsメソッドが呼ばれてセクション数を指定して
 ↓
 tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)が呼ばれてセル数を指定して
 ↓
 tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCellが呼ばれて
 すべての行数(すべてのindexPath.sectionのindexPath.rowの数)だけ呼ばれる
 行数が3個あれば3回呼ばれる
 
 ※ 注意点
 ・UITabeleViewCellのstyleがdefaultのままだとdetailTextLabelが表示されない
 
 */
