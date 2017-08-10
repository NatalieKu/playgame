//
//  Status.swift
//  playgame
//
//  Created by MEI KU on 2017/8/9.
//  Copyright © 2017年 Natalie KU. All rights reserved.
//

import Foundation
enum GameState {
    case start,win,draw
    
    var status: String {
        switch self {
        case .start:
            return "黑白配！男生女生配！"
        case .win:
            return "哈哈哈～你輸了!"
        case .draw:
            return "哼---沒中!"
            
        }
    }
}
