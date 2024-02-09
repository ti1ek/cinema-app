//
//  Home.swift
//  CinemaApp
//
//  Created by ti1ek on 09.02.2024.
//

import SwiftUI

struct Home: View {
    
    @State var currentIndex: Int = 0
    
    @State var posts: [Post] = []
    
    @State var currentTab = "Slide Show"
    @Namespace var animation
    
    var body: some View {
        
        VStack(spacing: 15){
            
            VStack(alignment: .leading, spacing: 12) {
                
                // Snap Carousel....
                SnapCarousel(index: $currentIndex, items: posts) {post in
                    
                    GeometryReader{proxy in
                        
                        let size = proxy.size
                        
                        Image(post.postImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width)
                            .cornerRadius(12)
                    }
                }
                .padding(.vertical,40)
            }
            .frame(maxHeight: .infinity,alignment: .top)
            .onAppear {
                for index in 1...5{
                    posts.append(Post(postImage: "post\(index)"))
                }
            }
        }
    }
}

#Preview {
    Home()
}
    
