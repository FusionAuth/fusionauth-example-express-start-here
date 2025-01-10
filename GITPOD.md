# Example Get Started Application in GitPod

This repo holds an example Express.js application that uses FusionAuth as the identity provider. 
This application will use an OAuth Authorization Code Grant workflow to log a user in and 
get them access and refresh tokens.

## Launch - GitPod

The system is creating a fusionauth server, along with the backend containers needed to run it.  When it is done you will have a login for the system.

Login to the server with 'admin@example.com' and password 'password' to verify that the installation has worked.  Once there, you can move on to the Delegate step.

## Delegate Authentication

The next step is to delegate authentication for your application, and verify that the change is applied.  For this you will:
* Add the admin@example.com user to the application
* Logout from the administrative user
* Go to the test application
* Login as the administrative user

### Bring up the administrative interface

In the previous step, you logged in to the system as an admin user.  Go back to that browser screen, which should be showing the administrative interface for FusionAuth.
* Navigate to "Applications" in the left-hand sidebar (you may need to use the hamburger icon at the top left of the screen to see all options)
* Choose the "Start Here" application
* Choose "Edit" from the list of actions

### Authorization URL and Token Handling

* Scroll down to the bottom of the user page and click "Add registration"
* Choose the "Start Here" application (it may already be selected)
* Click the blue save icon at the top of the screen

### Open the Application

In your shell, type the following to start up the application:

```
cd app; npm install; npm run dev
```

Point your browser to the application:

```
gp preview `gp url 8080`
```

Now, login to the application in your browser using admin@example.com and 'password' to see the integration working.
