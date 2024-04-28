//
//  CarousalItem.swift
//  openInApp
//
//  Created by hemanth on 4/27/24.
//

import SwiftUI

struct CarouselItem: View {
    
    
    var imageName: String
    var title: String
    var subTitle: String
    
//    var color:Color
    

    var body: some View {
    
            
            VStack(alignment: .leading) {
                Image(imageName) // Use system image
                    .resizable()
                    .frame(width: 35, height: 35) // Adjust size as needed
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle()) // Apply circular clipping mask

                Spacer()
                Spacer()

                
                Text(title)
                    .font(.title2)
                
                Spacer()
                
                Text(subTitle)
                    .font(.footnote)
                    .foregroundColor(.black.opacity(0.3))
                
                Spacer()

            }
            .frame(width: 120, height: 120)
            .padding(.horizontal,8)
            .padding(.vertical,16)
            .background(.white)
            .cornerRadius(10)
        }
    }


struct CarouselItem_Previews: PreviewProvider {
    static var previews: some View {
        CarouselItem(imageName: "links", title: "Top Links", subTitle: "Recent")
    }
}
