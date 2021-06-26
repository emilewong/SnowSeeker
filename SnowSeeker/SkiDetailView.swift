//
//  SkiDetailView.swift
//  SnowSeeker
//
//  Created by Emile Wong on 25/6/2021.
//

import SwiftUI

struct SkiDetailView: View {
    // MARK: - PROPERTIES
    let resort: Resort
    
    // MARK: - BODY
    var body: some View {
        Group {
            Text("Elevation: \(resort.elevation)m").layoutPriority(1)
            Spacer().frame(height: 0)
            Text("Snow: \(resort.snowDepth)cm").layoutPriority(1)
        }
    }
}
// MARK: - PREVIEW
struct SkiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailView(resort: Resort.example)
    }
}
