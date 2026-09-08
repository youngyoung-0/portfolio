#!/bin/bash

# start.sh - Hugo 로컬 개발 서버 실행 스크립트

# Hugo 설치 여부 확인
if ! command -v hugo &> /dev/null; then
    echo "❌ 에러: Hugo가 설치되어 있지 않습니다."
    echo "macOS의 경우, 아래 명령어로 설치할 수 있습니다:"
    echo "  brew install hugo"
    exit 1
fi

echo "🚀 Hugo 로컬 개발 서버를 시작합니다..."
echo "📍 브라우저에서 http://localhost:1313 으로 접속하세요."
echo ""

# hugo server 실행 (초안 포함)
# 추가 인자가 있으면 함께 전달
hugo server -D "$@"
