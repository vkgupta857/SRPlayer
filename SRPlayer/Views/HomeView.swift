//
//  HomeView.swift
//  SRPlayer
//
//  Created on 02/05/22.
//  

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: SongViewModel = SongViewModel()
    @EnvironmentObject var player: PlayerViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.songs) { song in
                        SongRowView(song: song)
                            .onTapGesture {
                                withAnimation {
                                    player.showPlayer = true
                                    player.song = song
                                }
                            }
                    }
                }
                .padding(.horizontal, 20.0)
            }
            .onAppear() {
                viewModel.fetchSongs()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

