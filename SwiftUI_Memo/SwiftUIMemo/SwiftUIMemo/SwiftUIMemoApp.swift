//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by USER on 2023/05/22.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var store = MemoStore()
    /*
     A property wrapper type that instantiates an observable object.
     ObservableObject를 객체화한다
     StateObject는 ObservedObject와 거의 똑같으나, 이 StateObject는 하나의 객체로 만들어지고, View가 얼마나 초기화되든지 상관없이 별개의 객체로 관리 즉 View의 Life-cycle에 관계 없이 메모리에서 관리가 됨을 의미한다.
     애플이 추천하는 StateObject와 ObservedObject의 사용법은 Observable Object를 처음 초기화할 때는 StateObject를 사용하고, 이미 객체화된 것을 넘겨 받을 때 ObservedObject의 사용을 추천
     */

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environmentObject(store)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

