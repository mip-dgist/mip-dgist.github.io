# MIP Lab @ DGIST — 연구실 홈페이지

DGIST **MIP Lab** (Multimodal AI · Robot Perception · Medical Imaging)의 공식 홈페이지 소스 코드입니다.
[Hugo](https://gohugo.io/) + [HugoBlox](https://hugoblox.com/) 테마와 Tailwind CSS로 만들어졌으며,
`main` 브랜치에 푸시하면 GitHub Actions가 자동으로 빌드해 GitHub Pages로 배포합니다.

> **처음 참여하는 분은 먼저 [MANUAL.md](MANUAL.md)를 읽어주세요.** 설치부터 콘텐츠 편집, 배포까지
> 단계별로 정리되어 있습니다. (SSH 키 설정은 [SSH_SETUP.md](SSH_SETUP.md) 참고)

## 사용 및 문의
본 저장소는 DGIST MIP Lab 공식 홈페이지 운영을 위해 제작되었습니다.
소스 코드, 디자인 또는 구성 요소를 다른 홈페이지나 프로젝트에 참고하거나 활용하고자 하는 경우, 사전에 아래 이메일로 문의하여 사용 허가를 받은 후 활용해 주시기 바랍니다.
> 문의: shyoon [at] dgist [dot] ac [dot] kr

## 기술 스택

- **Hugo (extended)** — 정적 사이트 생성기
- **HugoBlox landing-page 테마** — Hugo 모듈로 불러옴 (`go.mod`, `config/_default/module.yaml`)
- **Tailwind CSS v4** — 스타일 (`assets/css/`, `package.json`)
- **pnpm** — 프런트엔드 의존성 관리
- **GitHub Actions + GitHub Pages** — 자동 배포 (`.github/workflows/deploy.yml`)

## 디렉터리 구조 (핵심만)

```
config/_default/     사이트 설정 (hugo.yaml, params.yaml, menus.yaml, languages.yaml)
content/             페이지별 콘텐츠 (_index.md, people/, research/, news/, publications/, contact/)
data/                실제 데이터(주로 여기를 편집)
  authors/           구성원 프로필 (한 명당 yaml 하나, john-doe.yaml = 템플릿)
  news/news.yaml     뉴스/소식
  research/          연구 분야 카드
  publications/      논문 목록
layouts/shortcodes/  data/ 내용을 카드로 렌더하는 템플릿(HTML)
static/media/        이미지·미디어 (authors/, research/ 등)
assets/              CSS, 사이트에서 처리하는 에셋
.github/workflows/   배포 자동화
```

대부분의 콘텐츠 수정은 **`data/` 폴더의 YAML 파일**만 고치면 됩니다. 자세한 편집 방법은
[MANUAL.md](MANUAL.md)에 있습니다.

## 빠른 시작

```bash
# 1) 사전 준비: Hugo(extended)와 pnpm 설치
brew install hugo
brew install pnpm            # 또는: npm install -g pnpm

# 2) 저장소 클론
git clone git@github.com:mip-dgist/mip-dgist.github.io.git
cd mip-dgist.github.io

# 3) 의존성 설치
pnpm install

# 4) 로컬 서버 실행 → 브라우저에서 http://localhost:1313 열기
hugo server        # 또는: pnpm dev
```

파일을 저장하면 브라우저가 자동으로 새로고침됩니다.

## 배포

- `main` 브랜치에 푸시하는 순간 GitHub Actions가 빌드 후 GitHub Pages에 배포합니다.
- **`main`은 곧 라이브 사이트입니다.** 직접 푸시하지 말고 브랜치를 만들어 작업한 뒤 Pull Request로
  합치는 것을 권장합니다. 자세한 협업 규칙은 [MANUAL.md](MANUAL.md#5-git-협업-워크플로)를 보세요.
