//
//  RightViewController.swift
//  Graceful
//
//  Created by MacBook on 16/4/10.
//  Copyright © 2016年 com.lvwenhan. All rights reserved.
//

import UIKit
class RightViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let filterTitle=["全部","时间间隔","范围","热度"]
   
    @IBOutlet weak var heightLayoutConstraintOfSettingTableView: NSLayoutConstraint!
    @IBOutlet weak var settingRightTable: UITableView!
    var thisMoth:UIButton!
    var thisWeek:UIButton!
    var inThreeDay:UIButton!
    override func viewDidLoad() {
        settingRightTable.delegate = self
        settingRightTable.dataSource = self
        settingRightTable.tableFooterView = UIView()
  
        heightLayoutConstraintOfSettingTableView.constant = Common.screenHeight < 500 ? Common.screenHeight * (568 - 221) / 568 : 347

        self.view.frame = CGRectMake(0, 0, 320 * 0.78, Common.screenHeight)
    }


    
    // 处理点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = Common.rootViewController
        viewController.homeViewController.titleOfOtherPages = filterTitle[indexPath.row]
        viewController.homeViewController.performSegueWithIdentifier("showOtherPages", sender: self)
        Common.contactsVC.view.removeFromSuperview()
        viewController.mainTabBarController.tabBar.hidden = true
        viewController.mainTabBarController.selectedIndex = 0
        viewController.showHome()
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //返回cell每行的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30
    }
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section==0 {
//        
//        }else if section==1{
//        
//        }else {
//  
//        }
//    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("rightCell", forIndexPath: indexPath)
      
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor=UIColor.grayColor()
        cell.textLabel!.text = filterTitle[indexPath.row]
        return cell
    }

}
