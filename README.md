# portfolio

## 로컬에서 실행하기

### 준비물
- **Hugo(Extended) 설치**
  - macOS(Homebrew): `brew install hugo`
  - 설치 확인: `hugo version`

### 개발 서버 실행
아래 명령어를 실행하면 로컬 서버가 뜨고, 브라우저에서 `http://localhost:1313` 로 접속하면 됩니다.

```bash
hugo server -D
```

- `-D`: 초안(draft) 글까지 함께 빌드/노출

### 정적 사이트 빌드
`public/` 디렉터리에 정적 파일이 생성됩니다.

```bash
hugo --minify
```