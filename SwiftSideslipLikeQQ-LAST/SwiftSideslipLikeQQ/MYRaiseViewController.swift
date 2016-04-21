//
//  MYRaiseViewController.swift
//  Graceful
//
//  Created by MacBook on 16/4/16.
//  Copyright © 2016年 com.lvwenhan. All rights reserved.
//

import Foundation
import UIKit
class MYRaiseViewController:UIViewController,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var RaiseTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var ctrls:[String]=["lable","gaga","button2","Button","sdfdsfd","fsghgfh"]
    var ctrlsel:[String]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ctrlsel=self.ctrls
        self.RaiseTableView.sizeToFit()
        self.searchBar.frame=CGRectMake(0, 0, 0, 44)
        self.searchBar.sizeToFit()
        self.searchBar.backgroundColor=UIColor.orangeColor()
         self.searchBar.placeholder="兴趣搜索"
        self.searchBar.delegate=self
        self.RaiseTableView.delegate=self
        self.RaiseTableView.dataSource=self
        //注册cell
        self.RaiseTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlsel.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identify:String="cell"
        let cell=tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath) as UITableViewCell
        //设置cell样式
        //cell.sizeToFit()
        cell.frame=self.RaiseTableView.frame
        cell.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text=self.ctrlsel[indexPath.row]
        let lable:UILabel?=UILabel.init()
        lable?.text="sfds"
        lable?.sizeToFit()
        cell.addSubview(lable!)
        
        return cell
    }
    //tableview高度设置
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row==0{
            return 100
        }else{
            return 80
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText == ""{
            self.ctrlsel=self.ctrls
        }else{
            self.ctrlsel=[]
            for ctrl in self.ctrls{
                if ctrl.lowercaseString.hasPrefix(searchText.lowercaseString){
                    self.ctrlsel.append(ctrl)
                }
            }
        }
        self.RaiseTableView.reloadData()
    }
}