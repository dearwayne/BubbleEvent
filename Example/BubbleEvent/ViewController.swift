//
//  ViewController.swift
//  BubbleEvent
//
//  Created by dearwayne on 02/08/2022.
//  Copyright (c) 2022 dearwayne. All rights reserved.
//

import UIKit
import BubbleEvent

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ViewController {
    @objc func myViewClicked() {
        print("bubble(event:object:) 调用了: myViewClicked")
    }
}

extension ViewController {
    override func router(eventName: String, object: Any? = nil) {
        print("router 调用了: ",eventName)
    }
}


class MyView:UIView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("MyView 点击了")
        router(eventName: "test_eventName", object: nil)
        bubble(event: #selector(ViewController.myViewClicked), object: nil)
    }
}

