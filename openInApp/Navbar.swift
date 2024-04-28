//
//  Navbar.swift
//  openInApp
//
//  Created by hemanth on 4/27/24.
//

import SwiftUI

struct Navbar: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Text("Dashboard")
                    .foregroundColor(Color.white)
                    .font(.headline)
                    .padding(8)
                Spacer()
                
                
                
                ZStack{
                    Rectangle()
                        .background(Color.white)
                        .foregroundColor(Color("primary_color").opacity(0.8))
                        .frame(width: 40, height: 40)
                        .cornerRadius(8)
                    
                    
                    
                    Image("Wrench")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                }
                
                
            }
            .padding(16)
        }
    }
}

struct Navbar_Previews: PreviewProvider {
    static var previews: some View {
        Navbar()
    }
}




