//
//  BannerView.swift
//  openInApp
//
//  Created by hemanth on 4/27/24.
//

import SwiftUI

struct BannerView: View{
    
    
    @EnvironmentObject var apiResponseHolder: ApiResponseHolder
    
    
   

    

    
    var body: some View{
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM"
        let currentDate = dateFormatter.string(from: Date())
        
        
        
        return VStack(spacing:20){
            
            
            //greeting View
            
            Spacer()
            
            HStack{
                VStack{
                    Text("Good Morning")
                        .font(.footnote)
                        .foregroundColor(Color.black.opacity(0.5))
                    
                    
                    Spacer()
                    
                    Text("Hemanth   ")
                        .font(.headline)
                        .foregroundColor(Color.black)
                    
                }
                Spacer()
            }
            
            
            
            VStack{
                
                //ChartView
                
                
                
                VStack{
                    
                    Spacer()
                    
                    HStack(alignment: .center){
                        Text("Overview")
                            .font(.footnote)
                            .foregroundColor(Color.black.opacity(0.5))
                        
                        
                        
                        Spacer()
                        
//
                        Button(action: {
                               }) {
                                   HStack(spacing: 0) {
                                       
                                       Text(currentDate)
                                           .font(.headline)
                                           .fontWeight(.regular)
                                           .foregroundColor(Color.black)
                                           .padding(8)

                                       
                                       Image("time") // Example image, replace with your image
                                           .resizable()
                                           .aspectRatio(contentMode: .fit)
                                           .frame(width: 20, height: 20)
                                           .padding(8)
                                       
                                   }
                                   .cornerRadius(5) // Add corner radius to the button
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray, lineWidth: 0.5) // Add thin border around the button
                                   )
                               }
                        
                        
                        
                       
                        
                    }
                    
                    
                    
                    if let dataPoints = apiResponseHolder.response?.data.overall_url_chart{
                        LineChart(dataPoints:dataPoints)
                                       .frame(height: 200)
                    }
                   
                    
                  
                }
                .padding(8)
                .background(.white)
                .cornerRadius(10)
            }
            
            
                ScrollView(.horizontal, showsIndicators: false) {
                           HStack(spacing: 20) { // Adjust spacing between views as needed
                               

                               
                               CarouselItem(imageName: "eclipse", title: "\(apiResponseHolder.response?.total_clicks ?? 0)", subTitle: "Today's Clicks")
                               CarouselItem(imageName: "pin", title: "\(apiResponseHolder.response?.top_location ?? "")", subTitle: "Top Location")
                               CarouselItem(imageName: "internet", title: "\(apiResponseHolder.response?.top_source ?? "")", subTitle: "Top Source")
                               CarouselItem(imageName: "software", title: "\(apiResponseHolder.response?.total_clicks ?? 0)", subTitle: "Todays Clicks")

                               }
                           }

            

            
            
                
                
                //View Analytics Btn
                
                Button(action: {
                           // Action to perform when the button is tapped
                           print("Button tapped")
                       }) {
                           HStack(spacing: 10) { // Adjust spacing between image and text as needed
                               
                               Spacer()
                               
                               Image("price_boost") // Example image, replace with your image
                                   .resizable()
                                   .aspectRatio(contentMode: .fill)
                                   .frame(width: 20, height: 20) // Adjust image size as needed
                               
                               
                               Text("View Anaytics")
                                   .font(.headline) // Adjust text font and style as needed
                                   .foregroundColor(Color.black) // Adjust text color as needed
                               
                               Spacer()
                           }
                           .padding() // Add padding to the HStack
                           .cornerRadius(5) // Add corner radius to the button
                           .overlay(
                               RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 0.5) // Add thin border around the button
                           )
                       }

                
                

            }


        }
        
        
    
}


struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}




