---
title: "마크다운 이미지 첨부 테스트"
date: 2026-03-04T12:05:00+09:00
draft: false
tags: ["마크다운", "테스트"]
categories: ["튜토리얼"]
description: "Hugo에서 기본 마크다운 문법으로 어떻게 이미지가 렌더링되는지 확인합니다."
cover:
  image: "/assets/images/blog-2.jpg" # 대표 이미지 테스트
  alt: "샘플 커버 이미지"
---

안녕하세요! 블로그에 글을 작성하면서 이미지를 첨부하는 것은 가독성을 높이는데 필수적입니다.
Hugo에서는 `static` 폴더를 루트 디렉터리로 취급합니다.

## 이미지 렌더링 예시

아래와 같이 `static/assets/images` 경로 이미지를 손쉽게 마크다운 문법으로 불러올 수 있습니다.

![샘플 이미지 테스트](/assets/images/blog-1.jpg)

**코드 예시:**
```markdown
![샘플 이미지 이름](/assets/images/blog-1.jpg)
```

이와 같이 작성하면 로컬 서버와 실제 배포 환경 모두에서 이미지가 자연스럽게 렌더링됩니다.
