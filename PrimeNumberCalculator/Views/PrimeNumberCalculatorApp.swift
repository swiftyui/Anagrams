import SwiftUI

@main
struct PrimeNumberCalculatorApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining: Int = 4
    @State var isLoading: Bool = true
    
    
    var body: some Scene {
        WindowGroup {
            if self.isLoading {
                SplashScreenView().onReceive(timer) {_ in
                    if ( timeRemaining > 0 )
                    {
                        timeRemaining -= 1
                    }
                    if (timeRemaining <= 0)
                    {
                        timer.upstream.connect().cancel()
                        isLoading = false
                    }
                }
            }
            else {
                MainMenuView()
            }
        }
    }
}
