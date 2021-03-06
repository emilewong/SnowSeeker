//
//  ResortDetailView.swift
//  SnowSeeker
//
//  Created by Emile Wong on 25/6/2021.
//

import SwiftUI

struct ResortDetailView: View {
    // MARK: - PROPERTIES
    let resort: Resort
    
    var size: String {
        switch resort.size {
            case 1:
                return "Small"
            case 2:
                return "Average"
            default:
                return "Large"
        }
    }
    
    var price: String {
        String(repeating: "$", count: resort.price)
    }
    
    // MARK: - BODY
    var body: some View {
        Group {
            Text("Size: \(size)").layoutPriority(1)
            Spacer().frame(height: 0)
            Text("Price: \(price)").layoutPriority(1)
        }
    }
}
// MARK: - PREVIEW
struct ResortDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ResortDetailView(resort: Resort.example)
    }
}
