# HTML/CSS Crash Course!!!!!!!!!

## Excellent resources
* The Turing School's open source [HTML and CSS lessons](http://frontend.turing.io/lessons/) (which heavily, heavily inspired this document)
* [HTML Dog](http://www.htmldog.com/) Simple, accessible HTML/CSS/JS guides/tutorials/references

## Glossary

* HTML - Hyper Text Markup Language. Used to annotate and provide structure to HTML documents
* CSS - Cascading Style Sheets. Used to style content
* JavaScript - Programming language in the browser - commonly used to manipulate HTML elements
* HTML element - Individual component of a web page, made up of one or more tags
* HTML tag - Used to create HTML elements
* HTML attribute - Key/value pair that specifies a property of an HTML element
* Semantic HTML - Using the most descriptive elements to describe content - e.g. for a navbar, `nav` (descriptive) is semantic, `div` (generic) is not
* CSS selector - identifier used to target HTML elements for styling
* CSS rule - combination of selector, properties, and values which specify styles for HTML element(s)
* Hyperlink - a link to another HTML document
* Block element - an element which takes up the full width of it's container
* Inline element - an element which only takes up the space defined by its tags
* Static asset - content for the web that doesn't change based on who is visiting a site. Usually refers to HTML/CSS/JS/image files.

## Core Concepts at a glance
Language/implementation specific
- The web platform - the role of html/css/js in building web pages
- HTML
  - HTML = structure
  - Elements and attributes
    - links
    - images
    - block vs inline
  - Semantic HTML
- CSS
  - CSS = presentation
  - Rules
  - Selectors and specificity
  - The cascade
  - Inline styles vs style tag vs stylesheets
- JS = behavior
  - won't go into detail here yet, more on JS next week

The web as a platform
  - We'll talk about specifics of HTML/CSS/JS, but I find it helpful to remember that
    the web is just one of many platforms for us to build applications for end users.
    Our goal is not to write HTML/CSS - it's to build websites and HTML/CSS are our tools.
  - I'll revisit this idea of translating abstract mental modeling into implementation that
    does the thing we want.

## HTML
### Overview
- HTML = structure
- Markup language - a way to annotate content to give meaning to certain things
- Newspaper is a great example. A newspaper is a bunch of text - with different
  formatting for certain elements or areas of content. Headers, paragraphs, sections, etc.
- HTML is how we tell the browser that this text is a header, this section should be one column, etc.
### Elements and Tags
- Elements are made up of tags, usually one for both open/close
- Examples:
  - text: `h1`, `h2`, `p`
  - lists: `ol`, `ul`, `li`
  - content grouping: `header`, `footer`, `article`, `nav`, `main`, `div`, `span`
  - links: `a`
  - static assets: `img`, `script`, `link`
- Anatomy of an element ![anatomy of an element](https://mdn.mozillademos.org/files/9347/grumpy-cat-small.png)
- Example - article with two headers (`h1`, `h2`) and few paragraphs (`p`)
  - https://codepen.io/wfro/pen/YOYJrw?editors=1000
### Newspaper Exercise!
There are lots of HTML elements - I certainly couldn't list them all off the top of my head :).

Let's apply some of what we learned by using HTML elements to annotate/describe the content from
the front page of a newspaper.

Here are the elements you'll need:

* `header`
* `footer`
* `h1 - h6`
* `section`
* `article`
* `p`
* `ul` and `ol`
* `div`

Don't worry about looks/styles here, we only care about structure.

![newspaper front page](https://raw.githubusercontent.com/turingschool/front-end-curriculum/gh-pages/assets/images/alien-paper.png)

### Attributes

- HTML elements can have attributes - key/value pairs which attach certain properties to elements
- e.g. `id` and `class` attributes act as identifiers for elements, which we can use to style elements with CSS (more on this soon)
```html
<h1 id="title">
  Header
  <p class="body">Body</p>
</h1>
```
- Take the `img` tag for example, which is used to fetch an image file from a given url and display it in the browser. We need a way to tell the browser where an image lives - enter the `src` tag.
![image tag example](https://raw.githubusercontent.com/turingschool/front-end-curriculum/gh-pages/assets/images/html-tag-anatomy.png)

## Links

* Links are fundamental to the web - they allow us to navigate users to different web pages.
* To add a link we'll use the `a` (anchor) tag, which has an `href` attribute which specifies where the link should navigate to.
```html
<a href="instacart.com">Go to Instacart</a>
```

We haven't covered all elements, but we have everything we need to build functional web page. Here are a few other important elements for reference:
* `script`
* `link`
* `meta`

## CSS

* CSS (cascading style sheets) = presentation
* CSS is a language for styling HTML elements
* We define CSS "rules", made up of few components: selectors, properties, and values
![css rule anatomy](https://raw.githubusercontent.com/turingschool/front-end-curriculum/gh-pages/assets/images/css-rule-anatomy.png)

## Selectors

- CSS selectors are used to target HTML elements so we can style them
- Selectors take a few forms:
  - tag name
  - class name
  - id name
  - combination of the above

[selector examples](https://codepen.io/wfro/pen/bxaOaV?editors=1100#)

## Box model

* Browsers render each HTML element as a rectangular box according to the CSS box model
* CSS determines size, position, and properties

![css box model](https://raw.githubusercontent.com/turingschool/front-end-curriculum/gh-pages/assets/images/box-model.jpg)

## Layout

* Many different tools exist to adjust the layout of your sites:
  * Flexbox
  * CSS Grid
  * Inline display
  * Floats
  * Tables
* Vertical navbar example:
[vertical nav example](https://codepen.io/wfro/pen/YOYBRG)
## Dev tools + CSS Diner

Let's play around a bit in the browser! Head to instacart.com, open the dev tools, and try the following:

- Change the background color of the header to chartreuse
- Change the headline text color to magenta.
- Change the “flourish” logo in the headline to have a height of 20px
- Hide the element that contains the map using css