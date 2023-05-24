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

struct Spacer_Tutorials: View {
    var body: some View {
        VStack(spacing: 0) { // #6 모든 SubView 들의 최소 공백이 추가된다.
            
//            Spacer()
//                .frame(height: 1) // 위로 확장 하고 싶지 않을때
            
            HStack {
                Image(systemName: "suit.heart.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                
                // #3
                Spacer() // 하트를 제외한 전체 여백을 추가한다. 이 상위의 embed 하는 영역의 크기도 더 커지게 된다.
            }
            .padding()
            .background(Color.blue)
            
            // #1
            // 수직 여백을 추가 진행 이때 여백은 사용가능한 공간 전체를 ***최대로*** 채우게 된다.
            //Spacer()
            //Spacer(minLength: 50) // 최소 크기를 지정 할 수 있다.
            Spacer()
                .frame(height: 50) // Spacer 의 크기를 고정 하고 싶을때는 이렇게 사용을 한다.
            
            VStack {
                // #5
                //Spacer()
                
                Image(systemName: "suit.spade.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                
                // #4
                //Spacer() // 사용 가능한 높이를 채운다. 그리고 스페이드를 위로 올리고 embed 한 상위 View를 화면에 꽉 차게 한다.
            }
            .padding()
            .background(Color.red)
            
            // #2
            // 하나 더 추가하면 최대의 2등분이 된다. 3개가 되면 3등분이 된다.
            Spacer()
            Spacer()
        }
        .padding(.top, 1)
    }
}

struct Spacer_Previews: PreviewProvider {
    static var previews: some View {
        Spacer_Tutorials()
    }
}
