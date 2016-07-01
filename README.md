[<img src="http://images.thoughtbot.com/bourbon/bourbon-logo.svg" width="200" alt="Bourbon logo">][Bourbon website]

# Bourbon Website

This is the source code for the [Bourbon website]. It’s built with [Middleman].

[Bourbon website]: http://www.bourbon.io/
[Middleman]: https://middlemanapp.com/

## Setup

1. Get the code:

  ```
  git clone https://github.com/thoughtbot/bourbon.io.git
  ```

1. Set up your machine:

  ```
  bin/setup
  ```

1. Run the app:

  ```
  bundle exec middleman
  ```

  ```
  open http://localhost:4567
  ```

## Generate Documentation

Bourbon uses [SassDoc] to document its source code. For this website, we use
Rake tasks to run SassDoc’s CLI, which parses documentation-specific comments
from [Bourbon’s source] and outputs them as versioned JSON files
(e.g. [`bourbon_5_0_0.json`]). We then use a [proxy] in Middleman to generate
unique pages for each version.

To generate documentation for the gem version specified in the `Gemfile`, run:

  ```
  rake generate
  ```

You can also generate documentation for the gem version from GitHub by using the
`generate_for` command:

  ```
  rake generate_for 5.0.0
  ```

[SassDoc]: http://sassdoc.com/
[Bourbon’s source]: https://github.com/thoughtbot/bourbon/
[`bourbon_5_0_0.json`]: data/bourbon_5_0_0.json
[proxy]: https://middlemanapp.com/advanced/dynamic_pages/

## Hosting & Deployment

The website is hosted on [Netlify], and is automatically built and deployed when
changes are pushed to the `master` branch. Credentials for Netlify can be found
in 1Password.

[Netlify]: https://www.netlify.com/
