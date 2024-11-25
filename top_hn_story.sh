#!/bin/bash

# Fetch the top stories IDs from Hacker News
TOP_STORY_ID=$(curl -s https://hacker-news.firebaseio.com/v0/topstories.json | jq '.[0]')

# Fetch the details of the top story
STORY_DETAILS=$(curl -s https://hacker-news.firebaseio.com/v0/item/${TOP_STORY_ID}.json)

# Extract the title, URL, and score
TITLE=$(echo $STORY_DETAILS | jq -r '.title')
URL=$(echo $STORY_DETAILS | jq -r '.url')
SCORE=$(echo $STORY_DETAILS | jq -r '.score')

# Display the top story details
echo "Top Story on Hacker News:"
echo "Title: $TITLE"
echo "Link: $URL"
echo "Points: $SCORE"
