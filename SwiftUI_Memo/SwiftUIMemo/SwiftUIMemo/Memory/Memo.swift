//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by USER on 2023/05/22.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject { // identifiable 은 List 에서 사용, ObservableObject 는 binding을 위해서 채택
    let id: UUID
    @Published var content: String // 새로운 값을 저장 할 때마다 binding 된 UI 가 update 된다.
    let insertDate: Date
    
    // ObservableObject -> objectWillChange 를 통해 언제 변동되는지 정해준다.
    
    init(content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
