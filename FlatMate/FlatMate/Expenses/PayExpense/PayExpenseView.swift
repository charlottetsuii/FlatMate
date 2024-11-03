//
//  PayExpenseView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/2/24.
//

import SwiftUI

struct PayExpenseView: View {
    @Binding var flat: RoomieGroup
    @Binding var showSheet: Bool
    @State var expenseAmount = 0.0
    @State var expenseName = ""
    @State var expenseDescription = ""
    @State var selectedBill: Bill? // Changed to Bill? for better selection management
    @StateObject var vm = BillViewModel()
    var defaultBill: Bill = Bill(name: "default", balance: 0.0, balanceBreakdown: Array(repeating: 0.0, count: 4))

    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack(alignment: .leading) {
                Spacer()
                VStack(alignment: .leading) {
                    Text("How much?")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white.opacity(0.5))
                    TextField("0.0", value: $expenseAmount, format: .currency(code: "USD"))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                .padding()
                
                ZStack {
                    Color.white.ignoresSafeArea()
                    VStack(alignment: .leading, spacing: 5) {
                        Group {
                            Text("Bill")
                                .font(.headline)
                            
                            Picker("", selection: $selectedBill) {
                                ForEach(flat.bills, id: \.self) { bill in
                                    Text("\(bill.name), \(String(format: "%.2f", bill.balance))")
                                        .tag(bill as Bill?)
                                }
                            }
                            .frame(width: 375, height: 40)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary, lineWidth: 1))
                        }
                        Spacer()
                        Button {
                            //TODO: fix MAKEPAYMENT() CALL HERE!
                            //let billBinding = Binding(get: { selectedBill ?? defaultBill }, set: { selectedBill = $0 })
                           // vm.makePayment(bill: selectedBill ?? defaultBill, amount: expenseAmount, userIndex: 0)
                            showSheet = false
                        } label: {
                            Text("Continue")
                                .fontWeight(.bold)
                                .padding()
                                .frame(width: 375)
                                .background(Color.green)
                                .foregroundColor(Color.white)
                                .cornerRadius(15)
                        }
                    }
                    .padding()
                }
                .foregroundColor(Color.secondary)
            }
        }
    }
}

//#Preview {
 //   PayExpenseView(showSheet: .constant(true))
//}

