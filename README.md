# My Movie List (API)

Full-stack app for users to create, edit and share movie lists with their friends. Built with React, Ruby on Rails, MongoDB and the TMDB API. Tested with RSpec.

Currently deployed and hosted at [mymovielist.ca](https://mymovielist.ca).

## Table of contents

- [Overview](#overview)
  - [The Challenge](#the-challenge)
  - [Screenshots](#screenshots)
- [Built with](#built-with)
- [What I learned](#what-i-learned)
  - [Work with external APIs](#work-with-external-apis)
  - [Research documentation](#research-documentation)
  - [NoSQL](#nosql)
- [Instructions](#instructions)
- [Author](#author)
- [Other Projects](#other-projects)

## Overview

This app allows users to:

- Create accounts
- Create public and private Movie Lists
- View the 20 most recent lists created
- View their personal movie lists
- Edit lists (add and remove movies and reorder them)
- Delete lists
- Share public lists with other users

This is an API that is meant to be used with conjunction with the [frontend app](https://github.com/spomberg/my-movie-list).

![Usage GIF](https://github.com/spomberg/my-movie-list/blob/main/src/assets/ezgif-1-eb722a5992.gif?raw=true)

### The Challenge

This was my first solo full-stack project out of bootcamp, the challenge was planning and creating a CRUD web application with no external help aside from Google and documentation. 

I chose to create a movie lists application after I learned about the TMDB API and since I'm a nerd who loves films I thought this would be something fun to work on (luckily, I was right). The first challenge was reading the API's documentation to learn how I could leverage it to achieve my goals.

The next steps were designing the wireframes and the the database, as another learning opportunity I decided to use a NoSQL database (MongoDB) for the first time. 

Since I didn't have much free time available for this project I chose to build the backend on Ruby on Rails because it was a framework I was familiarized with and it would enable me to get the API running in less time.

For the front end, the chosen framework was React, another technology I was familiar with and which I wanted to be more profecient in. 

### Screenshots

Main Page

![Main Page](https://github.com/spomberg/my-movie-list/blob/main/src/assets/home_screen.png?raw=true)

List Page

![List Page](https://github.com/spomberg/my-movie-list/blob/main/src/assets/list_screen.png?raw=true)

Edit List Page

![Edit List Page](https://github.com/spomberg/my-movie-list/blob/main/src/assets/edit_screen.png?raw=true)

Add Movie Page

![Add Movie Page](https://github.com/spomberg/my-movie-list/blob/main/src/assets/add_movie.png?raw=true)

## Built With

- React
- Ruby on Rails
- MongoDB

### Dependencies

- HTTP
- Faker
- Mongoid
- Nanoid
- Rack-CORS
- BCrypt

## What I learned

### Work with external APIs

While I had used external APIs before, I had never worked on a project of this scope that was so reliant on one. I spent a significant amount of time reading the API's documentation just to learn what I could and couldn't do with it and how I could use it to achieve my goals before I wrote a single line of code. Now I feel confident that in the future I will be able to get familiarized with new APIs in no time. 

### Research documentation

To build this application, besides the external API, I also used 8 libraries that I had never worked with before. It took a lot of research to just find out which solutions already existed for the problems I needed to solve and then a lot of documentation reading to figure out how to implement them in my project. It was interesting to realize how much of the time allocated to this project was spent researching and reading. 

### NoSQL

Up until this point, I only had experience with relational databases, so I wanted to take this opportunity to learn how to use a NoSQL database, and for this project I chose MongoDB. I had to step out of my comfort zone and learn by myself how to handle a completely different type of database with only the help of Google, Stack Overflow and the available documentation. In the end, I was able to make MongoDB work exactly the way I had envisioned for this project, which was so rewarding.

## Instructions

- Follow the instructions to set up the frontend app [here](https://github.com/spomberg/my-movie-list).
- Clone this repo.
- CD into this repo and install dependencies with `bundle install`.
- Follow the instructions on [this link](https://developers.themoviedb.org/3/getting-started/introduction) to create a TMDB API key.
- Follow the instructions on [this link](https://www.mongodb.com/atlas/database) to create a MongoDB Atlas cluster and database.
- Follow the instructions on [this link](https://www.mongodb.com/docs/upcoming/reference/connection-string/) to get your MongoDB url.
- Copy the `.env.example` file and rename it to `.env`.
- Change the `TMDB_API_KEY` env variable to the TMDB API key that was generated.
- Change the `ORIGIN` env variable to the frontend app localhost URL.
- Change the `MongoDB_URI` env variable to your MongoDB url.
- Run `rails start` to start the app.

## Author

Full-Stack Developer with a knack for finding innovative solutions for solving complex problems in a timely manner. 

Throughout my career, I have honed my people skills in other industries where I successfully led projects in different areas. I also trained hundreds of people, as passing down knowledge (while continuously learning) is a passion of mine. 
  
Aside from my passion for coding, my abilities also extend to communication and collaboration with proficiency in interpersonal skills. My strongest suit is that I can bring these two skill sets together in a unique way. 
  
My goal is to now use my skills to make meaningful connections, exchange knowledge and help others while working as a Web Developer.


- Portfolio - [spomberg.com](https://spomberg.com)
- LinkedIn - [/marcos-spomberg](https://www.linkedin.com/in/marcos-spomberg/)

## Other projects

- My Movie List - [Site](https://mymovielist.ca) / [Repo](https://github.com/spomberg/my-movie-list)
- Password Generator App - [Site](https://password-generator.spomberg.com) / [Repo](https://github.com/spomberg/password-generator-app)
- Memory Game - [Site](https://memory.spomberg.com) / [Repo](https://github.com/spomberg/memory)
