

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
* [Endpoints](#endpoints)

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
11. All 48 tests should be passing with 100% coverage: `bundle exec rspec`
12. Run the server `rails s`

## Endpoints

### GET /api/v1/recipes?country=thailand

```
  {
     "data": [
        {
          "id": null,
          "type": "recipe",
          "attributes": {
          "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
          "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
          "country": "Thailand",
          "image": "https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?..."
         }
        },
      {...},
      {...},
      ]
  }
```

### GET /api/v1/recipes

```
{
  "data": [
    {
      "id": null,
      "type": "recipe",
      "attributes": {
        "title": "Vermouth Cocktail Recipe",
        "url": "http://www.seriouseats.com/recipes/2011/01/vermouth-cocktail-recipe.html",
        "country": "Country of curaçao",
        "image": "https://edamam-product-images.s3.amazonaws.com/web-img/b5f/b5f1c16f0e8a0b3144c3b1b00fcc2567.jpg?..."
      }
    },
    {
      "id": null,
      "type": "recipe",
      "attributes": {
        "title": "Mai Tai",
        "url": "https://www.epicurious.com/recipes/food/views/mai-tai-51172000",
        "country": "Country of curaçao",
        "image": "https://edamam-product-images.s3.amazonaws.com/web-img/4db/4db61c7e0deb6f8ac2873ba72991665d.jpg?..."
      }
    }
  ]
}
```

### GET /api/v1/learning_resources?country=scotland
```
{
  "data": {
      "id": null,
      "type": "learning_resource",
      "attributes": {
          "country": "scotland",
          "video": {
          "title": "A Super Quick History of Northern Ireland",
          "youtube_video_id": "IU0tzcgcb-Q"
      },
      "images": [
          {
              "alt_tag": "green grass on mountain under white cloudy sky",
              "url": "https://images.unsplash.com/photo-1551801691-f0bce83d4f68?..."
          },
          {
              "alt_tag": "gray concrete building near lake under white sky during daytime",
              "url": "https://images.unsplash.com/photo-1589489873423-d1745278a8f4?..."
          },
          {
              "alt_tag": "brown ox on mountain",
              "url": "https://images.unsplash.com/photo-1493962853295-0fd70327578a?..."
          },
          {
              "alt_tag": "bird's eye photography of winding road on mountain",
              "url": "https://images.unsplash.com/photo-1476990789491-712b869b91a5?..."
          },
          {
              "alt_tag": "brown mountain cliff beside of blue ocean aerial photography",
              "url": "https://images.unsplash.com/photo-1524756614325-ab25ba59e6e6?..."
          },
          {
              "alt_tag": "train on bridge surrounded with trees at daytime",
              "url": "https://images.unsplash.com/photo-1505832018823-50331d70d237?..."
          },
          {
              "alt_tag": "aerial photo of black train during daytime",
              "url": "https://images.unsplash.com/photo-1571936804022-90d128047136?..."
          },
          {
              "alt_tag": "people walking on sidewalk near red concrete building during daytime",
              "url": "https://images.unsplash.com/photo-1594800083755-8fe31b2c99df?..."
          },
          {
              "alt_tag": "brown concrete building",
              "url": "https://images.unsplash.com/photo-1565011231598-66c1ec39b72c?..."
          },
          {
              "alt_tag": "train passing by bridge over mountains",
              "url": "https://images.unsplash.com/photo-1551801841-ecad875a5142?..."
          }
        ]
      }
    }
  }
```
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
