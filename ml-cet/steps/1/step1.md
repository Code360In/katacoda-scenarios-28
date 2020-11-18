## 1. Variables and math in Python

### 1.1 Math operators


#### add two integers
```python
2 + 2
```{{execute}}



#### multiply two integers
```python
2 * 2
```{{execute}}

#### spaces don't matter here, but keep them consistent (PEP8 good practice)
```python
2*3   +   10
```{{execute}}

#### divide two integers
```python
6 / 3
```{{execute}}

#### raise 2 to the 4th power
```python
2 ** 4
```{{execute}}

#### the mod function returns the remainder after division. Useful to check divisibility.
```python
10 % 3
```{{execute}}

<table><thead>
<tr><th>Symbol</th><th>Task Performed</th></tr></thead>
<tbody><tr><td>+</td><td>Addition</td></tr>
<tr><td>-</td><td>Subtraction</td></tr>
<tr><td>/</td><td>division</td></tr>
<tr><td>*</td><td>multiplication</td></tr>
<tr><td>**</td><td>to the power of</td></tr>
<tr><td>%</td><td>mod</td></tr>
</tbody>
</table>

### 1.2 Working with variables


#### variables, such as x here, contain values and their values can vary
```python
x = 5
```{{execute}}

#### to inspect a value, just call it
```python
x
```{{execute}}

#### you can perform calculations on variables
```python
x + 3
```{{execute}}

#### what's the value of x now?
```python
x
```{{execute}}

#### to update the value of a variable, you have to do assignment again
```python
x = x + 3
```{{execute}}

#### now what's the value of x?
```python
x
```{{execute}}

#### create a new variable y from a calculation involving x
```python
y = x + 2
y
```{{execute}}

#### calling two variables only displays the last one
```python
x
y
```{{execute}}

#### use the print() function to output value(s) to the console
```python
print(x)
print(y)
```{{execute}}

#### separate two values by commas to output on the same line
```python
print(x,y)
```{{execute}}

#### you can also print the output of an expression
```python
print(x * y)
```{{execute}}

NOTE: Use valid variable names!

*   Variable names can contain letters, numbers, and the underscore character.
*   You can't begin variable names with a digit, or use any of Python's _reserved words_ (eg. False, list, None, zip, else, class, ...).
*   Don't use a space in the middle of a variable name.

<table>
<thead><tr><th>result</th><th>variable name</th></tr></thead>
<tbody>
  <tr><td>Valid</td><td>my_float, xyz_123, zip_code</td></tr>
  <tr><td>Error!</td><td>my float, 123_xyz, zip</td></tr>
</tbody>
</table>

### 1.3 Getting help and using tab complete


#### get iPython help on an expression by putting ? after it
```python
len?
```{{execute}}

#### use tab complete to fill in the rest of statements, functions, methods
```python
prin
```{{execute}}

#### also use it to complete variable or functions that you defined yourself
```python
name_of_course = "Python for Data Science"
```{{execute}}

##name_of_cou
```python
```{{execute}}


## 2. Basic data types: int, float, string

These object types are the most basic building blocks when handling data in Python. Note that Python is an object-oriented language. Each object has a type, which determines what can be done with it. For instance, an object of type _int_ can be added to another _int_.

In compiled languages like C++, the programmer has to declare the type of any variable before using it. By contrast, Python will **infer the type of variable you want** at run-time. It does this based on what characters you pass, whether they are surrounded by quote marks or brackets. This keeps the syntax much more 'natural' - but take care to learn the rules your Python interpreter applies.


#### integers are whole numbers
```python
x = 10
type(x)
```{{execute}}

#### floats are floating point (or decimal) numbers
```python
y = 4.25
type(y)
```{{execute}}

#### strings are sets of characters in a row, denoted by single or double quotes
```python
course_name = 'Python for Data Science'
```{{execute}}

#### another data type is a Boolean, which has the possible values True or False
```python

my_enrollment_status = True
type(my_enrollment_status)
```{{execute}}

#### use isinstance to check an object's type
```python
isinstance(course_name, int)
```{{execute}}

