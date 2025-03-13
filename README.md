# README

Run ```brew install vips```, ```sudo apt install imagemagick libvips```, ```bundle```, ```rails db:drop db:create db:migrate``` and ```rails s``` in project folder in console to start project.

For testing and development ```rails db:seed```

```mailcatcher``` to test mailer.

Run ```psql -U postgres -h localhost```, ```CREATE ROLE myuser WITH LOGIN PASSWORD '12345678';``` and ```ALTER USER myuser WITH SUPERUSER;``` to have access to db. 

When production change config/environments/production.rb "example.com" to domain.
