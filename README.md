[![Bourbon](http://images.thoughtbot.com/bourbon/bourbon-logo.svg)](http://bourbon.io)

# Bourbon Website

### Setup

1. Get the code

  `% git clone https://github.com/thoughtbot/bourbon.io.git`

2. Install `NPM`. If you use `Homebrew`:

  `% brew install node`

  Otherwise, check instructions at https://github.com/npm/npm

3. Install `sassdoc`

  `% npm install sassdoc -g`

4. Bundle gems

  `% bundle`

5. Verify that the app is up and running

  `% middleman server`

  `% open http://localhost:4567`

### Available rake tasks

  `% rake generate` or just `rake`

This task generates documentation (as a new json file, for example:
`data/bourbon_5.0.0.json`) for the gem version specified in the `Gemfile`.

  `% rake generate_for 4.2.1`

This task grabs the gem version from Github and pretty much does the same.

