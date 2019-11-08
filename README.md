Engine Commerce Building Blocks Theme
=======================================================================

This is the Building Blocks theme for the Engine Commerce platform. We've created this theme as a repository of features to use when building store themes for clients.

Helpful resources, development guides, theme docs, and API docs can be found at [developers.enginecommerce.com](https://developers.enginecommerce.com).

**When your team started working with Engine, [a custom Slack channel](https://slack.com/) was created for real-time support from the Engine developer support team. Reach out and say, "Hello! 👋" and let us know how it's going at any time.**

## Get Started: Clone This Theme

```bash
git clone https://github.com/enginecommerce/building-blocks-theme.git
cd ./building-blocks-theme
```

---

## Synchronize Your Local Theme With Your Store

Engine is a hosted platform, but we've made it easy to work locally with your favorite dev tools. **To synchronize your local work with your store, use the Crank Shaft script contained in theme download .ZIP files.**

When you download a theme from an Engine Commerce store, the Crank Shaft upload script is automatically populated with secure credentials from your store. There is a copy of the script in `theme_assets/scripts/upload.sh` only for reference.

1. Log into your store's admin dashboard, navigate to /admin/themes, and download the starter theme
2. Upzip the theme and copy the enclosed `/upload.sh` file to the root of this theme repo
3. Make the file executable
    ```bash
    chmod 700 upload.sh
    ```
4. Install the dependency [fswatch](https://github.com/emcrisostomo/fswatch)
5. Add the following line to your shell (bash or zsh) in order to create a `crank_shaft` shell function
    ```bash
    function crank_shaft { fswatch -0 -1 . | xargs -0 -I $ ./upload.sh }
    ```
6. From within the theme directory, run `crank_shaft`
7. To stop the function, type `CTRL+C`

When files are saved while Crank Shaft is running, edits will be synchronized with the store and will appear in store within about 15 seconds.

---

## Engine Theme Strucutre

Engine Themes will have the following directory layout:

```text
📂 /
├- 📂 engine_cms
|  ├- 📂 categories
|  └- 📂 posts
├- 📂 spree
|  ├- 📂 checkout
|  ├- 📂 errors
|  ├- 📂 home
|  ├- 📂 layouts
|  ├- 📂 orders
|  ├- 📂 products
|  ├- 📂 shared
|  ├- 📂 taxons
|  ├- 📂 user_passwords
|  ├- 📂 user_registrations
|  ├- 📂 user_sessions
|  └- 📂 users
└- 📂 theme_assets
   ├- 📂 fonts
   ├- 📂 img
   ├- 📂 js
   ├- 📂 scss
   ├- 📂 scripts
   ├- 📄 settings_data.json
   └- 📄 settings_schema.json
```

Each folder in `spree` and `engine_cms` contains Liquid files that become the pages of a store. Reusable partials live in the `spree/shared` folder.

`theme_assets` are the non-Liquid files that make up your theme, like JavaScript and CSS. Engine has native support for [SCSS](https://sass-lang.com/) and favors it over vanilla CSS. Also included are two JSON files that allow Engine operators to customize your theme.

---

## More Guides and Docs

**We hope this repo and README help you get started, but there is much more help available to you. Helpful resources, development guides, theme docs, and API docs can be found at [developers.enginecommerce.com](https://developers.enginecommerce.com).**

---

<mark>_NOTE: This repo is under active development, as the Engine Commerce team adds new features regularly._</mark>
