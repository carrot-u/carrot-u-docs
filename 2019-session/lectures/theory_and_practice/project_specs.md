# Project specs for engineers

There are plenty of references available for how to do project planning and project
management. We won't talk here about how to be a project manager, just about how it
affects you as an engineer.

## Involvement

### Minimal Involvement

This is not ideal, but it may be how you get started. Make an effort to be as involved
as the company philosophy will allow, even if it means attending a lot of meetings!

A well-defined project spec is handed to you by a PM:
- A TLM, TPM, Tech Lead or Architect was consulted on the spec and estimates
- You are just assigned tasks
- This is common for very junior engineers/interns and also at very large companies
- This is more typical of a 
 [Waterfall](https://www.tutorialspoint.com/sdlc/sdlc_waterfall_model.htm) development process

### Basic Involvement
If you're not leading the project, you should expect:

- You are consulted on the project spec
- You give your own estimates
- You break the job down into tasks for yourself
- This is common at smaller companies, particularly those practicing some form of
 [Agile](https://www.agilealliance.org/agile101/) process

### Tech Lead/Architect
If you are the tech lead, you should expect: 

- You are involved in developing the project spec
- You give estimates and break down tasks
- You select technologies
- You may or may not be involved in the actual development
- This is a role in any sort of development process

## Responsibilities

Regardless of what your role in the project is, you need to look at the spec and project
plan as an engineer. At a very basic level, this means assuming that anything that could
possibly go wrong certainly will. This can make you unpopular! However, it is important
to find potential problems as early as possible.

### Read and evaluate the product spec
What are frequently referred to as "edge cases" are not all truly 
[edge cases](https://en.wikipedia.org/wiki/Edge_case),
but you do need to look for them. These are cases where you are not following the
"good path", such as:

- Bad user input (users are absolutely determined to do this whenever possible)
- Bad data from your system
- External system glitch (database doesn't respond, network is slow, etc.)

Generally, the product spec will not cover most of these, as the PM and designer are
thinking about how the system should work, not about how it can break. Thinking about
how it can break is your job. If you can imagine a case where the system would fail,
 and what to do in this case is not covered in the product spec, add this as a question.

### Raise issues ASAP
Two big issues to look out for in the product spec are

- The spec is not actually compatible with the existing structure
-- For example, say we want to start offering clothes from Costco. Of course we
 can add them to the catalog, add a new "Clothing" department, etc., but we don't
 have a way to specify color or size when adding an item to the cart, so this is
 going to be a very substantial change.
- There are too many open questions, such as
-- What inputs can we expect from other systems (e.g. inventory files from retailers)?
-- Can the system handle the additional load?
-- What reporting and tracking do we need?
-- Is this even legal?

## MVP
One way to deal with a huge system change or a lot of questions is to produce the
"Minimum Viable Product". That is, cut out a lot of the complexity and just make
something work. Then put it into production, see what people do, and adjust accordingly.
Don't try to handle every "edge case", just make sure that the system:
 
- doesn't die horribly
- gives useful feedback to the user that they can't have what they asked for
- tracks how often these situations occur

## Learn to estimate
Estimates are, literally, guesses. Managers and PMs want them because they have to plan.
However, you will find that your guesses are usually off by a significant factor.
Very commonly, you will estimate something will take only half the time it will actually
take. Why is this?

- Life happens. You're going to go to meetings, eat lunch, read your email, have to
 answer questions, etc. You never have a solid 8 hours (or whatever) per day to work,
  but you tend to estimate with "actual time" rather than "elapsed time".
- Context switching is expensive, and [flow](https://link.springer.com/article/10.1007/s10270-017-0621-x)
 doesn't happen easily. You need large blocks of uninterrupted (even by yourself!) time
 in order to write code. If you are interrupted by literally anything, it is estimated
 that it takes 25 minutes to get back into the necessary state of concentration.
- There are always surprises. No matter how well you know a piece of code (and you
 usually don't), when you set out to change it, you find out that there was something
 you didn't know and things break.
- Not enough questions were answered in the design. It is inevitable that there will be
 some questions which were not answered, and each one of these is a little (or big!)
 speed bump to your accomplishing your task. This is why it is so important to get these
 questions ironed out at the beginning; if you do not, it will not only slow you down,
 you may even find that you have to re-do substantial pieces of work once you get the
 answer and it is not what you were assuming.

## Learn to break down tasks
This helps a lot in improving your estimates, and also allows you to feel more in
control of your development work. We use [Jira](https://www.atlassian.com/software/jira/guides/use-cases/what-is-jira-used-for)
for project and task management, but there are many many other options that people use,
including something as simple a TODO list.

## Other notes

- Keep PM and Tech Lead informed
- Project Development Methodolgies
-- Agile
-- XP
-- Pair programming
-- Scrum
-- Velocity
-- Kanban
-- Waterfall 
-- TDD
-- BDD
-- Top-down
-- Bottom-up
- In testing, people will do what you don't expect and your code will break
- Bugs often come from code that is too trusting, not code that is bad
- TLM
  - may need to break spec down into specific task groups for engineers or teams
  - select other technologies to allow implementation
- INTERVIEW TIP!
  - "Here's a product spec. What''s the first thing you do?"
  -- "Look for what's missing, fill in the blanks"
  -- "Google if there is already technology that does what this spec wants"
  --  Using an existing package that's been tested can help avoid a lot of pitfalls, avoid
    "not invented here" syndrome
  -- The first step is NOT to sit down and write code.
- ESTIMATES
  - Figure out difficulty level
  - Put in wiggle room
  - If you guess 1 week, it'll take 2
  - Must keep people in the loop
- HOW TO IMPLEMENT
  - "Waterfall Development"
    - Product M gives idea to Project M
    - Project M gives to Eng
    - Eng gives to QA
    - QA gives to beta customers
    - What's the issue? 
      - NO FEEDBACK LOOP
      - cost to correct an error was exponentially higher the further back it occurred
      - much cheaper to fix in initial spec and in planning
 - "Agile Development"
   - Everyone who is involved, is involved the whole way through
   - conducive to early discovery of issues
   - If an issue is encountered during dev, you go back to PM and change plan as needed
   - In SCRUM, break things down into the smallest possible pieces (tasks)
 - "Top Down Development"
   - start with big picture and fill in details
 - "Bottom Up Development"
   - do little pieces and build up
   - generally easier than Top Down because you don't understand what is needed on a
     granular level
 - "TDD" = Test Driven Development
 - "BDD" = Behavior Driven Devloment
   - design what the behavior is supposed to be and run tests against that
   - very time consuming, so not always ideal in start up
   - helps avoid production with bugs
   - tests won't save you but should be used for anything that's critical
- MY PRODUCT SPEC FEEDBACK
  - Does it align with goals?
  - What's the cost?
    - what's the engineering input required
    - risks associated with implementation
      - could it break another system
      - is it legal? breaking a contract?
  - What is it going to buy us? (benefits)
  - Screenshots
    - Annotate with more user based info and potential coding/design needs
  - Questions
    - can be for ANYONE!
    - should be updated throughout the process
    -  Spec should be a living doc through the entire process!
- "Don't over complicate"
  -  easier to make changes to a simple piece of code
  - "Don't optimize until you need to"
  - YAGNI = "You ain''t gonna need it!"
