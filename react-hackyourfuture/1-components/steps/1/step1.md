## The quickest way to start with React

### NWB

[NWB @github](https://github.com/insin/nwb#readme)

#### Installing it globally

```js
yarn global add nwb
```{{execute}}

This will take a bit... sit back and relax.

#### Heading to `step_1`

```js
cd ~/sandbox/step_1/
```{{execute}}

#### Initialize a javascript `package`


```js
yarn init
```{{execute}}

#### Create an index.js file


`touch index.js`{{execute}}


#### Install nwb locally

> To use nwb's tooling in a project, install it as a devDependency and use nwb commands in package.json "scripts":

`yarn add nwb --dev`{{execute}}

```json
"scripts": {
  "start": "nwb serve-react-app index.js",
  "build": "nwb build-react-app index.js"
}
```{{copy}}

This part is for my setup only, because I am on this sandbox environment.

`touch nwb.config.js`{{execute}}

`nwb.config.js`{{open}}


```
const path = require('path');

module.exports = {
  type: 'react-app',
  devServer: {
    compress: true,
    disableHostCheck: true, // Required to run on katacoda
  },
  webpack: {
    publicPath: ''
  }
};
```{{copy}}


## A first react component!

### The code

```
import React, {Component} from 'react';
import {render} from 'react-dom';

class App extends Component {
  render() {
    return (<div>Hello Brussels</div>);
  }
}

render(React.createElement(App), document.querySelector('#app'));
```{{copy}}


### Let's install our dependencies

```
yarn add react react-dom
```{{execute}}


