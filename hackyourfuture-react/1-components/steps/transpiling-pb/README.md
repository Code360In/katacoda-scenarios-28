## The transpiling problem!

I am pretty sure you have already been told of this. In 2015, the javascript language got major upgrade! Mostly, there was a move to make the notion of modules, that had been fully supported in the nodejs environment, available in browser-based environments.

With a module, you get the option to split your code into separate files and to "import" the code on demand. This helps write code that is easier to design, maintain and debug.

Problem was that, browsers are maintained by vendors that have each a separate implementation of a javascript engine. And most were not able to deal with module syntax. To use modules, it was required to convert modern javascript to an older verion of javascript understood by the browsers. This is known as transpiling.

> A compiler goes to a lower level (lower number). A transpiler switches from one language (or version of a language) to another at the same number.

So, a few tools started to appear to manage the automation of application deployment tasks. One of the most popular one being webpack.

Problem is, webpack is hard to configure. And it is even harder when working on a complex product. So a few tools have emerged to do the heavy lifting for us.

I will be introducing 3. NWB, Parcel, create-react-app. Today, we will only care about NWB and Parcel, that let you work at component level. Next week, we will introduce create-react-app, which let you write a complete application.
