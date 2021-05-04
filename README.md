# Menu API

A simple app using Rails framework with API only configuration.

The project is built with Ruby 3.0 and Rails 6.1

### Dependencies

* Ruby 3.0.0
* NodeJS 14.16.1
* Yarn 1.22.10
* PostgreSQL 13.1

### Installation

* Run `bin/setup` this will install the necessary things to get you up and running.

### Testing

* Run `bundle exec rails test:all` this will run all the test cases.

### Technical Overview

Menus controller with action of `calculate_ids` accepts JSON data and computes the sum of menu objects ID that has a label.
