# Fast and Furious Cinema

This is an api service that belongs to a small cinema. This cinema only shows movies that belong to the [Fast and Furious](https://en.wikipedia.org/wiki/The_Fast_and_the_Furious) franchise.
This service helps the cinema to update movie show times and show their customers the prices and show times of the showing movies. It also helps a customer to give a review of any movie.

You will find the documentation [here](https://fast-furious-cinema.herokuapp.com/)

## API Endpoints

| EndPoint                                |   Functionality                      |
| --------------------------------------- | ------------------------------------:|
| POST   /api/admin_users/sign_in         | Logs an admin user in                |
| DELETE /api/admin_users/sign_out        | Logs an admin user out               |
| GET    /api/v1/movies                   | Return movies and their ratings and show times   |
| GET    /api/v1/movies/:id               | Get a single movie details           |
| PUT    /api/v1/movies/:id               | Update a movie show time and price (for admins)  |
| POST	/api/v1/movies/:id/rating         | Rate a movie                         |

### Versioning
Changes and upgrades are made from time to time in this API. The API is versioned to avoid code breaking. New changes are implemented under a new version. Currently, the Api handles versioning through url name spacing. Simply add ```api/v1/``` to your url to use version 1. To use subsequent versions of the api, just change v1 to v2 or other versions you want.

### Limitations
The API only responds with json, and does not yet have support for xml and other response types.

## Contributing

### Prequisites
Ensure you have ruby and postgresql installed on your machine.
[Here is how to install ruby](https://www.ruby-lang.org/en/documentation/installation/). If you don't have postgres installed, you can follow the any of the install instructions [here](https://www.postgresql.org/download/).

### Installation

First, you will need to clone the repository

```bash
git clone git@github.com:VanPaitin/fast-furious-cinema.git
```
Then you cd into it

```bash
cd fast-furious-cinema
```

#### Install dependencies

```bash
bundle install
```
#### Environment variables

Setup your environment variables by running

```bash
cp .env.example .env.development
```
The application uses the [dotevn-rails gem](https://github.com/bkeepers/dotenv) to supply environment variables in development.

You will need to supply the `OMDB_API_KEY` env variable to be able to make requests to the **OMDB API**.

This service uses `devise-jwt` gem to issue tokens. In order for devise to work properly, it requires a secret key for encrypting payloads. You can use the default one available in the `.env.development` file or you can easily create another by running

```bash
rails secret
```

Then you setup your database by simply running the following command

```
rails db:setup
```

At this point, you will have your database ready seeded with all the movies. You will also have an AdminUser that has been created. In order to for you to make authenticated requests, you will need to sign in as an admin user.

Here are the admin user login details:

```
email: admin@example.com
password: password
```

### Running the server

```
rails server
```

Further instructions on using the api is available in the API usage documentation [here](https://fast-furious-cinema.herokuapp.com/)

### Runing the tests

Project is well tested. Unit and request specs were written for the project. Testing framework used is the [RSpec](https://github.com/rspec/rspec-rails) testing frame work with all of its elegant DSL. Other testing libraries used involve:

* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) - for rspec compatible one-liners to test model associations and validations.
* [Factory Bot](https://github.com/thoughtbot/factory_bot_rails) - for providing factories for active record objects.
* [Faker](https://github.com/faker-ruby/faker) - for generating fake data.

To run the specs, simply run:

```bash
rspec
```

### Updating app with your changes

1. Create your feature branch `git checkout -b my-new-feature`

2. Commit your changes `git commit -am 'Add some feature'`

3. Ensure all the tests pass

4. Push to the branch `git push origin my-new-feature`

5. Raise a Pull Request

### Deployment

Deployment happens automatically on merge to the master branch

## To Do
Below are items I will like to add in a real production environment.

* We will like to setup continuous integration for the project, that way, we ensure that only builds that passed are deployed.
* We will also like to create staging environments for our service so as to test new features in production like environments before deploying to the real production.
* We will like to create and endpoint or a rake task for new movie creation in future
