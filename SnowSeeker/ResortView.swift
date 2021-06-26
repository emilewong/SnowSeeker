//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Emile Wong on 25/6/2021.
//

import SwiftUI

struct ResortView: View {
    // MARK: - PROPERTIES
    let resort: Resort
    @Environment(\.horizontalSizeClass) var sizeClass
    @State private var selectedFaility: Facility?
    @EnvironmentObject var favorites: Favorites
    
    // MARK: - BODY
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0, content: {
                ZStack {
                    Image(decorative: resort.id)
                        .resizable()
                        .scaleEffect()
                    VStack {
                        Spacer()
                        HStack{
                            Spacer()
                            Text("Image Credit: \(resort.imageCredit)")
                                .font(.footnote)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.blue).opacity(0.7)
                                .clipShape(Capsule())
                                .shadow(radius: 10)
                        }
                    }
                    
                }
                
                HStack {
                    if sizeClass == .compact {
                        Spacer()
                        VStack { ResortDetailView(resort: resort) }
                        VStack { SkiDetailView(resort: resort) }
                        Spacer()
                    } else {
                        ResortDetailView(resort: resort)
                        Spacer().frame(height: 0)
                        SkiDetailView(resort: resort)
                    }
                }
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.top)
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            facility.icon
                                .font(.title)
                                .onTapGesture {
                                    self.selectedFaility = facility
                                }
                        }
                    }
                        .padding(.vertical)
                }
                .padding(.horizontal)
            })
            
            Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
                if self.favorites.contains(self.resort) {
                    self.favorites.remove(self.resort)
                } else {
                    self.favorites.add(self.resort)
                }
            }
            .padding()
        }
        .navigationBarTitle(Text("\(resort.name), \(resort.country)"), displayMode: .inline)
        .alert(item: $selectedFaility, content: { facility in
            facility.alert
        })
    }
}

// MARK: - PREVIEW
struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: Resort.example)
    }
}
