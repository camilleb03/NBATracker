<h1 align="center"> NBATracker </h1>

<p align="center">
<img src="https://user-images.githubusercontent.com/43909779/117497566-a96d0d80-af46-11eb-98c9-ea40b04f3beb.png" width="25%" height="25%">
</p>

> Personal iOS project to display NBA infos on current teams, players and current season with scoreboards of the day using data.nba.net and cdn.nba.net APIs.

## Table of Contents
1. [General Info](#general-info)
2. [Project Screenshots](#project-screenshots)
3. [Technologies](#technologies)
4. [Features](#features)
5. [TODOs](#todo-list)
6. [References](#references)
7. [Disclaimer](#disclaimer)

<hr>

## General Info

* iOS Deployment Target : 14.4

<hr>

## Project Videos
<table>
  <tr>
    <td>Scoreboards View</td>
     <td>Search View</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/43909779/124505332-3ab9fe00-dd97-11eb-97a0-d65ecffb5b54.gif" width=225 height=500></td>
    <td><img src="https://user-images.githubusercontent.com/43909779/124505893-815c2800-dd98-11eb-8e14-29afc2d4ea15.gif" width=225 height=500></td>
  </tr>
 </table>

<hr>

## Technologies
A list of technologies used within the project:
* Xcode 12.4
* Swift 5
* SwiftUI
* Combine
* MVVM
* APIs : data.nba.net and cdn.nba.net

<hr>

## Features

A few of the things you can do with NBATracker:

* View a list of games scoreboards by date
* View a list of advanced statistics of a selected game (score table, team statistics, team leaders)
* Search a player or a team by name

<hr>

## TODO list

List of upcoming features:
- Player Profile
  - Display player's latest headshot
  - Display personal info (name, birthday, attended collegue, draft info, current team)
  - Display game statistics (total and average in points, rebounds, assists, etc.) throughout :
    - Career
    - Regular seasons
- Team "Profile"
  - Display logo, name
  - Display current season's statistics (average)
  - Display roster
- Conference Standings
  - Display list of teams for each conference ordered by win percentage
  - Display number of wins and losses with percentage, last ten games results, current streak
  - Differentiate teams who clinched a playoff spot
- Tests
  - Migrate tests from NBATracker-UIKit

<hr>

## References

* Basketball image of app icon designed by BSGStudio (taken from https://all-free-download.com/)
* NBA team logos taken from the publicly accessible API cdn.nba.net

## Disclaimer
* This project is not affiliated, associated, endorsed by, or in any way officially connected with the NBA.
* All names and logos used are registered trademarks of their respective owners.
* This application is released under MIT (see [LICENSE](LICENSE)).
