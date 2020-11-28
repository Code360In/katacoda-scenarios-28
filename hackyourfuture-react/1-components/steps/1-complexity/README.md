

## Dealing with Complexity

Once you start writing applications that are meant to provide a service to a customer, you end up having to design a number of screens.

If you visit any website that provides design templates, like [ui8](https://ui8.net/), you rapidly realise that apps can easily include well over 30 screens.

![](http://clients.widged.com/hackyourfuture/assets/shop-screens.png)

For instance

- [Food delivery](https://ui8.net/noansa-studio/products/foody---food-delivery-ui-kit)
- [E-commerce](https://ui8.net/dimoui/products/siadagang-ecommerce-ui-kit)
- [Doctor appointments](https://ui8.net/tickbird/products/bdoctor-appfor-doctor-ui-kit)
- [Grocery](https://ui8.net/ui-machines/products/g-shop-grocery-app-ui-kit)

## Two challenges

1/ Writing the application in a modular way. Mostly, what it means is that when you make a change somewhere in your application, it does not create unexpected changes in other parts of your application. A key concept associated with modules is the one of encapsulation.

> Encapsulation is one of the object oriented principles. It is combination of two notions:
>
> - Keeping data and functionality as a single unit.
> - Having the ability to restrict the access to some object from outside world.

2/ Maintainability

### Choice!

![too many js frameworks](https://miro.medium.com/max/1100/1*Q2t-jgIzVx_w1Cyy1YlbNw.png)

In 2020, the major players are:

- React JS
- Vue Js
- Angular JS

## Important differences

### 1/ Library vs Framework

![](https://pbs.twimg.com/media/Ej8EWXXU4AACy52?format=jpg&name=medium)

> Frameworks. When using a framework, the framework is in charge of running the system. It defines some extensibility points (interfaces) where you need to put your implementation.

> Libraries. When using a library, you are in charge of running the system. The library defines some points through which you can access it (functions and types) and your code can call it as it needs.

![](https://static1.squarespace.com/static/536be213e4b0098a764a0244/t/5380e8ace4b0d3b0ecca0650/1400957100989/library_vs_framework.png)

### 2/ HTML in Code vs Code in HTML

![](http://clients.widged.com/hackyourfuture/assets/jsx-vs-template.png)

Angular and Vue: Templates, Bindings, and Directives

> Binding is, what it sounds like. It is like a connection that you define between a Template element and an action, to perform some changes and the Angular will take care of the rest.

![](http://clients.widged.com/hackyourfuture/assets/directives.png)

## How do we get to pick one!?

1/ Popularity trends

![](https://res.cloudinary.com/practicaldev/image/fetch/s--odmGMyDT--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/stmx00kgdw6nq0w5q29r.png)

2/ Community Size

For instance, a large chunk of Vue developer community is from non-English speaking eastern European countries.

However Vue saw a mammoth rise in popularity since 2019.

3/ Learning Curve

![](https://academind.com/static/ca99acca1313bd7ef0917a2870fc3c6f/e5166/angular-react-vue-learning-curve.jpg)

4/ Product type and Speed to market

![](https://www.sphinx-solution.com/blog/wp-content/uploads/2019/05/angular-react-vue_table.jpg)

## We are going for React!

But by all means, make your own mind by reading some in-depth reviews

- [best-javascript-framework-2020](https://www.lambdatest.com/blog/best-javascript-framework-2020/)
- [stateofjs.com](https://2019.stateofjs.com/)

With a bit of google-fu, you can get more insights on

- [Differences between javascript libraries and frameworks](https://medium.com/better-programming/libraries-vs-frameworks-whats-the-difference-5f28c53dcffe) and
- Reasons people give to [avoid frameworks](http://tomasp.net/blog/2015/library-frameworks/)
