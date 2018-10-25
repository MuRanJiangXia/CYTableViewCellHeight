//
//  ViewController.swift
//  CYTableViewCellHeight
//
//  Created by cyan on 2018/10/25.
//  Copyright © 2018年 cyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var cells: Array<CYListModel> = []//cellmodel 数组
    var heightDic: Dictionary<IndexPath, Any> = [:]//缓存高度
    
    lazy var homeTable: UITableView? = {
        //        114
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.register(CYListTableViewCell.self, forCellReuseIdentifier: "CYListTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.homeTable!)
        
        loadData()
        
    }
    
    func loadData() {
        let string =
                "桃花飞绿水 一庭芳草围新绿 有情芍药含春泪 " +
                "野竹上青霄 十亩藤花落古香 无力蔷薇卧晓枝 " +
                "我愿暂求造化力 减却牡丹妖艳色 " +
                "花非花 梦非梦 花如梦 梦似花 梦里有花 花开如梦 " +
                "心非心 镜非镜 心如镜 镜似心 镜中有心 心如明镜 "
        
        for i in 0..<100 {
            let model = CYListModel()
            let index = Int(arc4random()%8)
//            model.content =  (string as NSString).substring(to: max(20, index))
            model.content = string
            
            cells.append(model)
        }

        self.homeTable?.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CYListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CYListTableViewCell", for: indexPath) as! CYListTableViewCell
        cell.configWithModel(cells[indexPath.row], indexRow: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.heightDic[indexPath] as? NSNumber
        if height != nil {
            return CGFloat(height!.floatValue)
        }else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let height = NSNumber(value: Float(cell.frame.size.height))
        self.heightDic[indexPath] = height
        
    }


    
}

