/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone',
  reactStrictMode: true,
  swcMinify: true,
  // Disable image optimization for IBM Cloud
  images: {
    unoptimized: true,
  },
}

module.exports = nextConfig

