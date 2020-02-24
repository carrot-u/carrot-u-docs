# HTML and CSS

## HTML - HyperText Markup Language

### Overview

- Basic building blocks of the web
- Language that the browser understands and interprets
- Tells the browser how to display the content
- Has various tags with specific purposes and default styling

### Basics

```
<!DOCTYPE html>
<html>
  <head>
    <title></title>
  </head>
  <body>

  </body>
</html>
```

### Importance of Semantic HTML

HTML is very flexible and allows for many ways to do the same thing, especially when paired with javascript that can control interactions.

For example, the following two elements could have th same appearance and behavior:

```
<a class="home_button" href="./home">Home</a>
```

```
<div class="home_button" onclick="navigateHome()">Home</div>
```

You could make your website in almost entirely `<div>`, but this would have no Accessibility support!

#### A11y (Accessibility)

Relies on semantic HTML in order to support assistive technologies. For example, the first example above would tell a blind user that there is a link to be interacted with, but the second would not.

### HTML Attributes

Attributes are additional information about a particular element that describe / control a tag

For example:

```
<img src="pretty_cat_pic.jpg" width="500" height="600" />
```

`src`, `height` and `width` are the attributes of the image tag. You will begin to memorize the attributes you need for a given tag as you use it more.

_Note:_ Typically styles are defined out side the tag, but html elements can use the `style` tag to style an element.

## CSS - Cascading Style Sheets

- This is the control of how elements will be presented and styled.
- Does not change the interactions or structure.
- Just for visual appeal

### Basics

There are many different selectors, but the most common are:

**Element Name**

```
body {
  ...
}

div {
  ...
}
```

**ID**

```
#my-element {
  ...
}
```

**class**

```
.square-images {
  ...
}
```

More advanced selectors include:

- Combinations (i.e. `div p`): https://www.w3schools.com/css/css_combinators.asp
- Pseudo Class (i.e. `a:visited`): https://www.w3schools.com/css/css_pseudo_classes.asp
- Psuedo Selectors (i.e. `p::first-line`): https://www.w3schools.com/css/css_pseudo_elements.asp
- Attribute Selectors (i.e. `a[target="_blank"]`): https://www.w3schools.com/css/css_attribute_selectors.asp

### Box Model

All HTML elements can be considered as boxes. In CSS, the term "box model" is used when talking about design and layout.

Content - The content of the box, where text and images appear
Padding - Clears an area around the content
Border - A border that goes around the padding and content
Margin - Clears an area outside the border

All these elements together make up the size of the element.

```
div {
  width: 300px;
  border: 15px solid green;
  padding: 50px;
  margin: 20px;
}
```

<div style="background-color: #f1f1f1; border: 2px dashed #bbb; padding: 20px">
  <div style="border: 15px solid green; padding: 50px; background-color: #f1f1f1;">
    <div style="text-align: center;  background-color: white; border: 2px dashed #bbb">Content</div>
  </div>
</div>

### Layout

One of the most used methods to layout items withing a space is **flexbox:** https://css-tricks.com/snippets/css/a-guide-to-flexbox/

Getting familiar with it as well as understanding the basic positioning attributes is highly recommended:

- static
- relative
- fixed
- absolute
- sticky

https://www.w3schools.com/css/css_positioning.asp
