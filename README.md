# Coat or No Coat

CONC saves users time and energy on busy mornings with a customizable daily alert that recommends outerwear based on the weather.

This is the CONC back end, which stores users and their coats, generates user sessions, and queries external APIs for forecast and geocoding data. In development is the Coat Selector model to match User Coats with each day's Forecast. 

[Visit Coat or No Coat's front end!](https://beccahyland.github.io/frontend_coat_or_no_coat/) *(currently in development)*
<img width="1440" alt="updated style after review" src="https://user-images.githubusercontent.com/39714935/49409669-cde1b180-f71e-11e8-904d-fd7fd4e1cc9c.png">

Check out the register screen and click the button to the homepage to see the current static style.
You can also see the front end code [here](https://github.com/BeccaHyland/frontend_coat_or_no_coat).

## Using CONC's API Endpoints
This API backend is deployed here: https://secret-ocean-30502.herokuapp.com/

_(without an endpoint url below, displays nothing)_

You can request data from the following endpoints by adding them to the end of the web address above, and entering the full URL in your browser.

`/api/v1/forecasts/search?zip_code=ENTER A ZIP CODE HERE`

Example:
<img width="901" alt="screen shot 2018-12-02 at 9 02 06 pm" src="https://user-images.githubusercontent.com/39714935/49409613-95da6e80-f71e-11e8-9bde-9f5f870f4bdd.png">

Below are the other endpoints you can try out with an HTTP testing client such as Postman.

POST `/api/v1/users`
* Add a new user to the database
* Requires parameters per the following example:
`/api/v1/users?email=DOG@DOG.com&zip_code=0&phone_number=0&password_digest=DOG&password_confirmation=DOG`
* Returns a unique API key generated for that CONC user

POST `/api/v1/coats`
* Add a new coat to the database
* Requires a parameter `api_key` belonging to an existing user in the database. Associates coat to that user.
* Requires coat parameters `title`, `precip_condition`, `high_temp`, and `low_temp` (Visit front end homepage above to see coat examples)

GET `/api/v1/coats` Requires a parameter `api_key` belonging to an existing user in the database.
* Returns all coats for one user

POST `/api/v1/sessions`
* Takes parameters of the user's email / password
* Returns the user's API key

## Built With
* Rails
* Faraday gem (API requests)

## Tested With
* Rspec / TDD

## Testing Gems
* FactoryBot
* Capybara
* Shoulda-Matchers
* Simplecov

## External APIs used
* Google (geocoding)
* DarkSky (weather)



