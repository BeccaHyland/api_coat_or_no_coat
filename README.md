# Coat or No Coat

CONC saves users time and energy on busy mornings with a customizable daily alert that recommends outerwear based on the weather. (front end in development)

[Visit Coat or No Coat]'s front end!(https://beccahyland.github.io/frontend_coat_or_no_coat/) *(currently in development)
Check out the register screen and click the button to the homepage to see the current static style.
You can see the front end code [here](https://github.com/BeccaHyland/frontend_coat_or_no_coat).

## Using CONC's Endpoints
This API backend is deployed here: https://secret-ocean-30502.herokuapp.com/
_(without an endpoint url below, displays nothing)_

You can request data from the following endpoints by adding them to the end of the web address above, and entering the full URL in your browser.

`/api/v1/forecasts/search?zip_code=ENTER A ZIP CODE HERE`

Below are the other endpoints you can try out with an HTTP testing client such as Postman.

POST `/api/v1/users`
* Add a new user to the database
* Requires parameters per the following example:
`/api/v1/users?email=DOG@DOG.com&zip_code=0&phone_number=0&password_digest=DOG&password_confirmation=DOG`
* Returns a unique API key generated for that CONC user

POST `/api/v1/coats`
* Add a new coat to the database.
* Requires a parameter `api_key` belonging to an existing user in the database. Associates coat to that user.
* Requires coat parameters `title`, `precip_condition`, `high_temp`, and `low_temp` (Visit front end homepage above to see coat examples)

GET `/api/v1/coats` Requires a parameter `api_key` belonging to an existing user in the database.Returns all coats for one user.

This API also includes an endpoint for POST `/api/v1/sessions` that takes parameters of the user's email / password and returns the user's API key.

## Built With
* Rails
* Faraday gem (API requests)

## Tested With
* Rspec

## Testing Gems
* FactoryBot
* Capybara
* Shoulda-Matchers
* Simplecov

## External APIs used
* Google (geocoding)
* DarkSky (weather)



