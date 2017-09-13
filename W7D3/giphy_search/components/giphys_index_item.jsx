import React from 'react';

const GiphysIndexItem = ({ giphy }) => (
  <div>
    <li className="gif">
      <img src={giphy.images.fixed_height.url} />
    </li>
  </div>
);

export default GiphysIndexItem;
