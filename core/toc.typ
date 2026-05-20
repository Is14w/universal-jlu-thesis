#import "fonts.typ": *

#let make-toc() = {
  set page(
    paper: "a4",
    margin: (top: 20mm, bottom: 20mm, left: 30mm, right: 30mm),
    header: context [
      #set text(size: 9pt, font: fonts.main + fonts.song, fill: black)
      #set par(spacing: 0.5em)
      #align(center)[目录]
      #line(length: 100%, stroke: black)
    ],
    footer: context {
      align(center, text(size: 9pt, counter(page).display("I")))
    },
    header-ascent: 7mm,
    footer-descent: 18pt,
  )
  
  [
    // 空2行
    #v(2em)
    
    // 目录标题（3号黑体，居中）
    #align(center)[
      #text(size: 16pt, weight: "bold", font: fonts.hei)[目   录]
    ]
    
    // 目录标题与内容之间的间距
    #v(1.5em)
    
    // 设置行距为18磅
    #set par(leading: 18pt)
    
    #show outline.entry: it => {
      let lv = it.element.level

      if lv == 1 {
        let fill-dots = box(width: 1fr, repeat[.])
        let body-text = it.element.body
        let chinese = ("一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二", "十三", "十四", "十五")
        let ch = counter(heading).at(it.element.location()).first()
        set par(leading: 18pt, first-line-indent: 0em)
        text(font: fonts.song)[
          第#chinese.at(ch - 1)章 #body-text
          #fill-dots
          #counter(page).at(it.element.location()).first()
        ]
      } else {
        it
      }
    }
    #outline(
      title: none,
      indent: auto
    )
    
    #pagebreak()
  ]
}