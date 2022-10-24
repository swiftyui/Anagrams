import Foundation
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

            // print("Your code here")

            let nc = UNUserNotificationCenter.current()
            // if You do not set delegate, does not work.
            nc.delegate = self

            return true
        }
        
        
        // called after user has tapped on notification ballon.
        func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    willPresent notification: UNNotification,
                                    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            
            let request = notification.request
            //let content = request.content
            let identifier = request.identifier
            //let title = content.title
            //print(title)
            print( identifier,"\n----\n")
            
        completionHandler([.banner, .list, .badge, .sound])
        } // end of userNotificationCenter

    }
    
