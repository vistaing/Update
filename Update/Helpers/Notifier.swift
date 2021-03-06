//
//  Notifier.swift
//  Update
//
//  Created by Lucas Farah on 2/11/20.
//  Copyright © 2020 Lucas Farah. All rights reserved.
//

import Foundation
import UserNotifications

struct Notifier {
    static func notify(title: String, body: String, info: [AnyHashable: Any]? = nil) {
        Notifier.requestAuthorization { _ in
            let center = UNUserNotificationCenter.current()
            
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = body

            if let info = info {
                content.userInfo = info
            }
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }

    }
    
    static func requestAuthorization(handler: @escaping (_ isAccepted: Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (isAccepted, error) in
            handler(isAccepted)
        }
    }
}
