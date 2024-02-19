resource "heroku_app" "example" {
  name   = var.app_name
  region = var.app_region

  organization {
    name = var.heroku_enterprise_team
  }
}

# Build code & release to the app
resource "heroku_build" "example" {
  app_id     = heroku_app.example.id

  source {
    url     = "https://github.com/abernicchia-heroku/node-js-getting-started/archive/v1.0.0-20240219.tar.gz"
    version = "v1.0.0-20240219"
  }
}

# Launch the app's web process by scaling-up
resource "heroku_formation" "example" {
  app_id     = heroku_app.example.id
  type       = "web"
  quantity   = 1
  size       = "Standard-1x"
  depends_on = [heroku_build.example]
}

output "example_app_url" {
  value = heroku_app.example.web_url
}

resource "heroku_addon" "papertrail_example" {
  app_id = heroku_app.example.id
  plan   = "papertrail:choklad"
}