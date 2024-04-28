//
//  CurvedTabsView.swift
//  openInApp
//
//  Created by hemanth on 4/27/24.
//


import SwiftUI

struct CustomTabsView: View {
    @Binding var index: Int
    
    var body: some View {
        HStack {
            Button(action: {
                self.index = 0
            }) {
                TabBarItemView(imageName: "link", text: "Link", index: 0, selectedIndex: index)

            }
            .frame(maxWidth: .infinity)
            
            Button(action: {
                self.index = 1
            }) {
                TabBarItemView(imageName: "magzine", text: "Courses", index: 1, selectedIndex: index)

            }
            .frame(maxWidth: .infinity)
            
            Button(action: {
                self.index = 2
            }) {
                VStack {
                    Image("plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80) // Fixed size
                        .offset(y: -5)
                }
            }
            .frame(maxWidth: .infinity)
            
            Button(action: {
                self.index = 3
            }) {
                TabBarItemView(imageName: "fast_forward", text: "Campaigns", index: 3, selectedIndex: index)
            }
            .frame(maxWidth: .infinity)
            
            Button(action: {
                self.index = 4
            }) {
                TabBarItemView(imageName: "person", text: "Profile", index: 4, selectedIndex: index)

            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 24)
        .background(Color.white)
        .clipShape(CShape())
    }
}


struct CShape : Shape{
    
    func path(in rect: CGRect)->Path{
        return Path { path in
            
            path.move(to: CGPoint(x: 0, y: 35))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 35))
            
            path.addArc(center: CGPoint(x: rect.width/2, y: 35), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)

        }
    }
}

struct TabBarItemView: View {
    var imageName: String
    var text: String
    var index: Int
    var selectedIndex: Int
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20) // Fixed size
                .foregroundColor(Color.black.opacity(index == selectedIndex ? 1 : 0.5))
            Text(text)
                .font(.caption)
                .foregroundColor(Color.black.opacity(index == selectedIndex ? 1 : 0.5))
        }
    }
}



