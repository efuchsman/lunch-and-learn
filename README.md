

<h1 align="center">Lunch and Learn</h1>

<br />
<div align="center">
  <a href="https://github.com/efuchsman/lunch-and-learn">
    <img src="https://robbreport.com/wp-content/uploads/2018/12/edit-PLAT-EUG-174-YOAN-CHEVOJON.jpg" alt="The cuisine of Michel Guérard." width="650" height="450">
  </a>

  <h3 align="center">
    Get recipes for a country as well as learn about that country!
    <br />
  </h3>
</div>

## Table of Contents
* [App Description](#app-description)
* [Learning Goals](#learning-goals)
* [System Requirements](#system-requirements)
* [Setup](#setup)
* [Respository](#repository)

## App Description
 This app allows users to search for recipes by country, favorite recipes, and learn more about a particular country.

## Learning Goals
* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## System Requirements
* Ruby 2.7.4
* Rails 5.2.8

## Repository
https://github.com/efuchsman/lunch-and-learn

## Setup
1. Fork and Clone the repository
2. Install gem packages: `bundle install`
3. Setup Figaro: `bundle exec figaro install`
4. Setup the database: `rails db:{drop,create,migrate,seed}`
5. Sign up for an api key and app id through edamame: https://developer.edamam.com/edamam-recipe-api
6. In application.yml: `edamam_api_key: <YOUR KEY> edamam_app_id: <YOUR ID>`
7. Sign up for an api key for youtube: https://developers.google.com/youtube/v3/getting-started
8. In application.yml: `YOUTUBE_API_KEY: <YOUR KEY>`
9. Sign up for api key with Unsplash: https://unsplash.com/developers
10. In application.yml: `unsplash_access_key: <YOUR KEY>`
11. Run the server `rails s`

## Contact

<table align="center">
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/104859844?s=150&v=4"></td>
  </tr>
  <tr>
    <td>Eli Fuchsman</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/efuchsman">GitHub</a><br>
      <a href="https://www.linkedin.com/in/elifuchsman/">LinkedIn</a>
    </td>
  </tr>
</table>



<!-- ACKNOWLEDGEMENTS -->
<h3><b>Acknowledgements</b></h3>

Turing School of Software Design: [https://turing.edu/](https://turing.edu/)

<p>Image Source:</p>
<p> https://robbreport.com/wp-content/uploads/2018/12/edit-PLAT-EUG-174-YOAN-CHEVOJON.jpg </p>
