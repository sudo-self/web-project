#!/bin/bash

# Function to initialize Git repository and perform initial commit
initialize_git() {
    git init
    git add .
    git commit -m "Initial commit"
    echo "Git repository initialized and initial commit performed."
}

# Function to download file from URL
download_file() {
    url=$1
    filename=$2
    if curl -sSL "$url" -o "$filename"; then
        echo "$filename downloaded."
    else
        echo "Failed to download $filename"
        exit 1
    fi
}

# Create a new directory
mkdir -p website-project
cd website-project || exit

# Create directories for assets, styles, and scripts
mkdir -p assets css js

# Create script.js and style.css files
touch js/script.js css/style.css

# Download favicon.ico and apple-touch-icon.png
download_file "https://pub-c1de1cb456e74d6bbbee111ba9e6c757.r2.dev/favicon.ico" "assets/favicon.ico"
download_file "https://pub-c1de1cb456e74d6bbbee111ba9e6c757.r2.dev/apple-touch-icon.png" "assets/apple-touch-icon.png"

# Generate index.html file
cat << EOF > index.html
<!doctype html>
<html class="no-js" lang="">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Welcome to Web Project!</title>
  <link rel="stylesheet" href="css/style.css">
  <link rel="icon" href="assets/favicon.ico" sizes="any">
  <link rel="apple-touch-icon" href="assets/apple-touch-icon.png">
  <meta name="description" content="">
  <meta property="og:title" content="">
  <meta property="og:type" content="">
  <meta property="og:url" content="">
  <meta property="og:image" content="">
  <meta property="og:image:alt" content="">
  <link rel="manifest" href="site.webmanifest">
  <meta name="theme-color" content="#fafafa">
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    h1 {
      font-size: 36px;
      text-align: center;
    }
  </style>
</head>
<body>
    <h1>Welcome to Web Project!</h1>
    <script src="js/script.js"></script>
</body>
</html>
EOF

# Create license.txt file
cat << EOF > license.txt
Copyright (c) 2024 <your name>

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
EOF

# Create README.md file
cat << EOF > README.md
## Web Project

This is a web project generated using a bash script.

### Setup

\`\`\`bash
git clone <repository_url>
cd website-project
npm install
\`\`\`

### Development

\`\`\`bash
npm start
\`\`\`

### Build

\`\`\`bash
npm run build
\`\`\`

### Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests.
EOF

# Create robots.txt file
echo "User-agent: *\nDisallow:" > robots.txt

# Create manifest.json file
cat << EOF > manifest.json
{
  "name": "Web Project",
  "short_name": "Web",
  "start_url": "https://example.com",
  "scope": "./",
  "icons": [
    {
      "src": "assets/apple-touch-icon.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "assets/apple-touch-icon.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ],
  "theme_color": "#000000",
  "background_color": "#333",
  "display": "standalone"
}
EOF

# Create .gitignore file
cat << EOF > .gitignore
node_modules/
.DS_Store
EOF

# Create basic content for style.css and script.js
cat << EOF > css/style.css
/* css/style.css */
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
}

h1 {
  color: #333;
}
EOF

cat << EOF > js/script.js
// js/script.js
document.addEventListener('DOMContentLoaded', () => {
  console.log('Welcome to Web Project!');
});
EOF

# Initialize Git repository
read -rp "Initialize Git repository? (y/n): " initialize_git_option
if [[ "$initialize_git_option" =~ ^[Yy]$ ]]; then
    initialize_git
else
    echo "Git repository not initialized. Continuing without Git."
fi

# Run project on server
read -rp "Run project on server? (y/n): " run_on_server_option
if [[ "$run_on_server_option" =~ ^[Yy]$ ]]; then
    if npm install http-server; then
        npx http-server
    else
        echo "Failed to install http-server."
    fi
else
    echo "Project is Ready!"
fi

if [[ "$initialize_git_option" =~ ^[Yy]$ ]]; then
    echo "Git repository initialized and initial commit performed."
fi

echo "Thank you, Enjoy your Web-Project!"
