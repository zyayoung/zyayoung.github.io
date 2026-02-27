// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
	site: 'https://zyayoung.github.io',
	base: '/',
	output: 'static',
	build: {
		outDir: './dist'
	},
	vite: {
		plugins: [
			{
				name: 'add-nojekyll',
				closeBundle() {
					import('fs').then(fs => {
						const nojekyllPath = './dist/.nojekyll';
						try {
							fs.writeFileSync(nojekyllPath, '');
							console.log('Created .nojekyll file for GitHub Pages');
						} catch (err) {
							console.error('Failed to create .nojekyll file:', err);
						}
					});
				}
			}
		]
	}
});
