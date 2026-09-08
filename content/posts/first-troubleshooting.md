---
title: "Hugo 환경 설정 및 CLI 의존성 트러블슈팅"
date: 2026-03-04T12:00:00+09:00
draft: false
tags: ["트러블슈팅", "Hugo", "개발환경"]
categories: ["개발 일지"]
description: "Hugo 정적 사이트 로컬 개발 환경 구성 과정에서 발생한 CLI 의존성 문제 해결 기록"
---

## <span class="material-symbols-outlined">report_problem</span> 문제 상황

로컬 환경에서 정적 사이트 빌드를 실행하는 과정에서 CLI 명령어를 찾을 수 없는 에러가 발생했습니다.

```bash
Error: command not found: hugo
```

---

## <span class="material-symbols-outlined">search</span> 원인 분석

시스템 환경 변수(`$PATH`) 상에 Hugo 바이너리가 등록되어 있지 않거나 패키지가 설치되지 않은 상태였습니다.

---

## <span class="material-symbols-outlined">build</span> 해결 방법

macOS 패키지 관리자(Homebrew)를 통해 Hugo 확장 패키지(Extended 버전)를 설치했습니다.

```bash
brew install hugo
```

설치 완료 후 바이너리 실행 및 버전을 확인했습니다.

```bash
hugo version
```

---

## <span class="material-symbols-outlined">insights</span> 주요 학습

- 프로젝트 빌드 파이프라인에서 사용하는 CLI 도구의 최소 버전 및 런타임 의존성을 README 및 실행 스크립트에 명시해야 환경 세팅 병목을 방지할 수 있습니다.
