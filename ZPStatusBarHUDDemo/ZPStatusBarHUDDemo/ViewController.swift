//
//  ViewController.swift
//  ZPStatusBarHUDDemo
//
//  Created by miaolin on 16/4/11.
//  Copyright © 2016年 赵攀. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        ZPStatusBarHUD.showSuccess(nil)
    }


}

