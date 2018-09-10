## Getting Started ##



### Installing gems ###
To install gems type:
```shell
bundle install
```

### Drivers: ###
Install and include in PATH
- [chromedriver](https://sites.google.com/a/chromium.org/chromedriver/)
- [phantomjs](http://phantomjs.org/)
- [internetExplorerDriver](http://www.seleniumhq.org/download/)
- [Firefox Geckodriver](https://developer.mozilla.org/en-US/docs/Mozilla/QA/Marionette/WebDriver)

Install [Webdriver Safari extension](http://selenium-release.storage.googleapis.com/2.48/SafariDriver.safariextz).


### Run tests in DEV with Chrome###
Type this in the tests folder:
```shell
bundle exec cucumber  -p ci -p html -p headless -p dev
```

### Run tests in DEV with headless###
Type this in the tests folder:
```shell
bundle exec cucumber  -p ci -p html -p headless -p dev
```

### Run tests in HMG with Chrome###
Type this in the tests folder:
```shell
bundle exec cucumber -p pretty -p html -p no_headless -p hmg
```

### Run tests in HMG with headless###
Type this in the tests folder:
```shell
bundle exec cucumber -p ci -p html -p headless -p hmg
```

### Run with tags###
Type this in the tests folder:
```shell
bundle exec cucumber --tags @run
```
