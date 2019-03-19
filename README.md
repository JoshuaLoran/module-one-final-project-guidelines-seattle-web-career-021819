# Module 1 Final Project
By Josh Loran and Sofia Jonsson

![Game of Thrones title card](lib/art/Game_of_Thrones_title_card.jpg)

## Welcome

For our final project we have built a database sourced from the Game of Thrones "Ice and Fire" API. We have provided instructions below for you to run the application on your local computer.


## Details
We have built a Game of Thrones themed searching database using An API Of Ice And Fire. This public database is hosted at https://anapioficeandfire.com/ and requires no authorization to use. Using our CLI, a user will be able to:

1. Choose from a list of Characters, Books or Houses. This will direct the user to a new list of options relating the topic chosen.

2. From here, the user will be able to dive one step deeper into the facts.


## Install Instructions
1. Clone the repository using your favorite clone method, or typing `git clone git@github.com:WTFCodingPotato/module-one-final-project-guidelines-seattle-web-career-021819.git` into your terminal
2. Still in terminal type, `cd module-one-final-project-guidelines-seattle-web-career-021819`
3. Type `bundle install`
4. Type `rake db:migrate`
5. Type `rake seed`
6. Type `rake run` to start the program

![screenshot of bundle install output](lib/art/Bundle_install.png)
[![video demo on YouTube](lib/art/got_screenshot_1.png)](https://youtu.be/-6aCt-y7opo)

### Recognitions

This API uses several frameworks and libraries, with the most important ones being listed below:

ASP.NET Core - The API is built on top of this awesome framework by Microsoft.
Azure - The API has been hosted on Azure from the very first day and it's been a smooth ride ever since.
Dapper - This micro ORM has been invaluable since we switched from Entity Framework. (Information sourced from API website)

Thank you to Christopher Johnson and his website https://asciiart.website/ as well as ASCII artists: Tua Xiong, hrr, and "unknown"

### Copyright

The data associated with "An API of Ice and Fire" is the property of George R.R. Martin. The data displayed by the creator, and us, is used without any claim of ownership.

The author, Joakim Skoog collected data from open free sources, such as "A Wiki of Ice and Fire" that had been normalized and then cleaned

This project uses a BSD license.

https://anapioficeandfire.com/About
