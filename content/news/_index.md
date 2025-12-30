---
title: News
date: 2024-01-01
type: landing

design:
  spacing: "6rem"

sections:
  - block: markdown
    id: news
    content:
      title: News
      text: |
        {{< news-cards >}}
    design:
      spacing:
        padding: ["2rem", 0, "2rem", 0]
      css_class: "bg-gray-100 dark:bg-gray-900"
      css_style: "max-width: 100% !important; width: 100% !important;"
      container: false
---

