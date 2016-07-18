[<img src="http://images.thoughtbot.com/bourbon/bourbon-logo.svg" width="200" alt="Bourbon logo">][Bourbon website]

# Bourbon Website

This is the source code for the [Bourbon website]. It’s built with [Middleman].

You can find the [Bourbon Sass library source code here][library repo].

[Bourbon website]: http://www.bourbon.io/
[Middleman]: https://middlemanapp.com/
[library repo]: https://github.com/thoughtbot/bourbon

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

SassDoc has only been in use since v5.0.0. The v4 release is documented
via [a static page][v4], pulled from the previous website.

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
[v4]: source/docs/4.2.7/index.html.erb

## Hosting & Deployment

The website is hosted on [Netlify], and is automatically built and deployed when
changes are pushed to the `master` branch. Credentials for Netlify can be found
in 1Password.

[Netlify]: https://www.netlify.com/

## Front-end Architecture

This project uses:

- Sass, with Bourbon
- [BEM]-style CSS class names, with [namespaces]
  - `library/`: Global variables, mixins and functions; all non-rendering Sass
  - `base/`: Unclassed HTML elements (e.g. `a {}`, `input {}`)
  - `patterns/`: Abstractions, highly reusable pieces of style that are used in
    any number of unrelated contexts (e.g. `.p-media {}`)
  - `components/`: Discrete, implementation-specific piece of UI
    (e.g. `.c-site-nav {}`)
  - `utilities/`: High-specificity, very explicit selectors. Overrides and
    helper classes (e.g. `.u-flex {}`).
- Autoprefixer
- SCSS-Lint, with Hound ([configuration](.scss-lint.yml))
- A variety of CSS units:
  - `em` for typographical-related elements
  - `rem` for lengths related to components
  - `px` for borders, text shadows, etc.
  - `vw`/`vh` for lengths that should be relational to the viewport
- `modular-scale()` (which outputs `em` values) for font sizes

[BEM]: http://csswizardry.com/2013/01/mindbemding-getting-your-head-round-bem-syntax/
[namespaces]: http://csswizardry.com/2015/03/more-transparent-ui-code-with-namespaces/
