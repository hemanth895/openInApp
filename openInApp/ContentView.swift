//
//  ContentView.swift
//  openInApp
//
//  Created by hemanth on 4/27/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var index : Int = 0
    
    @EnvironmentObject var apiResponseHolder: ApiResponseHolder


    var body: some View {
        
        
        
        GeometryReader { geometry in
            
            VStack(spacing:0){
                

                
                ZStack{
                    
                    if self.index == 0{
                        HomeView()
                            .frame(width: geometry.size.width)

                    }else if self.index == 1{
                        Color.gray
                        
                    }else if self.index == 2{
                        Color.green
                        

                        
                    }else if self.index == 3{
                        Color.accentColor
                        
                    }else{
                        Color.blue
                        
                    }
                    
                    
                    
                }
                .padding(.bottom,-35)
                
                CustomTabsView(index: self.$index)
                    .frame(height: 35)
                    .frame(width: geometry.size.width)
                    .background(Color.white)
                    .edgesIgnoringSafeArea(.bottom)// Optional: Add background color to the tab bar
                
            }
            .background(Color.black.opacity(0.05))
        }
      


        
    }

   
  
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
