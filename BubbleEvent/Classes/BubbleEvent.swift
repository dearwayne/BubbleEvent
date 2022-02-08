//
//  ResponseChain.swift
//  Test006
//
//  Created by wayne on 2021/6/22.
//

import UIKit


/// 将子视图的事件往顶层传递，顶层视图根据eventName来进行分类处理
@objc public protocol RouterEventable {
    @objc dynamic func router(eventName: String,object: Any?)
}

extension UIResponder: RouterEventable {
    /**
     顶层视图需要重写此方法来进行响应
     * 如果需要继续传递，请调用:
     *   super.router(eventName: eventName,object: object)
     */
    @objc dynamic open func router(eventName: String,object: Any? = nil) {
        if let n = next {
            n.router(eventName: eventName,object: object)
        }
    }
}

/// 将子视图的事件冒泡到上层视图处理，避免多层代理、回调传递
@objc public protocol BubbleEventable {
    @objc dynamic func bubble(event: Selector,object: Any?)
}

extension UIResponder: BubbleEventable {
    /**
     默认找到响应者后，就中止事件冒泡，如果需继续往上冒泡，可以重写此方法
     * 然后调用:
     *   super.bubble(event: event,object: object)
     *   if let n = next { n.bubble(event: event,object: object) }
     */
    @objc dynamic open func bubble(event: Selector,object: Any? = nil) {
        if responds(to: event) {
            perform(event, with: object)
        } else if let n = next {
            n.bubble(event: event,object: object)
        } else {
            print("\(NSStringFromSelector(event))找不到响应者")
        }
    }
}


