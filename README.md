# Direct Effect

When I brought the idea for the My Brother's Keeper open source project to Code for Philly, I wanted to challenge myself to build the project on my own at the same time.  I thought this would be an awesome way learn and experiment with different design and architectural choices without risking cluttering up the repo for my teammates on the My Brother's Keeper project.

## Some of the Different Features of Direct Effect

* Use the Devise gem to implement two User Models - "User" for Charity Organization Members who need to log in to use the app, and "Admin" for myself (i.e. any site administrator)

* Allow users to create their own accounts, automatically sending the Admin an email notification that a new user is pending approval.  The Admin's main root page after login contains a list of all Users and their approval status.  User accounts only become accessible when the Admin approves them.

* Store long/lat coordinates as decimal values on the Organizations model instead of using PostGIS for a spatial point factory column.  Move the point factory object into the controller.  Pass the long/lat values in as variables when the GeoJSON object is created for the Organization's data to be displayed in the map UI.

* Use a map that shows more detail such as nearby Septa train stops.

* Store comments as a column on the Needs model instead of creating a Comments Model.
