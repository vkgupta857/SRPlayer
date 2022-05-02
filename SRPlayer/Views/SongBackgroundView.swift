//
//  SongBackgroundView.swift
//  SRPlayer
//
//  Created on 02/05/22.
//  

import SwiftUI

/// this view sets background for player view
struct SongBackgroundView: View {
    @Binding var expandPlayer: Bool
    var body: some View {
        if expandPlayer {
            ZStack {
                Image("background")
                    .resizable()
                Rectangle()
                    .foregroundColor(.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [.clear, .secondary, Color(.systemGray4), Color(.systemGray3)]), startPoint: .top, endPoint: .bottom))
            }
        } else {
            Rectangle()
                .foregroundColor(Color(.systemGray3))
        }
    }
}

