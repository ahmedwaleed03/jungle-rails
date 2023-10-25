# Jungle

A mini e-commerce application built with Rails 6.1 and tested with Rspec and Cypress.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 with Date being any future date and a CVC of any 3 digits for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Final Product
!["Homepage"](https://github.com/ahmedwaleed03/jungle-rails/blob/master/docs/Homepage.png?raw=true)
!["HTTP Authentication"](https://github.com/ahmedwaleed03/jungle-rails/blob/master/docs/HTTPAuthentication.png?raw=true)
!["Cart"](https://github.com/ahmedwaleed03/jungle-rails/blob/master/docs/Cart.png?raw=true)
!["Order Confirmation"](https://github.com/ahmedwaleed03/jungle-rails/blob/master/docs/OrderConfirmation.png?raw=true)
!["Signup"](https://github.com/ahmedwaleed03/jungle-rails/blob/master/docs/Signup.png?raw=true)
!["Login"](https://github.com/ahmedwaleed03/jungle-rails/blob/master/docs/Login.png?raw=true)
!["Logged in Homepage"](https://github.com/ahmedwaleed03/jungle-rails/blob/master/docs/LoggedIn.png?raw=true)