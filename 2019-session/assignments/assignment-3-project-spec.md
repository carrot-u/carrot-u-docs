# Project planning: Design a system for a new session of Carrot U 

## Why?

Why is this part of a course teaching aspiring engineers? As you are working, you will
always require a planning session for any new project. If you are fortunate enough to 
have a good PM, they will do a lot of the work for you, determining who the customer
is and what their needs are, putting together a list of requirements, figuring out what
metrics to use to measure success, and gathering the information and the team needed to
be successful.

If you don't have a PM, you will have to do this yourself. Even if you do though, you will
still need to examine the plan from a technical implementation perspective, pointing out
things which may be more difficult (or easy!) than the plan indicates, suggesting
alternatives to make the development process smoother, and clarifying points that are
ambiguous or insufficiently detailed.

## What?

The process for people to apply for Carrot U and get accepted is very manual. Let's
make it easier for the next class by improving the process and automating what we can.
In particular, we'd like to minimize the manual work and also keep records so we can
get some metrics on the success of the program - what happens to applicants and to
students, how well the lectures are attended, who does their homework, etc.

### Current process

Currently Dave and I and sometimes other mentors get a lot of DMs and emails asking when
the next session is.  Eventually we send out an email to the company letting people know
that a session is planned and asking for applicants to fill out a Google form, which in
turn populates a spreadsheet.
 
We collect a group of interviewers from among previous years' mentors and divide up the
applicants for interviews. We also establish a list of questions each interviewer will
ask and a list of answers to common questions interviewers will receive. Interviewers
set up half-hour sessions with each applicant to ask and answer questions. We take notes
on the interviewees and make recommendations for acceptance to the program. This is all
handled with Google spreadsheets and Quip documents, both of which are fairly free-form.

At the same time, we put out a call to the engineering staff asking for additional
mentors and people to give talks on topics they are expert in. We review the
syllabus and the setup documents. We determine how many students we think we can 
support and coordinate with HR and Engineering leadership to make sure the program
is supported and funded. We coordinate with the office staff to get a training room
and recordings.

Once we have selected the students, we send out acceptance letters and survey the students
to determine a good time for talks. We assign individual mentors to the students. We 
update the GitHub repo for a new session, archiving the old work. All this setup/cleanup
is discussed among the mentors and assigned but not tracked, we just assume it will get
done because people are responsible. Finally, we assign mentors and assume they will
meet weekly with their assigned students, but again, this is not tracked.

We don't currently track attendance or completion of the coursework, but HR has been
asking for some statistics on this. We also don't track who drops out when or why, though
usually a student will talk to one of us about why they have to stop. We don't track
who completes it and whether or not they apply for or succeed in getting an internship,
though of course we know because we're so happy when it works!

# How?

Most of what I describe above could be automated, simplified, and tracked in some way.
Think about what you would do to make things easier for everyone involved and put
together a project spec for a system someone could write to handle as much of the work as
possible. Assume that there are interfaces available for whatever you might want to
automate: for example, we might write an application that connects to Google Calendar
and sets up mentor/student meetings or we might write an application 
that pulls course viewing data from Treehouse.

## What does a project plan look like?

Here are a few resources I think are excellent, one of which is a spec from a previous
Carrot U student who is now a PM:

* https://instacart.quip.com/bNpwANHFPmm8/Product-Spec-Checkout-Flow
* https://www.devteam.space/blog/6-tips-to-write-project-specification/
* https://eng.lyft.com/awesome-tech-specs-86eea8e45bb9
* https://docs.google.com/document/d/1MU-fo5FlBbcz3R-Eg38lFtcAr5s_k2ynpd9ew0aButs/edit
