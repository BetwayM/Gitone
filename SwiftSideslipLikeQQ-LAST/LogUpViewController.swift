//
//  LogUpViewController.swift
//  Graceful
//
//  Created by MacBook on 16/4/18.
//  Copyright © 2016年 com.lvwenhan. All rights reserved.
//

import Foundation
import UIKit
class LogUpViewController: UIViewController {
    var user_Name:UITextField=UITextField.init()
    var user_Password:UITextField=UITextField.init()
    var REuser_Password:UITextField=UITextField.init()
    var user_NikeName:UITextField=UITextField.init()
    var btn_Logup:UIButton=UIButton.init(type: UIButtonType.RoundedRect)
    var btn_Cancel:UIButton=UIButton.init(type: UIButtonType.RoundedRect)
    var BGImg:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackGround()
        self.addWidget()
    }
    func setBackGround(){
       // BGImg=UIImageView(image: UIImage(named: "Background"))
//        BGImg.backgroundColor=UIColor(red: 74/255.0, green: 194/255.0, blue: 205/255.0, alpha:0.9)
//        BGImg.frame=CGRectMake(0, 0, Common.screenWidth, Common.screenHeight)
//        self.view.addSubview(BGImg)
        self.view.backgroundColor=UIColor(red: 74/255.0, green: 194/255.0, blue: 205/255.0, alpha:0.9)
    }
    func addWidget(){
        self.user_Name.frame=CGRectMake(20, Common.ScreenSizeHeight/2-80, Common.ScreenSizeWidth-40, 45)
        self.user_Password.frame=CGRectMake(20, Common.ScreenSizeHeight/2, Common.ScreenSizeWidth-40, 45)
         self.REuser_Password.frame=CGRectMake(20, Common.ScreenSizeHeight/2+80, Common.ScreenSizeWidth-40, 45)
         self.user_NikeName.frame=CGRectMake(20, Common.ScreenSizeHeight/2-160, Common.ScreenSizeWidth-40, 45)
        self.btn_Logup.frame=CGRectMake(Common.ScreenSizeWidth/2-150,Common.screenHeight-100,100, 50)
        self.btn_Cancel.frame=CGRectMake(Common.ScreenSizeWidth/2+50,Common.screenHeight-100,100, 50)
        self.user_NikeName.text="傲娇小天使"
        self.user_Name.placeholder="phone"
        self.user_Password.placeholder="password"
        self.REuser_Password.placeholder="password again"
        self.user_NikeName.layer.borderWidth=2
        self.user_Name.layer.borderWidth=2
        self.user_Password.layer.borderWidth=2
        self.REuser_Password.layer.borderWidth=2
        self.user_NikeName.layer.cornerRadius=10
        self.user_Name.layer.cornerRadius=10
        self.user_Password.layer.cornerRadius=10
        self.REuser_Password.layer.cornerRadius=10
        self.user_Name.backgroundColor=UIColor.clearColor()
        self.user_Password.backgroundColor=UIColor.clearColor()
        self.REuser_Password.backgroundColor=UIColor.clearColor()
        self.user_NikeName.backgroundColor=UIColor.clearColor()
        self.user_Password.secureTextEntry=true
        self.REuser_Password.secureTextEntry=true
        self.btn_Logup.backgroundColor=UIColor.orangeColor()
        self.btn_Cancel.backgroundColor=UIColor.orangeColor()
        self.btn_Cancel.layer.cornerRadius=10
        self.btn_Logup.layer.cornerRadius=10
        self.btn_Logup.setTitle("注册", forState: UIControlState.Normal)
        self.btn_Cancel.setTitle("取消", forState: UIControlState.Normal)
        self.btn_Cancel.addTarget(self, action: Selector("CancelLogup"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.user_NikeName)
        self.view.addSubview(self.user_Name)
        self.view.addSubview(self.user_Password)
        self.view.addSubview(self.REuser_Password)
        self.view.addSubview(btn_Logup)
        self.view.addSubview(btn_Cancel)
    }
    func CancelLogup(){
        performSegueWithIdentifier("cancelLogup", sender: self)
    }
}