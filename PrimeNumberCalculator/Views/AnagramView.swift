//
//  AnagramView.swift
//  PrimeNumberCalculator
//
//  Created by Arno van Zyl on 2022/10/24.
//

import SwiftUI

struct AnagramView: View {
    @State var notifications: Notifications
    @State var stringOne: String
    @State var stringTwo: String
    
    init() {
        self.notifications = Notifications()
        self.stringOne = ""
        self.stringTwo = ""
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
                    
                    Text("Is Anagram?")
                        .frame(width: 200, height: 15)
                        .padding()
                        .background(Color(hue: 0.523, saturation: 0.0, brightness: 0.177))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .onTapGesture {
                            
                            let isAnagram = isAnagram(stringOne: self.stringOne, stringTwo: self.stringTwo)
                            if isAnagram {
                                notifications.schedule(title: "Anagram",
                                                       body: "\(self.stringOne) and \(self.stringTwo) are anagrams",
                                                       sound: .default,
                                                       badge: 1)
                            } else {
                                notifications.schedule(title: "Anagram",
                                                       body: "\(self.stringOne) and \(self.stringTwo) are not anagrams",
                                                       sound: .default,
                                                       badge: 1)
                            }
                        }
                }
            } label: {
                Label("Anagrams", systemImage: "textformat.abc.dottedunderline")
            }
            .shadow(radius: 5)
            .padding()
            .groupBoxStyle(ColoredGroupBox(color: .white))
        }
    }
    
    func isAnagram(stringOne: String, stringTwo: String) -> Bool {
        
        /// First ensure not empty
        if (stringOne.isEmpty || stringTwo.isEmpty) {
            return false
        }
        
        ///Check string lengths are the same
        if (stringOne.count != stringTwo.count) {
            return false
        }
        
        /// Get a sorted character array of two strings
        let charArrayOne = Array(stringOne.lowercased()).sorted()
        let charArrayTwo = Array(stringTwo.lowercased()).sorted()
        
        ///Check each character in their position
        for characterIndex in charArrayOne.indices {
            if(String(charArrayOne[characterIndex]) != String(charArrayTwo[characterIndex]))
            {
                print(String(charArrayOne[characterIndex]))
                print(String(charArrayTwo[characterIndex]))
                return false
            }
        }
        
        return true
    }
}
