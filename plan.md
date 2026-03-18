# 기술 블로그형 포트폴리오 기획안 (Plan)

## 1. 프로젝트 개요
- **주제**: Portfolio (개발 블로그 겸용)
- **목적**:
  - 나의 개발 여정과 배운 점(TIL, 회고)을 기록 및 공유
  - 프로젝트 진행 중 마주한 트러블슈팅(문제 해결 과정) 및 기술적 고민 정리
  - 이력서 및 포트폴리오 역할 수행
- **핵심 기능**: Markdown 형식으로 글 작성 및 렌더링

## 2. 주요 기능 (Features)
1. **홈 페이지 (vCard 템플릿 구조 적용)**
   - **사이드바 (Sidebar)**: 스크롤 시 고정되는 프로필 카드 영역. 내 사진, 이름, 직무, 이메일, 링크 등 핵심 정보 고정 노출
   - **메인 컨텐츠 (Main Content)**: 상단에 탭(Tab) 메뉴를 두어 각 섹션으로 부드럽게 전환(About, Blog(Posts), Activities 등)
   - **About Me**: 간단한 소개와 스킬셋, 진행한 서비스 등을 대시보드 형태로 배치. 추가로 기존 'Testimonials', 'Clients' 섹션을 삭제하고, 해당 영역에 간결하게 본인의 활동 이력(Activities 요약)을 녹여냄
   - **최근 작성 글 (Recent Posts)**: 심플한 리스트 형태의 최신 게시글 노출 (vCard 레이아웃 내부에서 이전처럼 깔끔하게 텍스트 위주 구성)
   - **Contact 페이지**: 삭제 (불필요한 기능 간소화)
2. **블로그 기능**
   - 마크다운(Markdown) 기반의 글 작성 및 렌더링
   - **이미지 첨부 지원**: 로컬에 저장된 이미지(Asset) 경로 연동 및 반응형 이미지 렌더링
   - 코드 블록 하이라이팅 (Syntax Highlighting) 지원
   - 카테고리/태그 기능 마련 (**참고**: 상단 Navigation 메뉴에서 Search, Activities 등 불필요한 링크는 숨김 처리하여 심플함 유지)
3. **기능 및 파일 간소화**
   - 불필요한 섹션 제거: Testimonials, Clients, Contact 폼 등의 기존 데모 섹션을 완전 삭제
   - 통합된 메인 화면(About) 내에서 활동 이력(Activities)을 가장 간결하고 가독성 좋게 정리하여 프로필 어필 극대화
   - 더 이상 사용하지 않는 기존 테마 에셋 및 불필요한 더미 파일 스캔 및 삭제
4. **인적사항(Profile) 데이터 중앙 집중화**
   - 이메일, 휴대전화 번호, GitHub 주소, 블로그 소개글 등 기본 인적사항과 연락처 데이터를 `hugo.toml` 파일 한 곳에서 통합 관리하여 유지보수성 극대화
5. **반응형 디자인 고도화**
   - 모바일, 태블릿, 데스크톱 환경 모두에 최적화된 컴포넌트 구성
   - 전체 페이지 색상/타이포/보더 규칙을 단일 테마 기준으로 일관되게 유지
6. **SEO 및 퍼포먼스 최적화**
   - 메타 태그, Open Graph 태그 반영
   - 사이트맵 자동 생성 등 검색 엔진 최적화(SEO) 구축

## 3. 추천 기술 스택 (Tech Stack)
기능의 요구사항(특히 SEO, 마크다운 렌더링)을 충족하기 위해 정적 사이트 생성이 가능한 스택을 제안합니다.

