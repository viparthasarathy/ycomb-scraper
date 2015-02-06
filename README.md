# Documentation

This is a small project to get some exposure to using the Nokogiri and Open-Uri gem. As of now, this repository currently contains the 'script.rb' ruby file which can be run through the terminal to download and save the comments from each front page link of [Hacker News](https://news.ycombinator.com/).


## Future Plans

While the project saves the comments from each link of the front page, it fails to save the link itself. This isn't very helpful if the topic of discussion requires knowledge of the linked subject. 

Furthermore, the saved html files are currently named after their id number. This makes it a painful process to find something interesting to read; the saved title should be changed to both the submitted title of the link/content and the id.

Finally, the script could potentially target discussions outside of purely the front page of Hacker News. Given how Hacker News indexes its conversations/links (id value that starts at 0), it should be fairly simple (but time consuming for the computer) to copy every single disussion that has ever taken place on Hacker News. There are also concerns about proper etiquette regarding how frequent requests should be made.
