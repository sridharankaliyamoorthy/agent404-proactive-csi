# RETENX Dashboard - Website

This is the Vercel-deployed Next.js frontend for the ProActive CSI project.

## Project Structure

This website folder contains a complete Next.js 14 application with:
- **React 18** with TypeScript
- **Tailwind CSS** for styling
- **Recharts** for data visualization
- **Lucide React** for icons

## Development

### Local Development

```bash
cd website
npm install
npm run dev
```

The website will be available at `http://localhost:3000`

### Build for Production

```bash
cd website
npm run build
npm start
```

## Deployment to Vercel

### Option 1: Deploy from Root Directory

The root `vercel.json` is configured to build from the `website` folder:

```bash
# From project root
vercel
```

### Option 2: Deploy from Website Directory

You can also deploy directly from the website folder:

```bash
cd website
vercel
```

## Integration with Backend

This website is integrated with the ProActive CSI Python backend:
- **Backend**: Python/Streamlit application (`app.py`)
- **Frontend**: Next.js website (this folder)
- Both can run independently without conflicts

## Notes

- The website folder is completely isolated from the Python backend
- All Next.js dependencies are in `website/node_modules/`
- Build artifacts go to `website/.next/`
- The root `.gitignore` excludes website build files
