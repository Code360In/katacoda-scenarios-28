# Automating Testing and Devops

## Scripts

```json
  "scripts": {
    "start": "react-app-rewired start",
    "build": "CI=true yarn test && react-app-rewired build",
    "build-without-tests": "react-app-rewired build",
    "test": "react-app-rewired test --env=jsdom",
    "test:all": "react-app-rewired test --env=jsdom --watchAll",
    "eject": "react-scripts eject",
    "docker:up": "docker-compose up -d --build",
    "docker:stop": "docker-compose stop",
    "analyze": "source-map-explorer 'build/static/js/*.js'",
    "git-report": "git report",
    "git-short": "git log --since='1 sunday ago' --until='now' --pretty=tformat: --shortstat",
    "git-last-3": "git log -3 --pretty='format:%C(auto)%ad   %s' --stat --no-merges",
    "git-since-1-day": "git log --since='1 day ago' --until='now' --pretty='format:%C(auto)%ad   %s' --stat --no-merges",
    "git-since-1-week": "git log --since='1 week ago' --until='now' --pretty=format:'%Cred%h%Creset %s %Cgreen(%ci) %Cblue<%an>%Creset' --shortstat"
  }
```


## Code Linting

```json
  "eslintConfig": {
    "extends": "react-app"
  },
  "lintstaged": {
    "*.{js,md,css,html}": [
      "prettier --trailing-comma es5 --single-quote --write",
      "git add"
    ],
    "yarn.lock": [
      "git rm --cached"
    ]
  }
 ```

 

## Mocha

## Jest

```json
"jest": {
    "testEnvironment": "node",
    "moduleNameMapper": {
      "^@hyf(.*)$": "<rootDir>/src/packages$1",
      "^sample-data(.*)$": "<rootDir>/../app-hyf__visual-checks/_sample-data$1"
    }
  }
  ```

## StoryBook

## Husky

```json
"husky": {
    "hooks": {
      "pre-commit": [],
      "commit-msg": "commitlint -E  HUSKY_GIT_PARAMS",
      "pre-push": "CI=true yarn test"
    }
  },
  "commitlint": {
    "extends": [
      "@commitlint/config-conventional"
    ],
    "rules": {
      "subject-case": [
        2,
        "never",
        [
          "start-case",
          "pascal-case"
        ]
      ]
    }
  }
 ```

## nyc 

```
"nyc": {
    "exclude": [
      "**/*.spec.js",
      "**/*.spec.jsx",
      "**/dist/*",
      "**/test/*",
      "bin",
      "docs",
      "node_modules",
      "plop"
    ],
    "extension": [
      ".jsx"
    ]
  }
 ```
