//
//  ContentView.swift
//  SwiftUI_Test
//
//  Created by USER on 2023/05/12.
//

import SwiftUI

// View 는 UI를 구성하는 가장 기본적인 요소
// 1. 원하는 Data 를 표시
// 2. 모여서 하나의 화면으로 만들어지기도 한다.
// 3. View 는 상속하는 Member가 없고 value type 이라서 ARC 같은 overhead가 없어서 가볍다.
// 4. 여러 중첩을 해도 runtime overhead가 거의 없다.
// 5. SwiftUI 에서는 무조건 가운데에 배치한다. (Swift 에서는 왼쪽 상단이였던것에 비하여)
// 6. 여러 View 들은 무조건 Group, Stack 등으로 감싸야 한다.

struct ContentView: View { // View를 상속하는 모든것이 View 이다.
    // SwiftUI 가 자동으로 관리해주는 변수는 @State 를 붙인다.
    // 1. 버튼이 눌리면 data가 바뀐다.
    // 2. 이후 body를 다시 부르게 된다.
    // 3. Text 안의 문구가 변경이 되게 된다. (바뀐 부분만 따로 바뀌게 된다.)
    @State var data: String = "0"
    
    var body: some View {
        VStack { // 수직으로 된 Group View를 Return 한다.
            Text(data)
                .font(.headline) // modifier 를 추가 하는것이다.
                .padding()
            
            Button {
                data = "\(Int.random(in: 1...100))"
            } label: {
                Text("Update")
            }
        }
        .onAppear { // viewDidLoad
            
        }
        .onDisappear { // viewDidDisapear
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
