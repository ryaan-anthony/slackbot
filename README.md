# Installation Instructions

1. Clone repo

2. Run `bundle install`

3. Configure `.env` file based on `.env.sample`

4. Start rails server


## Usage:

### > CI Build

`POST /api/v1/build`

#### Parameters

| Parameter Type | Name	| Description	| Required | Definition | Example |
|---	|---	|---	|---	|---	|---	|
| Header| X-CI-ID | Identifies the CI caller. | Yes	| String	| `dev04` |
| Header| X-CI-Event | Describes the CI Event. Must contain "success" or "fail". | Yes	| String	| `Build-Fail` |
| Body  	| author  	|  The author of the commit. 	|  Yes	|  String 	|  `Tom` 	|
| Body  	| commit  	|  The commit which caused the event. 	|  Yes 	| String  	|  `some string message` 	|

Example:

`curl -X POST localhost:3000/api/v1/build --header "X-CI-ID:ci01" --header "X-CI-Event:BUILD_FAIL" -F "author=Username" -F "commit=Example Message"`


_______


## > CI Deploy

`POST /api/v1/deploy`

#### Parameters

| Parameter Type | Name	| Description	| Required | Definition | Example |
|---	|---	|---	|---	|---	|---	|
| Header| X-CI-ID | Identifies the CI caller. | Yes	| String	| `dev04` |
| Header| X-CI-Event | Describes the CI Event. Must contain "success" or "fail". | Yes	| String	| `Deploy-Fail` |
| Body  	| environment  	|  The environment deployed to. 	|  Yes	|  String 	|  `Production` 	|
| Body  	| commit  	|  The commit being deployed. 	|  Yes, but for successful deploys only | String  	|  `some string message` 	|

Example:

`curl -X POST localhost:3000/api/v1/deploy --header "X-CI-ID:prod01" --header "X-CI-Event:DEPLOY_SUCCESS" -F "environment=Production" -F "commit=Example Message"`

