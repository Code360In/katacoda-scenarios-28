## A first React component

### Heading to `step_1`

```
mkdir ~/sandbox/step_1/
cd ~/sandbox/step_1/
```{{execute}}


#### Initialize a javascript `package`

`yarn init`{{execute}}

Enter and accept all de

#### Create an index.js file

`touch index.js`{{execute}}


### The quickest way to start with React -- NWB

NWB is short for "No webpack"!

[NWB @github](https://github.com/insin/nwb#readme)

#### 1/ Install `nwb` globally

```
yarn global add nwb
```{{execute}}

This will take a bit... sit back and relax.

> Note. This is a one time thing. Once you have to installed it on the machine you use for coding, you won't have to run this instruction again. 

#### 2/ Install nwb locally

For each new project folder that you create, you will need to install the local version of nwb. This gives you access to utilities from the command line. 

> To use nwb's tooling in a project, install it as a devDependency and use nwb commands in package.json "scripts":

`yarn add nwb --dev`{{execute}}

```
"scripts": {
  "start": "nwb serve-react-app index.js",
  "build": "nwb build-react-app index.js"
}
```{{copy}}

#### 3/ Add a config file to overwrite the webpack configuration if you need to

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

`HelloBrussels.jsx`

```
import React, {Component} from 'react';
import {render} from 'react-dom';

const  Component {
    return <div>Hello Brussels</div>;
}

export default Component
```

`index.js`

```
import {render} from 'react-dom';
import HelloBrussels from 'HelloBrussels'

render(<HelloBrussels/>, document.querySelector('#app'));
```{{copy}}

Note. `document.querySelector('#app')` is a command to find in the dom an element with for id `app`

=> show Inspect from the developer tools

### Let's install our dependencies

```
yarn add react react-dom
```{{execute}}


