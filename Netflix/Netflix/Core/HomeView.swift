//
//  HomeView.swift
//  Netflix
//
//  Created by ALYSSON MENEZES on 13/08/25.
//

import SwiftUI
import SwiftfulRouting

struct HomeView: View {
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    
    @Environment(\.router) var router
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            
            VStack (spacing: 0){
               header
                    .padding(.horizontal, 16)
                
                FilterBarView(
                    filters: filters,
                    onXMarkPressed: {
                        selectedFilter = nil
                    },
                    onFilterPressed: { newFilter in
                        selectedFilter = newFilter
                    },
                    selectedFilter: selectedFilter)
                .padding(.top, 16)
                
                Spacer()
            }
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var header: some View {
        HStack (spacing: 0){
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            }
        }
    }
}

#Preview {
    RouterView {router in
        HomeView()
    }
}
