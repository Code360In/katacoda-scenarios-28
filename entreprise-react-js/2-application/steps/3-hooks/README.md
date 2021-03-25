# Hooks

## Reminder React Lifecycle

![](https://i1.wp.com/blog.logrocket.com/wp-content/uploads/2020/11/common-react-lifecycle-methods.png?w=730&ssl=1)



![](https://i1.wp.com/blog.logrocket.com/wp-content/uploads/2020/11/react-hooks-lifecycle.png?w=730&ssl=1)


### useState

```
const [state, setState] = useState(initialState);
```

> Returns a stateful value, and a function to update it.

> During the initial render, the returned state (state) is the same as the value passed as the first argument (initialState).

> The setState function is used to update the state. It accepts a new state value and enqueues a re-render of the component.

```
setState(newState);
```

> During subsequent re-renders, the first value returned by useState will always be the most recent state after applying updates.


```
function Counter({initialCount}) {
  const [count, setCount] = useState(initialCount);
  return (
    <>
      Count: {count}
      <button onClick={() => setCount(initialCount)}>Reset</button>
      <button onClick={() => setCount(prevCount => prevCount - 1)}>-</button>
      <button onClick={() => setCount(prevCount => prevCount + 1)}>+</button>
    </>
  );
}
```

> NOTE. Unlike the setState method found in class components, useState does not automatically merge update objects.

```
setState(prevState => {
  // Object.assign would also work
  return {...prevState, ...updatedValues};
});
```

> Another option is useReducer, which is more suited for managing state objects that contain multiple sub-values.

### useEffect


> Accepts a function that contains imperative, possibly effectful code.

> Mutations, subscriptions, timers, logging, and other side effects are not allowed inside the main body of a function component (referred to as React’s render phase). Doing so will lead to confusing bugs and inconsistencies in the UI.

> Instead, use useEffect. The function passed to useEffect will run after the render is committed to the screen. Think of effects as an escape hatch from React’s purely functional world into the imperative world.

> By default, effects run after every completed render, but you can choose to fire them only when certain values have changed.

```
useEffect(() => {
  const subscription = props.source.subscribe();
  return () => {
    // Clean up the subscription
    subscription.unsubscribe();
  };
});
```

Full signature:

```js
useEffect(
    () => {
        // execute side effect
    },
    // optional dependency array
    [
        // 0 or more entries
    ] 
)
```


### Multipe hooks

```
import React, { useState, useRef, useEffect } from "react";
function EffectsDemoNoDependency() {
  const [title, setTitle] = useState("default title");
  const titleRef = useRef();
  useEffect(() => {
    console.log("useEffect");
    document.title = title;
  });
  const handleClick = () => setTitle(titleRef.current.value);
  console.log("render");
  return (
    <div>
      <input ref={titleRef} />
      <button onClick={handleClick}>change title</button>
    </div>
  );
}```

### Understanding Hooks

[Hooks API Reference](https://reactjs.org/docs/hooks-reference.html)

[Learn React Hooks and find something to eat - Recipe App](https://alanmynah.com/blog/react-hooks-recipes)

### Recipes
[usehooks.com](https://usehooks.com/) and the associated [github repo](https://github.com/gragland/usehooks)

[React Recipes: State management with setState, useState and useReducer hooks](https://medium.com/@alicantorun/react-recipes-state-management-with-setstate-usestate-and-usereducer-573aa1377633)
