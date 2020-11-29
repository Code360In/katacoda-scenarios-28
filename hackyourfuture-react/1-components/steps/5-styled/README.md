
Time to use react for doing something useful! 

For these two sessions on React, we will go for the general theme of "recipes". 

We will try and create content like this, as react components:

![](https://caphe.sfo2.cdn.digitaloceanspaces.com/assets/images/scratch-recipe-ui-kit-0.jpg)

But for this, we need to be able to specify some styling.

In React, by default, it is done by adding style in-line. 

```
var divStyle = {
  color: 'white',
  backgroundImage: 'url(' + imgUrl + ')',
  WebkitTransition: 'all', // note the capital 'W' here
  msTransition: 'all' // 'ms' is the only lowercase vendor prefix
};

ReactDOM.render(<div style={divStyle}>Hello World!</div>, mountNode);
```

However, this is not really practical. It looks like CSS but it is not quite css. 

Styled are not specified as a string. Instead they are specified with an object whose key is the camelCased version of the style name in order to be consistent with accessing the properties on DOM nodes from JS (e.g. node.style.backgroundImage). 

And the value is not always the way you would specify it in CSS. For instance, you specify width as `{width: 24}`, as a number, and not `{width: '24px'}`

Why can we not use the CSS that we already know!? Libraries can be used for that. 

Two popular ones are `styled-components` and `emotions`. We are going to use `styled-components` . 

## Specifying CSS styles with  `styled-components` 

First we need to make sure that we have the dependency added in our current package

On Repl.it, you add a new dependency this way:

![](https://clients.widged.com/hackyourfuture/assets/replit/add-a-package.png)

When developing on your local environment, you can do it this way:

```
yarn add styled-components
```

Then, we can import it from any component

Let's create a file `styled.js`

It really is a good habit to physically separate different logics. Here, we are putting everything that belongs to the styling logic in one file. 

The file ends with '.js', not with '.css'. Any css that is included in the file is __interpreted__ and converted to react style. 

```
import styled from 'styled-components'

export const RedBox = styled.div`
    margin: 8px 0px;
    border: 1px solid red;
    background-color:  salmon;
    padding: 8px 4px;
`

export const Emphasis = styled.span`
    font-family: Helvetica;
    font-weight: bold;
    font-size: 18pt;
    color: darkred;
`
```

Note how we use `export const` instead of `export default` to allow multiple exports within the file

We choose to isolate `App.js`, which is about mounting the rendered react app in the DOM and `LandingPage.js`  which is the react component associated to the First Page that the user see when it connects to our app. 

```
import React from 'react'
import {RedBox, Emphasis} from './styled.js'

const LandingPage = () => {
  return <RedBox><Emphasis>Warning</Emphasis></RedBox>
}

export default LandingPage
```

## Example

[2-recipe-card](https://repl.it/@widged/2-recipe-card)
