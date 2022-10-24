import SwiftUI

struct CalculatorView: View {
    
    @State var number: Int
    @State var primeNumber: Bool
    @State var notifications: Notifications
    
    init() {
        self.primeNumber = false
        self.number = 0
        self.notifications = Notifications()
    }
    var body: some View {
        
        VStack {
            GroupBox {
                VStack {
                    TextField("Enter a number....", value: self.$number, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(height: 40)
                        .overlay {
                            Capsule(style: .continuous).stroke(Color.gray, style: StrokeStyle(lineWidth: 1))
                        }
                    
                    Text("Is Prime Number?")
                        .frame(width: 200, height: 15)
                        .padding()
                        .background(Color(hue: 0.523, saturation: 0.0, brightness: 0.177))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .onTapGesture {
                            
                            let isPrimeNumber = isPrime(self.number)
                            if isPrimeNumber {
                                notifications.schedule(title: "Prime Number",
                                                       body: "\(self.number) is a prime number",
                                                       sound: .default,
                                                       badge: 1)
                            } else {
                                notifications.schedule(title: "Prime Number",
                                                       body: "\(self.number) is not a prime number",
                                                       sound: .default,
                                                       badge: 1)
                            }
                        }
                }
                
            } label: {
                Label("Prime Numbers", systemImage: "numbersign")
            }
            .shadow(radius: 5)
            .padding()
            .groupBoxStyle(ColoredGroupBox(color: .white))
            
            
        }
        .onAppear(perform: notifications.prepareForNotifications)
    }
    

    
    func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
}
