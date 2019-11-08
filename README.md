---
foo:
---


Engine Commerce Building Blocks Theme
=======================================================================

This is the Building Blocks theme for the Engine Commerce platform. We've created this theme as a repository of features to use when building store themes for clients.

Helpful resources, development guides, theme docs, and API docs can be found at [developers.enginecommerce.com](https://developers.enginecommerce.com).

<mark>
When your team started working with Engine, [a custom Slack channel](https://engine-ecommerce.slack.com/) was created to give you real-time support from the Engine developer support team. Reach out, as soon as you feel like it.
</mark>

---

## Get Started: Clone This Theme

```bash
git clone https://github.com/enginecommerce/building-blocks-theme.git
cd ./building-blocks-theme
```


---

## Setup Crank Shaft Server Sync

1. Install [fswatch](https://github.com/emcrisostomo/fswatch)
2. Edit the `upload.sh` script at the base of this repo, replacing variables with details from your server
3. Make `upload.sh` executable
    ```bash
    chmod 700 upload.sh
    ```
4. Add the following line to your shell (bash or zsh) in order to create a `crank_shaft` function
    ```bash
    function crank_shaft { fswatch -0 -1 . | xargs -0 -I $ ./upload.sh }
    ```
5. From within the theme directory, run `crank_shaft`

Crank Shaft should now be running. Whenever any files are saved, after about 15 seconds, edits will be synchronized and will appear on the confitured server.

---

<mark>This repo is under active development, as the Engine Commerce team adds new features daily.</mark>
