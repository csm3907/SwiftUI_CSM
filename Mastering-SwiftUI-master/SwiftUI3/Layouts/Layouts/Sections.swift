//
//  Sections.swift
//  Layouts
//
//  Created by KxCoding on 2022/02/13.
//

import SwiftUI

struct Sections: View {
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: [.sectionHeaders]) { // Sticky Header 를 구현 하는 방법  (새로운 Section 이 되면 scroll 이 된다.)
                
                Section {
                    EmojiView(emoji: "😀")
                    EmojiView(emoji: "😍")
                    EmojiView(emoji: "😎")
                } header: {
                    SectionHeaderView(title: "Emotions")
                }

                Section {
                    EmojiView(emoji: "🐶")
                    EmojiView(emoji: "🐱")
                    EmojiView(emoji: "🐯")
                } header: {
                    SectionHeaderView(title: "Animals")
                }
                
                Section {
                    EmojiView(emoji: "🍎")
                    EmojiView(emoji: "🍌")
                    EmojiView(emoji: "🍓")
                } header: {
                    SectionHeaderView(title: "Fruits")
                }

            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct Sections_Previews: PreviewProvider {
    static var previews: some View {
        Sections()
    }
}
