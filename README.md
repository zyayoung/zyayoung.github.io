# Yuang Zhang - Academic Personal Homepage

A professional academic personal homepage built with Astro, designed for computer vision researchers. This site showcases academic achievements, research interests, publications, and contact information.

## 🎯 Features

- **Modern Design**: Clean, responsive design that reflects academic professionalism
- **Academic Statistics**: Display of citations, publications, h-index, and i10-index
- **Research Showcase**: Highlighted research interests and selected publications
- **Education Background**: Academic history and achievements
- **Contact Information**: Professional contact details and links to academic profiles
- **Skills & Tools**: Technical expertise and research tools

## 🚀 Live Demo

The site is available at: [https://zyayoung.github.io](https://zyayoung.github.io)

## 🏗️ Project Structure

```text
/
├── .github/workflows/    # GitHub Actions deployment configuration
├── public/              # Static assets (favicon, images, etc.)
├── src/
│   └── pages/
│       └── index.astro  # Main homepage with academic profile
├── astro.config.mjs     # Astro configuration for GitHub Pages
└── package.json         # Dependencies and scripts
```

## 🧞 Available Commands

All commands are run from the root of the project:

| Command                | Action                                           |
| :--------------------- | :----------------------------------------------- |
| `npm install`          | Installs dependencies                            |
| `npm run dev`          | Starts local dev server                          |
| `npm run build`        | Build your production site to `./dist/`          |
| `npm run preview`      | Preview your build locally                       |
| `npm run deploy`       | Build and deploy to GitHub Pages (manual)        |

## 🌐 Deployment to GitHub Pages

This site is configured for automatic deployment to GitHub Pages:

### Automatic Deployment

1. Push your changes to the `main` branch
2. GitHub Actions will automatically:
   - Install dependencies
   - Build the Astro site
   - Deploy to GitHub Pages

### Manual Deployment

If you want to deploy manually:

```bash
npm run build
npm run deploy
```

### Environment Setup

The following environment configurations are already set:

- **GitHub Pages Source**: `gh-pages` branch or `GitHub Actions`
- **Custom Domain**: Configured via `CNAME` file (if needed)
- **Build Directory**: `./dist`

## 📝 Customization Guide

### Personal Information

Edit the following in `src/pages/index.astro`:

1. **Name and Title**: Update the `<h1>` and `<h2>` elements
2. **Institution and Email**: Update the contact information
3. **Academic Statistics**: Update the citation and publication numbers
4. **Research Interests**: Modify the research areas and descriptions
5. **Publications**: Add or update your selected publications
6. **Education**: Update your academic background

### Styling

The site uses a custom CSS color scheme with:
- **Primary Color**: `#2c3e50` (dark blue)
- **Secondary Color**: `#3498db` (light blue)
- **Accent Color**: `#e74c3c` (red)

You can modify the CSS variables in the `<style>` tag to change the color scheme.

## 🎨 Design Philosophy

This academic homepage is designed with the following principles:

1. **Clarity Over Complexity**: Information is presented in a clear, organized manner
2. **Responsive Design**: Works well on all devices from mobile to desktop
3. **Academic Professionalism**: Clean, modern design that reflects research excellence
4. **Performance Focus**: Fast loading with minimal JavaScript
5. **Accessibility**: Semantic HTML and proper contrast ratios

## 📚 Technology Stack

- **Framework**: [Astro](https://astro.build) - Modern static site generator
- **Hosting**: [GitHub Pages](https://pages.github.com) - Free static site hosting
- **CI/CD**: [GitHub Actions](https://github.com/features/actions) - Automated deployment
- **Styling**: Custom CSS with modern CSS features

## 🔗 Useful Links

- [Astro Documentation](https://docs.astro.build)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Google Scholar Profile](https://scholar.google.com/citations?user=pP5WG9wAAAAJ&hl=en)

## 📄 License

This project is open source and available under the MIT License.
