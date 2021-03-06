# Direct Effect

When I brought the idea for the My Brother's Keeper open source project to Code for Philly, I wanted to challenge myself to build the project on my own at the same time.  I thought this would be an awesome way learn and experiment with different design and architectural choices without risking cluttering up the repo for my teammates on the My Brother's Keeper project.


## Different Features of Direct Effect vs. My Brother's Keeper

* Use the Devise gem to implement two User Models - "User" for Charity Organization Members who need to log in to use the app, and "Admin" for myself (i.e. any site administrator)

* Allow users to create their own accounts, automatically sending the Admin an email notification that a new user is pending approval.  The Admin's main root page after login contains a list of all Users and their approval status.  User accounts only become accessible when the Admin approves them.

* Store long/lat coordinates as decimal values on the Organizations model instead of using PostGIS for a spatial point factory column.  Move the point factory object into the controller.  Pass the long/lat values in as variables when the GeoJSON object is created for the Organization's data to be displayed in the map UI.

* Use a map that shows more detail such as nearby Septa train stops.

* Store Comments as a column on the Needs model instead of creating a Comments Model.

## Getting Started

We recommend [Homebrew](https://brew.sh/) for macOS users to simplify installation of dependencies.

Developers will need to manually install [Ruby](https://www.ruby-lang.org/en/documentation/installation/#homebrew) and [PostgreSQL](https://www.postgresql.org/download/) if you don't already have them.  These links provide detailed instructions for users of various operating systems.

Ruby v. 2.4.1 is the specific version currently in use in the project.  Assuming you already have [RVM](https://rvm.io/rvm/install), you can run:

```
rvm list
```

to check if you already have this version available.  If not, run:

```
rvm install ruby-2.4.1
```

Once you've cloned and set up this environment, `bundle install` will take care of your other gem dependencies.

