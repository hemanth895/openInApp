//
//  LineGraph.swift
//  openInApp
//
//  Created by hemanth on 4/28/24.
//

import SwiftUI

struct LineChart: View {
    let dataPoints: [String: Int]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Draw the grid lines
                ForEach(0..<5, id: \.self) { index in
                    let y = geometry.size.height / 5 * CGFloat(index)
                    
                    // Draw horizontal grid lines
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: y))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: y))
                    }
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    
                    // Add indicator values for y-axis
                    Text("\(Int((5 - CGFloat(index)) * 0.25 * CGFloat(dataPoints.values.max() ?? 0)))")
                        .font(.caption)
                        .position(x: -20, y: y) // Adjust the position of the label
                }
                
                ForEach(dataPoints.sorted(by: { $0.key < $1.key }).indices, id: \.self) { index in
                    let x = geometry.size.width / CGFloat(dataPoints.count - 1) * CGFloat(index)
                    
                    // Draw vertical grid lines
                    Path { path in
                        path.move(to: CGPoint(x: x, y: 0))
                        path.addLine(to: CGPoint(x: x, y: geometry.size.height))
                    }
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    
                    // Add indicator values for x-axis
                    Text(dataPoints.sorted(by: { $0.key < $1.key })[index].key)
                        .font(.caption)
                        .position(x: x, y: geometry.size.height + 15) // Adjust the position of the label
                }
                
                // Draw the chart lines
                Path { path in
                    guard let maxY = dataPoints.values.max(), maxY > 0 else {
                        return
                    }
                    
                    let stepX = geometry.size.width / CGFloat(dataPoints.count - 1)
                    
                    for (index, (_, occurrences)) in dataPoints.sorted(by: { $0.key < $1.key }).enumerated() {
                        let x = stepX * CGFloat(index)
                        let y = geometry.size.height - (CGFloat(occurrences) / CGFloat(maxY)) * geometry.size.height
                        let point = CGPoint(x: x, y: y)
                        
                        if index == 0 {
                            path.move(to: point)
                        } else {
                            path.addLine(to: point)
                        }
                    }
                }
                .stroke(Color.blue, lineWidth: 2)
            }
        }
    }
}


struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart(dataPoints:[:])
    }
}
