//
//  HomeView.swift
//  CinemaApp
//
//  Created by ti1ek on 09.02.2024.
//

import SwiftUI

struct CardsView: View {
    
    @ObservedObject var viewModel: CardsViewModel
    
    @State var currentIndex: Int = 0
    @State var posts: [Card] = []
    
    var body: some View {
        
        VStack(spacing: 15){
            VStack(alignment: .leading, spacing: 12) {
                Text("My Favourite Films")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .padding(10)
                    .foregroundStyle(.secondary)
                
                SnapCarousel(index: $currentIndex, items: posts) {post in
            
                    GeometryReader{proxy in
                        let size = proxy.size
                        Image(post.postImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width)
                            .cornerRadius(12)
                            .onTapGesture {
                                viewModel.selectPost(post)
                            }
                    }
                }
                .padding(.vertical,40)
            }
            .frame(maxHeight: .infinity,alignment: .top)
            .onAppear {
                for index in 1...7 {
                    posts.append(Card(postImage: "post\(index)"))
                }
            }
        }
    }
}
