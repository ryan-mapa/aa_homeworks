import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
// import fetchSearchGiphys from './util/api_util.js';
import {fetchSearchGiphys} from './actions/giphy_actions.js';

import {receiveSearchGiphys} from './actions/giphy_actions.js';



// const store = configureStore();
// window.store = store;
window.fetchSearchGiphys = fetchSearchGiphys;
window.receiveSearchGiphys = receiveSearchGiphys;

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, root);
});