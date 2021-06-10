# README

This is an example app for my blog article where I teach you how to live stream log file from Rails server to the browser. You can find the blog at [Live Stream Log Files to Browser with Rails](https://prabinpoudel.com.np/articles/live-stream-logs-to-browser-with-rails)

## Setup

1. Clone the repo
2. Go to project root and install all required gems with `bundle install`
3. Fire the rails server: `rails s`
4. For live streaming, go to `http://localhost:3000/live_streams/log_file`
5. To view the live changes to log file, open default view for Rails app in another tab: `http://localhost:3000/`
6. Go back to the tab where we are live streaming and you can see that log file is being streamed there. You can try refreshing default view again and new changes will be appended to current view.

## Customization

If you want to live stream another file, go to `app/controllers/live_streams_controller` and update **log_file_path** inside the action `log_file` to the desired file path.

Now, when you make changes to that file, those changes will be live streamed to the browser.
