# EaglercraftX GitHub Pages Setup

This repository is now configured for automated deployment to GitHub Pages. Your EaglercraftX web client will be automatically built and hosted on GitHub Pages with every push to the main branch.

## Quick Start

### For GitHub Pages Hosting:

1. **Push to main branch** - The GitHub Actions workflow will automatically:
   - Compile the EPK assets
   - Compile the JavaScript client
   - Deploy to GitHub Pages

2. **Access your client at:**
   ```
   https://<your-username>.github.io/<your-repo-name>/
   ```

### For Local Testing:

**On Linux/macOS:**
```bash
chmod +x setup-github-pages.sh
./setup-github-pages.sh
# Opens server on http://localhost:8000/
```

**On Windows:**
```cmd
setup-github-pages.bat
# Opens server on http://localhost:8000/
```

Or manually:
```bash
./CompileEPK.sh
./CompileJS.sh
cd javascript
python3 -m http.server 8000
```

## What's Been Set Up

### Automated Deployment
- ✅ GitHub Actions workflow (`.github/workflows/deploy-pages.yml`)
- ✅ Automatic builds on every push
- ✅ Automatic deployment to GitHub Pages

### Configuration
- ✅ `.nojekyll` file - Tells GitHub to serve static files as-is
- ✅ `_config.yml` - Jekyll configuration
- ✅ Dependabot configuration for security updates

### Scripts
- ✅ `setup-github-pages.sh` - Linux/macOS setup and local testing
- ✅ `setup-github-pages.bat` - Windows setup and local testing
- ✅ GitHub Actions workflow in `.github/workflows/`

### Documentation
- ✅ `docs/HOSTING_GUIDE.md` - Detailed hosting guide

## Repository Settings (Action Required)

⚠️ **Important:** You must enable GitHub Pages in your repository settings:

1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Under "Build and deployment":
   - **Source**: Select `GitHub Actions`
   - Save

Once configured, your site will be available at:
```
https://<username>.github.io/<repository>/
```

## Features

- 📱 **Automatic Deployment** - Builds and deploys on every push
- 🚀 **Fast Setup** - Everything is pre-configured
- 🔒 **Secure** - Uses GitHub Actions for automated builds
- 📊 **CI/CD Ready** - Includes Dependabot for security updates
- 💻 **Cross-Platform** - Works on Windows, Linux, and macOS

## File Structure

```
.
├── .github/
│   ├── workflows/
│   │   └── deploy-pages.yml    # GitHub Actions deployment
│   └── dependabot.yml
├── javascript/                 # Your compiled web client
│   ├── .nojekyll              # Tells GitHub to serve static files
│   ├── index.html
│   ├── classes.js
│   ├── assets.epk
│   └── lang/
├── docs/
│   └── HOSTING_GUIDE.md        # Detailed hosting documentation
├── setup-github-pages.sh       # Linux/macOS setup script
├── setup-github-pages.bat      # Windows setup script
├── _config.yml                 # Jekyll configuration
├── src/                        # Source code
├── build.gradle
├── CompileEPK.sh
└── CompileJS.sh
```

## Troubleshooting

### "Build Failed" in GitHub Actions
- Check the Actions tab for error logs
- Ensure the build works locally first
- Verify Java 17 is available in your environment

### Site not loading at all
- Ensure GitHub Pages is enabled in Settings → Pages
- Wait 1-2 minutes after first deployment
- Clear browser cache (Ctrl+Shift+Del)

### CORS/API errors
- Ensure you're accessing via the full GitHub Pages URL
- Check browser console (F12) for error details
- Verify relay servers are configured correctly in `javascript/index.html`

### Local server won't start
- Ensure Python 3 is installed: `python3 --version`
- Check that port 8000 is not in use
- On Windows, use `python -m http.server 8000` if python3 command doesn't work

## Advanced Configuration

### Custom Domain
1. Add a `CNAME` file to the `javascript/` folder with your domain
2. Configure DNS records with your provider
3. Update GitHub Pages settings to use the custom domain

### Modify Build Settings
Edit `.github/workflows/deploy-pages.yml` to change:
- Java version
- Build commands
- Deployment triggers

### Disable Automatic Deployment
Delete `.github/workflows/deploy-pages.yml` and deploy manually to your hosting service.

## Manual Deployment

If you prefer not to use GitHub Pages:

1. Build locally: `./CompileEPK.sh && ./CompileJS.sh`
2. The `javascript/` folder contains your complete web client
3. Deploy the `javascript/` folder to any web host
4. Ensure your host serves it over HTTPS

## Next Steps

1. ✅ Commit these changes to your repository
2. ✅ Push to the main branch
3. ✅ Enable GitHub Pages in Settings → Pages (if not already done)
4. ✅ Wait 2-3 minutes for the first deployment
5. ✅ Access your site at `https://<username>.github.io/<repo-name>/`

## Support

For more information:
- [GitHub Pages Docs](https://docs.github.com/en/pages)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
- See `docs/HOSTING_GUIDE.md` for detailed hosting information
- See `EAGLERCRAFTX_README.md` for EaglercraftX-specific information

---

**Your EaglercraftX web client is now ready for GitHub Pages!** 🚀
