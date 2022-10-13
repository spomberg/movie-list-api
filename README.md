# My Movie List API

Full-stack app for users to create, edit and share movie lists with their friends. Built with React, Ruby on Rails, MongoDB and the TMDB API. Tested with RSpec.

Currently deployed and hosted at [mymovielist.ca](https://mymovielist.ca).

## Table of contents

- [Overview](#overview)
- [Built with](#built-with)
- [Instructions](#instructions)
- [Author](#author)

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

- Portfolio - [spomberg.com](https://spomberg.com)
- LinkedIn - [/marcos-spomberg](https://www.linkedin.com/in/marcos-spomberg/)

### Other projects

- My Movie List - [Site](https://mymovielist.ca) / [Repo](https://github.com/spomberg/my-movie-list)
- Password Generator App - [Site](https://password-generator.spomberg.com) / [Repo](https://github.com/spomberg/password-generator-app)