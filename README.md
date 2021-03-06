# Fine

[![CircleCI](https://circleci.com/gh/mrcnk/fine.svg?style=svg)](https://circleci.com/gh/mrcnk/fine)
[![Maintainability](https://api.codeclimate.com/v1/badges/edd5076871dea4d5fc80/maintainability)](https://codeclimate.com/github/mrcnk/fine/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/edd5076871dea4d5fc80/test_coverage)](https://codeclimate.com/github/mrcnk/fine/test_coverage)

RESTful API for Vine / Instagram clone app.

### Ruby / Rails versions

* Ruby 2.4.1
* Ruby on Rails 5.2

### Testing

Stack:
* RSpec
* Shoulda Matchers

Run tests:
```sh
$ rake
```

### Getting started

```sh
$ rvm use 2.4.1
$ bundle
$ rake db:create
$ rake db:schema:load
$ rake db:migrate
$ rails s
```

### Code style

Code follows *Ruby Style Guide*. The **Rubocop** running in CircleCI makes sure it does.

### Demo

[Click here](http://fine-api.herokuapp.com)

### Docs

[Fine Docs](http://mrcnk.me/fine)

To generate docs from RSpec acceptance tests:
```sh
$ rspec spec/acceptance --format RspecApiDocumentation::ApiFormatter
```
