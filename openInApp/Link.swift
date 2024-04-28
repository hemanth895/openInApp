//
//  Link.swift
//  openInApp
//
//  Created by hemanth on 4/27/24.
//

import SwiftUI

struct Link: View {
    var link: LinkX
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 20) {
                AsyncImage(url: URL(string: link.original_image)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding()
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            )
                    case .failure(let error):
                          Image("person")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding()
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            )
                    case .empty:
                        ProgressView()
                    @unknown default:
                        ProgressView()
                    }
                }

                
                    
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(link.title)
                        .font(.caption)
                        .foregroundColor(.black)
                        .lineLimit(1, reservesSpace: false)
                    Text(formatDate(link.created_at)) // Use formatDate function to format the date
                        .font(.footnote)
                        .foregroundColor(.black.opacity(0.5))
                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 6) {
                    Text("\(link.total_clicks)")
                        .font(.caption)
                        .foregroundColor(.black)

                    Text("Clicks")
                        .font(.footnote)
                        .foregroundColor(.black.opacity(0.5))
                }
            }
            .padding(8)
            
            HStack {
                Text(link.web_link)
                    .font(.footnote)
                    .foregroundColor(Color("primary_color"))
                
                Spacer()
                
                Button(action: {
                    
                    UIPasteboard.general.string = link.web_link
                    
                    
                    print(link.web_link)

                    
                }, label: {
                    Image("copy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color("primary_color"))
                })
                
             
            }
            .padding( 8)
            .background(Color("primary_color").opacity(0.2))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(style: StrokeStyle(lineWidth: 0.5, dash: [3]))
                    .foregroundColor(Color("primary_color"))
            )
        }
        .background(.white)
        
    }
    
    
    // Function to format the date
        func formatDate(_ dateString: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Input format
            
            if let date = dateFormatter.date(from: dateString) {
                dateFormatter.dateFormat = "dd MMM yyyy" // Output format
                let formattedDate = dateFormatter.string(from: date)
                return formattedDate
            } else {
                return dateString // Return original string if formatting fails
            }
        }
}



struct Link_Previews: PreviewProvider {
    static var previews: some View {
        Link(link: LinkX(url_id: 1, web_link: "", smart_link: "", title: "", total_clicks: 123, original_image: "", thumbnail: "", times_ago: "", created_at: "", domain_id: "", url_prefix: "", url_suffix: "", app: "", is_favourite: false))
    }
}
