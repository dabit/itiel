# Itiel

[![Build Status](https://secure.travis-ci.org/dabit/itiel.png?branch=master)](http://travis-ci.org/dabit/itiel)

Hopefully, it will be an awesome Framework to do ETL with Ruby. It
should only work with *Ruby 1.9*.

[A working example](https://github.com/railsmx/rails-mx-blog/blob/master/itiel/posts.rb)

# This README is work in progress

You should not trust it, until I clean it up.

For better examples and documentation, refer to the *features* folder.

# TODO: Everything I want it to be, below:

### Define the Itiel project structure

I have in mind something like this:

    /itiel_example/
    |~config/
    | `-sources.yml
    |~lib/
    | `-transformation_class1.rb
    |~jobs/
    | `-main_job.rb
    |~tasks/
    | `-itiel.rake
    |-Gemfile
    |-Gemfile.lock

### Controllers

Take care of defining and running the jobs. It's where you put all the
code like the example above.

### A command line bin to generate the basic structure

    itiel new project_name.

Use thor?

### Rake

    rake itiel:run

### Mongo

Picture yourself migrating form SQL to Mongo

### Joins, Scripts and lots more transformations

Some on my mind:

    Itiel::Joins::DatabaseTable
    Itiel::Lookups::DatabaseTable
    Itiel::Loads::FTP
    Itiel::Loads::HTTPRequest
    Itiel::Loads::MongoDBDocument
    Itiel::Script::ExecuteInSystem
    Itiel::Extracts::HTTP
    Itiel::Extracts::MongoDBDocument
    Itiel::Transforms::CustomSort
    Itiel::Transforms::MapValues
    Itiel::Transforms::IfNil

Just ideas, I have nothing on how to implement most of them

### Filters and conditional stream routing

If the column X has a value of Y, send true output to this step, send
false output to this other steps

### Slowly Changing Dimentions

Can't have ETL without these

### Test helpers

So you can TDD your ETL

### Logging

It would be extra nice if all the steps logged statistics

* Processing X rows of Y
* Time spent
* Transformation Name
* Configurable log level

### Viz

    rake itiel::graph

Creates a graphical representation of your ETL flow

### Ruby 1.8

Not really, Ruby 1.9 is enough. I don't have plans to make it
work on 1.8

