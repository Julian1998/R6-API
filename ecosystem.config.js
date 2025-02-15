module.exports = {
    apps: [
        {
            name: 'r6-api',
            script: './dist/index.js',
            instances: 2,
            autorestart: true,
            watch: false,
        }
    ]
};
