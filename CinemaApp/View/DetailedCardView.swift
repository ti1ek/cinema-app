//
//  CardView.swift
//  CinemaApp
//
//  Created by ti1ek on 09.02.2024.
//

import SwiftUI

struct DetailedCardView: View {
    @ObservedObject var viewModel: DetailedCardViewModel

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(viewModel.post.postImage)
                .resizable()
                .aspectRatio(contentMode: .fit)

            Button(action: {
                viewModel.close()
            }) {
                Image(systemName: "xmark")
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.white)
                    .clipShape(Circle())
            }
            .padding() 
        }
    }
}
