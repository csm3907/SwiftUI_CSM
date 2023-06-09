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

struct DragGesture_Tutorials: View {
    
    @State private var currentTranslation = CGSize.zero
    @State private var finalTranslation = CGSize.zero
    
    @GestureState private var currentTranslation2 = CGSize.zero
    
    var dragGesture: some Gesture {
        return DragGesture(minimumDistance: 10, coordinateSpace: .local)
            .onChanged { value in
                currentTranslation = value.translation
            }
            .onEnded { value in
                currentTranslation = .zero
                
                var t = finalTranslation
                t.width += value.translation.width
                t.height += value.translation.height
                finalTranslation = t
            }
    }
    
    var dragGestureWithGestureState: some Gesture {
        return DragGesture()
            .updating($currentTranslation2) { value, state, transaction in
                state = value.translation
            }
            .onEnded { value in
                var t = finalTranslation
                t.width += value.translation.width
                t.height += value.translation.height
                finalTranslation = t
            }
    }
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(.yellow)
                .frame(width: 100, height: 100)
                .offset(finalTranslation)
                .offset(currentTranslation)
                .gesture(dragGesture)
        }
    }
}

struct DragGesture_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DragGesture_Tutorials()
        }
    }
}
