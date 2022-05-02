//
//  PlayerView.swift
//  SRPlayer
//
//  Created on 02/05/22.
//  

import SwiftUI

/// Player View and related controls
struct PlayerView: View {
    
    @State var silderValue: Double = 5
    @State var isMiniPlayer: Bool = false
    @EnvironmentObject var player: PlayerViewModel
    @Binding var expandPlayer: Bool
    @Binding var showPlayer: Bool
    
    var height = UIScreen.main.bounds.height / 3
    var width = UIScreen.main.bounds.width - 100

    var body: some View {
        if showPlayer {
            VStack(alignment: .leading) {
                if expandPlayer {
                    Button {
                        withAnimation {
                            expandPlayer = false
                        }
                    } label : {
                        Image(systemName: "chevron.down")
                            .frame(width: 50, height: 50, alignment: .center)
                            .foregroundColor(.white)
                    }
                }
                HStack(alignment: .center) {
                    Image("thumbnail")
                        .resizable()
                        .frame(maxWidth: expandPlayer ? width : 40, maxHeight: expandPlayer ? height : 40, alignment: .center)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(8)
                        .padding(.horizontal, expandPlayer ? 50 : 0)
                    if !expandPlayer {
                        VStack (alignment: .leading) {
                            Text(player.song?.name ?? "")
                                .font(.subheadline)
                                .bold()
                            Text(player.song?.artist ?? "")
                                .bold()
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Button(action: {
                            withAnimation(.spring()) {
                                expandPlayer = false
                            }
                        }, label: {
                            Image("pause_small")
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .center)
                        })
                        Button(action: {
                            withAnimation(.spring()) {
                                showPlayer = false
                                expandPlayer = true
                            }
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 15, height: 15, alignment: .center)
                                .foregroundColor(.black)
                        })
                    }
                }
                .padding(.horizontal, expandPlayer ? 0 : 15)
                .padding(.vertical, expandPlayer ? 0 : 5)
                .onTapGesture {
                    withAnimation(.spring()) {
                        expandPlayer = true
                    }
                }
                
                if expandPlayer {
                    VStack (alignment: .leading) {
                        Text(player.song?.name ?? "")
                            .bold()
                            .font(.title3)
                        Text(player.song?.artist ?? "")
                            .bold()
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Slider(value: $silderValue, in: 0...10)
                            .accentColor(.init(red: 39/255, green: 48/255, blue: 253/255))
                        HStack {
                            Text("1:15")
                                .font(.body)
                            Spacer()
                            Text("4:05")
                                .font(.body)
                        }
                        HStack {
                            Spacer()
                            Image("pause")
                                .resizable()
                                .padding()
                                .frame(width: 80, height: 80, alignment: .center)
                            Spacer()
                        }
                    }
                    .padding()
                }
            }
            .frame(maxHeight: expandPlayer ? .infinity : 90)
            .background(SongBackgroundView(expandPlayer: $expandPlayer))
            .cornerRadius(expandPlayer ? 0 : 10)
            .offset(y: -player.tabHeight)
            .ignoresSafeArea()
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

