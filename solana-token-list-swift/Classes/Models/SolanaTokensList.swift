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

public struct SolanaTokenTag: Decodable {
    public var name: String
    public var description: String
}

public struct SolanaToken: Decodable {
    let _tags: [String]
    private(set) var liquidity: Bool?
    
    public let chainId: Int
    public let address: String
    public let symbol: String
    public let name: String
    public let decimals: UInt
    public let logoURI: String?
    public var tags: [SolanaTokenTag] = []
    public let extensions: SolanaTokenExtensions?
    
    public var pubkey: String?
    public var lamports: UInt64?
    
    enum CodingKeys: String, CodingKey {
        case chainId, address, symbol, name, decimals, logoURI, extensions, _tags = "tags"
    }
    
    public var isLiquidity: Bool {
        liquidity == true
    }
    
    public static func nativeSolana(
        pubkey: String?,
        lamports: UInt64?
    ) -> SolanaToken {
        .init(
            _tags: ["stablecoin"],
            liquidity: true,
            chainId: 101,
            address: "So11111111111111111111111111111111111111112",
            symbol: "SOL",
            name: "Solana",
            decimals: 9,
            logoURI: nil,
            tags: [
                SolanaTokenTag(
                    name: "stablecoin",
                    description: "Tokens that are fixed to an external asset, e.g. the US dollar"
                )
            ],
            extensions: .init(
                website: "https://solana.com/",
                bridgeContract: nil
            ),
            pubkey: pubkey,
            lamports: lamports
        )
    }
}

public struct SolanaTokenExtensions: Decodable {
    public let website: String?
    public let bridgeContract: String?
}
