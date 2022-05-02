//
//  Song.swift
//  SRPlayer
//
//  Created on 02/05/22.
//  

import Foundation

struct Song: Codable, Identifiable {
    public var id: Int
    public var name: String
    public var artist: String
}
