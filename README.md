# Fine

![CircleCI](https://img.shields.io/circleci/project/github/mrcnk/fine.svg)

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
