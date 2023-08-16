<br/>

<div align="center" style="margin: 30px;">
<a href="https://refine.dev/">
  <img src="https://raw.githubusercontent.com/helpotters/asprin/app/assets/images/asprin.gif"   style="width:350px;" align="center" />
</a>
<br />
<br />

<div align="center">
    <a href="https://linkedin.com/in/helpotters">LinkedIn</a> |
    <a href="https://helpotters">Personal Portfolio</a> |
    <a href="">Documentation</a>
</div>
</div>

<br />

<div align="center"><strong>Building 2008 Facebook from scratch.</strong><br> Not just a portfolio-project, but an experiment with variants on the usual social media features.

<br />

<div align="center">
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=flat&logo=ruby-on-rails&logoColor=white)
![TailwindCSS](https://img.shields.io/badge/tailwindcss-%2338B2AC.svg?style=flat&logo=tailwind-css&logoColor=white)
[![](https://img.shields.io/github/commit-activity/m/helpotters/asprin)](https://github.com/helpotters/asprin/commits/next)

</div>

<br/>

[![how-asprin-works](https://raw.githubusercontent.com/helpotters/asprin/app/assets/images/early-version.gif)](https://github.com/helpotters/asprin)


## What is asprin?

**asprin** is a **Ruby on Rails** application that I'm working on to test out some idea basic social media features and also experiment with Rails gems like ViewComponents.  

It uses Hotwire to improve performance and user-experience, especially in reducing intial pageload time after logging in (ie, notifications).  


**asprin** is _ViewComponent-driven_, anything repetition is simplified in the UI, which also helps with driving component design in Figma first.

## What's Turbo?

`%turbo-frame` allows **asprin** to break up the web page into individual 'sub-pages' that are each individually interacting with the server. `notifications`, `user search` or `posts` are all running separtely from one another. Each section also sends their own network requests, which allows the page to load right away rather than waiting for all of it to come in. If each part took 50ms and there were 4 sections to load, it'd take `200ms` before the page loaded; however, breaking it up into turbo frames, that means it'll `50ms`, or technically less if you put a placeholder in the frame as it loads.

### How it affected notifications

The `notifications` consists of a polymorphic relation to multiple 'payloads' while belonging to the user. Upgrading this feature with turbo allows notifications to roll in as the user browses. Building the notifs with `ViewComponents` should also help improve performance over partials as well, and allows me swap in different components depending on the payload model: `FriendRequestComponent` consists of an interactable form while a `Like` notification can just be text.

## Goal of the project

**asprin** tries to emulate_2008⚡ Facebook_ with basic features like **posts**, **comments** and **searchable friends**. Overall, I'm using this project to learn more about **ViewComponents**, **elasticsearch**, and **Devise**. Potentially, I can add an _interesting spin_ to the application such as **hooking it up to spotify playlists**.

Some potential ideas for **asprin**:


- MySpace-like html input design
- Music intteractivity
- Find friends through discord mutuals

## Key Features

- 📝 **User Registration and OAuth:** Users can sign up and log in with either a normal email/password or they can use their Github or Discord accounts to sign in. Their profile pictures will automatically be set to the ones they already had!
- 👤 **User Profiles:** Allow users to create and customize their profiles. Users can set avatars, provide personal information, and manage their profile settings. 
- 🤝 **Friends System:** Users can search for other users and send them a friend request. Simply use the search bar in the navbar and it will autocomplete suggestions as you type.
- ✉️ **Posting and Sharing:** Implement a posting feature that allows users to create and share text-based content. Users can create posts, view their own posts, and see posts from their friends. Possibly 'retweet' posts.
- 📬 **Notification System:** The notification system displays interactable notifs from anything from friend requests to likes on your post.
- ⚡ Hotwire for **segmenting the UI**

## Quick Start

**asprin** requires Elasticsearch for the autocomplete user search feature. Thank you to [@Deanout][https://github.com/Deanout], for his tutorial and following docker command to get Elasticsearch up and running quickly:

```
docker run -d -p 127.0.0.1:9200:9200 -p 127.0.0.1:9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.17.8
```

If you have issues with memory, the following modified command will limit its memory usage to `2g`:

```
docker run -d -p 127.0.0.1:9200:9200 -p 127.0.0.1:9300:9300 -e "discovery.type=single-node" -e "ES_JAVA_OPTS=-Xms2g -Xmx2g" docker.elastic.co/elasticsearch/elasticsearch:7.17.8
```

<br/>

You can check if its working at [http://localhost:9200](http://localhost:9200). Be sure to also run `User.reindex` in `rails c`. There is also a bug regarding `has_one_attached :avatar` in the *User* model that causes a `Stack level too deep` error, probably due to indexing.


## Next Steps

👉 Sign up: you can use Discord or Github to make your account! One sign on.

👉 Find friends: Search for people you may know or send them a link to sign up! Of course, I'm available to friend as Paul Lemus.

👉 Check out my [LinkedIn][https://linkedin.com/in/helpotters].


## License

Undecided on licensing. 
