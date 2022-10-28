//
//  MyNotificationCenter.swift
//  IosCustomComponents
//
//  Created by Prathamesh Salvi on 26/10/22.
//

import Foundation

final class MyNotificationCenter {
    static let shared: MyNotificationCenter = MyNotificationCenter()
    var notifications: [MyNotificationName: [MyNotification]] = [MyNotificationName: [MyNotification]]()
    
    private init() {}
    
    func addObserver(_ observer: AnyObject, selector aSelector: Selector, name aName: MyNotificationName, object: AnyObject?) {
        let notification = MyNotification(notificationName: aName, thisObject: observer, methodName: aSelector, object: object)
        var array = notifications[aName]
        guard array != nil else {
            var newArray: [MyNotification] = [MyNotification]()
            newArray.append(notification)
            notifications[aName] = newArray
            return
        }
        array?.append(notification)
        notifications[aName] = array
    }
    
    func post(name aName: MyNotificationName, object anObject: AnyObject? = nil, userInfo aUserInfo: [String : Any]? = nil) {
        guard let notificationArray = notifications[aName] else {
            return
        }

        for notification in notificationArray {
            notification.object = anObject
            notification.userInfo = aUserInfo
            let object = notification.objectName
            let methodName = notification.methodName
            _ = object.perform(methodName, with: notification)
        }
    }
    
    func removeObserver(objectName: AnyObject, name aName: MyNotificationName) {
        guard var array = notifications[aName] else {
            return
        }
        if !array.isEmpty {
            array.removeAll(where: { $0.objectName === objectName && $0.name == aName})
                notifications[aName] = array
        }
    }
    
}
