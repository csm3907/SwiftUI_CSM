//
//  SwiftUI_TestApp.swift
//  SwiftUI_Test
//
//  Created by USER on 2023/05/12.
//

import SwiftUI

// Compiler 가 Main 을 자동으로 합성하게 되고, OS 역시 가장 먼저 수행을 하게 된다.
// 합성된 Main 이 실행 되고 있다.

/*
 App 이라는 프로토콜을 채택하고 있다.
 Main 함수의 기본을 제공한다.
 body 부분이 App Protocol 이 요구하는 속성이고 Scene을 return 하게 된다.
 WindowGroup 은 기본적인 Group 중의 하나 이다. 
 */

// AppDelegate 를 직접 생성을 하여야 한다.
// Push 기능을 넣어야 할때 보통 생성을 해준다.

/*
class Model: ObservableObject {
    
}

@main
struct SwiftUI_TestApp: App {
    @StateObject private var model = Model() // 모든 앱 내에서 공유가 가능하다.
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate // App 을 실행할떄 자동적으로 세팅이 된다.
    
    var body: some Scene { // Scene 을 구현하는것
        WindowGroup { // WindowGroup이 Scene 이다. Window 객체를 만들어서 화면을 만들게 된다.
            ContentView()
                .environmentObject(model) // 앱 내에서 환경으로 Setting 하여 공유 혹은 Initializer로 공유도 가능하다.
        }
    }
}


class AppDelegate: UIResponder, UIApplicationDelegate {
    
}

 */





// Scene 은 2가지
// 1. Scene 에 따라서 원하는대로 Custom Scene 구현
// 2. 원하는 코드가 실행 되도록 한다.

@main
struct SwiftUI_TestApp: App {
    var body: some Scene {
        MyScene()
    }
}

// 내가 원하는 Custom Scene 을 만들었다.
struct MyScene: Scene {
    //Scene 의 상태가 바뀌면 속성의 저장된 값이 바뀐다.
    //active, inactive, background
    // active 는 화면이 위에 있어 event 처리가 가능한 상태, inactive 는 화면은 떠있지만 event처리가 불가능한 상태 (전화, 문자 등), background 는 background 상태일때를 의미한다.
    @Environment(\.scenePhase) private var scenePhase
        
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { phase in // 상태가 바뀔떄 check 하는것이다.
            if phase == .background {
                
            } else if phase == .inactive {
                
            } else if phase == .active {
                
            }
        }
        
        // 이때 여러 Scene 이 있을수 있고, 하나의 scene 이라도 active 한 상태라면 active를 return 하게 된다.
        // 각각의 Scene 마다의 처리가 필요하다면 이곳에서는 불가능 하다.
    }
}
