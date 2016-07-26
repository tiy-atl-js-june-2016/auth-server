## June 2016 Class Server

### Usage

Root URL - [https://https://quiet-waters-26668.herokuapp.com/](https://quiet-waters-26668.herokuapp.com/)

1. Start with the __Root URL__ above
2. Sign up for an account to get an access token
3. Send authenticated requests by sending an `Access-Token` header
4. Create collections for your user just like the `class-server`.
  - example: `/collections/brit`
  - example: `/collections/brits-boops`
  - example: `/collections/asldfjasdjfpoiwre5858323lasdf`
5. Have fun! :metal: :heart:

> Ok, you get the point.

### General Rules

#### Authorization

All authorized requests unless otherwise mentioned require
a "**Access-Token**" header to be present. Users are assigned an
Auth Token during account creation. The access token can be
retrieved at any time via the "/login" route.

#### Errors

Any request that fails to be processed will return an *appropriate*
status code as a response as well as a JSON object with an "errors"
property providing any additional data to solve the problem.

#### Pagination

Any collection request may optionally take `page` and `per_page`
params specifying how many objects should be returned on a page
and which page or results to return, respectively.

### Routes


#### POST /signup

> This route creates an account for a new user.

**Params:**

```
  * first: string
  * last: string
  * username: string
  * email: string
  * password: string
```

**Status Code:**
Returns 201 Created on Success and 422 Unprocessable Entity in case of failure.

**Request:**

```
{
  "first": "Brit",
  "last": "Butler",
  "username": "KingCons",
  "email": "brit@lies.com",
  "password": "cookies"
}
```

**Response:**

```
{
  "user": {
    "id": 35,
    "first_name": "Brit",
    "last_name": "Butler",
    "username": "KingCons",
    "email": "brit@lies.com",
    "access_token": "7774743beeb3c26dfdd80213ba1b9097"
  }
}
```

#### POST /login

> This route exists 'signs a user in' and gets their info.

**Params:**

```
email: string
password: string
```

**Status Codes:**
Returns 200 on success and 401 on failure.

***Request:***

```
{
  "username": "KingCons",
  "password": "cookies"
}
```

***Response:***

```
{
  "message": "Logged in as 'KingCons'",
  "access_token": "7774743beeb3c26dfdd80213ba1b9097"
}
```
