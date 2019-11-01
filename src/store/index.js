import Vue from 'vue';
import Vuex from 'vuex';
import { get } from 'lodash';

import {
  SET_IS_PLAYING,
  SET_TEMPO,
  SET_TIME_SIGNATURE,
} from './constants';


Vue.use(Vuex);


export default new Vuex.Store({
  state: {
    isPlaying    : false,
    tempo        : 120,
    timeSignature: {
      beatsPerBar : 4,
      beatDuration: 4,
    },
  },
  getters: {
    getIsPlaying: state => get(state, 'isPlaying'),
    getTempo    : state => get(state, 'tempo'),
    getTimeSignature: state => get(state, 'timeSignature'),
  },
  mutations: {
    [SET_IS_PLAYING]: (state, { isPlaying }) => {
      state.isPlaying = isPlaying;
    },
    [SET_TEMPO]: (state, { tempo }) => {
      state.tempo = tempo;
    },
    [SET_TIME_SIGNATURE]: (state, { beatsPerBar, beatDuration }) => {
      state.timeSignature = {
        beatsPerBar,
        beatDuration,
      };
    },
  },
})
