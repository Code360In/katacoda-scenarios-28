## The quickest way to start with React


### The transpiling problem!

I am pretty sure you have already been told of this. In 2015, the javascript language got major upgrade! Mostly, there was a move to make the notion of modules, that had been fully supported in the nodejs environment, available in browser-based environments.

With a module, you get the option to split your code into separate files and to "import" the code on demand. This helps write code that is easier to design, maintain and debug.

Problem was that, browsers are maintained by vendors that have each a separate implementation of a javascript engine. And most were not able to deal with module syntax. To use modules, it was required to convert modern javascript to an older verion of javascript understood by the browsers. This is known as transpiling.

> A compiler goes to a lower level (lower number). A transpiler switches from one language (or version of a language) to another at the same number.

So, a few tools started to appear to manage the automation of application deployment tasks. One of the most popular one being webpack.

Problem is, webpack is hard to configure. And it is even harder when working on a complex product. So a few tools have emerged to do the heavy lifting for us.

I will be introducing 3. NWB, Parcel, create-react-app. Today, we will only care about NWB and Parcel, that let you work at component level. Next week, we will introduce create-react-app, which let you write a complete application.

### Heading to `step_1`

```js
mkdir ~/sandbox/step_1/
cd ~/sandbox/step_1/
```{{execute}}


#### Initialize a javascript `package`

`yarn init`{{execute}}

Enter and accept all de

#### Create an index.js file


`touch index.js`{{execute}}


#### NWB

NWB is short for "No webpack"!

[NWB @github](https://github.com/insin/nwb#readme)


#### Installing `nwb` globally

```js
yarn global add nwb
```{{execute}}

This will take a bit... sit back and relax.

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


