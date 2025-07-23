# demo_process_site

Site that demonstrates usage of Antora with Prism.js

## Install dependencies

It is easier if you install an Ubuntu 24.04 VM as discussed on this <a href="https://practicalcompute.cc/main-website/guides/ubuntu_24.04_vm_setup.html" target="_blank">site</a>.

If you do that, you will already have Node.js and npm installed.  You will also have **tree** installed and that could be useful for checking your directory structure.  Finally, that install will also include the **http-server** node package, that is useful for serving out your web pages locally.

### Installing Node.js and npm

On Debian-based Linux:

````
sudo apt install curl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.bashrc
nvm install --lts
````

### Installing ruby

On Debian-based Linux:

````
sudo apt install ruby
````

### Installing asciidoctor

On Debian-based Linux:

````
sudo apt install asciidoctor
````

### Installing git

On Debian-based Linux:

````
sudo apt install git
````

## Clone the demo_process_site.git repository

With these dependencies installed, run the following to clone the repository:

````
git clone https://github.com/webdev1hcc/demo_process_site.git
````

Then, change into the **demo_process_site** directory to run the following commands.  Note that here is where you install the Node.js depencies for this project.

````
cd demo_process_site
npm install -D -E antora
npm install @antora/collector-extension
npm install cheerio
npm install fs
````
Now, you are ready to build the site:

````
cd /path/to/demo_process_site
./make_all.sh
````
You should see the following:

````
$ ./make_all.sh 
Site generation complete!
Open file:///path/to/demo_process_site/build/site/index.html in a browser to view your site.
./build/site/demo-process-site/module1/for_loops1.html saved
./build/site/demo-process-site/module1/while_loops1.html saved
./build/site/demo-process-site/module2/while_loops.html saved
./build/site/demo-process-site/index.html saved
./build/site/demo-process-site/module2/for_loops.html saved
````
