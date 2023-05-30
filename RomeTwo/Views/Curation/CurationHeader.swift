//
//  CurationImage.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 5/28/23.
//

import SwiftUI

extension Image {
    func curationImageModifier(geometry: GeometryProxy) -> some View {
        self
            .resizable()
            .scaledToFill()
            .overlay(ImageOverlay(geometry: geometry), alignment: .bottomLeading)
            .frame(maxWidth: .infinity, maxHeight: geometry.size.height * 0.6)
            .clipped()
    }
    
    func appIconModifier() -> some View {
        self
            .resizable()
            .frame(width: 48, height: 48)
            .cornerRadius(10)
    }
}

extension View {
    // Curation Image
    func headerImageOverlayStyle() -> some View {
        self
            .font(.custom("NotoSansTamil-ExtraBold", size: 42))
            .foregroundColor(.white)
    }
    
    func headerImageModifier(geometry: GeometryProxy) -> some View {
        self
            .padding(.horizontal)
            .padding(.bottom, geometry.size.height * 0.18)
    }
}

struct ImageOverlay: View {
    var geometry: GeometryProxy
    
    var body: some View {
        VStack(alignment: .leading, spacing: -15) {
            Text("APP")
            Text("OF THE")
            Text("DAY")
        }
        .headerImageModifier(geometry: geometry)
        .headerImageOverlayStyle()
    }
}

struct CurationHeader: View {
    var geometry: GeometryProxy
    
    var body: some View {
        VStack(spacing: 0) {
            Image("Zagreus")
                .curationImageModifier(geometry: geometry)
        }
    }
}

struct CurationImage_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([DeviceName.iPhone_8.rawValue, DeviceName.iPhone_12_mini.rawValue, DeviceName.iPhone_14_Pro_Max.rawValue], id: \.self) { device in
            GeometryReader { geometry in
                CurationHeader(geometry: geometry)
            }
            .previewDevice(PreviewDevice(rawValue: device))
            .previewDisplayName(device)
        }
    }
}
