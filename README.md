![Top Language](https://img.shields.io/github/languages/top/Daniel-Gallagher92/sweater_weather?color=red)
![PRs Closed](https://img.shields.io/github/issues-pr-closed/Daniel-Gallagher92/sweater_weather)
![RSpec Version](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![Simplecov Version](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov)
![All Contributors](https://img.shields.io/badge/contributors-1-orange.svg?style=flat)


## Sweater Weather: Your Comprehensive API Hub for Real-Time Data
Welcome to Sweater Weather, a robust backend solution engineered to serve diverse API endpoints, delivering you a wealth of real-time data in one unified experience. Here's what sets Sweater Weather apart:

🌦️ Dynamic Weather Forecasting: Obtain real-time weather conditions, as well as comprehensive daily and hourly forecasts for any location.

🗺️ Efficient Route Planning: Navigate from point A to B with precise directions and expected travel time.

📚 Cultural Insights: Discover books that have been written about your destination, enriching your journey with literary context.

🕒 Time-Accurate Destination Weather: When planning a trip, receive destination-specific weather forecasts that are synchronized with your estimated time of arrival.

🔗 Third-Party API Integration: By harmoniously integrating various third-party APIs, Sweater Weather guarantees seamless user experiences and delivers data that you can trust.

Embrace the future with Sweater Weather — Your one-stop API hub for reliable, real-time data. 


## Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).


## Requirements and Setup (for Mac):

### Ruby and Rails
- Ruby Version 3.2.2
- Rails Version 7.0.8

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
3. Open in your favorite code editor
   
4. Install required Gems utilizing Bundler: <br>
If Bundler is not installed, first run the following command.

```shell
$ gem install bundler
```

If Bundler *is* already installed, run the following command.

```shell
$ bundle install
```

After running the following command, you should see a list of all gem's installed by bundler.

Now let's get that database set up!

```shell
$ rails db:{drop,create,migrate,seed}
```

## API Keys you will need
- [Mapquest](https://developer.mapquest.com/documentation/)
- [Weather](https://www.weatherapi.com/)

## Endpoints

### ` GET '/api/v0/forecast' `
**Parameters**
| **Name** | **Description** |
| ----------- | ----------- |
| location, string(query)  | The city and state. ex, 'Denver, CO' | 

**Responses**
| Code | Description |
| ----------- | ----------- |
| 200 | A forecast for that city |

*Example shortened for brevity*

```
  {
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "last_updated": "2023-09-26 14:30",
                "temp_f": 79.7,
                "feelslike_f": 76.7,
                "humidity": 15,
                "uv": 7.0,
                "visibilty": 9.0,
                "condition_text": "Partly cloudy",
                "condition_icon": "//cdn.weatherapi.com/weather/64x64/day/116.png"
            },
            "daily_weather": [
                {
                    "date": "2023-09-26",
                    "max_temp_f": 86.2,
                    "min_temp_f": 52.5,
                    "sunrise": "06:51 AM",
                    "sunset": "06:51 PM",
                    "condition_text": "Sunny",
                    "condition_icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
                },

              *THIS SHOULD COVER A 5 DAY FORECAST*

            ],
            "hourly_weather": [
                {
                    "time": "00:00",
                    "temp_f": 63.3,
                    "condition_text": "Clear",
                    "condition_icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
                },

              *THIS SHOULD COVER A 24 HOUR FORECAST*

            ]
        }
    }
}
```


### ` POST /api/v0/users `
**Parameters**
| **Name** | **Description** |
| ----------- | ----------- |
| **user details**, *required*(body)  | example request body | 

*Example*
```
  {"user":
      {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
      }
  }
```

**Responses**
| Code | Description |
| ----------- | ----------- |
| 201 | The user was created successfully. |

*Example*

```
  {
      "data": {
          "id": "4",
          "type": "users",
          "attributes": {
              "email": "whatever@example.com",
              "api_key": "tOtaLlyrEaLApikeY"
          }
      }
  }
```

### ` POST /api/v0/sessions `
**Parameters**
| **Name** | **Description** |
| ----------- | ----------- |
| **session details**, *required*(body)  | example request body | 

*Example*
```
  {
    "email": "doot@doot.com",
    "password": "test123",
    "password_confirmation": "test123"
  }
```

**Responses**
| Code | Description |
| ----------- | ----------- |
| 201 | The session was created successfully. |

*Example*
```
  {
    "data": {
        "id": "1",
        "type": "users",
        "attributes": {
            "email": "doot@doot.com",
            "api_key": "tOtaLlyrEaLApikeY"
          }
      }
  }
```

### ` POST /api/v0/road_trip `
**Parameters**
| **Name** | **Description** |
| ----------- | ----------- |
| **road trip details**, *required*(body)  | example request body | 

*Example*
```
     {
        "origin": "New York, NY",
        "destination": "Los Angeles, CA",
        "api_key": "tOtaLlyrEaLApikeY"
      }
```

**Responses**
| Code | Description |
| ----------- | ----------- |
| 201 | The road trip was created successfully. |

*Example*
```
  {
    "data": {
        "id": "null",
        "type": "road_trip",
        "attributes": {
            "origin": "New York, NY",
            "destination": "Los Angeles, CA",
            "travel_time": "39:00:30",
            "forecast": {
                "datetime": "2023-09-28 06:00",
                "summary": "Clear",
                "temperature": 66.9
              }
          }
      }
  }
```
