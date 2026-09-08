---
title: "UMI — LLM 기반 인터랙티브 게임 백엔드"
date: 2026-03-05
draft: false
tags: ["Project", "UMI", "LLM", "게임", "멀티에이전트", "FastAPI", "RAG", "회고"]
categories: ["Activities"]
description: "폐쇄된 가상 세계관을 배경으로 LLM 페르소나의 일관성과 안전성을 실증 검증한 인터랙티브 게임 'UMI'의 백엔드 개발기"
thumbnail: "/assets/images/umi-game-page/1F_outside01.png"
period: "2026.01 - 2026.02"
role: "Backend & AI Architect"
summary: "폐쇄된 가상 세계관을 배경으로 LLM 페르소나의 일관성과 안전성을 실증 검증한 인터랙티브 게임 'UMI'의 백엔드 개발기"
stack: ["FastAPI", "Gemma-2", "Qwen", "BERT", "Docker", "AWS EC2", "asyncio"]
impact: "Guardrail 모델 최적화 및 비동기 멀티 에이전트 파이프라인 설계로 API 레이턴시 개선"
demoUrl: "https://youtu.be/kBFtGbRGuVI"
repoUrl: "https://github.com/youngyoung-0"
---

## <span class="material-symbols-outlined">article</span> 프로젝트 개요

- **진행 기간**: 2026. 01. 22 ~ 2026. 02. 27 (약 5주)
- **목적**: 예측 불가능한 사용자 발화와 스트레스 환경에서 LLM 기반 NPC 페르소나의 일관성 및 안전성을 실증 검증

---

## <span class="material-symbols-outlined">help</span> 기획 배경

LLM을 활용한 페르소나 에이전트는 다양한 도메인에서 도입되고 있으나, 사용자의 복잡한 상호작용 속에서 인격과 규칙을 지속적으로 유지하는 데는 한계가 존재합니다.

> "자유도 높은 사용자 입력 환경에서 NPC가 고유 페르소나와 제약 조건을 일관되게 유지할 수 있는가?"

이 가설을 검증하기 위해 실시간 상호작용과 돌발 대화가 빈번히 일어나는 **인터랙티브 텍스트 게임 환경**을 구축했습니다. 폐쇄된 공간과 '탈출'이라는 명확한 목표를 부여해 유저와의 심리적 대치 및 대화 몰입도를 높였습니다.

![thumbnail](/assets/images/umi-game-page/1F_outside01.png)

---

## <span class="material-symbols-outlined">terminal</span> 담당 역할 및 기여

팀 내에서 **백엔드 인프라 설계, 비동기 멀티 에이전트 파이프라인 구축, AI 서빙 최적화**를 전담했습니다.

### <span class="material-symbols-outlined">cloud</span> 서버 및 인프라 구축
- FastAPI 기반 비동기 API 서버를 설계하고, AWS EC2 환경에서 Docker 컨테이너 기반으로 파이프라인 및 백엔드 서비스를 배포·서빙

### <span class="material-symbols-outlined">bolt</span> 비동기 멀티 에이전트 파이프라인
- Guardrail(BERT) → 의도 분류 → NPC Agent(Gemma) → Story Agent(Qwen)로 이어지는 순차 추론 과정을 `asyncio` 기반으로 구조화하여 I/O 병목 완화

### <span class="material-symbols-outlined">verified_user</span> 데이터 검증 및 런타임 방어
- LLM 응답의 비정형 출력(JSON 포맷 오류 등)을 제어하기 위해 Pydantic 스키마 검증 레이어를 구축해 런타임 오류 방지

### <span class="material-symbols-outlined">science</span> AI 페르소나 파인튜닝 실험
- 오픈소스 소형 LLM(Llama-3, Mistral, Gemma-2)을 대상으로 페르소나 주입 실험을 진행하고, 대화 데이터셋 기반 SFT(Supervised Fine-Tuning) 수행

### <span class="material-symbols-outlined">campaign</span> 기술 발표 및 공유
- 프로젝트 아키텍처 및 트러블슈팅, RAG 한계점 분석 결과를 정리하여 최종 기술 시연 발표 진행

---

## <span class="material-symbols-outlined">hub</span> 전체 파이프라인 및 아키텍처

사용자 발화 시 다음 4단계 파이프라인을 거쳐 응답이 생성됩니다.

1. **Safety Guardrail** → 욕설 및 탈옥(Jailbreak) 시도 감지
2. **의도 분류 모델** → 12가지 대화 의도 태그 분류
3. **NPC Agent** → 호감도 및 상태 변수를 반영한 페르소나 대화 생성
4. **Story Agent** → 당일 대화 내역 요약 후 Vector DB에 장기 기억으로 적재

![AI 에이전트 흐름도](/assets/images/umi-game-page/ai-agent-flow.png)

### 기술 스택

| 분류 | 기술 |
|---|---|
| **API 서버 / 인프라** | **FastAPI** (ASGI), **AWS EC2**, **Docker**, Nginx |
| **데이터베이스** | **MongoDB** (Motor 비동기 드라이버) |
| **LLM 오케스트레이션** | **LangChain**, LangSmith |
| **모델 추론** | **HuggingFace Transformers**, BitsAndBytes (양자화), PEFT |
| **임베딩 & 벡터 DB** | **Sentence-Transformers**, Vector DB (RAG) |
| **인증 & 검증** | **JWT**, **Pydantic** |

