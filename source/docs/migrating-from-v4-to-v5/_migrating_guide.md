## Removal of prefixing features

The following features for prefixing CSS properties have been removed. We
suggest consulting [Can I Use] to see if prefixes are needed for a property,
and using [Autoprefixer] to add the prefixes based on your project’s browser
support needs.

  - `align-items`
  - `animation-delay`
  - `animation-direction`
  - `animation-duration`
  - `animation-fill-mode`
  - `animation-iteration-count`
  - `animation-name`
  - `animation-play-state`
  - `animation-timing-function`
  - `animation`
  - `appearance`
  - `backface-visibility`
  - `background-image`
  - `background`
  - `border-image`
  - `box-sizing`
  - `calc`
  - `column-count`
  - `column-fill`
  - `column-gap`
  - `column-rule-color`
  - `column-rule-style`
  - `column-rule-width`
  - `column-rule`
  - `column-span`
  - `column-width`
  - `columns`
  - `display`
  - `filter`
  - `flex-direction`
  - `flex`
  - `font-feature-settings`
  - `hidpi`
  - `hyphens`
  - `image-rendering`
  - `justify-content`
  - `keyframes`
  - `linear-gradient`
  - `perspective`
  - `placeholder`
  - `radial-gradient`
  - `selection`
  - `text-decoration-color`
  - `text-decoration-line`
  - `text-decoration-style`
  - `text-decoration`
  - `transform-origin`
  - `transform-style`
  - `transform`
  - `transition-delay`
  - `transition-duration`
  - `transition-property`
  - `transition-timing-function`
  - `transition`
  - `user-select`

  [Autoprefixer]: https://github.com/postcss/autoprefixer
  [Can I Use]: http://caniuse.com/

## Settings

Bourbon’s global settings are no longer defined using individual variables (e.g.
`$asset-pipeline: true;`) and are instead set within [a map named
`$bourbon`][settings]:

```scss
$bourbon: (
  "rails-asset-pipeline": true,
);
```

There are also a few changes and removals to settings:

- The `$global-prefixes` setting has been removed now that most of the prefixing
  features have been removed and the `prefixer` mixin no longer uses it.
- The `$em-base` settings variable has been removed now that the `em` and `rem`
  functions have been removed.
- The `$asset-pipeline` setting is now `rails-asset-pipeline` in the `$bourbon`
  settings map.

  [settings]: /docs/latest/#settings

## `em` and `rem`

The `em` and `rem` functions have been removed ([read the discussion on
why][discussion]). Use plain `em` and `rem` units, instead.

  [discussion]: https://github.com/thoughtbot/bourbon/issues/691

## `position`

The `position` mixin no longer has default values for the `$position` and
`$coordinates` arguments. Define values for those arguments each time you call
the mixin.

## `strip-units`

The `strip-units` function is now `strip-unit`:

```diff
- $foo: strip-units(10px);
+ $foo: strip-unit(10px);
```

## `size`

The `size` mixin now requires a comma-separated argument list:

```diff
- @include size(1em 2em);
+ @include size(1em, 2em);
```

## `font-face`

The `$weight` and `$style` arguments in the font-face mixin have been removed.
Instead, you can now include these—along with other CSS properties—within the
mixin block and they’ll be output as part of the `@font-face` declaration:

```diff
- @include font-face(
-   "source-sans-pro",
-   "/fonts/source-sans-pro/source-sans-pro-regular",
-   400,
-   normal
- );
+ @include font-face(
+   "source-sans-pro",
+   "/fonts/source-sans-pro-regular"
+ ) {
+   font-style: normal;
+   font-weight: 400;
+ }
```

## `triangle`

The `triangle` mixin no longer has default argument values. It also now requires
two individual values to be set for its size:

```diff
- @include triangle(12px, #ccc, "up");
+ @include triangle("up", 12px, 6px, #ccc);
```

## Font stack variables

All of the font stack variables are now prefixed with `font-stack-`. For
example, `$helvetica` is now `$font-stack-helvetica`.

The `$monospace` variable has been removed and we now have variables for _many_
monospace fonts:

- [`$font-stack-consolas`](/docs/latest/#font-stack-consolas)
- [`$font-stack-courier-new`](/docs/latest/#font-stack-courier-new)
- [`$font-stack-monaco`](/docs/latest/#font-stack-monaco)

## Button variables

`inputs` has been removed from the names of the button variables:

- `$all-button-inputs` is now `$all-buttons`.
- `$all-button-inputs-active` is now `$all-buttons-active`.
- `$all-button-inputs-focus` is now `$all-buttons-focus`.
- `$all-button-inputs-hover` is now `$all-buttons-hover`.

## `retina-image`

The `retina-image` mixin has been removed. Use vanilla CSS, instead.

## General removals

The following features that were deprecated in the v4 release cycle have now
been removed:

- `button` mixin
- `flex-grid` function
  - Our focus on grid systems is now solely in [Neat].
- `flex-gutter` function
  - Our focus on grid systems is now solely in [Neat].
- `golden-ratio` function
  - This function simply wrapped the `modular-scale` function. Please use the
    `modular-scale` instead, e.g. `modular-scale(1, 1em, $golden)`.
- `grid-width` function
  - Our focus on grid systems is now solely in [Neat].
- `inline-block` mixin

  [Neat]: https://neat.bourbon.io/
