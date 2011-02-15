# Itiel

Hopefully, it will be an awesome Framework to do ETL with Ruby. It
should only work with *Ruby 1.9* because, you know, it's the present.

Right now, this works:

    require 'rubygems'
    require 'itiel'

    #
    # source.csv
    #
    # id,name,state
    # 1,john,active
    # 2,ruby,active
    # 3,rails,inactive
    # 4,pete,active


    @source             = Itiel::Sources::CSVFile.new('source.csv')
    @destination        = Itiel::Outputs::CSVFile.new('destination.csv')

    @sorter             = Itiel::Transformations::SingleColumnSort.new("name")
    @add_constant       = Itiel::Transformations::ConstantField.new("constant" = > "value")

    @sorter.input       = @source.output
    @add_constant.input = @sorter.output
    @destination.input  = @add_constant.output

    #
    # destination.csv
    #
    # id,name,state,constant
    # 1,john,active,value
    # 4,pete,active,value
    # 3,rails,inactive,value
    # 2,ruby,active,value

I want to have something like this:

    Itiel::Job do
      step @source       => @sorter
      step @sorter       => @add_constant
      step @add_constant => @destination
    end

## TODO

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

### A command line bin to generate the basic structure

    itiel new project_name

### Rake

    rake itiel:run

### Redis

Don't know exactly where or how we need it, but Redis is awesome

### Joins, Scripts and lots more transformations

Some on my mind:

    Itiel::Scripting::ExecuteSQL
    Itiel::Scripting::ExecuteInSystem
    Itiel::Outputs::FTP
    Itiel::Sources::HTTP
    Itiel::Outputs::HTTPRequest
    Itiel::Joins::DatabaseTable
    Itiel::Transformations::CustomSort
    Itiel::Transformations::MapValues
    Itiel::Transformations::IfNil
    Itiel::Lookups::DatabaseTable

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

Not really, Ruby 1.9 is more enough. I don't have plans to make it
work on 1.8

# About the Author

[Crowd Interactive](http://www.crowdint.com) is a Ruby and Rails consultancy firm powered by a
team of enthusiast engineers who love programming.
We turn your ideas into web applications, and we like challenging projects. We also have
a lot of experience in retail, so it doesn't matter if your idea is about
something you'd like to sell, we can surely help you.
