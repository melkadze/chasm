# CodePath-Group1-iOS-Project (Georgina W, Deondrae F, Kazi M, Nick M)

Original App Design Project - README Template
===

# Chasm

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description

Users upload a picture of a rock, and tag it with identifying variables like color 
(light or dark), luster (metallic or non metallic), cleavage (how it breaks into 
pieces, poor cleavage just means crumbly, good cleavage would be distinct angles 
like x2 90 deg or a 120 and a 60 deg angle). From there, we pull, for instance,
the top 5 rocks that match those descriptions along with photos and additional
info so they can identify it.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Social Networking / Science
- **Mobile:** We would have this app be mobile-first, and there is a good reason for this: support for taking pictures. This will not work as well on desktops/laptops, so we will leverage the benefits of having a mobile device.
- **Story:** Allows those who are interested in rocks to share their findings, and comment on those of others.
- **Market:** This app can cater to those who are well informed about rocks, as well as to those who are just getting started with a little bit of interest in the topic -- as our app will certainly grow that interest.
- **Habit:** The app can be used as often as the user utilizes their other social media apps, whether that be multiple times a day or a couple times a week. Since it has a scrollable feed that users can browse to catch up on all they've missed, there is no need to check it constantly.
- **Scope:** We would first start with creating an Instagram-like app, similar to the Parstagram app we've already built, and then add the categorization features which are specific to rocks. Later on, we will add other features that build on these such as identifying the rocks.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Login/Sign Out
* Ability to post pictures
* Ability to tag pictures with labels
* Caption pictures
* LIke pictures
* Comment on pictures
* Search for specific tags
* Identify something based on information submitted
* Quiz game

**Optional Nice-to-have Stories**

* View your own profile
* Leaderboard for quiz game
* Follow other users

### 2. Screen Archetypes

* Start Screen
   * Logo and then transition to Login/Signup
* Login/Signup Screen
   * Text fields for username and password
   * Buttons to signup and signin
* Feed Screen
   * Separate cells for each post taht includes the picture, user, caption, tags, likes, and comments
   * Scrollable and refreshable
* Profile Screen
   * Portrays the users' username, pictures, numberof posts, bio, and followers (Optional)
   * Can use this screen to view other profiles and individual posts
* Explore Screen
   * Search by tags or name for specific things
   * Quiz section on the bottom of the screen in case the user wants to take it
   * A scrollable object that will put random posts form other users
* Capture Screen
   * Shows camera view to capture and post an image, with a caption

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Start 
* Login/Signup 
* Feed 
* Profile
* Explore

**Flow Navigation** (Screen to Screen)

* Start
   * Login/Signup
* Login/Signup
   * Feed
* Feed
   * Profile
   * Explore
* Profile
   * Feed
   * Explore
* Explore
   * Feed
   * Profile

## Wireframes
### Launch Screen and Login

![Oopsie Doopsie, image link breaky](https://i.imgur.com/L6qe4IS.png)

### Feed, Explore, and Profile

![Oopsie Doopsie, image link breaky](https://i.imgur.com/cbEN7rM.png)

### Post Screen

![Oopsie Doopsie, image link breaky](https://i.imgur.com/bxaGgwD.png)




### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
### Models
#### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field) |
   | author        | Pointer to User| image author |
   | image         | File     | image that user posts |
   | caption       | String   | image caption by author |
   | commentsCount | Number   | number of comments that has been posted to an image |
   | likesCount    | Number   | number of likes for the post |
   | tags          | Array<String>   | list of tags for the post |
   | likesCount    | Number   | number of likes for the post |
   | createdAt     | DateTime | date when post is created (default field) |
   | updatedAt     | DateTime | date when post is last updated (default field) |
#### User

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field) |
   | name          | String   | string of username |
   | followersCount | Number  | number of followers |
   | followingCount | Number  | number of users followed |
   | rockCount     | Number  | number of rocks posted |
   | bio           | String   | bio by author |
   | createdAt     | DateTime | date when post is created (default field) |
   | updatedAt     | DateTime | date when post is last updated (default field) |
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
