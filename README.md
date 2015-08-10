# Highr
## Technologies Used
This is a Ruby on Rails app and is hosted by Heroku. In edition to the gems Rails is dependent on, this app uses Omniauth and the twitter and facebook omniauth gems. Omniauth is used for authentication of Users. The app also uses figaro to manage environment variables where the keys and secrets used for omniauth are stored. The app uses rails_12factor to log to the Heroku log and to fix development production parity in delivering assets. The app also uses pry for debugging.
## Approach Taken
I did this project in one planning phase and one writing phase (each took several days). This was not a very good approach as I was planning things well before I should have and I was working on other things without a plan. I wound up with something that mostly reflected what I had set out to build but didn't adapt to challenges as they came up. If I had this to do over again, I would have spent a lot less time planning and the beginning and then stopped to plan more frequently when I was writing.  
## Installation Instructions
To use this app, just clone this repository, run `figaro install`. An untracked file called application.yml is created in config. Register an app with facebook, put the app id and secret in application.yml, and configure the callback settings on facebook.
## Unsolved Problems
I am still adding User profiles and the ability to upload resumes as pdfs. I need to set up authentication for managers. I had trouble referencing an image in my assets folder from my css so I referenced its URL on wikicommons instead.
## Planning

### User Stories

https://trello.com/b/QH0lx6Yo/project2

### ERD

![ERD] (/planning/wireframes/project-2_erd.jpg?raw=true)


### Wireframe

![Wireframe](/planning/wireframes/project-2_wireframe.jpg?raw=true)
