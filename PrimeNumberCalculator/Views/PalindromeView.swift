//
//  PalindromeView.swift
//  PrimeNumberCalculator
//
//  Created by Arno van Zyl on 2022/10/24.
//

import SwiftUI

struct PalindromeView: View {
    
    @State var isPalindrome: Bool
    @State var stringOne: String
    @State var stringTwo: String
    @State var notifications: Notifications
    
    init() {
        self.stringOne = ""
        self.stringTwo = ""
        self.isPalindrome = false
        self.notifications = Notifications()
    }
    var body: some View {
        VStack {
            GroupBox {
                VStack {
                    
                    TextField("Enter a string....", text: self.$stringOne)
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(height: 40)
                        .overlay {
                            Capsule(style: .continuous).stroke(Color.gray, style: StrokeStyle(lineWidth: 1))
                        }
                    
                    TextField("Enter a string....", text: self.$stringTwo)
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(height: 40)
                        .overlay {
                            Capsule(style: .continuous).stroke(Color.gray, style: StrokeStyle(lineWidth: 1))
                        }
                    
                    
                    Text("Is Palindrome?")
                        .frame(width: 200, height: 15)
                        .padding()
                        .background(Color(hue: 0.523, saturation: 0.0, brightness: 0.177))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .onTapGesture {
                            
                            let isPalindrome = isPalindrome(self.stringOne, self.stringTwo)
                            if isPalindrome {
                                notifications.schedule(title: "Palindrome",
                                                       body: "\(self.stringOne) and \(self.stringTwo) are palindromes",
                                                       sound: .default,
                                                       badge: 1)
                            } else {
                                notifications.schedule(title: "Palindrome",
                                                       body: "\(self.stringOne) and \(self.stringTwo) are not a palindrome",
                                                       sound: .default,
                                                       badge: 1)
                            }
                        }
                }
            } label: {
                Label("Palindrome", systemImage: "arrow.uturn.backward.circle.badge.ellipsis")
            }
            .shadow(radius: 5)
            .padding()
            .groupBoxStyle(ColoredGroupBox(color: .white))
        }
    }
    
    func isPalindrome(_ stringOne: String, _ stringTwo: String) -> Bool {
        
        let reversedOne = stringOne.lowercased().reversed()
        if( stringTwo.lowercased() == String(reversedOne) ) {
            return true
        }
        
        let reversedTwo = stringTwo.lowercased().reversed()
        if (stringOne.lowercased() == String(reversedTwo)) {
            return true
        }
        
        return false
    }
}
