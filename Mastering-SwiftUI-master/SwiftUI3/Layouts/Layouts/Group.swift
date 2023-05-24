//
//  Mastering SwiftUI
//  Copyright (c) KxCoding <help@kxcoding.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import SwiftUI

struct Group_Tutorials: View {
    
    // SwiftUI 에서는 child 의 최대 갯수가 10개로 지정되어 있다.
    // VStack 의 init 을 가보면 content 가 ViewBuilder 라는 어노테이션으로 정의가 되어 있다.
    // 하나의 Closure 여러개의 child View를 나열할수 있게 해준다.
    // SwiftUI 에서 하나 이상의 View를 파라미터로 받는다. -> ViewBuilder 로 정의가 된다.
    // ViewBuilder 의 경우 buildBlock 을 호출하게 되는데 이 ViewBuilder 의 최대 파라미터 갯수가 10개 이다. -> 최대 10개인 이유 이다.
    // 10개 이상이다 -> Section, Stack 으로 할수도 있고, Group 으로 해주면 layout은 영향을 주지 않고 10개씩 추가를 하게 해준다.
    
    var body: some View {
        VStack {
            Group { // 이렇게 논리적으로 layout에 영향을 주지 않고 10개씩 묶는 것이다.
                Text("Hello, World!")
                Text("Hello, World!")
            }
            
            Group {
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .font(.title2) // Group 으로 빼면 modifier 를 전체적으로 포현이 가능하다. -> Code가 짧아진다.
            
            Group {
                Text("Hello, World!")
                Text("Hello, World!")
            }.padding() // 이때 중요한것은 Section, Stack 같은 것은 전체의 Padding 이 들어가지만 Group의 경우는 layout이 안잡히기 때문에 childView 에 각자 적용이 되는 것이다.
            
            Text("Hello, World!")
            Text("Hello, World!")
            /*
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            */
        }
        
        
        
    }
}

struct Group_Previews: PreviewProvider {
    static var previews: some View {
        Group_Tutorials()
    }
}
