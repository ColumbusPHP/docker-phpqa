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

## Creating a test

Sometimes the generatephpt.phar is bad so you need to rebuild it locally.

- `cd php-src/scripts/dev/generate-phpt`
- `rm ../generate-phpt.phar`
- `php gtPackage.php`
   - This may require changes to php.ini to allow phar.readonly to be Off.


## License

The MIT License seen in the LICENSE file covers this repository with the following exceptions:

* `phpqa/action/phpqa.sh` is derivative of [herdphp/docker-phpqa](https://github.com/herdphp/docker-phpqa) Dockerfile under the following license:

```
The MIT License (MIT)

Copyright (c) 2017 Bruno Ricardo Siqueira, Joao Paulo Vendramini Martins

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

