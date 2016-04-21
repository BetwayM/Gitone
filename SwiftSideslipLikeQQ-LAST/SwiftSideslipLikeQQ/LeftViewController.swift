//
//  LeftViewController.swift
//  SwiftSideslipLikeQQ
//
//  Created by JohnLui on 15/4/11.
//  Copyright (c) 2015年 com.lvwenhan. All rights reserved.
//

import UIKit

// 侧滑菜单 View Controller
class LeftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var mySite:UIButton=UIButton.init(type: UIButtonType.RoundedRect)
    var bgImg:UIImageView!
    let titlesDictionary = ["我的发起", "我的响应", "我的收藏", "我的好友", "我的兴趣标签", "献计献策"]
    @IBOutlet weak var settingTableView: UITableView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var heightLayoutConstraintOfSettingTableView: NSLayoutConstraint!
    var fliterTibleView:UITableView!
     var vController: ViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mySite.frame=CGRectMake(150,250,120, 21)
        self.mySite.addTarget(self, action: Selector("ShowMap"), forControlEvents: UIControlEvents.TouchUpInside)
        self.mySite.setTitle("我的位置", forState: UIControlState.Normal)
        self.view.addSubview(self.mySite)
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.tableFooterView = UIView()
        
        heightLayoutConstraintOfSettingTableView.constant = Common.screenHeight < 500 ? Common.screenHeight * (568 - 221) / 568 : 347
        self.view.frame = CGRectMake(0, 0, 320 * 0.78, Common.screenHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //返回cell每行的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30
    }

    // 处理点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = Common.rootViewController
        viewController.homeViewController.titleOfOtherPages = titlesDictionary[indexPath.row]
        //viewController.homeViewController.performSegueWithIdentifier("showOtherPages", sender: self)
        switch indexPath.row{
        case(0):
          print("点击我的发起")
       viewController.homeViewController.performSegueWithIdentifier("showMyRaise", sender: self)
          
            break
        case(1):
             print("点击我的响应")
            break
        case(2):
            print("点击我的收藏")
            break
        case(3):
                print("点击我的好友")
            break
        case(4):
                print("点击我的兴趣标签")
            break
        case(5):
            print("点击献计献策")
            break
        default:
            break
        }
        Common.contactsVC.view.removeFromSuperview()
        viewController.mainTabBarController.tabBar.hidden = true
        viewController.mainTabBarController.selectedIndex = 0
        viewController.showHome()
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("leftViewCell", forIndexPath: indexPath) 
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor=UIColor.grayColor()
        cell.textLabel!.text = titlesDictionary[indexPath.row]
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func ShowMap(){
        performSegueWithIdentifier("showMap", sender: self)
    }
}
