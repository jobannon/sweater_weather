<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->





<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![LinkedIn][linkedin-shield]][linkedin-url]
[![Inline docs](http://inch-ci.org/github/jobannon/sweater_weather.svg?branch=master)](http://inch-ci.org/github/jobannon/sweater_weather)

<!-- PROJECT LOGO -->
<br />
<p align="center">
    <img src="images/sweater.jpg" alt="Logo" width="800" height="800">
  </a>

  <h1 align="center">Sweater Weather</h1>

  <p align="center">
    Welcome to the Sweater Weather API 
    <br />
    <br />
    <br />
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [License](#license)
* [Contact](#contact)



<!-- ABOUT THE PROJECT -->
## About The Project

Sweater weather is a exercise in: 
* Consuming Weather data through the Dark Sky API,
* Location data through Google Geocoding,
* Yelp information from the Yelp Fusion API.

### Built With
* [Ruby on Rails](https://rubyonrails.org/)
* [Google Geocoding API](https://jquery.com)
* [Yelp Fusion API](https://www.yelp.com/fusion/)
* [Dark Sky API](https://darksky.net/dev)

<!-- GETTING STARTED -->
## Getting Started
This API is hosted on Heroku 
[Hosted](https://sweater-weather-mod3.herokuapp.com/)

Project specs can be found here
[Specs](https://backend.turing.io/module3/projects/sweater_weather/requirements)

<!-- USAGE EXAMPLES -->
## Usage/Endpoints
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/551776612a2cf9b429ce)

This project exposes four endpoints.  These endpoints will inform a fictitious front end 
### 1. Create User 
  <img src="https://backend.turing.io/module3/projects/sweater_weather/images/sign_up.png" width="800">

* Endpoint 
  * `POST` `"<domain>/api/v1/users"`
* Required Params: 
  - email: 
    - IE-  test@test.com
  - password:
    - IE - tester
  <details>
    - <summary>Returned JSON (click me):</summary> 

    ```json
      {
          "api_token": "qhEvzTfq6_p4KQm7_EzSJQ"
      }
    ```

  </details>
- Notes:
  - If this user is already registered, API will submit a redirect:  `302 :found`


### 2.  Login User

  <img src="https://backend.turing.io/module3/projects/sweater_weather/images/login.png" width="800">

* Endpoint 
  * `POST` `"<domain>/api/v1/users"`
* Required Params: 
  - email: 
    - IE-  test@test.com
  - password:
    - IE - tester
  <details>
    <summary>Returned JSON (click me):</summary> 

    ```json
      {
          "api_token": "qhEvzTfq6_p4KQm7_EzSJQ"
      }
    ```

  </details>

### 3.  Forecast

<img src="https://backend.turing.io/module3/projects/sweater_weather/images/root.png" width="800">

* Endpoint 
  * `GET` `"<domain>/api/v1/forcast"`
* Required Params: 
  - location: 
    - IE-  denver, co

  <details>
    <summary>Returned JSON (click me):</summary>

  ```json
    {
        "data": {
            "id": null,
            "type": "forecast",
            "attributes": {
                "forecast_summary": {
                    "icon": "clear-day",
                    "summary": "Clear",
                    "temperature": 65.92,
                    "temperature_high": 77.76,
                    "temperature_low": 49.02,
                    "state": "denver",
                    "city": " co",
                    "time": 1588183457,
                    "date": 1588183457
                },
                "forecast_details": {
                    "summary": "Clear",
                    "feel_like": 65.92,
                    "humidity": 20,
                    "visiblity": "10.00",
                    "uv_index": 9,
                    "today_message": "Clear throughout the day.",
                    "tonight_message": "Clear",
                    "icon": [
                        "clear-day",
                        "Clear",
                        65.92,
                        20,
                        "10.00",
                        9,
                        "Clear throughout the day.",
                        "Clear"
                    ]
                },
                "forecast_days_in_review": {
                    "daily_stats": [
                        [
                            {
                                "time": 1588140000
                            },
                            {
                                "icon": "clear-day"
                            },
                            {
                                "humidity": 0.3
                            },
                            {
                                "temperatureHigh": 77.76
                            },
                            {
                                "temperatureLow": 49.02
                            }
                        ],
                        [
                            {
                                "time": 1588226400
                            },
                            {
                                "icon": "partly-cloudy-day"
                            },
                            {
                                "humidity": 0.25
                            },
                            {
                                "temperatureHigh": 88.16
                            },
                            {
                                "temperatureLow": 57.14
                            }
                        ],
                        [
                            {
                                "time": 1588312800
                            },
                            {
                                "icon": "clear-day"
                            },
                            {
                                "humidity": 0.29
                            },
                            {
                                "temperatureHigh": 86.44
                            },
                            {
                                "temperatureLow": 52.09
                            }
                        ],
                        [
                            {
                                "time": 1588399200
                            },
                            {
                                "icon": "rain"
                            },
                            {
                                "humidity": 0.61
                            },
                            {
                                "temperatureHigh": 69.29
                            },
                            {
                                "temperatureLow": 49.23
                            }
                        ],
                        [
                            {
                                "time": 1588485600
                            },
                            {
                                "icon": "partly-cloudy-day"
                            },
                            {
                                "humidity": 0.42
                            },
                            {
                                "temperatureHigh": 85.79
                            },
                            {
                                "temperatureLow": 51.81
                            }
                        ],
                        [
                            {
                                "time": 1588572000
                            },
                            {
                                "icon": "clear-day"
                            },
                            {
                                "humidity": 0.34
                            },
                            {
                                "temperatureHigh": 80.56
                            },
                            {
                                "temperatureLow": 48.99
                            }
                        ],
                        [
                            {
                                "time": 1588658400
                            },
                            {
                                "icon": "partly-cloudy-day"
                            },
                            {
                                "humidity": 0.27
                            },
                            {
                                "temperatureHigh": 75.02
                            },
                            {
                                "temperatureLow": 51.9
                            }
                        ],
                        [
                            {
                                "time": 1588744800
                            },
                            {
                                "icon": "partly-cloudy-day"
                            },
                            {
                                "humidity": 0.26
                            },
                            {
                                "temperatureHigh": 81.49
                            },
                            {
                                "temperatureLow": 43.67
                            }
                        ]
                    ]
                },
                "forecast_hours_in_review": {
                    "hourly_stats": [
                        [
                            {
                                "time": 1588183200
                            },
                            {
                                "temperature": 65.7
                            }
                        ],
                        [
                            {
                                "time": 1588186800
                            },
                            {
                                "temperature": 68.47
                            }
                        ],
                        [
                            {
                                "time": 1588190400
                            },
                            {
                                "temperature": 71.12
                            }
                        ],
                        [
                            {
                                "time": 1588194000
                            },
                            {
                                "temperature": 74.14
                            }
                        ],
                        [
                            {
                                "time": 1588197600
                            },
                            {
                                "temperature": 76.16
                            }
                        ],
                        [
                            {
                                "time": 1588201200
                            },
                            {
                                "temperature": 77.24
                            }
                        ],
                        [
                            {
                                "time": 1588204800
                            },
                            {
                                "temperature": 76.64
                            }
                        ],
                        [
                            {
                                "time": 1588208400
                            },
                            {
                                "temperature": 74.47
                            }
                        ],
                        [
                            {
                                "time": 1588212000
                            },
                            {
                                "temperature": 70.31
                            }
                        ]
                    ]
                }
            }
        }
    }
  ```

  </details>

### 4. Generate a RoadTrip!

<img src="https://backend.turing.io/module3/projects/sweater_weather/images/road_trip.png" width="800">

* Endpoint 
  * `GET` `"<domain>/api/v1/forcast"`
* Required Params: 
  - origin: 
    - IE-  denver, co
  - destination: 
    - IE-  Fort Lupton, co

    <details><summary>Returned JSON (click me):</summary>

    ```json
    {
        "data": {
            "id": null,
            "type": "road_trip",
            "attributes": {
                "id": null,
                "start_location": "kansas city, ks",
                "end_location": "denver, co",
                "travel_time": "8 hours 40 mins",
                "forecast": "Possible light rain in the morning.",
                "arrival_temperature": 60.31
            }
        }
    }
    ```

    </details>

<!-- LICENSE -->
## License

Distributed under the Creative Commons License.

<!-- CONTACT -->
## Contact

Joshua O'Bannon - [@jtobannon](https://twitter.com/jtobannon) - jtobannon@gmail.com

Project Link: [https://github.com/jobannon/sweater_weather](https://github.com/jobannon/sweater_weather)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=flat-square
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=flat-square
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=flat-square
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=flat-square
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=flat-square
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/jtobannon/
[product-screenshot]: images/screenshot.png
