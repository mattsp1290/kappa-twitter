import React, { Component } from 'react';

class Tweet extends Component {
  render() {
    return (
      <h1>
        {this.props.text}
      </h1>
    );
  }
}

export default Tweet;
