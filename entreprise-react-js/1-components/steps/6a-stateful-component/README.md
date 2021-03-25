## Reacting to User's interaction

### Example

[4-interaction](https://repl.it/@widged/4-interaction)

```
import React, {Component} from 'react'
import RecipeCard from './RecipeCard'
import {ListBox, ListItem} from './styled.js'

class RecipeList extends Component {
  constructor(props) {
    super(props)
    this.onCardClick = this.onCardClick.bind(this)
    this.state = {active: -1}
  }
  onCardClick(evt) {
    const {idx} = evt.currentTarget.dataset
    this.setState({active: parseInt(idx,10)})
  }
  render() {
    const {items} = this.props // Note `this`
    const {active} = this.state // Note `this`
    const {onCardClick} = this
    return (
      <div>
        <div>Number of Recipes: {items.length}</div>
        <div>Active: {active > 1 ? items[active].name : "--N/A--"}</div>
        <h2>First 12</h2>
        <ListBox>
        {items.slice(0,12).map((d,i) => {
          const selected = active === i ? true : false
          return <ListItem key={i} selected={selected} onClick={onCardClick} data-idx={i}><RecipeCard {...d}/></ListItem>
        })}
      </ListBox>
    </div>
  )

  }
}

export default RecipeList
```
