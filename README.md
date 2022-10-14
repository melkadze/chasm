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
like x2 90 deg or a 120 and a 60 deg angle). From there, we pull like, the top 5 
rocks that match those descriptions along with photos and additional info so they 
can identify it. I have not found a good API for that so I'll need some help 
figuring out how to pull images with certain tags down. 

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:**
- **Mobile:**
- **Story:**
- **Market:**
- **Habit:**
- **Scope:**

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
*Follow other users

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
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
