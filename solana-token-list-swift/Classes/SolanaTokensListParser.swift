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
        
        // parse json
        var list = try JSONDecoder().decode(SolanaTokensList.self, from: jsonData)
        
        // map tags
        list.tokens = list.tokens.map {
            var item = $0
            item.tags = item._tags.compactMap {
                list.tags[$0]
            }
            return item
        }
        
        // return list with mapped tags
        return list.tokens
    }
}
