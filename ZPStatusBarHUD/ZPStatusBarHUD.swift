//
//  ZPStatusBarHUD.swift
//  ZPStatusBarHUDDemo
//
//  Created by miaolin on 16/4/11.
//  Copyright © 2016年 赵攀. All rights reserved.
//

import UIKit

class ZPStatusBarHUD: UIView {
    
    //静态的变量
    static var customwindow: UIWindow?
    static let windowH: CGFloat = 20;
    static let ZPMessageDuration = 2.0
    static let ZPAnimationDuration = 0.25
    static let ZPButtonEdgeInsets: CGFloat = 5
    static var timer: NSTimer?
    static let windowW = UIScreen.mainScreen().bounds.width
    
    class func showError(error: String?) {
        showMessageWithImage(error == nil ? "加载失败" : error!, image: UIImage(named: "ZPStatusBarHUD.bundle/error"))
    }
    
    class func showSuccess(success: String?) {
        showMessageWithImage(success == nil ? "加载成功" : success!, image: UIImage(named: "ZPStatusBarHUD.bundle/success"))
    }
    
    class func loading() {
        
    }
    
    class func showMessageWithImage(message: String, image: UIImage?) {
        //停止定时器
        timer?.invalidate()
        //创建新的window
        showWindow()
        //创建button
        let button = UIButton(type: .Custom)
        button.setTitle(message, forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(13)
        button.userInteractionEnabled = false
        button.frame = customwindow!.bounds
        //如果没有图片则不设置,并且不设置偏移
        if image != nil {
            button.setImage(image, forState: .Normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: ZPButtonEdgeInsets)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: ZPButtonEdgeInsets, bottom: 0, right: 0)
        }
        //将button添加到window上
        customwindow?.addSubview(button)
        //重置定时器
        timer = NSTimer.scheduledTimerWithTimeInterval(ZPMessageDuration, target: self, selector: "hidn", userInfo: nil, repeats: false)
    }
    
    class func showMessage(message: String) {
        
        showMessageWithImage(message, image: nil)
    }
    class func hidn() {
        UIView.animateWithDuration(ZPAnimationDuration, animations: { () -> Void in
            //将改变重置
            customwindow?.frame = CGRect(x: 0, y: -windowH, width: windowW, height: windowH)
            }) { (finish) -> Void in
                if finish == true {
                    //隐藏window
                    customwindow?.hidden = true
                    customwindow = nil
                    //销毁定时器
                    timer = nil
                }
        }
    }
    //MARK: - 私有方法
    private class func showWindow() {
        //先隐藏上一个指针指向的window
        customwindow?.hidden = true
        //创建新的window
        customwindow = UIWindow()
        //设置frame
        customwindow?.frame = CGRect(x: 0, y: -windowH, width: windowW, height: windowH)
        //设置window的等级
        customwindow?.windowLevel = UIWindowLevelAlert
        //显示window
        customwindow?.hidden = false
        //设置动画出现
        UIView.animateWithDuration(ZPAnimationDuration) { () -> Void in
            customwindow?.frame = CGRect(x: 0, y: 0, width: windowW, height: windowH)
        }
    }
    
}
