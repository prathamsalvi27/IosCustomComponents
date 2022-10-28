//
//  MyNotification.swift
//  IosCustomComponents
//
//  Created by Prathamesh Salvi on 26/10/22.
//

import Foundation
struct MyNotificationName: Hashable {
    var name: String
}
class MyNotification: NSObject {
    var name: MyNotificationName
    private (set) var objectName : AnyObject
    private (set) var methodName : Selector
    var userInfo: [String: Any]?
    var object: AnyObject?
    
    init(notificationName: MyNotificationName, thisObject: AnyObject, methodName: Selector, object: AnyObject?) {
        self.name = notificationName
        self.objectName = thisObject
        self.methodName = methodName
        self.object = object
    }
}
