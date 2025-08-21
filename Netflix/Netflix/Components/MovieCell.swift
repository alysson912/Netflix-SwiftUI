//
//  MovieCell.swift
//  Netflix
//
//  Created by ALYSSON MENEZES on 21/08/25.
//

import SwiftUI

struct MovieCell: View {
    
    var width: CGFloat = 90
    var height: CGFloat = 140
    var imageName: String = Constants.randomImage
    var title: String? = "Movie Title"
    var isRecentlyAdded: Bool = false
    var topRanking: Int? = nil
    
    
    var body: some View {
        HStack (alignment: .bottom, spacing: -8){
            if let topRanking {
                Text("\(topRanking)")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                    .offset(y: 20)
            }
            ZStack (alignment: .bottom){
                ImageLoaderView(urlString: imageName)
                
                VStack (spacing: 0){
                    if let title, let firstWord = title.components(separatedBy: " ").first {
                        Text(title)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .lineLimit(1)
                        
                    }
                    
                    Text("Recently Added")
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .padding(.bottom, 2)
                        .background(.netflixRed)
                        .clipShape(RoundedRectangle(cornerRadius: 2))
                        .offset(y:2)
                        .lineLimit(1)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.1)
                        .padding(.horizontal, 8)
                        .opacity(isRecentlyAdded ? 1 : 0 )
                }
                .padding(.top, 6)
                .background(
                    LinearGradient(
                        colors: [
                            
                            .netflixBlack.opacity(0),
                            .netflixBlack.opacity(0.3),
                            .netflixBlack.opacity(0.4)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .clipShape(RoundedRectangle(cornerRadius: 4 ))
            .frame(width: width, height: height)
            
        }
        
        .foregroundStyle(.netflixWhite)
        //.background(.blue)
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ScrollView {
            VStack {
                MovieCell(isRecentlyAdded: true)
                MovieCell(isRecentlyAdded: false)
                MovieCell(isRecentlyAdded: true, topRanking: 10)
                MovieCell(isRecentlyAdded: false, topRanking: 1)
            }
        }
    }
}
