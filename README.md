## What Vote Local has to offer:
While the nation pays attention to the big elections every 4 years, it’s not always easy to keep track of what is happening closer to home. Vote Local lets you keep track of some basic information to keep yourself informed about who your representatives are. With this app you can enter your address to find information on your local representatives. You can also use this app to check the tweets of your representatives and see what they are up to.

## Video Walkthrough
https://user-images.githubusercontent.com/24997456/121624825-7e874500-ca2f-11eb-834c-139ad50dae56.mp4

## How to use this App:

1. **Sign in**

   Vote Local uses OAuth allowing you to sign in with your Twitter account. Go to [Vote Local website](https://vote-local-fe.herokuapp.com) and click sign in.
   Don’t have a twitter account? Create an account here [Twitter Sign up](https://twitter.com/i/flow/signup). This app currently depends on twitter authentication in order to function.
   
2. **Search**

   Vote Local lets you search for your representatives. Once you have logged in, select search from the navigation bar to be taken to the search form where you can enter your address. Once you click search you will taken to a page where you can see who you local representatives are(up to the state level)
   
3. **Get details on who is representing you**

   You can get information on specific representatives you want to know more about. After doing a search, just click on the representative you want to know about. You will be taken to a page that displays information on them which may include thing like their name, their party affiliation, an available photograph, and a link to their web site among other information.
  
4. **Follow your local representative**

   To keep up to date with a representative, click the follow button to save them to your dashboard. That representative will now appear in your dashboard, so you can check in on them more easily. To remove a representative that you don’t want to see any more, click their name and then and click unfollow.

## Authors  
* Andrew Shafer [GitHub](https://github.com/Aphilosopher30) | [LinkedIn](https://www.linkedin.com/in/andrew-shafer-0631ab20a/)
* Harrison Blake[GitHub](https://github.com/harrison-blake) | [LinkedIn](https://www.linkedin.com/in/harrison-blake-802094200/)
* Wyatt Wicks [GitHub](https://github.com/Wyattwicks) | [LinkedIn](https://www.linkedin.com/in/wyattwicks/)
* Keegan O'Shea [GitHub](https://github.com/koshea9) | [LinkedIn](https://www.linkedin.com/in/keegan-oshea/)

## Technologies
- Framework: Ruby on Rails
- Testing: RSpec
- 3rd Party APIs:
  - [Twitter v2 API](https://developer.twitter.com/en/products/twitter-api)
- Response Caching: VCR & Webmock
- Test Coverage: SimpleCov

## Back End API Service
https://github.com/vote-local/vote_local_be
