1. Install the Bourbon gem using the [RubyGems] package manager:

    ```bash
    gem install bourbon
    ```

    Alternatively, you can install Bourbon with [Bower].

1. Install the Bourbon library into the current directory:

    ```bash
    bourbon install
    ```

    **Pro Tip:** You can target installation into a specific directory using the
    `path` flag:

    ```bash
    bourbon install --path my/custom/path/
    ```

1. Import Bourbon at the beginning of your stylesheet:

    ```scss
    @import "bourbon/bourbon";
    ```

    It’s not recommended that you modify Bourbon’s files directly as it will make
    updating to future versions difficult, by overwriting your custom changes or
    causing merge conflicts.

  [RubyGems]: https://rubygems.org
  [Bower]: http://bower.io

### Installation for Ruby on Rails 4.2+

1. Add Bourbon to your Gemfile:

    ```ruby
    gem "bourbon"
    ```

1. Then run:

    ```bash
    bundle install
    ```

1. Restart your server and rename `application.css` to `application.scss`:

    ```bash
    mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
    ```

1. Delete _all_ Sprockets directives in `application.scss` (`require`,
   `require_tree` and `require_self`) and use Sass’s native `@import` instead
   ([why?][sass-import]).

1. Import Bourbon at the beginning of `application.scss`. Any project styles
   that utilize Bourbon’s features must be imported after Bourbon.

    ```scss
    @import "bourbon";
    @import "home";
    @import "users";
    ```

  [sass-import]: http://pivotallabs.com/structure-your-sass-files-with-import

### Installing with npm and using a Node-based asset pipeline

1. Add Bourbon as a dependency:

    ```bash
    npm install --save bourbon
    ```

1. If you’re using [eyeglass], skip to Step 3. Otherwise,
   you’ll need to add Bourbon to your node-sass `includePaths` option.
   `require("bourbon").includePaths` is an array of directories that you should
   pass to node-sass. How you do this depends on how node-sass is integrated
   into your project.

1. Import Bourbon into your Sass files:

    ```scss
    @import "bourbon";
    ```

  [eyeglass]: http://eyeglass.rocks

### Installing older versions of Bourbon

1. Uninstall any Bourbon gem versions you already have:

    ```bash
    gem uninstall bourbon
    ```

1. Reinstall the Bourbon gem, using the `-v` flag to specify the version
   you need:

    ```bash
    gem install bourbon -v 3.2.4
    ```

1. Follow the [instructions above](#installation) to install Bourbon into
   your project.
