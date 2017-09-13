import React from 'react';

import GiphysIndex from './giphys_index';


class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {searchTerm: ""};
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(property) {
    return e => this.setState({ [property]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const searchTerm = this.state.searchTerm;
    this.props.fetchSearchGiphys( {searchTerm} );
  }

  render() {
    let { giphys } = this.props;
    return (
      <div>
        <form className='searchy' onSubmit={this.handleSubmit}>
          <label>Search yo shit:
            <br />
            <input
              type='text'
              value={this.state.searchTerm}
              onChange={this.handleChange('searchTerm')}
            />
          </label>
          <input type='submit' value='Searchitup!'></input>
        </form>
        <GiphysIndex giphys={giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
