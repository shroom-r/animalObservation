# AnimalObservation

AnimalObservation is an app written with [Ruby on Rails](https://rubyonrails.org) 7.1.3 created as a project in the context of [Master of Advanced Studies in Rapid Application Development (MAS-RAD)](https://www.he-arc.ch/ingenierie/formation-continue/mas-in-rapid-application-development) in the [CAS-DAS](https://www.he-arc.ch/ingenierie/formation-continue/cas-en-developpement-dapplications-riches/) [Frameworks module](https://rs.he-arc.ch/docs/RS530.40.22.204.pdf).

The app is a wildlife observation personal registry.It permits to create multiple locations and to link observations to it.

You can create, read, update and delete observations and locations.

To be used, the app requires authentication.

## Table of contents

- [Dependencies](#Dependencies)
- [Getting started](#Getting-started)
- [How to use the app](#how-to-use-the-app)
  - [Authenticate](#authenticate)
  - [Main page](#main-page)
  - [Locations](#locations)
    - [Create a location](#create-a-location)
    - [View a location](#view-a-location)
    - [Update a location](#update-a-location)
    - [Delete a location](#delete-a-location)
  - [Observations](#observations)
    - [Create an observation](#create-an-observation)
    - [View an observation](#view-an-observation)
    - [Update an observation](#update-an-observation)
    - [Delete an observation](#delete-an-observation)

## Dependencies
### Ruby gems
- [Devise](https://github.com/heartcombo/devise) : The app uses Devise for authentication.

### CSS stylsheets
- [Simple CSS](https://github.com/kevquirk/simple.css) : The style of the site is mainly based on Simple CSS. Some styles are modified to fit better with the wanted app visual appearance.

### Icons
- [Bootstrap icons](https://github.com/twbs/icons) : The app uses the icons from bootstrap.

## Getting started
0. If needed, use docker to prepare the development environment following this instructions : https://github.com/mas-rad/docked-rails-ci.

1. Clone the animalObservation git repository and open to the created folder (animalObservation).

2. Migrate the database with :
```bash
rails db:migrate
```

3. Launch rails console with :
```bash
rails console
```
and create new user with :
```bash
User.new({:email => "[EMAIL_ADDRESS]", :password => "[PASSWORD]", :password_confirmation => "[PASSWORD]" }).save()
```
replacing EMAIL_ADDRESS and PASSWORD with your own values.

4. Add the Devise configuration in the file config/environments/development.rb :
```ruby
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

5. Launch the app with `rails server` and go to _http://localhost:3000_ and sign-in with the user you just created.


## How to use the app

### Authenticate
The app requires authentication to be used. When needed. you are redirected to log in page. Use the credentials you created in [Getting started](#getting-started) to log in.

### Main page
Once the user is authenticated, the main page of the app is _/locations_. This page shows the list of all locations with the last respective observations (max. 3).

The locations are sorted by alphabetical ascending order and the observations are sorted by observation date in descending order.

___

### Locations
#### Create a location

To create a location, click on _Add location_ on home page and fill the form with the wanted values.

The name is mandatory and must be unique.

When the form is submitted, the name is normalized :
- The leading and trailing spaces are removed.
- The doubled (or more) spaces are replaced by only one space.
- Special characters are removed. Excepted : accented characters, hyphen (-) and apostrophe (').
- The first character is capitalized.

The process can be cancelled at any moment using the home button or the cancel button (back to home page).

#### View a location

To view a location, click on its name on the home page.

The view page _/locations/[ID]_ shows the location name and description as well as the list observations for the current location and its observation date.

This page gives access to the following actions for the location :
- [Update the location](#update-a-location) clicking on the pencil icon.
- [Delete the location](#delete-a-location) clicking on the trash icon next to the location name.

The page also gives access to some actions for the observations. See details on '[view an observation](#view-an-observation)' chapter.

#### Update a location

To update a location, open its detail page clicking on its name on the home page and click on the pencil icon next to its name.

Replace the values you want to change.

When the form is submitted, the values are normalized as explained in [create a new location](#create-a-location) part.

#### Delete a location

To delete a location, open its detail page clicking on its name on the home page and click on the trash icon next to its name.

Confirm deletion.

**WARNING** : When deleting a location, all associated observations will also be deleted.

___

### Observations

#### Create an observation

To create a new observation, click on the name of the location you want to link the observation to.

On the location detail page, click on _Add new observation_.

Fill the form and submit.

The animal name is required and the minimum length is 2.

When the form is submitted, the animal name is normalized :
- The leading and trailing spaces are removed.
- The doubled (or more) spaces are replaced by only one space.
- Special characters are removed. Excepted : accented characters, hyphen (-) and apostrophe (').
- The first character is capitalized.

#### View an observation

The observations related to a place can be seen on the home page (only the last 3 observations for each location).

They can also be seen on the [location detail page](#view-a-location). To access this page, click on the location name on home page.

The location detail page lists all the observations related to it.

The observations are sorted by 'observation date' in descending order.

This page gives access to the following actions for the observations :
- [Add a new observation](#create-an-observation) to the current location.
- Display the observation details hovering the mouse over the information icon.
- [Update the observation](#update-an-observation) clicking on its name.
- [Delete the observation](#delete-an-observation) clicking on the trash icon next to it.

#### Update an observation

To update an observation, click on its name on the list of observations.

Replace the values you want to change and submit the form.

When the form is submitted, the values are normalized as explained in [create a new observation](#create-an-observation) part.

#### Delete an observation

To delete an observation, you have to click on the trash icon next to its name on [location detail page](#view-a-location).
