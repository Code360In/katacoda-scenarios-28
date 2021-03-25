## Function Component vs Class  component

### Example

[4-interaction](https://repl.it/@widged/4-interaction)

### Function Component 

```
import React from 'react';

const RecipePhoto = (props) => {
    const {photo} = props
   return <img src={photo} width="200" />
}

export default RecipePhoto;
```

### Class Component 

```
 // Note: we import  `Component` on the next line
 // It is the same as React.Component.
import React ,  {Component} from 'react';

class RecipePhoto extends Component {
    render() {
        // Note: `this` on the next line
        const {photo} = this.props 
    return <img src={photo} width="200" />
    }
}

export default RecipePhoto;
```

Not very different, isn't it. Notice the use of `this` and `render()` in the second example. 

### `this`

 What we create is a class instance. Any class instance has a `this` that gives access to all variables and methods that are attached to the instance. 

## Lifecycle

### `render()`

Once we use the class format, we have access to react's lifecycle. 

Render is just one of the methods that are associated with React lifecycle. 

### Three phases:

![](https://www.netguru.com/hs-fs/hubfs/lifecycle.png?width=1633&name=lifecycle.png)

- Mounting takes places when the component is added to the dom
- Updating happens whenever the `state` or `props` has changed (or a forceUpdate has been called)

### Full lifecycle

We will come back to that next week. 

![](https://images.viblo.asia/2ceca49d-97fe-481a-8a1f-938532e75ee9.png)

If you want to learn on your own  [React Components Lifecycle Methods - WTH are they?](https://dev.to/aditya278/react-components-lifecycle-methods-wth-are-they-2lh5)

## Example

[4-interaction](https://repl.it/@widged/4-interaction)
