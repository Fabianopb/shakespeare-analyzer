# SHAKESPEARE ANALYZER

Simple application to analyze the number of speeches each character says in a play. This application parses a play in XML from [http://www.ibiblio.org/xml/examples/shakespeare/](http://www.ibiblio.org/xml/examples/shakespeare/) provided as URL by the user, counts how many lines of speech there are per speaker, and displays the final result in a bar chart created with [D3.js](https://d3js.org/).

## Installing

Clone the application and run:

```
bundle install
```

```
rails server
```

The application will run at [http://localhost:3000](http://localhost:3000)

## Testing

Those were my first experiences with testing in Ruby on Rails, there's not much happening, could be better, but hey, we're here to learn! :)

Simply run:

```
rails test
```

## What else...

Suppose those plays are under development and being modified every now and then. One way to keep track of that could be:

- create a database with two tables, one to store the `plays` and their ids, and the other one to store `modifications`, which could contain the timestamp and the whole play result as a `Hash`
- the `plays` model could have a relationship definition of `has_many :modifications`, so we can easily add, modify and remove plays without issues
- every time a play is analyzed in the application, the generated `Hash` could be compared with the last saved `Hash`
- in case the `Hash` is different from the last one saved (or there is no last saved entry) the user is asked whether he/she wants to save the new results
