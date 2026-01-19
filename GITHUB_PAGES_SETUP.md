# EaglercraftX GitHub Pages Setup

This repository is configured for deployment to GitHub Pages. Your EaglercraftX web client can be hosted on GitHub Pages.

## Important Note: Building vs Deploying

This repository **requires local setup** before it can be compiled to JavaScript:

1. The Minecraft 1.8 source code is NOT included (as stated in the README)
2. You must run the setup scripts (`build_init`, `build_make_workspace`) locally first
3. Once compiled locally, push the `javascript/` folder to GitHub

See [Setup Instructions Below](#local-setup-required)

## Quick Start

### For GitHub Pages Hosting:

1. **Build locally** - See setup section below
2. **Push to main branch** - The GitHub Actions workflow will automatically deploy to GitHub Pages
3. **Access your client at:**
   ```
   https://<your-username>.github.io/<your-repo-name>/
   ```

### For Local Testing:

**On Linux/macOS:**
```bash
chmod +x setup-github-pages.sh
./setup-github-pages.sh build
# This only starts the server (no build - do that first with build_init)
```

**On Windows:**
```cmd
setup-github-pages.bat build
# This only starts the server (no build - do that first with build_init)
```

---

## Local Setup Required

Before you can deploy to GitHub Pages, you need to compile the JavaScript client locally.

### Step 1: Prepare the Build Environment

Follow the setup instructions in the repository README:

```bash
# 1. Prepare Minecraft 1.8 source (see mcp918/readme.txt)
# 2. Run build initialization
./build_init

# 3. Create workspace
./build_make_workspace

# 4. Compile EPK assets
./CompileEPK.sh

# 5. Compile to JavaScript
./CompileJS.sh
```

**Note:** This requires Java 21 and the Minecraft 1.8 source code (Mod Coder Pack).

See [EAGLERCRAFTX_README.md](EAGLERCRAFTX_README.md) for detailed setup instructions.

### Step 2: Verify the Build

Check that `javascript/` folder contains:
- `index.html`
- `classes.js`
- `assets.epk`
- `lang/` folder
- `favicon.png`

### Step 3: Deploy to GitHub Pages

```bash
# 1. Commit your changes
git add .
git commit -m "Add compiled EaglercraftX client"

# 2. Push to GitHub
git push origin main

# 3. Enable GitHub Pages in Settings → Pages
#    (Select "GitHub Actions" as source)

# 4. Your site will be live in 2-3 minutes at:
#    https://<username>.github.io/<repo>/
```

---

## What's Been Set Up

### Deployment Workflow
- ✅ GitHub Actions workflow (`.github/workflows/deploy-pages.yml`)
- ✅ Automatic deployment on every push
- ✅ Deploys the `javascript/` folder to GitHub Pages

### Configuration
- ✅ `.nojekyll` file - Serves static files without Jekyll processing
- ✅ `_config.yml` - Jekyll configuration
- ✅ Dependabot configuration for security updates

### Documentation
- ✅ `docs/HOSTING_GUIDE.md` - Detailed hosting guide
- ✅ `SETUP_CHECKLIST.md` - Complete checklist
- ✅ This file

---

## Repository Settings (Required Action)

⚠️ **Important:** You must enable GitHub Pages in your repository settings:

1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Under "Build and deployment":
   - **Source**: Select `GitHub Actions`
   - Click **Save**

Once configured, your site will be available at:
```
https://<username>.github.io/<repository>/
```

---

## How It Works

```
Local Build
├─ build_init script
├─ Decompile Minecraft 1.8
├─ Apply patches
└─ Compile to JavaScript

Commit & Push
    ↓
GitHub Actions Triggered
    ├─ Checks out code
    └─ Uploads javascript/ folder
    ↓
GitHub Pages Deploys
    ↓
Available at Your URL
```

---

## Troubleshooting

### "Build Failed" locally
- Ensure Java 21 is installed: `java -version`
- Check you ran `build_init` and `build_make_workspace`
- See [EAGLERCRAFTX_README.md](EAGLERCRAFTX_README.md) for help

### Site not loading on GitHub Pages
- Ensure GitHub Pages is enabled in Settings → Pages
- Wait 1-2 minutes after first push
- Clear browser cache (Ctrl+Shift+Del)

### Missing javascript/ folder
- Run the build locally first: `./CompileEPK.sh && ./CompileJS.sh`
- Commit the compiled files
- Push to GitHub

---

## Next Steps

1. ✅ Run local build setup (see above)
2. ✅ Compile JavaScript locally
3. ✅ Commit and push compiled files
4. ✅ Enable GitHub Pages in Settings
5. ✅ Wait for deployment to complete
6. ✅ Access your site at the GitHub Pages URL

---

## Support

For more information:
- [EAGLERCRAFTX_README.md](EAGLERCRAFTX_README.md) - Build and compilation help
- [docs/HOSTING_GUIDE.md](docs/HOSTING_GUIDE.md) - Detailed hosting documentation
- [GitHub Pages Docs](https://docs.github.com/en/pages)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
