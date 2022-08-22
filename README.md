# Rails AWS Cognito with Google Provider
This repo is just an example of how AWS Cognito could be implemented with Rails.

## Used GEMs:
- Devise
- OmniAuth
- AWS Cognito with Google Provider

[Terraform repo](https://github.com/mateuszwu/terraform-aws-cognito) to set up AWS Cognito.

## Configuration:
1. Create a `master.key` file by executing the below command:
```
$ cp config/master.key.example config/master.key
```
2. Open `rails credentials`:
```
$ EDITOR='code --wait' rails credentials:edit
or
$ EDITOR='vim' rails credentials:edit
```
Then provide the required keys:
```
cognito:
  client:
    id: xxx
    secret: xxx
  user_pool:
    id: xxx
    site: xxx
  aws_region: xxx
  sign_in_url: xxx
  callback_path: xxx
```
Note: all mandatory values should be supplied by [terraform](https://github.com/mateuszwu/terraform-aws-cognito) output.

## Notes
- `app/views/users/sessions/new.html.erb:1` - `Sign In` link
- `config/initializers/devise.rb:276` - Devise OmniAuth configuration
- `app/controllers/users/omniauth_callbacks_controller.rb` - custom callback implementation
