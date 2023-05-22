//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by USER on 2023/05/22.
//

import SwiftUI

struct MainListView: View {
    
    @EnvironmentObject var store: MemoStore // 이전에 environmentObject로 등록한 instance 를 가져오는 것이다. (Type이 같으면)
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.list) { memo in
                    NavigationLink {
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo) 
                    }
                }
                .onDelete(perform: store.delete) // For Each 안에 만들어 주어야 한다.
                /*
                List(store.list) { memo in
                    NavigationLink { // Navigation 으로 Push 방식 이동을 할때 만들어 준다. List 내부에 있을 경우 > 화살표를 default로 생성
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo) // Command + Shift + A 로 embed in SubView를 통해서 바로 분리가 가능하다.
                    }
                }
                 */
            }
            .listStyle(.plain)
            .navigationTitle("내 메모") // Modifier 로 View를 조작한다.
            .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showComposer) { // Modal 방식으로 present 하는 방법이다.
                ComposeView()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}


