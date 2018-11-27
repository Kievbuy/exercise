# README

## CheckPermission Module

file location: <code>app/controllers/concerns/check_permission.rb</code>

#### Set permissions
To set permissions edit <code>permissions</code> method in the Module

## API routes

                     Prefix Verb   URI Pattern                    Controller#Action
                v1_articles GET    /v1/articles(.:format)         v1/articles#index
                            POST   /v1/articles(.:format)         v1/articles#create
                 v1_article GET    /v1/articles/:id(.:format)     v1/articles#show
                            PATCH  /v1/articles/:id(.:format)     v1/articles#update
                            PUT    /v1/articles/:id(.:format)     v1/articles#update
                            DELETE /v1/articles/:id(.:format)     v1/articles#destroy
                   v1_users GET    /v1/users(.:format)            v1/users#index
                            POST   /v1/users(.:format)            v1/users#create
                    v1_user GET    /v1/users/:id(.:format)        v1/users#show
                            PATCH  /v1/users/:id(.:format)        v1/users#update
                            PUT    /v1/users/:id(.:format)        v1/users#update
                            DELETE /v1/users/:id(.:format)        v1/users#destroy
            v1_authenticate POST   /v1/authenticate(.:format)     v1/authentication#authenticate


## Database structure

**Table** Articles {<br>
  String title;<br>
  Text body;<br>
  Integer user_id;<br>
}<br>

**Table** Users {<br>
   String name;<br>
   String email;<br>
   String password_digest;<br>
}<br>

**Table** Roles {<br>
   String name;<br>
}<br>
    
**Table** Assignments (join table) {<br>
   Integer user_id;<br>
   Integer role_id;<br>
}

## Database seeding

To seed databese by demo data - run <code>bundle exce rake db:seed</code>
* 11 users
* 3 roles (admin, reader, writer)
* 50 articles