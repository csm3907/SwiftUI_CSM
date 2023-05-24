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

struct LazyStacks: View {
    var body: some View {
        
        ScrollView(.horizontal) {
            LazyHStack { // 3. 이것을 위해서 Lazy Stack 이 나왔고 이것은 보이기만 하는 View를 진짜로 생성 하게 된다.
                ForEach(1 ..< 101) { num in
                    NumberView(number: num) // 1.Stack 은 보이지 않아도 해당 View를 만든다. ( reuse 가 아니다. )
                    // 2. 때문에 만약 이미지 다운로드 같은게 있으면 메모리를 다 잡아먹을 수가 있다.
                }
            } // Stack 은 자동으로 scroll 되지 않는다. -> ScrollView 안에 넣어 주어야 한다.
        }
        // Lazy Stack은 즉 필요한 시점에 View를 생성 하게 된다.
        // 그렇다면 왜 LazyStack 만을 사용 하지 않는 것인가? -> Apple 에서 Stack 사용 후 Lazy로 바꾸는것을 추천 하였다.
        
    }
}

struct LazyStacks_Previews: PreviewProvider {
    static var previews: some View {
        LazyStacks()
    }
}
