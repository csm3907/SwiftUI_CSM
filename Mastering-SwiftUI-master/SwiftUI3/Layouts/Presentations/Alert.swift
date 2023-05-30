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

struct Alert_Tutorials: View {
    @State private var message = ""
    
    @State private var showAlert = false
    @State private var showImageAlert = false
    
    @State private var imageData: ImageData? = nil
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
            
            Button {
                imageData = ImageData.sample
                showImageAlert = true
                //showAlert = true
            } label: {
                Text("Show Alert")
            }
            .padding()
            .alert("제목(경고창)", isPresented: $showAlert) {
                
                Button("확인") {
                    message = "확인"
                }
                
                Button(role: .destructive) {
                    message = "취소"
                } label: {
                    Text("취소")
                }

            } message: {
                Text("조심하세요")
            }
            .alert("경고", isPresented: $showImageAlert, presenting: imageData) { data in
                
                Button("확인") {
                    message = data.filters.joined(separator:  ", ") +  "필터를 적용합니다."
                }
                
                Button(role: .destructive) {
                    message = data.name + " 삭제"
                } label: {
                    Text("취소")
                }
                
            } message: { data in
                Text("\(data.name)")
            }
        }
    }
}

struct Alert_Previews: PreviewProvider {
    static var previews: some View {
        Alert_Tutorials()
    }
}
