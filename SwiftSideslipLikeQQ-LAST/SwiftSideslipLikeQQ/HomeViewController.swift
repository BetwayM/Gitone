//
//  HomeViewController.swift
//  SwiftSideslipLikeQQ
//
//  Created by JohnLui on 15/4/10.
//  Copyright (c) 2015年 com.lvwenhan. All rights reserved.
//

import UIKit

// 主页
class HomeViewController:UIViewController,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate{
    let segmentView = UISegmentedControl(items: ["推送", "发起",])
    var titleOfOtherPages = ""
    var Vcontroller:ViewController!
    var TagArray:[String]=[]//存放标签
    var FliterTag:[String]=[]//存放筛选标签
    var dataArray:NSMutableArray!//原始结果
    //=["我的发起", "我的响应", "我的收藏", "我的好友", "我的兴趣标签", "献计献策"]
    var fliterArray:NSMutableArray!//过滤结果
    var searchDisplayViewController:UISearchDisplayController!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var PushTableView: UITableView!

    @IBOutlet var panGesture: UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化数据
        dataArray=NSMutableArray.init(capacity: 0)
        fliterArray=NSMutableArray.init(capacity: 0)
       
       self.PushTableView.sizeToFit()
        self.searchBar.frame=CGRectMake(0, 0, 0, 44)
        let graceful=Graceful()
        graceful.Title="打球"
        graceful.Time="16-4-16 09:30"
        graceful.Address="广东珠海"
        graceful.Tag="Qw约个球"
        graceful.upMan="momo"
         //将标签加入字符串数组中
        TagArray.append(graceful.Tag)
        dataArray.addObject(graceful)
        let gracefultwo=Graceful()
        gracefultwo.Title="抓到我就让你嘿嘿嘿"
        gracefultwo.Time="16-4-18 12:30"
        gracefultwo.Address="广东珠海"
        gracefultwo.Tag="de约嘿嘿嘿"
        gracefultwo.upMan="dddd"
        //将标签加入字符串数组中
        TagArray.append(gracefultwo.Tag)
        dataArray.addObject(gracefultwo)
        self.FliterTag=self.TagArray
        let searchBar:UISearchBar=UISearchBar.init(frame: CGRectMake(0, 0,0, 45))
        searchBar.placeholder="兴趣搜索"
        self.searchBar.backgroundColor=UIColor.orangeColor()
       // self.PushTableView.tableHeaderView=searchBar
        self.title="home"
        //用seachbar初始化displayviewcontroller
        searchDisplayViewController = UISearchDisplayController.init(searchBar: searchBar, contentsController: self)
        searchDisplayViewController.searchBar.frame=CGRectMake(0, 0, 0, 44)
        searchDisplayViewController.searchBar.sizeToFit()
        //背景颜色
        searchDisplayViewController.searchBar.backgroundColor=UIColor.orangeColor()
     
        //设置搜索数据和delegate
//       searchDisplayViewController.searchResultsDataSource=self
//        searchDisplayViewController.searchResultsDelegate=self
//        searchDisplayViewController.delegate=self
        self.searchBar.delegate=self
        self.PushTableView.delegate=self
        self.PushTableView.dataSource=self
        //注册cell
        self.PushTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "pushcell")
        // 设置中间 segmentView 视图
        //let segmentView = UISegmentedControl(items: ["推送", "附近",])
        segmentView.selectedSegmentIndex = 0
        segmentView.setWidth(60, forSegmentAtIndex: 0)
        segmentView.setWidth(60, forSegmentAtIndex: 1)
        //为分段设置点击事件
        segmentView.addTarget(self, action: Selector("doSomeThingWhenSegmentChoosed:"), forControlEvents: UIControlEvents.ValueChanged)
        self.navigationItem.titleView = segmentView

    }
//     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tableView == self.PushTableView{
//        return dataArray.count
//        }else{
//            //正则表达式 谓词搜索
//            let predicate:NSPredicate=NSPredicate(format: "self contains [cd] %d", self.searchDisplayViewController.searchBar.text!)
//            //用predicate过滤dataArray
//            fliterArray=NSArray.init(array: dataArray.filteredArrayUsingPredicate(predicate))
//            return fliterArray.count
//        }
//    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.FliterTag.count
    }

   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let identify:String="pushcell"
    let grace:Graceful!//创建调用属性对象
    grace=dataArray.objectAtIndex(indexPath.row) as! Graceful//取得对象
    let cell=tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath) as UITableViewCell//登陆添加cell
    //设置cell样式
    cell.sizeToFit()
    cell.frame=self.PushTableView.frame
    cell.backgroundColor=UIColor.grayColor()
    cell.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator
   // cell.textLabel?.text=self.FliterTag[indexPath.row]
    let CellTitle:UILabel?=UILabel.init()
    CellTitle?.text=grace.Title
    CellTitle?.sizeToFit()
    cell.addSubview(CellTitle!)
    let AddressTextFile:UILabel?=UILabel.init()
    AddressTextFile?.text=grace.Address
    AddressTextFile?.frame=CGRectMake(180, 5, 150, 21)
    cell.addSubview(AddressTextFile!)
    let TimeTextfile:UILabel?=UILabel.init()
    TimeTextfile?.text=grace.Time
    TimeTextfile?.frame=CGRectMake(260, 5, 150, 21)
    cell.addSubview(TimeTextfile!)
    let TagTextfile:UILabel?=UILabel.init()
    TagTextfile?.text=grace.Tag
    TagTextfile?.frame=CGRectMake(5, 60, 150, 21)
    TagTextfile?.textColor=UIColor.orangeColor()
    cell.addSubview(TagTextfile!)
    let upManTextfile:UILabel?=UILabel.init()
    upManTextfile?.text=grace.upMan
    upManTextfile?.frame=CGRectMake(260, 60, 150, 21)
    cell.addSubview(upManTextfile!)

//        if self.searchDisplayViewController.active {
//            grace=fliterArray.objectAtIndex(indexPath.row) as! Graceful
//        }else{
//        grace=dataArray.objectAtIndex(indexPath.row) as! Graceful
//        }
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor=UIColor.redColor()
        if indexPath.row>0 {
            cell.textLabel!.font=UIFont.systemFontOfSize(15)
            cell.textLabel?.text=FliterTag[indexPath.row]
        }
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
//搜索栏调用
func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText == ""{
            self.FliterTag=self.TagArray
        }else{
            self.FliterTag=[]
            for ctrl in self.TagArray{
                if ctrl.lowercaseString.hasPrefix(searchText.lowercaseString){
                    self.FliterTag.append(ctrl)
                }
            }
        }
        self.PushTableView.reloadData()
    }

//分段点击事件
    func doSomeThingWhenSegmentChoosed(segment:UISegmentedControl) ->Void{
        let index=segment.selectedSegmentIndex
        switch index{
        case(0):
           // HomeLabel.text=segment.titleForSegmentAtIndex(index)
            break;
        case(1):
            //HomeLabel.text=segment.titleForSegmentAtIndex(index)
            break;
        default:
            
            break;
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showOtherPages" {
            if let a = segue.destinationViewController as? OtherPageViewController {
                a.PageTitle = titleOfOtherPages
            }
        }
    }
    

}
