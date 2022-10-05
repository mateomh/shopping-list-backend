## For adding gems to the project
- Add the gem name and version if needed to the gem file
- sudo docker-compose -f ./Docker/dev-env-compose.yml run app bundle install
- If it doesn't install the new gems run
- sudo docker-compose -f ./Docker/dev-env-compose.yml build

## For creating the database
- sudo docker-compose -f ./Docker/dev-env-compose.yml run app rails db:create

## For running migrations
- sudo docker-compose -f ./Docker/dev-env-compose.yml run app rails db:migrate

## For running a rake task
- sudo docker-compose -f ./Docker/dev-env-compose.yml run app rails <task namespace>:<task name>

## For seeding the database
- sudo docker-compose -f ./Docker/dev-env-compose.yml run app rails db:seed

## For creating models
- sudo docker-compose -f ./Docker/dev-env-compose.yml run app rails generate model <model name>

## For creating migrations
- sudo docker-compose -f ./Docker/dev-env-compose.yml run app rails generate migration <migration name>

## For creating rake tasks
- sudo docker-compose -f ./Docker/dev-env-compose.yml run app rails generate task <task namespace> <task name>

## For runnning the console
- sudo docker-compose -f ./Docker/dev-env-compose.yml run app rails console

**All the commands should be executed with the container running to prevent any problem, specially with the bundle install commands**

## To run the application
If you want to see  all the requests comming in
- sudo docker-compose -f ./Docker/dev-env-compose.yml up 

If you want to run the application in the background and keep it running
- sudo docker-compose -f ./Docker/dev-env-compose.yml up -d
