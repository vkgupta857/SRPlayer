//
//  MainView.swift
//  SRPlayer
//
//  Created on 02/05/22.
//  

import SwiftUI

/// Initial View with Tabbar
struct MainView: View {
    
    var songs: [Song] = []
    
    @State var selectedTab = 0
    
    @State var player = PlayerViewModel()
    
    var tabImages = ["Home", "Search", "Library"]
    
    var body: some View {
        VStack {
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                    switch selectedTab {
                    case 0:
//                        SearchView()
                        NavigationView {
                            HomeView()
                                .navigationTitle("Media List")
                                .environmentObject(player)
                        }
                    case 1:
                        SearchView()
                    case 2:
                        LibraryView()
                    default:
                        HomeView()
                            .navigationTitle("Media List")
                            .environmentObject(player)
                    }
                
                    PlayerView(expandPlayer: $player.expandPlayer, showPlayer: $player.showPlayer)
                        .transition(.move(edge: .bottom))
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    player.offset = value.translation.height
                                }
                                .onEnded { _ in
                                    withAnimation {
                                        if player.offset > 10 && player.expandPlayer {
                                            player.expandPlayer = false
                                        } else if !player.expandPlayer && player.offset < -10 {
                                            player.expandPlayer = true
                                        }
                                    }
                                    player.offset = 0
                                }
                        )
                        .environmentObject(player)
                
                    HStack {
                        ForEach(0..<3) { num in
                            Button(action: {
                                selectedTab = num
                            }, label: {
                                Spacer()
                                VStack {
                                    Image(tabImages[num])
                                        .resizable()
                                        .frame(width: 30, height: 30, alignment: .center)
                                    if num == selectedTab {
                                        Text(tabImages[num].uppercased())
                                            .bold()
                                            .font(.system(size: 14))
                                    }
                                }
                                Spacer()
                            })
                            .foregroundColor(.black)
                        }
                    }
                    .padding(.all, 8)
                    .background(Color(.systemGray3))
                    .frame(height: player.tabHeight + 10)
                    .border(Color.init(.gray))
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
        }
    }
}

