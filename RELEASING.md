# Releasing CaveMaxx

A release is two things: a **tag** (a named bookmark on one commit, like `v1.0.0`) and a
**release page** on GitHub with downloadable files attached. You never build the files
yourself. A small robot, the workflow in `.github/workflows/release.yml`, runs on GitHub's
computers, builds `cavemaxx-<version>.zip` and `cavemaxx.skill` with `scripts/package.sh`,
and attaches them to the release page. The YAML file is just the robot's instructions; you
don't edit or run it.

Everything below happens in your browser on github.com. No terminal needed.

## Every release: three steps

### 1. Bump the version number

1. Open `.claude-plugin/plugin.json` in the repo and click the pencil icon (Edit).
2. Change `"version": "1.0.0"` to the new number, for example `"1.0.1"`.
3. Click **Commit changes**, keep "Commit directly to the main branch", commit.

Which number? `1.0.1` for fixes and wording, `1.1.0` for a new feature, `2.0.0` for a
change that alters how the skill behaves. This is the only place the version lives.

### 2. Write the release notes

1. Open `.github/release-notes.md` and click the pencil icon.
2. Replace the text with what changed in this version. This text becomes the release page,
   so write it for a user, not for yourself.
3. Commit to main.

### 3. Run the robot

1. Click the **Actions** tab at the top of the repo.
2. In the left column click **Release**.
3. On the right, click the **Run workflow** dropdown.
4. Leave the branch as `main`. In the **Tag to release** box type the version with a `v` in
   front, exactly matching step 1: `v1.0.1`.
5. Click the green **Run workflow** button.

A run appears in the list within a few seconds. It takes about a minute. When it shows a
green check, go to **Releases** (right-hand column of the repo home page): the new release
is there with both files attached, and the tag was created for you.

That's it.

## If the run shows a red X

Click the run, then click the **release** job, and read the step that is red.

| What it says | What to do |
|---|---|
| `plugin.json says v1.0.0 but the tag is v1.0.1` | Step 1 was skipped or the numbers don't match. Fix `plugin.json`, then run the workflow again with the same tag. |
| Something about `zip` or `package.sh` | The package script hit a problem. Copy the red lines into a Claude session with the repo and ask it to fix the script. |
| `Resource not accessible by integration` | Actions lost permission to write. Repo **Settings → Actions → General → Workflow permissions**: choose **Read and write permissions**, save, run again. |

Running the workflow again with the same tag is safe. It replaces the attached files.

## Undoing a release

1. **Releases** → open the release → **Delete** (trash icon).
2. **Tags** (next to Branches on the repo home page) → the tag → **Delete tag**.
3. Fix whatever was wrong, then run the three steps again.

## The terminal way, if you prefer it

Bumping the version and notes is the same. Then, instead of clicking Run workflow:

```bash
git pull
git tag v1.0.1
git push origin v1.0.1
```

Pushing any tag whose name starts with `v` triggers the same robot automatically.

## What the two files are

`cavemaxx-<version>.zip` and `cavemaxx.skill` have identical contents: one folder named
`cavemaxx` with `SKILL.md` inside. They are the zip `make-release.sh` builds for Gumroad, under
the two names this page uses, so both downloads are the same product. The `.skill` extension
is what Claude.ai shows for skills; the `.zip` is for people who want to unzip it into
`~/.claude/skills/`. The README's install instructions point at both.
