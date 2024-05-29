# Web Project Setup Script

This Bash script automates the setup process for a basic web project. It creates a directory structure with essential files, downloads favicon and apple-touch-icon images, generates an HTML file with a basic structure, creates a license, README, and robots.txt files, initializes a Git repository if desired, and optionally runs the project on a local server.

## Usage

1. Clone this repository or download the script from [this Gist](https://gist.github.com/sudo-self/88cd02f137bfd17e48552f63acd4851d).
2. Make sure you have bash installed on your system.
3. Run the script by executing `./webproject.sh` in your terminal.
4. Follow the on-screen prompts to initialize a Git repository and run the project on a local server if desired.

OR it can be run with npm 

```
npm install -g web-project-setup
```

## This command will:

Create a new directory named website-project.
Create script.js and style.css files.
Download favicon.ico and apple-touch-icon.png.
Generate an index.html file with basic HTML structure.
Create a license.txt file with the MIT license.
Create a README.md file.
Create a robots.txt file.
Create a manifest.json file for PWA support.
Initialize a Git repository and make the initial commit.
Install and start a local server using http-server.






## Requirements

- bash shell
- curl 
- npm (for running http-server)

## Project Structure

After running the script, the project directory will look like this:

```
website-project/
├── apple-touch-icon.png
├── favicon.ico
├── index.html
├── license.txt
├── manifest.json
├── README.md
├── robots.txt
├── script.js
└── style.css
```

## Photos

<img width="337" alt="Screenshot 2024-05-28 at 9 43 19 AM" src="https://github.com/sudo-self/web-project/assets/119916323/f84c2694-8515-4c4e-b34a-0782c5be68f8">


## Notes

- This project does not utilize any frameworks and is based on static HTML. 


## License

This script is released under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

This script was created by sudo-self. Feel free to reach out with any questions or feedback.