- **프레임워크**: **Hugo** (빠른 빌드 속도 및 마크다운 렌더링 활용)
- **UI 템플릿 / 스타일링**: **[vCard Personal Portfolio](https://github.com/codewithsadee/vcard-personal-portfolio)** 테마의 HTML/CSS/JS 구조를 Hugo Layout에 이식(Porting)
- **콘텐츠 관리**: 마크다운(.md) 파일만으로 손쉽게 관리 가능 (Hugo 기본 기능)
- **배포**: **GitHub Pages** (Hugo 완벽 호환 및 무료 호스팅), **Vercel**, **Netlify** 등

## 4. 진행 단계 (Milestones)

### Step 1: 프로젝트 뼈대 및 vCard 템플릿 구조 이식
- Hugo 빈 프로젝트 생성
- `vcard-personal-portfolio`의 `assets`(CSS, JS, 이미지) 파일을 Hugo의 `static` 또는 `assets` 구조로 복사
- 해당 HTML 구조(`index.html`)를 Hugo의 `layouts/index.html`로 변환하여 기본 정적 프레임 렌더링 확인
- 모바일 대응을 위한 CSS 환경 검토

### Step 2: 마크다운 렌더링 시스템 및 에셋 관리 설정
- 로컬 `posts` 디렉토리에서 마크다운(.md) 파일을 읽어오는 로직 구현
- 마크다운 내용을 변환하는 렌더러 설정 (코드 하이라이팅 포함)
- **이미지 폴더 구조 수립 (`static/images` 또는 `assets` 폴더 활용)**
- 글의 메타데이터(Front Matter: 제목, 날짜, 태그, 대표 이미지 등) 파싱 구축

### Step 3: 핵심 페이지(UI) 및 디자인 디테일 구현 [vCard 디자인 적용]
- **Home (`/`)**: 
  - **사이드바 컴포넌트화**: 이름, 프로필 이미지, 주요 연락처 등 Hugo `config.toml` 변수를 읽어와 렌더링
  - **About 탭 (통합 메인)**: vCard의 About 레이아웃을 살려 개발자 소개 및 'What I Do' 부분 구성. 기존 Testimonials나 Clients 로고 섹션을 삭제하고, 그 자리에 자신이 해왔던 활동 이력(Activities)을 간결하게 녹여내는 형태로 UI 재설계
  - **Blog 탭**: 최신 블로그 목록 노출. vCard 템플릿 프레임은 유지하되, 내부는 이전 블로그처럼 심플하고 직관적인 리스트 구조로 동적 렌더링
- **Blog 상세 페이지 (`/posts/`)**: vCard 테마의 외부 껍데기(사이드바, 배경 디자인)는 유지하되, 포스트 본문이 렌더링되는 영역(`single.html`)은 **이전 사용하시던 PaperMod처럼 담백하고 가독성 높은 텍스트 중심의 단순한 형태(Simple Typographic Layout)**로 구현.

### Step 4: 환경 변수 최적화 및 세부 페이지 확장
- **Profile 변수 중앙화 세팅**
  - `hugo.toml` 내비게이션에 휴대폰 번호, 이메일, GitHub 주소 등 인적사항을 한곳에 명시하고 Layout(Sidebar 등)에서 불러오도록 구조화
- **사용하지 않는 파일 정리 (Cleanup)**
  - 작업 완료 후, 이전 PaperMod 테마 잔재나 안 쓰는 JS/CSS, 데모용 더미 파일 색출 및 삭제
- **About 메인 내 Activities 렌더링 방식 고도화**
  - 프론트매터(Frontmatter)의 카테고리(`categories: ["Activities"]`) 분류를 통해 일반 블로그 글과 활동 이력을 구분.
  - 마크다운 파일의 프론트매터에 `disableLink: true`를 추가하면 상세 블로그 페이지로 렌더링되지 않고 제목만 단순 텍스트로 노출되도록 제어.
  - 프론트매터에 `externalUrl: "https://..."`를 추가하면 상세 블로그 페이지 대신 외부 링크(새 창)로 바로 연결되도록 라우팅 구조 개선.
- 동적인 디자인(마이크로 애니메이션 등) 요소 적용 (프리미엄 퀄리티 지향)
- SEO 세팅 (`metadata` 객체 작성) 및 퍼포먼스 체크
- 모바일 환경에서의 레이아웃 테스트

### Step 5: 동작 검증 및 피드백 (Verification Testing)
- **홈 메인 화면 검증 (`index.html`)**
  - About 내에 Activities가 간결하게 잘 렌더링되었는지, 쓸모없는 탭(Activities 분리 탭, Contact)이 정상적으로 완전 제거되었는지 확인
  - `hugo.toml` 프로필 데이터 연동 정상 체크
- **블로그 포스트 및 상세 뷰 렌더링 검증**
  - 마크다운 기본 문법(볼드, 인용구, 리스트 등) 텍스트 렌더링 확인
  - `syntax.css` 연동을 통한 개발 언어별 코드 하이라이팅(Syntax Highlighting) 정상 표출 확인
  - 로컬 이미지 파일 연결 및 웹 반응형 이미지 표시 확인
- **UI/UX 호환성 검증**
  - 디바이스 해상도별(모바일 햄버거 메뉴, 태블릿, PC) 레이아웃 스크롤 및 겹침 현상 테스트
  - 전체 시스템 색상 일관성(보더, 배경, 텍스트) 점검

### Step 6: 배포 (Deploy) - **Vercel 플랫폼 선정 완료**
- [x] **배포 전 설정 변경**: `hugo.toml`의 `baseURL`을 배포용 URL(Vercel 도메인 또는 커스텀 도메인)로 업데이트
- [x] **자동 배포 파이프라인 구축 (Vercel)**:
  - GitHub Repository를 Vercel에 연동 (Import Project)
  - Framework Preset이 `Hugo`로 자동 인식되는지 확인 (Build Command: `hugo --gc --minify`, Output Dir: `public`)
- [ ] (선택) **커스텀 도메인 연결**:
  - 도메인 구매 (가비아, 호스팅케이알, Cloudflare 등)
  - Vercel Project Settings > Domains 에 구매한 도메인 추가
  - 도메인 구매처 네임서버에 Vercel용 DNS 레코드(A Record / CNAME) 등록
- [ ] **배포 후 동작 검증**:
  - Vercel 기본 도메인(`.vercel.app`) 및 커스텀 도메인 이중 접속 확인
  - 데스크톱/모바일 UI 정상 렌더링 확인
  - 404 에러 리소스(이미지 등) 파악
  - `sitemap.xml` 및 SEO OG태그 정상 노출 체크

## 5. 레퍼런스 기반 확장 기획 (블로그 유지 + 포트폴리오 웹 추가)

아래 확장안은 기존 블로그 구조(`/`, `/posts/`)를 그대로 유지하면서, 레퍼런스 사이트([Figma Site](https://blanch-coach-12976307.figma.site/))의 톤과 레이아웃 패턴을 신규 섹션(`/showcase/`)으로 분리 도입하는 것을 목표로 합니다.

### 5-1. 핵심 방향성
- **분리 전략**: 블로그는 기존 vCard 테마 유지, 포트폴리오는 별도 템플릿/스타일로 분리
- **디자인 키워드**: 라이트 톤, 큰 프로젝트 비주얼, 플로팅 네비게이션, 강한 카드 중심 레이아웃
- **콘텐츠 키워드**: Work 중심 케이스 스터디 + Side Project(실험/MVP) 강조
- **운영 키워드**: 모든 프로젝트를 Markdown으로 관리하여 유지보수 단순화

### 5-2. 정보 구조 (IA) 및 URL 설계
- 기존 유지
  - `/`: 블로그형 홈(vCard)
  - `/posts/`: 블로그 목록/상세
- 신규 추가
  - `/showcase/`: 포트폴리오 메인(대표 프로젝트 중심)
  - `/showcase/{slug}/`: 프로젝트 상세(케이스 스터디)
- 메뉴
  - 상단 메뉴에 `Portfolio` 항목 추가하여 `/showcase/`로 진입
  - 블로그 동선(`Blog`, `Tags`)은 그대로 유지

### 5-3. 화면 구성 (레퍼런스 반영)
1. **Floating Header**
   - 반투명(blur) 네비게이션 바
   - `Work`, `Resume`, `LinkedIn`, `GitHub` 액션 링크 배치
2. **Hero Intro**
   - 한 줄 소개 + 포지션/강점 요약
   - CTA 버튼 2개(`대표 프로젝트 보기`, `블로그 보기`)
3. **Featured Works**
   - 대표 프로젝트를 큰 카드로 노출
   - 썸네일, 기간, 역할, 문제 정의 한 줄을 우선 표시
4. **Work List (Alternating Layout)**
   - 카드가 좌/우 교차 배치되도록 구성
   - 각 카드 클릭 시 상세 페이지 이동
5. **Side Projects with AI**
   - 작은 카드 그리드로 실험성 프로젝트 노출
   - 외부 URL 또는 데모 링크로 즉시 이동 가능
6. **Bottom CTA**
   - 연락/협업 유도 문구 + 이력서/깃허브 링크

### 5-4. 콘텐츠 모델 (Front Matter 스키마)
- 공통 필드
  - `title`, `date`, `period`, `role`, `summary`, `thumbnail`, `featured`, `order`
- 분류 필드
  - `portfolioType`: `work` 또는 `side-project`
- 링크 필드
  - `demoUrl`, `repoUrl`, `caseUrl`, `externalUrl`
- 성과 필드(선택)
  - `problem`, `hypothesis`, `action`, `result`, `impact`
- 표기 필드(선택)
  - `stack`(배열), `badge`, `accent`

### 5-5. 구현 구조 (Hugo 파일 단위)
- 콘텐츠
  - `content/showcase/_index.md`
  - `content/showcase/*.md` (프로젝트별 페이지)
- 템플릿
  - `layouts/showcase/list.html` (포트폴리오 메인)
  - `layouts/showcase/single.html` (프로젝트 상세)
- 스타일/스크립트
  - `static/assets/css/showcase.css`
  - `static/assets/js/showcase.js`
- 설정
  - `hugo.toml` 메뉴에 `Portfolio` 추가
  - `hugo.toml`에 `params.showcase`(resume/linkedin 등) 추가

### 5-6. 인터랙션/모션 가이드
- 스크롤 진입 시 카드 `fade-up` 애니메이션
- 카드 hover 시 이미지 확대, 그림자 강화
- 상단 플로팅 헤더는 스크롤에 따라 blur/그림자 변화
- `prefers-reduced-motion` 사용자를 위한 애니메이션 축소 처리

### 5-7. 반응형/접근성 가이드
- 모바일 우선 설계 (단일 컬럼, 터치 영역 44px 이상)
- 데스크톱에서만 좌우 교차 레이아웃 적용
- 링크/버튼 명확한 포커스 스타일 제공
- 모든 프로젝트 썸네일에 의미 있는 `alt` 부여

### 5-8. 검증 기준 (Acceptance Criteria)
- 기존 블로그(` /, /posts/, /tags/ `) 회귀 이슈가 없어야 함
- `/showcase/`에서 Work/Side Project 카드가 정상 분리 렌더링
- 각 프로젝트 링크(내부/외부)가 의도대로 작동
- 모바일/태블릿/데스크톱에서 레이아웃 깨짐이 없어야 함
- 기본 SEO(`title`, `description`, `og`)가 페이지별로 정상 출력

### 5-9. 작업 순서 (Execution Order)
1. `plan.md` 확장안 확정
2. `hugo.toml` 메뉴/파라미터 확장
3. `/showcase` 템플릿 및 콘텐츠 스키마 반영
4. 전용 CSS/JS 구현 및 인터랙션 연결
5. 샘플 프로젝트 콘텐츠 입력
6. `hugo` 빌드 및 회귀 점검

## 6. 피드백 요청 (Next Steps)
위 확장 기획대로 `/showcase` 구현을 먼저 완료한 뒤, 2차로 프로젝트 실데이터(썸네일/성과지표/외부링크)를 채워 품질을 높이는 방식으로 진행합니다.

## 7. 실제 반영 완료 사항 (2026-03 기준)

아래 항목은 현재 코드에 반영된 **최신 구현 상태**입니다.  
(초기 기획의 일부 항목은 사용자 피드백에 따라 단순화/변경됨)

### 7-1. Showcase 데이터 소스 정책
- `/showcase`는 `content/showcase` 샘플 문서를 사용하지 않고, **기존 `content/posts` 문서**를 기반으로 렌더링
- 노출 기준은 카테고리 필터 방식:
  - `hugo.toml`의 `params.showcase.sourceCategories` 값과 `posts` 문서의 `categories`를 매칭
  - 기본 반영값: `["Activities"]`

### 7-2. Showcase 화면 정책 (단순화 버전)
- 상단 메뉴바 제거
- `title`, `Projects` 텍스트 제거
- CTA(`대표 프로젝트 보기`, `블로그 보기`) 제거
- 페이지 진입 시 **포트폴리오 카드 리스트만 바로 노출**

### 7-3. 대표 이미지(Thumbnail) 정책
- 카드 대표 이미지 우선순위:
  1. `thumbnail`
  2. `cover.image`
  3. 본문 첫 번째 마크다운 이미지
  4. 기본 이미지 (`/assets/images/blog-6.jpg`)
- Front Matter 권장 예시:
  ```yaml
  thumbnail: "/assets/images/your-image.jpg"
  ```
- 경로는 GitHub Pages의 `/portfolio` 베이스 경로를 고려해 렌더링 시 자동 보정

### 7-4. 시각/스타일 정책
- `/showcase` 배경을 기존 블로그와 동일한 다크 톤으로 통일
- 카드/텍스트 색상도 다크 테마 기준으로 맞춤 적용
- 링크 방문 후 색 변화 방지:
  - `link / visited / hover / active / focus-visible` 상태를 동일 스타일로 고정

### 7-5. 카드 레이아웃 정렬 정책
- 데스크톱에서 카드 폭 비율 고정
- 카드 최소 높이(min-height) 적용
- 썸네일 영역 높이 고정
- 본문 요약 줄 수 제한(클램프) + 태그 하단 정렬
- 모바일에서는 단일 컬럼 + 썸네일 16:9 비율 유지

### 7-6. 운영 가이드
- 포트폴리오로 노출할 글은 `content/posts`에서 카테고리를 `sourceCategories`와 맞추어 작성
- 대표 이미지는 각 포스트 Front Matter에 `thumbnail`을 넣는 방식을 표준으로 사용
