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

struct Overlay: View {
    
    @State var selected = false
    
    var body: some View {
        EmojiView(emoji: "😎")
            //.overlay(.blue, in: Circle()) // 이모지 View를 덮는다.
            //.overlay(.ultraThinMaterial, in: Circle()) // blur 처리도 가능하다.
//            .overlay { // 이미지를 위로 올린것
//                Image("big-photo")
//                    .resizable()
//            }
        // Z-stack 으로 사용을 해도 되지만 Frame을 고정하지 않았을때 가장 큰 View 에 맞춰지는데, overlay 는 이전의 View에 맞출수 있어서 상대적으로 간단하게 구현이 가능하다.
            .overlay(alignment: .bottomTrailing) { // 오른쪽 하단
                if selected {
                    Image(systemName: "checkmark.circle.fill") // 이미지를 overlay로 만든다.
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                } else {
                    Image(systemName: "checkmark.circle.fill") // 이미지를 overlay로 만든다.
                        .foregroundColor(.gray)
                        .font(.largeTitle)
                }
                
            }
            .onTapGesture {
                selected.toggle()
            }
        
    }
}

struct Overlay_Previews: PreviewProvider {
    static var previews: some View {
        Overlay()
    }
}
