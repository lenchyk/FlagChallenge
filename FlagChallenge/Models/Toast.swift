//
//  ToastMessage.swift
//  FlagChallenge
//
//  Created by Lena Soroka on 18.02.2025.
//

import SwiftUI

struct Toast {
    let isCorrect: Bool
    
    var color: Color {
        isCorrect ? Color.green : Color.red
    }
    
    var text: String {
        isCorrect ? Common.Toast.success : Common.Toast.failure
    }
}
