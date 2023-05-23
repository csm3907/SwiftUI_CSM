//
//  DetailView.swift
//  SwiftUIMemo
//
//  Created by USER on 2023/05/22.
//

import SwiftUI

struct DetailView: View {
    
    // ObservableObject를 채택하는 class의 Published 로 선언된 변수가 변경이 될때마다 View가 변경이 된다.
    //@ObservedObject var memo: Memo
    @ObservedObject var memo: MemoEntity
    
    //@EnvironmentObject var store: MemoStore // Environment 로 받아온다.
   
    @EnvironmentObject var manager: CoreDataManager
    
    @EnvironmentObject var navigationState: NavigationState
    
    // Mac os 에서는 사용하지 않는다.
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    var placement: ToolbarItemPlacement {
        #if os(macOS)
        return .primaryAction
        #else
        if horizontalSizeClass == .regular {
            return .primaryAction
        } else {
            return .bottomBar
        }
        #endif
    }
    
    @State private var showComposer = false
    @State private var showDeleteAlert = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ScrollView { // default가 수직이다.
                VStack {
                    HStack {
                        Text(memo.content ?? "")
                            .padding()
                        
                        Spacer(minLength: 0)
                    }
                    
                    Text(memo.insertDate ?? .now, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("메모 보기")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .toolbar {
            ToolbarItemGroup(placement: placement) {
                Button {
                    showDeleteAlert = true
                } label: {
                    Image(systemName: "trash")
                }
                .foregroundColor(.red)
                .alert("삭제 확인", isPresented: $showDeleteAlert) { // alert 창 추가 진행
                    Button(role: .destructive) {
                        //store.delete(memo: memo)
                        manager.delete(memo: memo)
                        
                        #if os(iOS)
                        if horizontalSizeClass == .regular {
                            navigationState.listId = UUID() // Navigation 다시 그리기 id갓을 바꾸어서
                        } else {
                            dismiss()
                        }
                        #endif
                        
                        
                    } label: {
                        Text("삭제")
                    }
                } message: {
                    Text("메모를 삭제할까요?")
                }

                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }

            }
        }
        .sheet(isPresented: $showComposer) {
            ComposeView(memo: memo)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(memo: MemoEntity(context: CoreDataManager.shared.mainContext))
                .environmentObject(CoreDataManager.shared)
                .environmentObject(NavigationState())
        }
    }
}
