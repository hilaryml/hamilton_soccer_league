# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship - A Team has_many users
- [x] Include at least one belongs_to relationship - A User belongs_to a Team
- [x] Include at least one has_many through relationship - A Team has_many Games through TeamGames, and many Practices through TeamPractices
- [x] The "through" part of the has_many through includes at least one user submittable attribute - comments.content
- [x] Include reasonable validations for simple model objects - Team, Game, Practice, Comment
- [X] Include a class level ActiveRecord scope method - Team.top_five_teams URL: /teams?utf8=%E2%9C%93&team+standings=top+five+teams&commit=Filter
- [x] Include a nested form writing to an associated model using a custom attribute writer - URL: /teams/new, User
- [x] Include signup - Devise
- [x] Include login - Devise
- [x] Include logout - Devise
- [x] Include third party signup/login - OmniAuth with Facebook
- [x] Include nested resource show or index - URL: /teams/1/users/1
- [x] Include nested resource "new" form - URL: /teams/1/practices/new
- [x] Include form display of validation errors URL: /teams/1/games/new

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
