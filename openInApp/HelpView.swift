//
//  HelpView.swift
//  openInApp
//
//  Created by hemanth on 4/27/24.
//

import SwiftUI

struct HelpView: View {
    
    var imageName: String
    var text: String
    var color: Color
    
    var body: some View {
        HStack {
            Image(imageName) // Use system image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            
            Text(text)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.horizontal,16)
            
            
            Spacer()
        }
        .padding(.horizontal,16)
        .padding(.vertical,16)
        .border(color, width: 0.5) // Add border to the HStack
        .background(color.opacity(0.2))
        .cornerRadius(8)


    }
}



struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView(imageName: "person", text: "Hello", color: .gray)
    }
}
