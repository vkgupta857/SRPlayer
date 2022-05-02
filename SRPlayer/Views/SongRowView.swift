//
//  SongRowView.swift
//  SRPlayer
//
//  Created on 02/05/22.
//  

import SwiftUI

struct SongRowView: View {
    
    var song: Song = Song(id: 1, name: "Song", artist: "Artist")
    
    var body: some View {
        HStack {
            Image("thumbnail")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(song.name)
                    .bold()
                Text(song.artist)
                    .bold()
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

struct SongRowView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
