//
//  Country.swift
//  FlagChallenge
//
//  Created by Lena Soroka on 17.02.2025.
//

import Foundation

enum Country: String, CaseIterable {
    case andorra
    case albania
    case armenia
    case austria
    case bosniaAndHerzegovina = "Bosnia And Herzegovina"
    case belgium
    case bulgaria
    case switzerland
    case cyprus
    case czechia
    case germany
    case denmark
    case estonia
    case spain
    case finland
    case france
    case unitedKingdom = "United Kingdom"
    case georgia
    case greece
    case croatia
    case hungary
    case ireland
    case iceland
    case italy
    case jersey
    case luxembourg
    case latvia
    case monaco
    case moldova
    case netherlands
    case norway
    case poland
    case portugal
    case romania
    case serbia
    case sweden
    case slovenia
    case slovakia
    case ukraine
    case scotland
    case wales
    
    var name: String {
        self.rawValue.uppercased()
    }
    
    var flag: String {
        switch self {
        case .andorra: "🇦🇩"
        case .albania: "🇦🇱"
        case .armenia: "🇦🇲"
        case .austria: "🇦🇹"
        case .bosniaAndHerzegovina: "🇧🇦"
        case .belgium: "🇧🇪"
        case .bulgaria: "🇧🇬"
        case .switzerland: "🇨🇭"
        case .cyprus: "🇨🇾"
        case .czechia: "🇨🇿"
        case .germany: "🇩🇪"
        case .denmark: "🇩🇰"
        case .estonia: "🇪🇪"
        case .spain: "🇪🇸"
        case .finland: "🇫🇮"
        case .france: "🇫🇷"
        case .unitedKingdom: "🇬🇧"
        case .georgia: "🇬🇪"
        case .greece: "🇬🇷"
        case .croatia: "🇭🇷"
        case .hungary: "🇭🇺"
        case .ireland: "🇮🇪"
        case .iceland: "🇮🇸"
        case .italy: "🇮🇹"
        case .jersey: "🇯🇪"
        case .luxembourg: "🇱🇺"
        case .latvia: "🇱🇻"
        case .monaco: "🇲🇨"
        case .moldova: "🇲🇩"
        case .netherlands: "🇳🇱"
        case .norway: "🇳🇴"
        case .poland: "🇵🇱"
        case .portugal: "🇵🇹"
        case .romania: "🇷🇴"
        case .serbia: "🇷🇸"
        case .sweden: "🇸🇪"
        case .slovenia: "🇸🇮"
        case .slovakia: "🇸🇰"
        case .ukraine: "🇺🇦"
        case .scotland: "🏴󠁧󠁢󠁳󠁣󠁴󠁿"
        case .wales: "🏴󠁧󠁢󠁷󠁬󠁳󠁿"
        }
    }
}
