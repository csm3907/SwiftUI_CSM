//
//  ComposeView.swift
//  SwiftUIMemo
//
//  Created by USER on 2023/05/22.
//

import SwiftUI

struct ComposeView: View {
    
    // 만약 body 에서 observe가 필요 없다면? -> 그냥 property wrapper 없이 만들어 주면 되는 것이다.
    //var memo: Memo? = nil
    
    var memo: MemoEntity? = nil
    
    //@EnvironmentObject var store: MemoStore
    
    @EnvironmentObject var manager: CoreDataManager
    
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = "" // State Variable 이라고 한다.
    
    /*
     SwiftUI는 state로 선언한 모든 프로퍼티의 스토리지를 관리.
     state 값이 변경되면 view가 appearance를 invalidates하고 body를 다시 계산(recomputes)합니다.
     view의 body에서만 state프로퍼티에 접근 할 것
     
     1. 상태값이 변경되면 View를 다시 계산하고 업데이트 합니다.
     2. 인스턴스 값이 아니라 값을 읽고 쓰는 수단입니다.
     3. 주의할 점은 뷰의 바디 안에서 또는 뷰에서 호출한 메소드에서만 접근해야 하므로 뷰의 클라이언트가 접근하지 못하도록 private로 선언해야 합니다.
     4. 사용할 때는 $와 함께 사용하면 됩니다.
     5. 그냥 변수로 쓸 경우 View Structure 안에서 self 의 값을 변경이 불가능 하므로 mutating 을 쓰라고 나온다. 하지만 body의 경우 이미 Protocol 내부에서 mutating 으로 정의가 되어 있지 않으므로 @State 를 통해서만 값을 쓰고, 읽을수 있게 되는 것이다.
     6. 뷰가 접근 가능하도록 값을 가지고 있는 프로퍼티 래퍼(Property Wrapper)
     
     참고 사항으로 $ 의 경우 property wrapper 의 wrapped Value 의 값을 바로 가져올때 ( getter 를 통해서 가져오는것이 아닐때 ) 사용을 한다.
     */
    
    var body: some View {
        
        #if os(macOS)
        VStack {
            TextEditor(text: $content) // content 와 TextEditor가 binding 이 된다. 달러가 필요하다. two-way binding 이라고 한다.
                .padding()
                .onAppear {
                    if let memo = memo?.content {
                        content = memo
                    }
                }
            
            HStack {
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Text("취소")
                }
                
                Button {
                    if let memo = memo {
                        //store.update(memo: memo, content: content)
                        manager.update(memo: memo, content: content)
                    } else {
                        //store.insert(memo: content) // 저장 시작
                        manager.addMemo(content: content)
                    }
                    
                    dismiss()
                } label: {
                    Text("저장")
                }
                .buttonStyle(.borderedProminent)
                
            }
        }
        .padding()
        .frame(minWidth: 500, minHeight: 300)
        #else
        
        NavigationView {
            VStack {
                TextEditor(text: $content) // content 와 TextEditor가 binding 이 된다. 달러가 필요하다. two-way binding 이라고 한다.
                    .padding()
                    .onAppear {
                        if let memo = memo?.content {
                            content = memo
                        }
                    }
                
            }
            .navigationTitle(memo != nil ? "메모편집" : "새 메모")
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .toolbar { // Navigation Tool Bar 추가 진행
                ToolbarItemGroup(placement: .navigationBarLeading) { // 왼쪽 Navigation Item 추가 진행
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) { // 오른쪽 Navigation Item 추가 진행
                    Button {
                        if let memo = memo {
                            //store.update(memo: memo, content: content)
                            manager.update(memo: memo, content: content)
                        } else {
                            //store.insert(memo: content) // 저장 시작
                            manager.addMemo(content: content)
                        }
                        
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }
                
            }
        }
    #endif
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            //.environmentObject(MemoStore())
            .environmentObject(CoreDataManager.shared)
    }
}