### 2.1. Manipulating strings


#### this is a string. It can be assigned to a variable.
```python
mystring = 'I am a string. Humans can interpret me easily'
```{{execute}}

##print(mystring)
```python
```{{execute}}

#### strings can added together (concatenated)
```python
add_chunk = '. I love strings'
mystring + add_chunk
```{{execute}}

#### but they can't be subtracted
```python
mystring - add_chunk
```{{execute}}

#### they can be repeated with *
```python
add_chunk * 3
```{{execute}}

#### Each object type has a set of 'methods' (ie. built-in operations) attached to it.
```python
# Access these with dot notation.

mystring.split('.')
```{{execute}}

#### the .replace() method is handy too. This operation can be chained for entertainment value:
```python
print(mystring)

new_string = mystring.replace("I am","Dharana is").replace("string", "human").replace("Humans", "Other humans").replace("me","her")

print(new_string)
print(new_string.replace('Dharana', 'Nicholas').replace('easily','from time to time').replace(' her ',' him '))
```{{execute}}

#### the built-in function len() returns the number of characters
```python

len(new_string)
```{{execute}}

#### use .format() to print variables alongside strings
```python
# to keep your outputs neat, you might want to limit the decimal places

print("My output: {}".format(value_to_print))
print("My output: {:.3f}".format(value_to_print))
```{{execute}}

## 2.2 Converting between types

Often you need to convert variables to other types, especially to make them work together. Use the _int()_, _str()_ or _float()_ functions to convert to these data types.

#### sometimes Python will change a variable's data type for you:
```python

my_salary = 200000
print(my_salary, type(my_salary))
```{{execute}}

#### Division always returns a float
```python

daily_rate = my_salary / 365
print(daily_rate, type(daily_rate))
```{{execute}}

#### be careful, changing a float to an integer lops off everything after the decimal place
```python
int(daily_rate)
```{{execute}}

#### you probably want to round up instead
```python
round(daily_rate)
```{{execute}}

#### you can't concatenate a string and an integer
```python
address = "1808 H ST NW, DC"
WB_zip = 20037

address + " " + WB_zip
```{{execute}}

#### instead, change the integer to a string first
```python
WB_zip = str(WB_zip)
type(WB_zip)
```{{execute}}

#### does it work now?
```python
address + " " + WB_zip
```{{execute}}

## 3. Data types: lists

Ints, floats and strings are the most basic data structures (think of them as atoms). Next, we'll look at data types that combine those atoms. Lists, tuples and dictionaries are compound data structures that group together other items.

