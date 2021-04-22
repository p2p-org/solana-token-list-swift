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
    var tokens: [SolanaToken]
}

public struct SolanaTokenTag: Hashable, Decodable {
    public var name: String
    public var description: String
}

public struct SolanaToken: Hashable, Decodable {
    public init(_tags: [String], chainId: Int, address: String, symbol: String, name: String, decimals: UInt, logoURI: String?, tags: [SolanaTokenTag] = [], extensions: SolanaTokenExtensions?) {
        self._tags = _tags
        self.chainId = chainId
        self.address = address
        self.symbol = symbol
        self.name = name
        self.decimals = decimals
        self.logoURI = logoURI
        self.tags = tags
        self.extensions = extensions
    }
    
    let _tags: [String]
    
    public let chainId: Int
    public let address: String
    public let symbol: String
    public let name: String
    public let decimals: UInt
    public let logoURI: String?
    public var tags: [SolanaTokenTag] = []
    public let extensions: SolanaTokenExtensions?
    
    enum CodingKeys: String, CodingKey {
        case chainId, address, symbol, name, decimals, logoURI, extensions, _tags = "tags"
    }
}

public struct SolanaTokenExtensions: Hashable, Decodable {
    public let website: String?
    public let bridgeContract: String?
}
