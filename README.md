# KUDAFE: website trafic analysis

We would like to better understand how a website users are navigating the site, with a focus on driving visitors to sign up for events and information sessions.

The website sees roughly 9000 visitors per month. However, only a small number of these visitors - about 100 per month - use the website book an event.

We would like to understand:

    The journey users take
    How they arrive on the site
    The pages they subsequently visit
    Where they drop off.

Are there any problems with the journey and is there anything we can do to support event bookings?

Can we increase event booking to 200 per month? If so, what changes would be recommended and how could these be monitored?

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
#There are some R libraries that need to be installed
#You can install via CRAN

install.packages("googleAnalyticsR")
install.packages("keyring")
install.packages("tidyverse")
install.packages("lubridate")
install.packages("janitor")
install.packages("shiny")
install.packages("shinythemes")

#And you need to install from GitHub using devtools (can be installed via CRAN)

install_github(d3Dashboard) 

```

### Installing

A step by step series of examples that tell you how to get a development env running

```
git clone https://github.com/millacurafa/kudafe

or via SSH

git clone git@github.com:millacurafa/kudafe.git
```

and open the Rproject shiny_app.Rproj

```
cd kudafe/shiny_app/shiny_app.Rproj
open shiny_app.Rproj
```

You can use the tidyverse library to edit the data pulles

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Everything is writtern using camelCase as it's the standard for shiny apps.
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* R studio
* Google Analytics
* Shiny

## Contributing

Please read [CONTRIBUTING.md](https://github.com/millacurafa/kudafe/blob/master/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [Git](https://git-scm.com/) for versioning. For the versions available, see the [tags on this repository](https://github.com/millacurafa/kudafe/tags). 

## Authors


See the list of [contributors](https://github.com/millacurafa/kudafe/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to Kuba, David, Felipe for creating this project
* and Steph, Aileen, Del and Mairi for support


