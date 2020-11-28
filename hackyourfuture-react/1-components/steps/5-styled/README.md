# Doing it in style

## Adding CSS style

First we need to make sure that we have the dependency added in our current package

```
yarn add styled-components
```

Then, we can import it from any component


```
import styled from 'styled-components'

const RedBox = styled.div`
    margin: 8px 0px;
    border: 1px solid red;
    background-color:  salmon;
    padding: 8px 4px;
`

const WarningBox = (props) => {
    const {message} = props

    return <RedBox>{message}</RedBox>

}
```
