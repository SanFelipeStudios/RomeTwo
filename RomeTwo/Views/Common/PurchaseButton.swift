//
//  PurchaseButton.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 5/29/23.
//

import SwiftUI

extension View {
    func purchaseButtonStyle() -> some View {
        self
            .font(.custom("NotoSansTamil-SemiBold", size: 20))
            .padding(.top, 5)
            .foregroundColor(.blue)
    }
    
    func purchaseButtonModifier() -> some View {
        self
            .frame(width: 90, height: 35)
            .background(.white)
            .clipShape(Capsule())
    }
}

struct PurchaseButton: View {
    var body: some View {
        Button {
            // TODO: Ability to buy the product
        } label: {
            Text("GET")
                .purchaseButtonStyle()
        }
        .purchaseButtonModifier()
        
    }
}

struct PurchaseButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .frame(width: .infinity, height: .infinity)
            PurchaseButton()
        }
        .ignoresSafeArea()
    }
}
