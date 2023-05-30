//
//  CurationView.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 5/17/23.
//

import SwiftUI

extension View {
    // Curation View
    func curationModifier() -> some View {
        self
            .background(Color("Curation Background")).edgesIgnoringSafeArea([.all])
    }
}

struct CurationView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack (spacing: 0) {
                    CurationHeader(geometry: geometry)
                    CurationBanner()
                    CurationDescription()
                }
            }
            .curationModifier()
        }
    }
}

struct CurationView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([DeviceName.iPhone_8.rawValue, DeviceName.iPhone_12_mini.rawValue, DeviceName.iPhone_14_Pro_Max.rawValue], id: \.self) { device in
            CurationView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
