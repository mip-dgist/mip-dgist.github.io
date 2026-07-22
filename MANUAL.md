# MIP Lab 홈페이지 작업 매뉴얼

이 문서는 홈페이지를 **처음 함께 작업하는 사람**이 스스로 콘텐츠를 수정하고 배포할 수 있도록
설치부터 배포까지 순서대로 정리한 가이드입니다. 코딩을 몰라도 대부분의 내용 수정은
`data/` 폴더의 텍스트 파일(YAML)만 고치면 됩니다.

## 목차

0. [처음 한 번만 하는 설정](#0-처음-한-번만-하는-설정)
1. [로컬에서 실행해보기](#1-로컬에서-실행해보기)
2. [사이트 구조 이해하기](#2-사이트-구조-이해하기)
3. [콘텐츠 편집하기](#3-콘텐츠-편집하기)
4. [이미지 넣을 때 지켜야 할 것](#4-이미지-넣을-때-지켜야-할-것)
5. [Git 협업 워크플로](#5-git-협업-워크플로)
6. [배포 (사이트에 반영되는 과정)](#6-배포-사이트에-반영되는-과정)
7. [자주 겪는 문제 (FAQ)](#7-자주-겪는-문제-faq)

---

## 0. 처음 한 번만 하는 설정

### (1) GitHub 계정 & 저장소 접근 권한
1. GitHub 계정이 없다면 [github.com](https://github.com)에서 만듭니다.
2. 관리자(윤성훈 교수님 또는 담당자)에게 본인 **GitHub 아이디**를 알려주고
   `mip-dgist` 조직 또는 이 저장소의 **협업자(Collaborator)**로 초대받습니다.
3. 초대 메일/알림을 수락합니다.

### (2) SSH 키 설정
조직 저장소에 푸시하려면 SSH 키가 필요합니다. → **[SSH_SETUP.md](SSH_SETUP.md)** 문서를 따라 하세요.

### (3) 필요한 프로그램 설치 (macOS 기준)
```bash
# Homebrew가 없다면 먼저 설치: https://brew.sh
brew install hugo      # 정적 사이트 생성기 (extended 버전이 설치됩니다)
brew install pnpm      # 프런트엔드 패키지 매니저  (또는: npm install -g pnpm)
```
> Windows라면 [Hugo 설치 가이드](https://gohugo.io/installation/windows/)와
> [pnpm 설치 가이드](https://pnpm.io/installation)를 참고하세요. 반드시 **Hugo extended** 버전이어야 합니다.

설치 확인:
```bash
hugo version     # 예: hugo v0.153.x+extended ... 처럼 'extended'가 보여야 함
pnpm --version
```

### (4) 저장소 클론
```bash
git clone git@github.com:mip-dgist/mip-dgist.github.io.git
cd mip-dgist.github.io
pnpm install     # 처음 한 번 의존성 설치
```

---

## 1. 로컬에서 실행해보기

내 컴퓨터에서 사이트를 미리 보면서 작업합니다. **실제 사이트에는 영향을 주지 않습니다.**

```bash
hugo server      # 또는: pnpm dev
```

- 실행되면 터미널에 나오는 주소 **http://localhost:1313** 을 브라우저에서 엽니다.
- 파일을 저장하면 브라우저가 자동으로 새로고침되어 바로 확인할 수 있습니다.
- 종료하려면 터미널에서 `Ctrl + C`.

---

## 2. 사이트 구조 이해하기

| 폴더 | 역할 | 언제 건드리나 |
|------|------|----------------|
| `data/` | 구성원·연구·뉴스·논문의 **실제 데이터**(YAML) | **콘텐츠 수정 대부분 여기** |
| `content/` | 각 페이지의 뼈대(제목, 소개문 등 `_index.md`) | 페이지 상단 문구를 바꿀 때 |
| `static/media/` | 사진·이미지 파일 | 사진을 추가/교체할 때 |
| `layouts/shortcodes/` | `data/` 내용을 카드 형태로 그려주는 템플릿(HTML) | 디자인/레이아웃을 바꿀 때 (개발 지식 필요) |
| `config/_default/` | 사이트 설정(메뉴, 제목, 파라미터 등) | 메뉴·사이트 이름 등을 바꿀 때 |
| `assets/`, `layouts/partials/` | CSS·공통 요소 | 스타일을 손볼 때 (개발 지식 필요) |

**핵심 개념:** `data/`의 YAML을 고치면, `layouts/shortcodes/`의 템플릿이 그 내용을 읽어
페이지에 카드로 자동으로 그려줍니다. 그래서 **글자·정보 수정은 거의 다 `data/`에서** 이루어집니다.

> YAML 문법 주의: **들여쓰기(공백)**로 계층을 표현합니다. 탭 대신 **스페이스**를 쓰고,
> 기존 파일의 들여쓰기 간격을 그대로 따라 하세요. `#`으로 시작하는 줄은 주석(무시됨)입니다.

---

## 3. 콘텐츠 편집하기

### 3-1. 구성원 추가/수정 (People)

한 명당 파일 하나입니다: `data/authors/<slug>.yaml` (`<slug>`는 영문 소문자 이름, 예: `gildong_hong`).

**새 구성원 추가하는 법:**
1. 템플릿 파일 [`data/authors/john-doe.yaml`](data/authors/john-doe.yaml)을 복사해 새 이름으로 만듭니다.
   ```bash
   cp data/authors/john-doe.yaml data/authors/gildong_hong.yaml
   ```
2. 파일을 열어 주석(`#`)을 지우고 본인 정보를 채웁니다. 실제 예시(기존 구성원 파일)를 참고하세요:
   ```yaml
   schema: hugoblox/author/v1
   slug: gildong_hong          # 파일명과 동일하게. 사진 파일명도 이 이름을 씀
   category: Master Students   # 아래 '분류' 참고
   order: 2                    # 같은 분류 안에서 표시 순서 (작을수록 위)
   name:
     display: Gildong Hong
     given: Gildong
     family: Hong
   role: Master Student (1st Year)
   bio: My research interests include ...
   tags:
     - Multimodal AI
     - Robot Perception
   # 아래 links는 원하면 주석(#)을 지우고 본인 것으로 채우세요. 없으면 생략 가능
   # links:
   #   - icon: at-symbol
   #     url: mailto:your_id@dgist.ac.kr
   #     label: Email
   #   - icon: brands/github
   #     url: https://github.com/your_id
   #     label: GitHub
   #   - icon: academicons/google-scholar
   #     url: https://scholar.google.com/citations?user=your_id
   #     label: Google Scholar
   ```
3. 프로필 사진을 `static/media/authors/<slug>.jpg`에 넣습니다. (예: `static/media/authors/gildong_hong.jpg`)
   - 사진을 안 넣으면 기본 이미지(`me.jpg`)로 대체됩니다.
   - 파일명을 slug와 다르게 하려면 yaml에 `image: 파일명.jpg`를 추가해도 됩니다.

**분류(category) 값** — 이 값에 따라 People 페이지의 어느 섹션에 표시될지 정해집니다:
`PI` · `Postdoc` · `PhD Students` · `Master Students` · `Interns`

> 사용 가능한 아이콘 종류(`icon:`)는 기존 파일들과 `data/authors/john-doe.yaml`의 예시를 참고하세요
> (`at-symbol`, `brands/github`, `brands/linkedin`, `brands/x`, `academicons/google-scholar`,
> `academicons/cv` 등).

**구성원이 나갔을 때:** 해당 `data/authors/<slug>.yaml` 파일을 삭제하면 됩니다.

### 3-2. 뉴스/소식 추가 (News)

파일: [`data/news/news.yaml`](data/news/news.yaml). 파일 **맨 위에** 새 항목을 추가하면 최신 소식이 위로 옵니다.

```yaml
- date: 2026-07-22
  type: award            # 아래 종류 참고
  title: "제목을 여기에"
  description: "한두 문장 설명을 여기에"
```

**type 종류** (뉴스 페이지에서 필터 버튼으로도 쓰임):
`publication` · `admission` · `graduation` · `career` · `award` · `service` · `grant`

> `title`, `description`에 콜론(`:`)이나 특수문자가 들어가면 위 예시처럼 **큰따옴표로 감싸세요.**

### 3-3. 연구 분야 (Research)

분야 하나당 파일 하나: `data/research/<slug>.yaml`.

```yaml
slug: medical-ai
title: Medical AI / AI for Science
category: Medical AI
description: 분야 설명 한두 문장
image: medical-ai.gif            # static/media/research/ 안의 파일명
order: 5                         # 표시 순서
# url: https://...               # 관련 페이지가 있으면 주석을 지우고 URL을 넣으면 카드에 버튼이 생김
```
- 이미지 파일은 `static/media/research/`에 넣습니다.

### 3-4. 논문 (Publications)

파일: [`data/publications/publications.yaml`](data/publications/publications.yaml). 항목을 추가합니다.

```yaml
- slug: my-paper-2026
  title: "논문 제목"
  authors:
    - First Author
    - Sung-Hoon Yoon*
  venue: CVPR
  date: 2026-02-21
```
- 최신 논문이 위로 오도록 날짜 순서에 맞춰 넣으면 됩니다.

### 3-5. 페이지 상단 문구 등

각 섹션의 제목·소개문은 `content/<섹션>/_index.md` 에 있습니다
(예: `content/people/_index.md`, `content/research/_index.md`). 첫 페이지는 `content/_index.md`.

---

## 4. 이미지 넣을 때 지켜야 할 것

- **위치:** 구성원 사진은 `static/media/authors/`, 연구 이미지는 `static/media/research/`.
- **웹용으로 줄여서 올리기:** 원본 고화질 사진을 그대로 올리지 말고 **1MB 이하** 정도로
  리사이즈·압축하세요. 사이트가 빨라지고 저장소도 가벼워집니다.
- **GitHub 파일당 100MB 제한:** 100MB를 넘는 파일은 push 자체가 막힙니다.
- **⚠️ 대용량 GIF 주의:** 현재 `static/media/research/`의 일부 GIF가 40~100MB로 매우 큽니다.
  새로 큰 GIF/동영상을 추가할 때는 mp4로 변환하거나 용량을 줄여서 넣는 것을 권장합니다.
  (기존 파일은 당장 문제는 없어 그대로 두었습니다.)

---

## 5. Git 협업 워크플로

> ⚠️ **가장 중요:** `main` 브랜치는 **곧 실제 라이브 사이트**입니다.
> `main`에 직접 푸시하면 실수한 내용도 즉시 사이트에 반영됩니다.
> 그래서 **항상 새 브랜치를 만들어 작업하고 Pull Request(PR)로 합치는 방식**을 씁니다.

기본 흐름:
```bash
# 0) 최신 상태로 맞추기
git checkout main
git pull

# 1) 작업용 브랜치 만들기 (이름은 자유, 무슨 작업인지 알아보게)
git checkout -b add-gildong-profile

# 2) 파일 수정 후, 바뀐 내용 확인
git status
git diff

# 3) 커밋
git add .
git commit -m "Add Gildong Hong to People"

# 4) 내 브랜치를 GitHub에 올리기
git push -u origin add-gildong-profile
```

5. GitHub 저장소 페이지에 가면 **"Compare & pull request"** 버튼이 뜹니다. 눌러서 PR을 만듭니다.
6. 관리자/동료가 확인(리뷰)한 뒤 **Merge**하면 그때 `main`에 합쳐지고 → 자동 배포됩니다.

> 혼자 빠르게 고칠 때도 가능하면 브랜치+PR 습관을 들이면 실수 시 되돌리기 쉽습니다.

---

## 6. 배포 (사이트에 반영되는 과정)

- 배포는 **자동**입니다. `main` 브랜치에 변경이 합쳐지면(=PR merge 또는 직접 push)
  GitHub Actions(`.github/workflows/deploy.yml`)가 자동으로:
  1. Hugo로 사이트를 빌드하고
  2. GitHub Pages에 올립니다.
- 진행 상황은 GitHub 저장소의 **Actions 탭**에서 볼 수 있습니다.
  초록색 체크(✓)가 뜨면 배포 완료(보통 1~3분).
- 반영이 안 보이면 잠시 기다렸다가 브라우저 **강력 새로고침**(Cmd/Ctrl + Shift + R)을 해보세요.

---

## 7. 자주 겪는 문제 (FAQ)

**Q. `hugo server`가 에러가 나요.**
- Hugo가 **extended** 버전인지 확인: `hugo version` 결과에 `extended`가 있어야 합니다.
- `pnpm install`을 했는지 확인하세요.
- YAML 문법 오류(들여쓰기, 따옴표 누락)로 빌드가 멈추는 경우가 많습니다. 터미널의 에러 메시지에
  나온 파일/줄을 확인하세요.

**Q. 사진이 안 보여요.**
- 파일 위치가 `static/media/authors/`(또는 `research/`)가 맞는지, 파일명이 yaml의 `slug`/`image`와
  **정확히 일치**하는지(대소문자·확장자 포함) 확인하세요.
- 구성원 사진이 안 나오면 기본 이미지로 대체됩니다 → 대개 파일명 불일치가 원인입니다.

**Q. 내가 바꾼 게 사이트에 안 보여요.**
- 지금 보고 있는 게 로컬(localhost:1313)인지 실제 사이트인지 확인하세요.
- 실제 사이트라면: 변경이 `main`에 merge됐는지, GitHub **Actions 탭**의 배포가 성공(✓)했는지 확인.

**Q. YAML을 고쳤는데 페이지가 깨졌어요.**
- 십중팔구 들여쓰기나 따옴표 문제입니다. 방금 바꾼 부분을 기존 항목과 비교해보고,
  정 안 되면 `git checkout <파일경로>`로 그 파일만 되돌릴 수 있습니다.

**Q. 블로그 기능이 필요해요.**
- 현재 블로그는 비활성화되어 있고 데모 글은 삭제했습니다. 다시 쓰려면
  `config/_default/menus.yaml`과 `config/_default/hugo.yaml`의 blog 관련 주석/설정을 되살리고
  `content/blog/`에 글을 추가하면 됩니다. (개발 지식이 조금 필요합니다.)

---

궁금한 점은 관리자에게 문의하거나, [Hugo 문서](https://gohugo.io/documentation/) ·
[HugoBlox 문서](https://docs.hugoblox.com/)를 참고하세요.
