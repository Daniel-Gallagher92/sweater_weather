![Top Language](https://img.shields.io/github/languages/top/Daniel-Gallagher92/sweater_weather?color=red)
![PRs Closed](https://img.shields.io/github/issues-pr-closed/Daniel-Gallagher92/sweater_weather)
![RSpec Version](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![Simplecov Version](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov)
![All Contributors](https://img.shields.io/badge/contributors-1-orange.svg?style=flat)


##Sweater Weather: Your Comprehensive API Hub for Real-Time Data
Welcome to Sweater Weather, a robust backend solution engineered to serve diverse API endpoints, delivering you a wealth of real-time data in one unified experience. Here's what sets Sweater Weather apart:

🌦️ Dynamic Weather Forecasting: Obtain real-time weather conditions, as well as comprehensive daily and hourly forecasts for any location.

🗺️ Efficient Route Planning: Navigate from point A to B with precise directions and expected travel time.

📚 Cultural Insights: Discover books that have been written about your destination, enriching your journey with literary context.

🕒 Time-Accurate Destination Weather: When planning a trip, receive destination-specific weather forecasts that are synchronized with your estimated time of arrival.

🔗 Third-Party API Integration: By harmoniously integrating various third-party APIs, Sweater Weather guarantees seamless user experiences and delivers data that you can trust.

Embrace the future with Sweater Weather — Your one-stop API hub for reliable, real-time data. 


## Learning Goals

- Consume two or more external APIs 
- Build APIs that return JSON responses 
- Refactor code for better code organization/readability 
- Create an application for use in mircroservices for a smealess, separate frontend view and backend database. 
- Utilize quality workflow practices: small commits, descriptive pull requests, and code reviews 
- Write thorough, understandable documentation



## Requirements and Setup (for Mac):

### Ruby and Rails
- Ruby Version 2.7.4
- Rails Version 5.2.6

### Gems Utilized
- RSpec 
- Pry
- SimpleCov
- Factory_Bot_Rails
- Faker
- Shoulda-Matchers 
- Webmock
- VCR
- bcrypt
- jsonapi-serializer
- Faraday

## Setup
1. Clone this repository:
On your local machine open a terminal session and enter the following commands for SSH or HTTPS to clone the repositiory.


- using ssh key <br>
```shell
$ git clone git@github.com:Daniel-Gallagher92/sweater_weather.git
```

- using https <br>
```shell
$ git clone https://github.com/Daniel-Gallagher92/sweater_weather.git
```

Once cloned, you'll have a new local copy in the directory you ran the clone command in.

2. Navigate to where you've chosen to store the project directory:<br>

```shell
$ cd sweater_weather
```

3. Install required Gems utilizing Bundler: <br>
If Bundler is not installed, first run the following command.

```shell
$ gem install bundler
```

If Bundler *is* already installed, run the following command.

```shell
$ bundle install
```

After running the following command, you should see a list of all gem's installed by bundler.
