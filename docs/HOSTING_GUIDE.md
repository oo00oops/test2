# GitHub Pages Hosting Guide

This repository is configured to automatically deploy the compiled web client to GitHub Pages.

## Setup Instructions

### 1. Enable GitHub Pages in Your Repository

1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Under "Build and deployment":
   - **Source**: Select "GitHub Actions"
   - This will automatically deploy from the `javascript/` folder

### 2. Configure Your Repository Settings

Ensure your repository settings are correct:

```
Settings → Pages
  - Source: GitHub Actions
  - Visibility: Public (for free GitHub Pages hosting)
```

### 3. First Deployment

The GitHub Pages deployment will happen automatically when you:
- Push code to the `main` branch
- Or manually trigger via "Actions" tab → "Deploy to GitHub Pages" → "Run workflow"

## Accessing Your Client

Once deployed, your EaglercraftX client will be available at:

```
https://<username>.github.io/<repository-name>/
```

For example:
- If your username is `myuser` and repo is `source-code`: `https://myuser.github.io/source-code/`

### Custom Domain (Optional)

To use a custom domain:

1. Add a `CNAME` file to the `javascript/` folder with your domain name
2. Configure your domain's DNS to point to GitHub Pages
3. Update repository settings to use the custom domain

## Build Process

The GitHub Pages workflow automatically:

1. Checks out your repository
2. Sets up Java 17
3. Runs `CompileEPK.sh` to generate assets
4. Runs `CompileJS.sh` to compile the JavaScript client
5. Uploads the `javascript/` folder to GitHub Pages

## Local Testing

To test locally before pushing:

```bash
# Compile the client
./CompileEPK.sh
./CompileJS.sh

# Start a local HTTP server
cd javascript/
python3 -m http.server 8000

# Open in browser
# http://localhost:8000/
```

## Troubleshooting

### Build Fails
- Check the Actions tab for error logs
- Ensure Java 17 is compatible with your code
- Verify `CompileEPK.sh` and `CompileJS.sh` work locally

### Client Won't Load
- Ensure you're accessing via HTTPS (some APIs require it)
- Check browser console for errors (F12)
- Verify all assets.epk and lang files are present

### Need to Disable Auto-Deploy
- Comment out or delete `.github/workflows/deploy-pages.yml`
- Or disable Actions in repository settings

## Manual Deployment

If you prefer manual deployment:

```bash
# Build locally
./CompileEPK.sh
./CompileJS.sh

# The javascript/ folder is now ready to serve
# You can deploy via your own hosting service
```

## Repository Structure

```
root/
├── .github/workflows/
│   └── deploy-pages.yml          # Automatic deployment configuration
├── javascript/                   # Compiled web client (deployed to Pages)
│   ├── index.html
│   ├── classes.js
│   ├── assets.epk
│   └── lang/
├── src/                          # Source code
├── build.gradle
├── CompileEPK.sh
├── CompileJS.sh
└── README.md
```

## Related Resources

- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [EaglercraftX Documentation](EAGLERCRAFTX_README.md)
