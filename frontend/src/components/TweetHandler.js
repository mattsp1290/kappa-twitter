import React, { Component } from 'react';
import Tweet from './Tweet';

class TweetHandler extends Component {
  constructor(props) {
    super(props);
    this.state = {
      tweetText: "Please load me a tweet"
    };

    this.refresh = this.refresh.bind(this);
  }

  getTweet() {
    let parentThis = this;
    fetch('http://localhost:4000/tweets')
    .then(response => response.json())
    .then(data => parentThis.setTweet(data));
  }

  setTweet(tweet) {
    if (tweet) {
      this.setState({tweetText: tweet['text']});
    }
  }

  refresh(e) {
    e.preventDefault();
    this.getTweet();
  }

  render() {
    return (
      <div>
        <Tweet text={this.state.tweetText} />
        <br />
        <button onClick={this.refresh}>Test</button>
      </div>
    );
  }
}

export default TweetHandler;
