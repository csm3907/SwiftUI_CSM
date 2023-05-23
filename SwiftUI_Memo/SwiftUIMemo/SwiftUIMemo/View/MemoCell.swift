//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by USER on 2023/05/22.
//

import SwiftUI

struct MemoCell: View {
    
    // 이것을 선언하면 알아서 initializer에 추가가 된다.
    //@ObservedObject var memo: Memo // memo 가 업데이트 되는 순간 마다 view가 update된다.
    @ObservedObject var memo: MemoEntity
    // ObservableObject를 관찰할 수 있다
    // 관찰 가능한 객체를 구독하고 관찰 가능한 객체가 변경될 때마다 View를 invalidate 속성 래퍼 유형입니다.
    /*
     ObservableObject가 변화하는 언제든 View를 만료시킨다고 적혀있다. 이 말을 Publisher가 보내주는 신호에 따라 변경되면 View를 만료시키고 새로 그린다고 이해할 수 있다.
     State 변수가 변화하면, 해당 변수를 사용하고 있는 하위 SubView들은 모두 초기화된다.
     
     */
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content ?? "")
                .font(.body)
                .lineLimit(1)
            
            Text(memo.insertDate ?? .now, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        //MemoCell(memo: Memo(content: "Test"))
        MemoCell(memo: MemoEntity(context: CoreDataManager.shared.mainContext))
    }
}
