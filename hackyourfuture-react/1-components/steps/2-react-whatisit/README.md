
> React is a JavaScript library created in 2011 by Facebook that specializes in helping developers build user interfaces, or UIs.

[https://reactjs.org/](https://reactjs.org/)

## UI Composition

![](https://static.bit.dev/homepage-bit/assets/booking-breakdown.png)

## Writing reusable components

![](https://mir-s3-cdn-cf.behance.net/project_modules/fs/25578470010007.5b95492d24c83.png)


## Coherent look and feel through the application
![](https://mir-s3-cdn-cf.behance.net/project_modules/fs/640c8e70010007.5b95492d24650.png)


## Mini App example

![](https://clients.widged.com/hackyourfuture/assets/filterable_product_table.png)

```jsx
import * as React from 'react'
import * as ReactDOM from 'react-dom'


class ProductCategoryRow extends React.Component {
  render() {
    const category = this.props.category;
    return (
      <tr>
        <th colSpan="2">
          {category}
        </th>
      </tr>
    );
  }
}

class ProductRow extends React.Component {
  render() {
    const product = this.props.product;
    const name = product.stocked ?
      product.name :
      <span style={{color: 'red'}}>
        {product.name}
      </span>;

    return (
      <tr>
        <td>{name}</td>
        <td>{product.price}</td>
      </tr>
    );
  }
}

class ProductTable extends React.Component {
  render() {
    const rows = [];
    let lastCategory = null;
    
    this.props.products.forEach((product) => {
      if (product.category !== lastCategory) {
        rows.push(
          <ProductCategoryRow
            category={product.category}
            key={product.category} />
        );
      }
      rows.push(
        <ProductRow
          product={product}
          key={product.name} />
      );
      lastCategory = product.category;
    });

    return (
      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Price</th>
          </tr>
        </thead>
        <tbody>{rows}</tbody>
      </table>
    );
  }
}

class SearchBar extends React.Component {
  render() {
    return (
      <form>
        <input type="text" placeholder="Search..." />
        <p>
          <input type="checkbox" />
          {' '}
          Only show products in stock
        </p>
      </form>
    );
  }
}

class FilterableProductTable extends React.Component {
  render() {
    return (
      <div>
        <SearchBar />
        <ProductTable products={this.props.products} />
      </div>
    );
  }
}

// ##############################
// ## Application to load in the DOM
// ##############################
const PRODUCTS = [
  {category: 'Sporting Goods', price: '$49.99', stocked: true, name: 'Football'},
  {category: 'Sporting Goods', price: '$9.99', stocked: true, name: 'Baseball'},
  {category: 'Sporting Goods', price: '$29.99', stocked: false, name: 'Basketball'},
  {category: 'Electronics', price: '$99.99', stocked: true, name: 'iPod Touch'},
  {category: 'Electronics', price: '$399.99', stocked: false, name: 'iPhone 5'},
  {category: 'Electronics', price: '$199.99', stocked: true, name: 'Nexus 7'}
];


ReactDOM.render(
  <FilterableProductTable products={PRODUCTS} />,
  document.getElementById('container')
);
 ```

## Some challenges

- Converting JSX into javascript for browser understanding => Need to use code bundlers like web pack
- Accessing subpages within the application through routes like `https://bestapponearth.com/settings/` => Using the URL router library like ReactRouter
