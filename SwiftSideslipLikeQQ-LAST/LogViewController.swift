//
//  LogViewController.swift
//  Graceful
//
//  Created by MacBook on 16/4/17.
//  Copyright © 2016年 com.lvwenhan. All rights reserved.
//

import Foundation
import UIKit
class LogViewController:UIViewController {
    
    @IBOutlet weak var user_Name: UITextField!
  
    @IBOutlet weak var user_Password: UITextField!
   
    @IBOutlet weak var lostPassword: UIButton!
    @IBAction func Login(sender: AnyObject) {
        performSegueWithIdentifier("login", sender: self)

    }
    @IBAction func ChangeLog(sender: AnyObject) {
        let btntitle:String=(self.logWithEmail.titleLabel?.text)!
        if btntitle=="邮箱登陆"{
            self.logWithEmail.setTitle("手机登陆", forState: UIControlState.Normal)
            self.user_Name.placeholder="E-mail"
        }else{
             self.logWithEmail.setTitle("邮箱登陆", forState: UIControlState.Normal)
            self.user_Name.placeholder="手机号码"
        }
        
    }

  
    @IBOutlet weak var logWithEmail: UIButton!
    
    
    @IBOutlet weak var login: UIButton!
  

    @IBOutlet weak var logup: UIButton!
 
    var BGImg:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置背景
        self.setBackGround()
        self.addWidget()
        self.view.addSubview(self.user_Name)
        self.view.addSubview(self.user_Password)
        self.view.addSubview(self.lostPassword)
        self.view.addSubview(self.logWithEmail)
        self.view.addSubview(self.login)
        self.view.addSubview(self.logup)
    }
    func setBackGround(){
        //BGImg=UIImageView(image: UIImage(named: "Background"))
       // BGImg.frame=CGRectMake(0, 0, Common.screenWidth, Common.screenHeight)
        //BGImg.backgroundColor=UIColor(red: 74/255.0, green: 194/255.0, blue: 205/255.0, alpha:0.9)
   
        // self.view.addSubview(BGImg)
    self.view.backgroundColor=UIColor(red: 74/255.0, green: 194/255.0, blue: 205/255.0, alpha:0.9)
    }
   
    func addWidget(){
        self.user_Name.frame=CGRectMake(Common.ScreenSizeWidth, Common.ScreenSizeHeight/2, Common.ScreenSizeWidth, 65)
        self.user_Password.frame=CGRectMake(Common.ScreenSizeWidth/2, Common.ScreenSizeHeight/2-80, Common.ScreenSizeWidth, 65)
        self.user_Name.placeholder="phone"
        self.user_Password.placeholder="password"
        self.user_Name.layer.borderWidth=2
        self.user_Name.layer.cornerRadius=10
        self.user_Name.backgroundColor=UIColor.clearColor()
        self.user_Password.secureTextEntry=true
        self.lostPassword.frame=CGRectMake(self.user_Password.frame.origin.x, user_Password.frame.origin.y-30, 150, 21)
        self.user_Password.layer.borderWidth=2
        self.user_Password.layer.cornerRadius=10
        self.user_Password.backgroundColor=UIColor.clearColor()
        self.lostPassword.backgroundColor=UIColor.clearColor()
        lostPassword.titleLabel?.text="忘记密码？"
        self.lostPassword.addTarget(self, action: Selector("lostPass"), forControlEvents:UIControlEvents.TouchUpInside)
        self.logWithEmail.frame=CGRectMake(self.user_Password.frame.origin.x+self.user_Password.frame.size.width-150,self.lostPassword.frame.origin.y , 150, 21)
        self.logWithEmail.backgroundColor=UIColor.clearColor()
        self.login.frame=CGRectMake(-Common.screenWidth+50, -Common.screenHeight+200,100, 80)
        self.login.backgroundColor=UIColor.orangeColor()
       self.login.layer.cornerRadius=10
        self.login.layer.shadowOffset=CGSizeMake(1, 1)
        self.login.layer.shadowOpacity=0.6
        
        self.logup.frame=CGRectMake(Common.screenWidth-50, -Common.screenHeight+200,100, 80)
        self.logup.addTarget(self, action:Selector("logupSender"), forControlEvents:UIControlEvents.TouchUpInside)
        self.logup.backgroundColor=UIColor.orangeColor()
 
    }
    func logupSender(){
        print("dfgf")
        performSegueWithIdentifier("logup", sender: self)
    }
    func lostPass(){
        performSegueWithIdentifier("lostPassword", sender: self)
    }
}