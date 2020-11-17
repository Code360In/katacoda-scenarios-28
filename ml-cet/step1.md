```scrap
source: https://www.practicepython.org/exercise/2014/01/29/01-character-input.html
recentness: 2020-11
```

![](/assets/img/logo.png)

# Practice Python


## Beginner Python exercises


# Character Input ![](/assets/img/chili-liz-20x20.png)

_input strings types int_

Calibrating the exercises to the audience is going to be a challenging task, so I ask you to bear with me if the exercises are too easy or too hard. Every week there will be a poll you can click on to discuss whether the exercise is too easy or too hard and hopefully in a few weeks, I’ll get the level right. Let’s get to it! I will start with the exercise and include a discussion later, in case you want the extra challenge.

## Exercise 1 (and [Solution](/solution/2014/02/05/01-character-input-solutions.html))

Create a program that asks the user to enter their name and their age. Print out a message addressed to them that tells them the year that they will turn 100 years old.

Extras:

1.  Add on to the previous program by asking the user for another number and printing out that many copies of the previous message. (_Hint: [order of operations](http://www.mathsisfun.com/operation-order-pemdas.html) exists in Python_)
2.  Print out that many copies of the previous message on separate lines. (_Hint: the string `"\n` is the same as pressing the ENTER button_)

## Discussion

Concepts for this week:

*   Getting user input
*   Manipulating strings (a few ways)

### User input in Python

To get user input in Python (3), the command you use is [`input()`](http://docs.python.org/3.3/library/functions.html?highlight=input#input). Store the result in a variable, and use it to your heart’s content. Remember that the result you get from the user will be a string, even if they enter a number.

For example,

```js
name = input("Give me your name: ")
print("Your name is " + name)
```

What this will print in the terminal (or the shell, whatever you are running Python in) will be:

```js
>>> Give me your name: Michele
Your name is Michele
```

What happens at the end of `input()` is that it waits for the user to type something and press ENTER. Only after the user presses ENTER does the program continue.

### Manipulating strings (a few ways)

What you get from the `input()` function is a string. What can you do with it?

First: Make the string into a number. Let’s say you are 100% positive that the user entered a number. You can turn the string into an integer with the function [`int()`](http://docs.python.org/3.3/library/functions.html#int). (In a later exercise or two or three there will be questions about what to do when the user does NOT enter a number and you try to do this; for now don’t worry about that problem). Here is what this looks like:

```js
age = input("Enter your age: ")
age = int(age)
```

(or, if you want to be more compact with your code)

```js
age = int(input("Enter your age: ")) 
```

In both cases, `age` will hold a variable that is an integer, and now you can do math with it.

(Note, you can also turn integers into strings exactly in the opposite way, using the [`str()`](http://docs.python.org/3.3/library/functions.html#str) function)

Second: Do math with strings. What do I mean by that? I mean, if I want to combine (**concatenate** is the computer science word for this) strings, all I need to do is add them:

```js
 print("Were" + "wolf")
print("Door" + "man")
print("4" + "chan")
print(str(4) + "chan")
```

The same works for multiplication:

```js
print(4 * "test")
```

but division and subtraction do not work like this. In terms of multiplication, the idea of multiplyling two strings together is not well-defined. What does it mean to multiply two strings in the first place? However, it makes sense in a way to specify multiplying a string by a number - just repeat that string that number of times. Try this in your own program with all the arithmetic operations with numbers and strings - the best way to get a feel for what works and what doesn’t is to try it!

## Happy coding!

Forgot how to [submit exercises](/about/)?

Loading...

## Share the fun!

[« Previous exercise](/exercise/2017/04/02/36-birthday-plots.html) [Next exercise »](/exercise/2014/02/05/02-odd-or-even.html)

  

[![](//a.impactradius-go.com/display-ad/3944-230400)](//treehouse.7eer.net/c/348966/230400/3944)![](//treehouse.7eer.net/i/348966/230400/3944)

[![](//a.impactradius-go.com/display-ad/3944-234096)](//treehouse.7eer.net/c/348966/234096/3944)![](//treehouse.7eer.net/i/348966/234096/3944)

var disqus\_shortname = 'practicepython'; /\* \* \* DON'T EDIT BELOW THIS LINE \* \* \*/ (function() { var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true; dsq.src = '//' + disqus\_shortname + '.disqus.com/embed.js'; (document.getElementsByTagName('head')\[0\] || document.getElementsByTagName('body')\[0\]).appendChild(dsq); })();

Please enable JavaScript to view the [comments powered by Disqus.](http://disqus.com/?ref_noscript)

[comments powered by Disqus](http://disqus.com)

_Copyright Michele Pratusevich, 2014-2017._

[_Advertising disclosure_](/disclosure.html)

(adsbygoogle = window.adsbygoogle || \[\]).push({});