---

## <span class="material-symbols-outlined">smart_toy</span> AI 모델 선정 및 파인튜닝

실시간 게임 환경의 제약 조건(추론 지연 시간, 한국어 구어체 표현력, 안전성)을 기준으로 모델을 선정했습니다.

### 1. NPC Agent — Gemma-2-9b-it
대화 몰입도를 위해 **한국어 대화 자연스러움과 응답 속도**를 기준으로 검토했습니다.  
초기 LoRA 방식 적용 시 프롬프트 누출 및 페르소나 이탈 현상이 발생하여, 정제된 자체 대화 데이터셋을 기반으로 **전체 SFT(Supervised Fine-Tuning)** 를 적용해 일관된 말투와 성향을 유지하도록 개선했습니다.

![gemma-2-9b-it](/assets/images/umi-game-page/gemma-2-9b-it.png)

### 2. Guardrail (Safety) — bert-base-multilingual-cased
사용자의 공격적 발화나 프롬프트 인젝션을 사전 차단하기 위한 보안 레이어입니다.  
낮은 추론 지연 시간이 요구되는 특성에 맞춰 경량 `BERT` 모델을 채택하고, 윤리 검증 데이터셋으로 파인튜닝을 거쳐 빠른 추론 속도와 높은 F1-score를 확보했습니다.

![bert-base-multilingual-cased](/assets/images/umi-game-page/bert-base-multilingual-cased.png)

### 3. Story Agent — Qwen-7B
세션 종료 시 누적된 장문 대화 로그를 사건 단위로 압축 요약하는 역할을 담당합니다.  
Long-context 환경에서의 인과관계 파악과 요약 완성도를 비교 평가하여 환각(Hallucination)이 적은 `Qwen-7B`를 채택했습니다.

![qwen-7b](/assets/images/umi-game-page/qwen-7b.jpg)

---

## <span class="material-symbols-outlined">sports_esports</span> 게임 플레이 루프

1. **탐색 및 단서 수집**: 맵을 이동하며 아이템과 단서 획득
2. **NPC 상호작용**: 고유 페르소나를 지닌 NPC와의 대화를 통해 심리전 수행 및 호감도 변동
3. **전략적 아이템 사용**: 패널티를 감수하고 상위 NPC 접근 권한 획득
4. **일차 마감 및 기억 동기화**: Story Agent가 당일 사건을 요약하여 Vector DB에 **장기 기억(Long-term Memory)** 으로 동기화, 익일 NPC 행동 패턴에 반영
5. **엔딩 생성**: 5일차 생존 시 누적된 요약 데이터를 바탕으로 맞춤형 최종 엔딩 도출

![플레이 사이클](/assets/images/umi-game-page/umi_play_cycle.png)

---

## <span class="material-symbols-outlined">videocam</span> 시연 영상

- [시스템 튜토리얼 영상](https://youtu.be/kBFtGbRGuVI)
- [NPC 대화 상호작용 영상](https://youtu.be/tg3XeJHV_XE)

---

## <span class="material-symbols-outlined">insights</span> 주요 학습 및 엔지니어링 회고

#### 1. 프롬프트 엔지니어링을 넘어선 페르소나 일관성 모델링
단순한 지시문 추가만으로는 유저의 유도 질문이나 탈옥 시도 시 페르소나를 유지하기 어렵습니다. 시스템 프롬프트의 계층화와 SFT를 결합하고, 백엔드 레벨에서 입출력 검증(Guardrail)을 병행해야 안정적인 에이전트 서빙이 가능함을 확인했습니다.

#### 2. 단순 Vector RAG의 관계 추론 한계와 Graph RAG 필요성
대화 턴 수가 누적되면서 단순 코사인 유사도 기반 Vector 검색은 문맥과 맞지 않는 과거 발언을 참조하거나 복잡한 인물 관계망을 왜곡하는 문제를 보였습니다. 인물-사건 간 인과관계를 구조화할 수 있는 **Graph RAG(Knowledge Graph 기반 RAG)** 아키텍처로의 전환 필요성을 확인했습니다.

#### 3. 다중 LLM 파이프라인의 추론 지연(Latency) 최적화 과제
에이전트가 순차 호출되는 구조로 인해 **초기 응답 지연(1.3~2.5초)** 이 발생했습니다. 비동기 호출 병렬화로 일부 완화했으나, 실시간 상호작용을 극대화하기 위해서는 시스템 프롬프트를 고정 캐싱하는 **Prefix Caching** 및 KV 캐시 메모리를 효율화하는 **vLLM PagedAttention** 도입이 핵심 해결책임을 도출했습니다.

---

## <span class="material-symbols-outlined">rocket_launch</span> 향후 개선 방향

- **Graph RAG 도입**: 엔티티-관계 기반 지식 그래프를 구축하여 복잡한 인과관계와 장기 기억의 일관성 강화
- **vLLM 및 PagedAttention 적용**: KV 캐시 단편화 해소 및 첫 토큰 생성 시간(TTFT) 단축
- **Prefix Caching 처리**: 공통 시스템 프롬프트(세계관 규칙, 안전 가이드라인)의 연산을 캐싱하여 서버 추론 처리량 극대화

![UMI 게임 플레이 화면](/assets/images/umi-game-page/B3_hall01.png)
