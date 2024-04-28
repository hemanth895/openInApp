//
//  LinksView.swift
//  openInApp
//
//  Created by hemanth on 4/27/24.
//

import SwiftUI

struct LinksView: View {
    
    
    @EnvironmentObject var apiResponseHolder: ApiResponseHolder

    var body: some View {
        
        VStack(spacing:10){
            
            
            BannerView()
            Spacer()
            
            Links()

           
            
            Spacer()
            
            VStack(spacing:10){
                
                HelpView(imageName: "whatsapp", text: "Talk With us", color: Color.green)
                
                Spacer()
                
                HelpView(imageName: "enquiry", text: "Frequently Asked Questions", color: Color("primary_color"))
                
                Spacer()

                
            }
            
            
            Spacer()
        }
        .padding(16)
        
        
    }
}

struct LinksView_Previews: PreviewProvider {
    static var previews: some View {
        LinksView()
    }
}











