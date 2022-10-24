//
//  MainMenuView.swift
//  PrimeNumberCalculator
//
//  Created by Arno van Zyl on 2022/10/24.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        VStack {
            CalculatorView()
            AnagramView()
            PalindromeView()
            Spacer()
        }
        
    }
}
