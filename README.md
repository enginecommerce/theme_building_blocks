Engine Commerce Building Blocks Theme
=======================================================================

This is the Building Blocks theme for the Engine Commerce platform. We've created this theme as a repository of features to use when building store themes for clients.

Helpful resources, development guides, theme docs, and API docs can be found at [developers.enginecommerce.com](https://developers.enginecommerce.com).

**When your team started working with Engine, [a custom Slack channel](https://engine-ecommerce.slack.com/) was created for real-time support from the Engine developer support team. Reach out and say, "Hello! 👋" and let us know how it's going at any time.**

## Get Started: Clone This Theme

```bash
git clone https://github.com/enginecommerce/building-blocks-theme.git
cd ./building-blocks-theme
```

---

## Setup Crank Shaft Server Sync

The Crank Shaft upload script is populated with secure credentials from your store server when you download a theme from an Engine Commerce store. There is a copy of the script in `/scripts/upload.sh` for reference.

To set up Crank Shaft, we will download a starter theme from your store and use it with this git repo.

1. Install the dependency [fswatch](https://github.com/emcrisostomo/fswatch)
2. Log into your store's admin dashboard, navigate to /admin/themes, and download the starter theme
2. Upzip the theme and copy the enclosed `/upload.sh` file to the root of this theme repo
3. Make the file executable
    ```bash
    chmod 700 upload.sh
    ```
4. Add the following line to your shell (bash or zsh) in order to create a `crank_shaft` shell function
    ```bash
    function crank_shaft { fswatch -0 -1 . | xargs -0 -I $ ./upload.sh }
    ```
5. From within the theme directory, run `crank_shaft`
6. To stop the function, type `CTRL+C`

When files are saved while Crank Shaft is running, edits will be synchronized and will appear on the configured server within about 15 seconds.

---

<mark>_NOTE: This repo is under active development, as the Engine Commerce team adds new features regularly._</mark>
