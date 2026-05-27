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
    
    // 设置行距为18磅，目录统一使用 Times New Roman + 宋体
    #set par(leading: 18pt, first-line-indent: 0em)
    #set text(font: fonts.main + fonts.song, size: 12pt)

    #outline(
      title: none,
      indent: 2em
    )

    #pagebreak()
  ]
}