For writing a recipe app, we will need some data!

[recipe-db](https://github.com/tabatkins/recipe-db)

[openrecip.es](http://openrecipes.s3.amazonaws.com/openrecipes.txt)

https://s3.amazonaws.com/openrecipes/20170107-061401-recipeitems.json.gz


https://github.community/t/food-cooking-recipe-database/12201

https://jsonld.com/recipe/


https://github.com/topics/cooking

## Data format 

### hrecipe specification

hrecipes specification on the microformats wiki ->
http://microformats.org/wiki/hrecipe

### recipe google data

https://developers.google.com/search/docs/data-types/recipe

https://developers.google.com/search/docs/data-types/recipe#recipe-properties

https://developers.google.com/search/docs/data-types/recipe#item-list

```json
{
      "@context": "https://schema.org/",
      "@type": "Recipe",
      "name": "Party Coffee Cake",
      "image": [
        "https://example.com/photos/1x1/photo.jpg",
        "https://example.com/photos/4x3/photo.jpg",
        "https://example.com/photos/16x9/photo.jpg"
      ],
      "author": {
        "@type": "Person",
        "name": "Mary Stone"
      },
      "datePublished": "2018-03-10",
      "description": "This coffee cake is awesome and perfect for parties.",
      "prepTime": "PT20M",
      "cookTime": "PT30M",
      "totalTime": "PT50M",
      "keywords": "cake for a party, coffee",
      "recipeYield": "10",
      "recipeCategory": "Dessert",
      "recipeCuisine": "American",
      "nutrition": {
        "@type": "NutritionInformation",
        "calories": "270 calories"
      },
      "recipeIngredient": [
        "2 cups of flour",
        "3/4 cup white sugar",
        "2 teaspoons baking powder",
        "1/2 teaspoon salt",
        "1/2 cup butter",
        "2 eggs",
        "3/4 cup milk"
        ],
      "recipeInstructions": [
        {
          "@type": "HowToStep",
          "name": "Preheat",
          "text": "Preheat the oven to 350 degrees F. Grease and flour a 9x9 inch pan.",
          "url": "https://example.com/party-coffee-cake#step1",
          "image": "https://example.com/photos/party-coffee-cake/step1.jpg"
        },
        {
          "@type": "HowToStep",
          "name": "Mix dry ingredients",
          "text": "In a large bowl, combine flour, sugar, baking powder, and salt.",
          "url": "https://example.com/party-coffee-cake#step2",
          "image": "https://example.com/photos/party-coffee-cake/step2.jpg"
        },
        {
          "@type": "HowToStep",
          "name": "Add wet ingredients",
          "text": "Mix in the butter, eggs, and milk.",
          "url": "https://example.com/party-coffee-cake#step3",
          "image": "https://example.com/photos/party-coffee-cake/step3.jpg"
        },
        {
          "@type": "HowToStep",
          "name": "Spread into pan",
          "text": "Spread into the prepared pan.",
          "url": "https://example.com/party-coffee-cake#step4",
          "image": "https://example.com/photos/party-coffee-cake/step4.jpg"
        },
        {
          "@type": "HowToStep",
          "name": "Bake",
          "text": "Bake for 30 to 35 minutes, or until firm.",
          "url": "https://example.com/party-coffee-cake#step5",
          "image": "https://example.com/photos/party-coffee-cake/step5.jpg"
        },
        {
          "@type": "HowToStep",
          "name": "Enjoy",
          "text": "Allow to cool and enjoy.",
          "url": "https://example.com/party-coffee-cake#step6",
          "image": "https://example.com/photos/party-coffee-cake/step6.jpg"
        }
      ],
      "aggregateRating": {
        "@type": "AggregateRating",
        "ratingValue": "5",
        "ratingCount": "18"
      },
      "video": {
        "@type": "VideoObject",
        "name": "How to make a Party Coffee Cake",
        "description": "This is how you make a Party Coffee Cake.",
        "thumbnailUrl": [
          "https://example.com/photos/1x1/photo.jpg",
          "https://example.com/photos/4x3/photo.jpg",
          "https://example.com/photos/16x9/photo.jpg"
         ],
        "contentUrl": "http://www.example.com/video123.mp4",
        "embedUrl": "http://www.example.com/videoplayer?video=123",
        "uploadDate": "2018-02-05T08:00:00+08:00",
        "duration": "PT1M33S",
        "interactionStatistic": {
          "@type": "InteractionCounter",
          "interactionType": { "@type": "http://schema.org/WatchAction" },
          "userInteractionCount": 2347
        },
        "expires": "2019-02-05T08:00:00+08:00"
      }
    }
    ```

## APIs

https://rapidapi.com/blog/recipe-apis/



## Others 

Open, crowd-sourced database of Recipes from around the world

[meal-db](https://www.themealdb.com/)

hrecipe (and microformats in general) are the bees knees and lucky for you are widely employed across the web; here's a list of sites actively publishing hrecipes in the wild; you can scrape and parse as you please!
http://www.eat-vegan.rocks/
http://funcook.com/
http://www.therecipedepository.com
http://sabores.sapo.pt/
http://www.epicurious.com/
http://www.williams-sonoma.com/
http://foodnetwork.com/
http://www.plantoeat.com/recipe_book
http://www.essen-und-trinken.de
http://itsripe.com/recipes/

Auntie's Recipes Repository

https://duckduckgo.com/?q=wiki+for+recipes&t=h_&ia=about

## Machine Learning

http://pic2recipe.csail.mit.edu/
