//
//  SolanaTokensList.swift
//  solana-token-list-swift
//
//  Created by Chung Tran on 21/04/2021.
//

import Foundation

struct SolanaTokensList: Decodable {
    let name: String
    let logoURI: String
    let keywords: [String]
    let tags: [String: SolanaTokenTag]
    let timestamp: String
    let tokens: [SolanaToken]
}

public struct SolanaTokenTag: Decodable {
    public var name: String
    public var description: String
}

public struct SolanaToken: Decodable {
    public let chainId: Int
    public let address: String
    public let symbol: String
    public let name: String
    public let decimals: UInt
    public let logoURI: String?
    public var tags: [SolanaTokenTag] = []
    public let extensions: SolanaTokenExtensions?
    
    enum CodingKeys: String, CodingKey {
        case chainId, address, symbol, name, decimals, logoURI, extensions
    }
}

public struct SolanaTokenExtensions: Decodable {
    public let website: String?
    public let bridgeContract: String?
}
