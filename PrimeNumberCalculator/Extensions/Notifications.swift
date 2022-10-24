import Foundation
import SwiftUI

/// Remeber notifications require an App Delegate

class Notifications: NSObject {
    
    func prepareForNotifications(){

            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            }
        }
    
    func schedule(title: String, body: String, sound: UNNotificationSound, badge: NSNumber)  {
          
        let NOTIFICATION_DELAY  = 0.1
          let NOTIFICATION_ID  = "NOTIFICATION_ID" // note: if repeating, ID must be differr, otherwise IOS will consider only once with this ID

          let USE_INTERVAL = true                 // experiment..

          let content = UNMutableNotificationContent()
          
          content.title = title
          content.body  = body
          content.sound = sound
          content.badge = badge
          
          let center = UNUserNotificationCenter.current()
                  
          if USE_INTERVAL{
              
              let trigger = UNTimeIntervalNotificationTrigger.init(
                  timeInterval: NOTIFICATION_DELAY,
                  repeats: false
              )
              
              let request = UNNotificationRequest.init(identifier: NOTIFICATION_ID,
                                                       content: content,
                                                       trigger: trigger)
              // Schedule the notification.
              center.add(request)
              
          }else{
              // USE DATE:
              
              let date = Date(timeIntervalSinceNow: 5)
              let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
              let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate,
                                                          repeats: true)
              
              let request = UNNotificationRequest.init(identifier: NOTIFICATION_ID,
                                                       content: content,
                                                       trigger: trigger)
              // Schedule the notification.
              center.add(request)
          }
      }
}
