import React from 'react';
import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = ({giphys}) => {
  return (
    <div>
      <ul>
        { giphys.map(giphy => <GiphysIndexItem key={giphy.id} giphy={giphy} />) }
      </ul>
    </div>
  );
};

export default GiphysIndex;
