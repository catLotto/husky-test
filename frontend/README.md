# Husky & PM2 restart 테스트

허스키는 `.git` 폴더가 있는 폴더경로를 기준으로 작동함. 설치는 `package.json`이 있는 프로젝트 폴더에서 진행. 모노레포에서 하위 폴더에 프로젝트가 있고 프로젝트를 위한 스크립트가 있는 경우 `cd <subfolder>` 등의 명령어를 통해 현재 폴더를 프로젝트폴더 경로로 변경해줘야 함.

## 자동 설치

`prepare` 스크립트 지정시 `cd`를 사용해 `.git` 폴더위치로 이동해서 허스키 설치 명령어를 적어줘야 함.

```json
{
  "scripts": {
    "prepare": "cd .. && husky install frontend/.husky"
  }
}
```

## 후크 만들기

`.husky` 폴더가 `.git`과 같은 폴더에 위치하지 않았다면 해당 폴더경로를 적어서 후크를 입력해야함.

```
npx husky add frontend/.husky/pre-commit "frontend/scripts/run.sh"
git add frontend/.husky/pre-commit
```

## 후크 내용 작성

첫줄을 프로젝트 폴더 경로로 맞춰주면 이후 명령어 입력이 용이.

```sh
cd frontend

...
```

## PM2 재시작

[Github Issue](https://github.com/Unitech/pm2/issues/325#issuecomment-594350085)에 여러논의가 있었지만 직접적인 해결책은 나오지 않은 상태임. PM2를 이용해서 앱 실행시 이름을 지정하고 재시작시에 해당 이름의 앱을 지우는 방식이 가장 간단함 (로그 트래킹이 불편해질것으로 예상됨)

```sh
pm2 delete -s next || :
pm2 start --name next scripts/next.run.js
```
