# Xplore-API

> A Rails API for Xplore App. Xplore is a listing of vacation packages.

## Built With

- Ruby
- Rails
- Postgresql
- RSpec

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites
 - Ruby v2.6.3
 - Rails v5.2.4
 - Postgresql

### Setup & Install
- Clone this repository and cd into the project directory.
- Run `bundle install`
- Run `rails db:create`
- Run `rails db:migrate`
- Run `rails server`
- Install [httPie](https://httpie.org/) for sending requests from terminal. 

### Usage
To get a list of all packages:
  - Run - `http get :3000/api/v1/packages`

To get a user's wishlist 
  - Run - `http get :3000/api/v1/wishes username='insert user's name'`

To add a package to a user's wishlist.
  - Run - `http post :3000/api/v1/wishes username='insert user's name' id='insert package_id'`

### Run tests
To run tests,

  - Run - `bundle exec rspec`

## Author

👤 **Moses Ogwo**

- Github: [@mosesogwo](https://github.com/mosesogwo/)
- Linkedin: [Moses Ogwo](https://www.linkedin.com/in/moses-ogwo-327168114/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).


## Acknowledgments
- [Austin Kabiru](https://scotch.io/@austin) - For his helpful [tutorial](https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one)

## 📝 License

This project is [MIT](http://www.tldrlegal.com/license/mit-license) licensed.

