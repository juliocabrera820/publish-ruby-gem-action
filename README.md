# Publish ruby gem action

[![Author](https://img.shields.io/badge/author-juliocabrera820-3D3D4D?color=233D3D4&style=flat)](https://github.com/juliocabrera820)
[![Languages](https://img.shields.io/github/languages/count/juliocabrera820/publish-ruby-gem-action?color=%233D3D4&style=flat)]
[![Stars](https://img.shields.io/github/stars/juliocabrera820/publish-ruby-gem-action?color=233D3D4&style=flat)](https://github.com/juliocabrera820/publish-ruby-gem-action/stargazers)

Action that builds a gem based on a gemspec and publishes to GitHub packages or Rubygems

## Usage

```yml
---
- name: Publish gem to rubygems or gh packages
  uses: juliocabrera820/publish-ruby-gem-action@v1
  with:
    github_token: ${{secrets.GITHUB_TOKEN}}
    rubygems_api_key: ${{secrets.RUBYGEMS_API_KEY}}
    github_username: octocat # optional: default value is your username in github
```
