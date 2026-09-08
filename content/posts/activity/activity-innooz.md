---
title: "개발팀 · ㈜이노즈"
date: 2023-09-01
draft: false
tags: ["Company", "백엔드", "이커머스", "DB설계"]
categories: ["Activities"]
description: "건강기능식품 이커머스 백오피스 기획 및 백엔드 개발"
thumbnail: "/assets/images/activity_post_image/linme_1.png"
disableLink: false
period: "2023.09 - 2024.09"
---

## <span class="material-symbols-outlined">article</span> 프로젝트 개요

건강기능식품 전문 이커머스 플랫폼 **린미**의 백엔드 시스템 및 관리자 백오피스를 개발했습니다.  
건강기능식품 도메인은 상품 유형별로 성분 함량, 섭취 방법, 병용 금기 등 관리해야 하는 속성이 상이했습니다. 도메인 특성을 반영하기 위해 약사 자문 데이터를 토대로 데이터 모델을 정립했습니다.

![thumbnail](/assets/images/activity_post_image/linme_1.png)

## <span class="material-symbols-outlined">report_problem</span> 문제 정의: RDB 단일 스키마의 한계

초기에는 모든 상품 데이터를 RDB 단일 테이블 구조로 관리하려 했으나, 상품 유형별 속성 편차로 인해 구조적 한계가 발생했습니다.

- 일부 상품은 10개 이상의 세부 성분 함량 필드가 필요하지만, 다른 상품은 해당 필드가 불필요함
- 단일 스키마 유지 시 `NULL` 컬럼이 과도하게 증가하고 스키마 확장에 제약이 발생

상품 카테고리가 확장될수록 스키마 유지보수 비용이 급증할 것으로 판단하여, 데이터 성격에 따른 저장소 분리 설계를 진행했습니다.

## <span class="material-symbols-outlined">lightbulb</span> 해결 방안: RDB + MongoDB 하이브리드 설계

고정 속성과 유동 속성을 분리하여 저장소를 이원화했습니다.

- **RDB (MySQL)**: 가격, 기본 카테고리, 재고, 주문 상태 등 공통 트랜잭션 데이터 관리
- **MongoDB**: 성분 구성, 섭취 프로토콜, 주의사항 등 상품 유형별로 구조가 유동적인 비정형 상세 데이터 관리

팀 구성(리드 1명, 백엔드 3명, 프론트엔드 1명) 내에서 **상품 관리 도메인 백엔드**를 전담하여 스키마 정의 및 API를 구현했습니다.

## <span class="material-symbols-outlined">code</span> 주요 개발 업무

### 성분 데이터 수집 및 정제 파이프라인
건강기능식품 정보 사이트 크롤링을 통해 원천 성분 데이터를 수집·정제했습니다.  
수집된 데이터의 상이한 단위 및 명칭 표기를 표준 스키마에 맞춰 정규화하고, 약사 검수를 거쳐 DB에 적재했습니다.

### 엑셀 대용량 일괄 등록 시스템
운영팀의 상품 등록 공수를 줄이기 위해 관리자 페이지 내 **엑셀 일괄 업로드 기능**을 개발했습니다.  
대량의 행 데이터를 파싱하는 과정에서 데이터 정합성 유효성 검사(Validation) 및 실패 행에 대한 오류 리포트 기능을 구현했습니다.

### 파트너사 및 관리자용 Web API 개발
입점 파트너사 포털 및 내부 어드민 시스템에 필요한 상품 CRUD 및 권한 관리 REST API를 구축했습니다.

## <span class="material-symbols-outlined">build</span> 기술 스택

- **Language & Framework**: Java 17, Spring Boot
- **ORM & Data**: Spring Data JPA, Querydsl
- **Database**: MySQL, MongoDB

## <span class="material-symbols-outlined">insights</span> 주요 학습 및 회고

#### 1. 도메인 맥락이 설계 품질을 결정한다
성분과 섭취 주의사항 같은 도메인 특화 속성을 단순 텍스트로 다루지 않고, 약사 자문을 통해 실제 처방 및 섭취 맥락을 파악한 뒤 데이터 모델을 설계했습니다. 비즈니스 맥락에 대한 명확한 이해가 선행될 때 확장성 있는 스키마가 도출됨을 확인했습니다.

#### 2. 다각도 리뷰를 통한 아키텍처 검증
RDB 단일 모델에서 발생할 수 있는 스키마 파편화 문제를 팀 코드 리뷰와 아키텍처 논의를 통해 조기에 식별하고 Polyglot Persistence(RDB + NoSQL)로 전환했습니다. 초기 설계에 대한 열린 검토가 장기적인 기술 부채를 방지한다는 점을 체감했습니다.

#### 3. 데이터 파이프라인에서 정제와 무결성 관리의 중요성
크롤링 자동화 자체보다 수집된 이종 데이터의 단위 통일과 정규화 작업에 더 많은 리소스가 소요되었습니다. 데이터 품질이 백오피스 운영 안정성으로 직결되므로 입력 단계의 유효성 검증 체계가 필수적임을 확인했습니다.

![second_image](/assets/images/activity_post_image/linme_2.jpg)
