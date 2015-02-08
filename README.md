[![Build Status](https://travis-ci.org/rOpenGov/finpar.svg?branch=master)](https://travis-ci.org/rOpenGov/finpar)

finpar
======

R client for the unofficial API of [Parliament of Finland](http://web.eduskunta.fi/Resource.phx/parliament/index.htx) provided by NGO [Kansan Muisti](http://www.kansanmuisti.fi/about/background/). Parliament of Finland does not provide an official API, but Kansan Muisti does provide a RESTful API to a database mostly compiled by scraping data from parliament's web page. 

### Kansan Muisti API

Kansan Muisti website version 2.0 is currently under heavy development and `parliament-fi` uses an API based on this development version. API based on the development site can be found at http://dev.kansanmuisti.fi/api/v1/, documentation http://dev.kansanmuisti.fi/static/api_v1_doc/index.html.

Currently, the following API endpoints are wrapped by `finpar`:

| API endpoint                       | Function                           |
|------------------------------------|------------------------------------|
| [http://dev.kansanmuisti.fi/api/v1/term](http://dev.kansanmuisti.fi/static/api_v1_doc/index.html#api-Term) | `term()` |

## Quick start

### Installation

Install `finpar` from GitHub using `devtools`.

```r
install.packages(devtools)
install_github("ropengov/finpar")
```

### Usage

Check out examples in the package [vignette]

## Contributors

+ [Joona Lehtomäki](https://github.com/jlehtoma) <joona.lehtomaki@gmail.com>
