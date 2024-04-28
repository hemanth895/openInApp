//
//  Links.swift
//  openInApp
//
//  Created by hemanth on 4/27/24.
//

import SwiftUI

struct Links: View {
    @EnvironmentObject var apiResponseHolder: ApiResponseHolder
    
    
    @State var type = 0
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button(action: {
                    // Action to perform when the first button is tapped
                    print("Top Links Button tapped")
                    type = 0
                }) {
                    Text("Top Links")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .fontWeight(.semibold)
                        .foregroundColor(type  == 0 ? .white : .gray)
                        .background(type  == 0 ? Color.accentColor : .white)
                        .cornerRadius(20)
                }
                
                
                
                
                Button(action: {
                    // Action to perform when the first button is tapped
                    print("Top Links Button tapped")
                    type = 1
                }) {
                    Text("Recent Links")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .fontWeight(.semibold)
                        .foregroundColor(type  == 1 ? .white : .gray)
                        .background(type  == 1 ? Color.accentColor : .white)
                        .cornerRadius(20)

                }
                
                
              
                
                Spacer()
                
                
                
                Button(action: {
                    // Action to perform when the first button is tapped
                    
                    type = 2
                }) {
                    Image("search")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                      
                }
                .frame(width: 40,height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 0.5)
                )
                
             
            }
            
            
            
            
            
            VStack(spacing: 20){
                
                
                
                if type == 0 {
                    if let topLinks = apiResponseHolder.response?.data.top_links {
                        ForEach(0..<topLinks.count) { index in
                            let item = topLinks[index]
                            // Render a custom view for each item
                            Link(link:item)
                                .cornerRadius(10)

                        }
                    }
                } else if type == 1 {
                    if let topLinks = apiResponseHolder.response?.data.recent_links {
                        ForEach(0..<topLinks.count) { index in
                            let item = topLinks[index]
                            // Render a custom view for each item
                            Link(link:item)
                                .cornerRadius(10)

                        }
                    }
                         
                }
                            
            }

            
            
            Spacer(minLength: 16)
            
            Button(action: {
                // Action to perform when the button is tapped
                print("View All Links Button tapped")
                print(apiResponseHolder.response?.data.top_links.count)
            }) {
                HStack(spacing: 10) {
                    Spacer()
                    
                    Image("link")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                    
                    Text("View All Links")
                        .font(.headline)
                        .foregroundColor(Color.black)
                    
                    Spacer()
                }
                .padding()
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 0.5)
                )
            }
        }
    }
}

struct Links_Previews: PreviewProvider {
    static var previews: some View {
        Links()
    }
}
