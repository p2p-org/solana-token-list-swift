//
//  SolanaTokensListParser.swift
//  solana-token-list-swift
//
//  Created by Chung Tran on 21/04/2021.
//

import Foundation

public class SolanaTokensListParser {
    public init() {}
    
    public func parse() throws -> [SolanaToken] {
        // get json file
        let bundle = Bundle(for: SolanaTokensListParser.self)
        let path = bundle.path(forResource: "tokens", ofType: "json")
        let jsonData = try Data(contentsOf: URL(fileURLWithPath: path!))
        let list = try JSONDecoder().decode(SolanaTokensList.self, from: jsonData)
        return list.tokens
    }
}
