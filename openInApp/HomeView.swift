//
//  HomeView.swift
//  openInApp
//
//  Created by hemanth on 4/27/24.
//

import SwiftUI



struct HomeView: View {
    
    
    @EnvironmentObject var apiResponseHolder: ApiResponseHolder

    
    
    var body: some View {
        
        ZStack(alignment: .top){
            VStack(spacing: 0) {
                
                Navbar()
                    .background(Color("primary_color"))
                    .frame(height: 60)
                
                
                ScrollView {
                    LinksView()
                }
                
                //asjhdjashdjash
                .cornerRadius(20)
                .edgesIgnoringSafeArea(.top)
                .scrollIndicators(.never)
                .scrollBounceBehavior(.basedOnSize)
            }
        }
        
        
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
