# Changelog Guide

## Setup changelog packages

```sh
npm install -g commitizen 
npm install -g cz-conventional-changelog
npm install -g conventional-changelog-cli
echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc

vim package.json
```

```json
"scripts": {
  "cz": "git cz",
  "changelog": "conventional-changelog -p angular -i CHANGELOG.md -s",
  "changelog:init": "conventional-changelog -o CHANGELOG.md",
  "changelog:check": "conventional-changelog",
  "changelog:init:angular": "conventional-changelog -p angular -i CHANGELOG.md -s -r 0",
  "changelog:check:angular": "conventional-changelog -p angular",
  "changelog:help": "conventional-changelog --help"
},
```

## Git commit & push for initial commit

```sh
git add . && git commit -m "initial commit"
git branch -M main
yarn

yarn changelog:check
yarn changelog:check -o CHANGELOG.md
vim CHANGELOG.md (fix typo)
vim package.json (chagne verison)
git add . && git commit -m "feat: setup changelog"
yarn changelog:check
yarn changelog
vim CHANGELOG.md (fix typo)
```
