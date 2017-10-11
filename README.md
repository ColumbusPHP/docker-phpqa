# ColumbusPHP PHPTestFest Docker

This is essentially a fork of herdphp/phpqa to make it easier to develop locally.

## Getting Started

### 1. Requirements

Make sure you have the following installed:

1. Docker
   1. Windows
      1. Docker for Windows **only** if you do **not** use VirtualBox and have Hyper-V support.
      2. Docker Toolbox if you use VirtualBox.
   2. MacOS
      * https://store.docker.com/editions/community/docker-ce-desktop-mac 
   3. Linux
      * Either get docker and docker-compose packages for your distribution or compile those from source.
      * If you do not have docker-compose, you can use the following Makefile to install it via pip automatically:
         * `make`
         * `. env/bin/activate`

### 2. Download PHP Source

We want to download the PHP source via Git so that we can easily edit it before running the container.

* Windows:
   * Use either TortoisGit, git-bash or babun/cygwin with Git installed to clone `https://github.com/php/php-src.git`.
* MacOS/Linux:
   * Use git via the command-line.

Commands regardless of operating system:
* `git clone --branch PHP-7.2 https://github.com/php/php-src.git`

### 3. Run the container

* Windows:
   * Docker Toolbox
      * Run the Docker Quickstart Terminal and browse to this directory.
         * Then run `docker-compose up`
* MacOS/Linux:
   * Browse to this directory in a terminal
   * Then run `docker-compose up`

Test output should be visible afterward.

## Managing Docker

### Shut things down

Run `docker-compose stop` so that you do not lose your work later.

Run `docker-compose down` to remove everything and start from scratch.

### Refresh

Run `docker-compose restart` after you've made some changes in phpqa/php locally such as adding a test.

### Running one test

1. Open docker-compose.yml in your favorite editor.
2. Find the `PHPQA_TESTS:` line and add the path to the test there

```
    environments:
      PHPQA_TESTS: "tests/basic/001.phpt"
```

Then run `docker-compose up` again :-)


