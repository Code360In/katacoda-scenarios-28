## Function Component vs Class  component

### Function Component 

```
import React from 'react';
const RecipePhoto = (props) => {
    const {src} = props
   return <img src={src} width="200" />
}
export default RecipePhoto;
```

### Class Component 

```
import React ,  {Component} from 'react';

class RecipePicker extends Component {
    render() {
        const {name} = this.props
        return <div>Hi, I am a Student. My name is {name} </div>
    }
}



export default Student;
```

Not very different, isn't it. Notice the use of `this` and `render()` in the second example. 

### `this`

 What we create is a class instance. Any class instance has a `this` that gives access to all variables and methods that are attached to the instance. 

### `render()`

Once we use the class format, we have access to react's lifecycle. 

Render is just one of the methods that are associated with React lifecycle. 

![](https://www.netguru.com/hs-fs/hubfs/lifecycle.png?width=1633&name=lifecycle.png)

![](https://sebhastian.com/react-lifecycle/lifecycle-graph.png)

