# Doing it in style

Time to use react for doing something useful! For these two sessions on React, we will go for the general theme of "recipes"

For writing a recipe app, we will need some data!

[](https://github.com/tabatkins/recipe-db)

If you feel like doing your styling from scratch, here is some inspiration

with code [ui-card collection on codepen](https://codepen.io/collection/XgYebO)


## Adding CSS style

First we need to make sure that we have the dependency added in our current package

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

```
import React, {Component} from 'react'
import {RedBox, BoldText} from './styled.js'

const WarningBox = (props) => {
    const {message} = props

    return <RedBox><Emphasis>Warning</Emphasis>{message}</RedBox>

}
```
