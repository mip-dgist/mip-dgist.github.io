# GitHub SSH 키 설정 가이드

조직 리포지토리에 Collaborator로 push하기 위한 SSH 키 설정 방법입니다.

## 전체 절차

### 1단계: 기존 SSH 키 백업 (선택사항)

기존 SSH 키가 있다면 백업합니다:

```bash
mkdir -p ~/.ssh/backup
cp ~/.ssh/id_ed25519* ~/.ssh/backup/ 2>/dev/null
```

### 2단계: 새로운 SSH 키 생성

Passphrase 없이 새로운 SSH 키를 생성합니다:

```bash
# 기존 키 삭제 (있는 경우)
rm ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub 2>/dev/null

# 새로운 키 생성 (passphrase 없이)
ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/id_ed25519 -N ""
```

**참고:** `your_email@example.com`을 본인의 GitHub 이메일로 변경하세요.

### 3단계: 공개키 복사

생성된 공개키를 클립보드에 복사합니다:

```bash
cat ~/.ssh/id_ed25519.pub | pbcopy
```

또는 공개키를 직접 확인:

```bash
cat ~/.ssh/id_ed25519.pub
```

### 4단계: GitHub에 SSH 키 등록

1. https://github.com/settings/keys 접속
2. **"New SSH key"** 버튼 클릭
3. 다음 정보 입력:
   - **Title**: 원하는 이름 (예: "MacBook", "My Mac" 등)
   - **Key type**: Authentication Key
   - **Key**: 3단계에서 복사한 공개키 붙여넣기
4. **"Add SSH key"** 클릭

**중요:** 
- SSH 키는 **개인 계정** 설정에 등록합니다 (조직 계정이 아님)
- Collaborator도 자신의 개인 계정에 SSH 키를 등록하면 됩니다

### 5단계: SSH agent에 키 추가

SSH agent를 시작하고 키를 추가합니다:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

### 6단계: Git remote를 SSH로 변경

리포지토리의 remote URL을 SSH 형식으로 변경합니다:

```bash
cd /path/to/your/repository
git remote set-url origin git@github.com:organization/repository.git
```

**참고:** `organization/repository`를 실제 조직명과 리포지토리명으로 변경하세요.

### 7단계: 연결 테스트

SSH 연결이 제대로 작동하는지 테스트합니다:

```bash
ssh -T git@github.com
```

성공하면 다음과 같은 메시지가 표시됩니다:
```
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

### 8단계: Push 테스트

이제 push가 정상적으로 작동하는지 확인합니다:

```bash
git push
```

## 추가 설정 (선택사항)

### macOS 키체인에 저장

재부팅 후에도 자동으로 SSH 키를 사용하려면 macOS 키체인에 저장합니다:

```bash
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

## 문제 해결

### SSH agent가 재시작된 경우

터미널을 재시작하거나 SSH agent가 종료되면 키를 다시 추가해야 합니다:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

### 권한 오류가 발생하는 경우

SSH 키 파일의 권한을 확인합니다:

```bash
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
```

## 참고사항

- **SSH 키 vs PAT**: SSH 키는 한 번 설정하면 계속 사용 가능하며, PAT는 만료일이 있습니다
- **Collaborator 권한**: SSH 키는 개인 계정에 등록하지만, Collaborator 권한으로 조직 리포지토리에 push할 수 있습니다
- **보안**: Passphrase 없이 키를 생성했으므로, 키 파일이 유출되지 않도록 주의하세요
