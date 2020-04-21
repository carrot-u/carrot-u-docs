# Database Design

A good post on the overall topic: https://medium.com/@kimtnguyen/relational-database-schema-design-overview-70e447ff66f9

## Rules of thumb

* Avoid storing relevant data inside text field. E.g. don't make a "comment" field and then search inside every comment for a particular value.
* Avoid update/delete unles totally necessary, you are "rewriting history" when you do this.
* Use constraints for data integrity.
* Don't use relational tables for non-relational data. E.g. don't store HTML or JSON for your site inside a table.
* Be verbose, don't abbreviate if you don't have to. Should I read `cust_dets` as "customer details" or as "custom detectives"?
* Don't oversimplify. Just because "customers" and "shoppers" are both people, with names and phone numbers, emails and addresses, does not mean their data all belongs in same table.
* Don't overengineer. If you're sure you will only ever store 90% the same data about both "customers" and "shoppers", put them in a "users" or "people" table.
* Document! Be nice not only to your co-developers but to future you.

## Additional Resources

* https://www.vertabelo.com/blog/13-blog-articles-with-database-design-tips-and-best-practices/
* http://joins.spathon.com/
