#!/bin/bash
# Favicon 업데이트 스크립트
# 사용법: ./update-favicon.sh [새로운-favicon-파일.png]

if [ -z "$1" ]; then
    echo "사용법: ./update-favicon.sh [새로운-favicon-파일.png]"
    exit 1
fi

NEW_FAVICON="$1"

if [ ! -f "$NEW_FAVICON" ]; then
    echo "오류: 파일을 찾을 수 없습니다: $NEW_FAVICON"
    exit 1
fi

echo "Favicon 업데이트 중..."

# 1. assets/media/favicon.png 교체
cp "$NEW_FAVICON" assets/media/favicon.png
echo "✓ assets/media/favicon.png 업데이트 완료"

# 2. static/favicon.png 교체
cp "$NEW_FAVICON" static/favicon.png
echo "✓ static/favicon.png 업데이트 완료"

# 3. static/favicon.ico도 교체 (PNG를 ICO로)
cp "$NEW_FAVICON" static/favicon.ico
echo "✓ static/favicon.ico 업데이트 완료"

# 4. 빌드된 파일들도 교체 (빌드 후 실행 시)
if [ -d "public/media" ]; then
    find public/media -name "icon_hu_*.png" -exec cp "$NEW_FAVICON" {} \;
    echo "✓ public/media/icon_hu_*.png 파일들 업데이트 완료"
fi

echo ""
echo "Favicon 업데이트 완료!"
echo "다음 단계:"
echo "1. Hugo 서버 재시작 (또는 자동 리로드)"
echo "2. 브라우저 캐시 삭제 후 새로고침"

