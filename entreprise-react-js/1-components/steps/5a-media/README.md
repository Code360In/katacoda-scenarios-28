Next week, we will learn how to embed assets. This week, we will simply link to online images.

For this, we can simply use an image tag. 

```jsx
<img src="https://www.flaticon.com/svg/static/icons/svg/995/995890.svg"   width="64" />
```

or with CSS in styled-components with

```jsx
export const Icon = styled.span`
	content:url("https://www.flaticon.com/svg/static/icons/svg/595/595067.svg");
  width: 24px;
`
```

To get the image `src`, right click over an image and select `Copy Image Address`

## Example

[2-recipe-card](https://repl.it/@widged/2-recipe-card)