<table><thead><tr><th>Data structure</th><th>Properties</th><th>Syntax</th></tr></thead><tbody><tr><td>List</td><td>Ordered, mutable sequence</td><td>mylist = [1,2,3]</td></tr><tr><td>Tuple</td><td>Ordered, immutable sequence</td><td>mytuple = (1,2,3)</td></tr><tr><td>Set</td><td>Unordered set of unique values</td><td>myset = set(1,2,3)</td></tr><tr><td>Dictionary</td><td>Mutable set of key, value pairs</td><td>mydict = {'first_value':1, 'second_value:2}</td></tr></tbody>
</table>

### 3.1 Manipulating lists

Lists are collections of items. To create one, put a series of items in square brackets, separated by commas. Lists can contain items of different types. They are helpful when your data has an order and may need to be changed in place.


#### create a list of strings
```python
weekdays = ['monday','tuesday','wednesday','thursday','friday']
weekdays
```{{execute}}

#### Lists are ordered collections; they are indexed starting at zero.
```python
# To get an individual item, use square brackets and the appropriate index value.
weekdays[0]
```{{execute}}

#### select slices (eg. the first to the fourth item) with square bracket notation
```python

weekdays[0:3]
```{{execute}}

#### check the type of items in a list
```python
type(weekdays[3])
```{{execute}}

#### a list is a mutable, you can change its contents in-place
```python
weekdays[3] = 'thursday - practice Python!'
weekdays
```{{execute}}

#### add an item to a list with append()
```python
weekdays.append('saturday')
weekdays
```{{execute}}

#### test for a value in your list
```python
'saturday' in weekdays
```{{execute}}

#### use .remove() to clean up the weekdays list
```python

weekdays.remove('saturday')
weekdays
```{{execute}}

#### concatenate two lists
```python
odds = [1,3,5]
evens = [2,4,6]
all_nums = odds + evens
all_nums
```{{execute}}

#### the built-in function len() also applies to lists
```python
len(all_nums)
```{{execute}}


## 4. Logic and control flow - quick intro

Definition of **control flow**:

*   In a simple script, program execution starts at the top and executes each instruction in order.
*   **Control flow** statements can cause the execution to loop and skip instructions based on conditions.

### 4.1 Loops and iterables

Definition: an **iterable** is an object capable of returning its members one at a time. Strings, lists and dictionaries are all iterables.

A **for loop** runs a block of code repeatedly "for" each item in an iterable. End the declaration with : and indent the subsidiary code.


##for color in ['red','green','blue']:
```python
    print("I love " + color)
```{{execute}}

#### or characters in a string
```python
for letter in 'abcd':
    print(letter.upper())
```{{execute}}

#### the range() function produces a helpful iterator
```python
for n in range(5):
    print("I ate {} donuts".format(n + 1))
```{{execute}}

#### a while loop allows you to move through part of an iterable until a condition is met
```python

a = 0
while a < 5:
    print('I am small {}'.format(a))
    a += 1
```{{execute}}


### 4.2 Logic operators

We test conditions using logic operators.

<table><thead><tr><th>Symbol</th><th>Task Performed</th></tr></thead><tbody><tr><td>==</td><td>True, if it is equal</td></tr><tr><td>!=</td><td>True, if not equal to</td></tr><tr><td>&lt;</td><td>less than</td></tr><tr><td>&lt;=</td><td>less than or equal to</td></tr><tr><td>&gt;</td><td>greater than</td></tr><tr><td>&gt;=</td><td>greater than or equal to</td></tr></tbody>
</table>


#### NOTE: We declare variables using '='
```python
a = 5
b = 7
```{{execute}}

#### But compare them using '=='
```python
a == b
```{{execute}}

#### Test whether a does not equal b
```python
a != b
```{{execute}}

#### Logic expressions evaluate to True or False (datatype: Boolean)
```python

test = b > a

test
```{{execute}}

##type(test)
```python
```{{execute}}

### 4.3 Conditional statements with if

My pet Python is a vegetarian. She will test whether variable 'food' is 'burger', 'chicken' or 'veg', then decide whether to eat.

Do this with 'if', 'elif' (else if), and 'else'.


##food = 'veg'
```python
```{{execute}}

##if food == 'veg':
```python
    print ('yum')
elif food == 'chicken':
    print ('hmm maybe')
elif food == 'burger':
    print ('no thanks')
else:
    pass
```{{execute}}
NOTE: Here's how the structure works:

*   start with an 'if' statement, specifying the logical test to apply
*   make sure your 'if' statement ends with :
*   **indent the conditional code block.** Whatever code should be executed if the condition is true, indent it with a tab.
*   test additional actions using 'elif', and any other actions with 'else'.

### 4.4 Testing conditions inside a loop

Combining loops with logic allows you to build more sophisticated code structures:


```python
# days = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun']
for day in days:
    if day == 'Sat':
        location = '--> Beach!'
    elif day == 'Sun':
        location = '--> My sofa!'
    else:
        location = '--> MC5-215B'
    print(day, location)
```{{execute}}

#### EXAMPLE 2: is your pet allowed?

```python
authorized_pets = ['small dog', 'cat', 'hamster','budgerigar']

print("Welcome to Nick's Apartment Block.")
my_pet = input("Type your pet's breed to see if it's accepted:")

if my_pet in authorized_pets:
    print("Congratulations, your {} is welcome here!".format(my_pet))
else:
    print("nSorry your {} is NOT ACCEPTED".format(my_pet))
```
