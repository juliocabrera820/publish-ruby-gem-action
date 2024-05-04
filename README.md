# Publish ruby gem action

Action that builds a gem based on a gemspec and publishes to GitHub packages or Rubygems

## Usage

```yml
---
- name: Publish gem to rubygems or gh packages
  uses: juliocabrera820/publish-ruby-gem-action@v1
  with:
    github_token: ${{secrets.GITHUB_TOKEN}} # optional
    rubygems_api_key: ${{secrets.RUBYGEMS_API_KEY}} # optional
    github_username: octocat # optional: default value is your username in github
```
