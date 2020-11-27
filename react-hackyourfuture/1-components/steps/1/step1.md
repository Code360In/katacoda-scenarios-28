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

#### Initialize a js project


```js
yarn init
```{{execute}}

#### Touch


```js
touch index.js
```{{execute}}


#### Install nwb locally

> To use nwb's tooling in a project, install it as a devDependency and use nwb commands in package.json "scripts":

```js
yarn add nwb --dev
```{{execute}}

```json
"scripts": {
  "start": "nwb serve-react-app",
  "build": "nwb build-react-app"
}
```{{copy}}

#### src/index.js

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


