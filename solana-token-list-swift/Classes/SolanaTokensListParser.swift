//
//  SolanaTokensListParser.swift
//  solana-token-list-swift
//
//  Created by Chung Tran on 21/04/2021.
//

import Foundation

protocol SolanaTokensListParserType {
    var list: [SolanaTokensList] {get set}
}

class SolanaTokensListParser: SolanaTokensListParserType {
    var list = [SolanaTokensList]()
    
}
