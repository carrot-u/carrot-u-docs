- get SQL query for AR query
```ruby
> puts Post.where(id:5).to_sql
SELECT "posts".* FROM "posts" WHERE "posts"."id" = 5
```

- get table name
```ruby
> puts Post.where(id:5).table_name
posts
```

- get last record
```ruby
> Post.last
Post Load (0.2ms)  SELECT  "posts".* FROM "posts" ORDER BY "posts"."id" DESC LIMIT ?  [["LIMIT", 1]]
=> #<Post id: 3000, title: "By Grand Central Station I Sat Down and Wept", body: "Repellat quam sapiente. Cumque et ea. Et nam accus...", tags: nil, author_id: 50, created_at: "2018-08-06 23:12:35", updated_at: "2018-08-06 23:12:35">
```

- get last n records
```ruby
> Post.last(10)
Post Load (0.3ms)  SELECT  "posts".* FROM "posts" ORDER BY "posts"."id" DESC LIMIT ?  [["LIMIT", 10]]
=> [#<Post id: 2991, title: "In a Glass Darkly", body: "Cum rerum a. Blanditiis reprehenderit vel. Similiq...", tags: nil, author_id: 52, created_at: "2018-08-06 23:12:35", updated_at: "2018-08-06 23:12:35">, ...]
```

- get first error
```ruby
> Post.first
Post Load (6.6ms)  SELECT  "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT ?  [["LIMIT", 1]]
=> #<Post id: 1, title: "The Road Less Traveled", body: "Quo fuga sunt. Voluptas aut voluptate. Sint dolor ...", tags: nil, author_id: 22, created_at: "2018-08-05 15:41:25", updated_at: "2018-08-05 15:41:25">
```
- get first n errors
```ruby
> Post.first(5)
Post Load (5.8ms)  SELECT  "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT ?  [["LIMIT", 5]]
=> [#<Post id: 1, title: "The Road Less Traveled", body: "Quo fuga sunt. Voluptas aut voluptate. Sint dolor ...", tags: nil, author_id: 22, created_at: "2018-08-05 15:41:25", updated_at: "2018-08-05 15:41:25">,...]
```
- get all records
```ruby
> User.all
User Load (0.3ms)  SELECT  "users".* FROM "users" LIMIT ?  [["LIMIT", 11]]
=> #<ActiveRecord::Relation [#<User id: 22, first_name: "Claudette", last_name: "Bauch", email: "chonghayes@ullrichkemmer.net", phone: "1-907-710-8809", created_at: "2018-08-05 15:41:25", updated_at: "2018-08-05 15:41:25">, ...]>
```
- create new user
```ruby
> user = User.new
> user.first_name = "Viktor'
> user.first_name = "Viktor"
> user
=> #<User id: nil, first_name: "Viktor", last_name: nil, email: nil, phone: nil, created_at: nil, updated_at: nil>
> user.save
(0.1ms)  begin transaction
SQL (1.1ms)  INSERT INTO "users" ("first_name", "created_at", "updated_at") VALUES (?, ?, ?)  [["first_name", "Viktor"], ["created_at", "2018-08-06 23:43:00.840450"], ["updated_at", "2018-08-06 23:43:00.840450"]]
(2.4ms)  commit transaction
```

- another example
```ruby
> user2 = User.create first_name:'James'
(0.1ms)  begin transaction
SQL (0.5ms)  INSERT INTO "users" ("first_name", "created_at", "updated_at") VALUES (?, ?, ?)  [["first_name", "James"], ["created_at", "2018-08-06 23:44:13.579226"], ["updated_at", "2018-08-06 23:44:13.579226"]]
(6.4ms)  commit transaction
> User.last
User Load (0.2ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT ?  [["LIMIT", 1]]
=> #<User id: 63, first_name: "James", last_name: nil, email: nil, phone: nil, created_at: "2018-08-06 23:44:13", updated_at: "2018-08-06 23:44:13">
```

- retrieve single record by id
```ruby
> User.find(63)
User Load (0.2ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 63], ["LIMIT", 1]]
=> #<User id: 63, first_name: "James", last_name: nil, email: nil, phone: nil, created_at: "2018-08-06 23:44:13", updated_at: "2018-08-06 23:44:13">
```

- retrive several records by id
```ruby
irb(main):024:0> User.find(63, 62)
User Load (0.4ms)  SELECT "users".* FROM "users" WHERE "users"."id" IN (63, 62)
=> [#<User id: 63, first_name: "James", last_name: nil, email: nil, phone: nil, created_at: "2018-08-06 23:44:13", updated_at: "2018-08-06 23:44:13">, #<User id: 62, first_name: "Viktor", last_name: nil, email: nil, phone: nil, created_at: "2018-08-06 23:43:00", updated_at: "2018-08-06 23:43:00">]
```

- query by specific field
```ruby
> User.find_by(first_name: "James")
  User Load (0.2ms)  SELECT  "users".* FROM "users" WHERE "users"."first_name" = ? LIMIT ?  [["first_name", "James"], ["LIMIT", 1]]
=> #<User id: 63, first_name: "James", last_name: nil, email: nil, phone: nil, created_at: "2018-08-06 23:44:13", updated_at: "2018-08-06 23:44:13">
> User.find_by(first_name: "James", last_name: nil)
User Load (0.3ms)  SELECT  "users".* FROM "users" WHERE "users"."first_name" = ? AND "users"."last_name" IS NULL LIMIT ?  [["first_name", "James"], ["LIMIT", 1]]
=> #<User id: 63, first_name: "James", last_name: nil, email: nil, phone: nil, created_at: "2018-08-06 23:44:13", updated_at: "2018-08-06 23:44:13">
```

- finding what columns specific table have
```ruby
> User.columns
=> [#<ActiveRecord::ConnectionAdapters::Column:0x00007fd60588fe68 @name="id", @table_name="users", @sql_type_metadata=#<ActiveRecord::ConnectionAdapters::SqlTypeMetadata:0x00007fd60588feb8 @sql_type="INTEGER", @type=:integer, @limit=nil, @precision=nil, @scale=nil>, @null=false, @default=nil, @default_function=nil, @collation=nil, @comment=nil>, #<ActiveRecord::ConnectionAdapters::Column:0x00007fd60588fcd8 @name="first_name", @table_name="users", @sql_type_metadata=#<ActiveRecord::ConnectionAdapters::SqlTypeMetadata:0x00007fd60588fd28 @sql_type="varchar", @type=:string, @limit=nil, @precision=nil, @scale=nil>, @null=true, @default=nil, @default_function=nil, @collation=nil, @comment=nil>, #<ActiveRecord::ConnectionAdapters::Column:0x00007fd60588fb48 @name="last_name", @table_name="users", @sql_type_metadata=#<ActiveRecord::ConnectionAdapters::SqlTypeMetadata:0x00007fd60588fb98 @sql_type="varchar", @type=:string, @limit=nil, @precision=nil, @scale=nil>, @null=true, @default=nil, @default_function=nil, @collation=nil, @comment=nil>, #<ActiveRecord::ConnectionAdapters::Column:0x00007fd60588f9b8 @name="email", @table_name="users", @sql_type_metadata=#<ActiveRecord::ConnectionAdapters::SqlTypeMetadata:0x00007fd60588fa08 @sql_type="varchar", @type=:string, @limit=nil, @precision=nil, @scale=nil>, @null=true, @default=nil, @default_function=nil, @collation=nil, @comment=nil>, #<ActiveRecord::ConnectionAdapters::Column:0x00007fd60588f828 @name="phone", @table_name="users", @sql_type_metadata=#<ActiveRecord::ConnectionAdapters::SqlTypeMetadata:0x00007fd60588f878 @sql_type="varchar", @type=:string, @limit=nil, @precision=nil, @scale=nil>, @null=true, @default=nil, @default_function=nil, @collation=nil, @comment=nil>, #<ActiveRecord::ConnectionAdapters::Column:0x00007fd60588f698 @name="created_at", @table_name="users", @sql_type_metadata=#<ActiveRecord::ConnectionAdapters::SqlTypeMetadata:0x00007fd60588f6e8 @sql_type="datetime", @type=:datetime, @limit=nil, @precision=nil, @scale=nil>, @null=false, @default=nil, @default_function=nil, @collation=nil, @comment=nil>, #<ActiveRecord::ConnectionAdapters::Column:0x00007fd60588f508 @name="updated_at", @table_name="users", @sql_type_metadata=#<ActiveRecord::ConnectionAdapters::SqlTypeMetadata:0x00007fd60588f558 @sql_type="datetime", @type=:datetime, @limit=nil, @precision=nil, @scale=nil>, @null=false, @default=nil, @default_function=nil, @collation=nil, @comment=nil>]
```
- or another way, as a hash
```ruby
> User.columns_hash
=> {"id"=>#<ActiveRecord::ConnectionAdapters::Column:0x00007fd60588fe68 @name="id", @table_name="users", @sql_type_metadata=#<ActiveRecord::ConnectionAdapters::SqlTypeMetadata:0x00007fd60588feb8 @sql_type="INTEGER", @type=:integer, @limit=nil, @precision=nil, @scale=nil>, @null=false, @default=nil, @default_function=nil, @collation=nil, @comment=nil>, "first_name"=>#<ActiveRecord::ConnectionAdapters::Column:0x00007fd60588fcd8 @name="first_name", @table_name="users", @sql_type_metadata=#<ActiveRecord::ConnectionAdapters::SqlTypeMetadata:0x00007fd60588fd28 @sql_type="varchar", @type=:string, @limit=nil, @precision=nil, @scale=nil>, @null=true, @default=nil, @default_function=nil, @collation=nil, @comment=nil>, "last_name"=>#<ActiveRecord::ConnectionAdapters::Column:0x00007fd60588fb48 @name="last_name", @table_name="users", @sql_type_metadata=#<ActiveRecord::ConnectionAdapters::SqlTypeMetadata:0x00007fd60588fb98 @sql_type="varchar", @type=:string, @limit=nil, @precision=nil, @scale=nil>, @null=true, @default=nil, @default_function=nil, @collation=nil, @comment=nil>, "email"=>#<ActiveRecord::ConnectionAdapters::Column:0x00007fd60588f9b8 @name="email", @table_name="users", @sql_type_metadata=#<ActiveRecord::ConnectionAdapters::SqlTypeMetadata:0x00007fd60588fa08 @sql_type="varchar", @type=:string, @limit=nil, @precision=nil, @scale=nil>, @null=true, @default=nil, @default_function=nil, @collation=nil, @comment=nil>, "phone"=>#<ActiveRecord::ConnectionAdapters::Column:0x00007fd60588f828 @name="phone", @table_name="users", @sql_type_metadata=#<ActiveRecord::ConnectionAdapters::SqlTypeMetadata:0x00007fd60588f878 @sql_type="varchar", @type=:string, @limit=nil, @precision=nil, @scale=nil>, @null=true, @default=nil, @default_function=nil, @collation=nil, @comment=nil>, "created_at"=>#<ActiveRecord::ConnectionAdapters::Column:0x00007fd60588f698 @name="created_at", @table_name="users", @sql_type_metadata=#<ActiveRecord::ConnectionAdapters::SqlTypeMetadata:0x00007fd60588f6e8 @sql_type="datetime", @type=:datetime, @limit=nil, @precision=nil, @scale=nil>, @null=false, @default=nil, @default_function=nil, @collation=nil, @comment=nil>, "updated_at"=>#<ActiveRecord::ConnectionAdapters::Column:0x00007fd60588f508 @name="updated_at", @table_name="users", @sql_type_metadata=#<ActiveRecord::ConnectionAdapters::SqlTypeMetadata:0x00007fd60588f558 @sql_type="datetime", @type=:datetime, @limit=nil, @precision=nil, @scale=nil>, @null=false, @default=nil, @default_function=nil, @collation=nil, @comment=nil>}
```
- just column names
```ruby
> User.columns_hash.keys
=> ["id", "first_name", "last_name", "email", "phone", "created_at", "updated_at"]
```


```ruby
irb(main):030:0> User.where(first_name:"James")
        User Load (0.1ms)  SELECT  "users".* FROM "users" WHERE "users"."first_name" = ? LIMIT ?  [["first_name", "James"], ["LIMIT", 11]]
      => #<ActiveRecord::Relation [#<User id: 63, first_name: "James", last_name: nil, email: nil, phone: nil, created_at: "2018-08-06 23:44:13", updated_at: "2018-08-06 23:44:13">]>
      irb(main):031:0> User.find_by(first_name: "James")
        User Load (0.3ms)  SELECT  "users".* FROM "users" WHERE "users"."first_name" = ? LIMIT ?  [["first_name", "James"], ["LIMIT", 1]]
      => #<User id: 63, first_name: "James", last_name: nil, email: nil, phone: nil, created_at: "2018-08-06 23:44:13", updated_at: "2018-08-06 23:44:13">
      irb(main):032:0> jameses = User.where(first_name: "James"); nil
      => nil
      irb(main):033:0> jameses
        User Load (0.1ms)  SELECT  "users".* FROM "users" WHERE "users"."first_name" = ? LIMIT ?  [["first_name", "James"], ["LIMIT", 11]]
      => #<ActiveRecord::Relation [#<User id: 63, first_name: "James", last_name: nil, email: nil, phone: nil, created_at: "2018-08-06 23:44:13", updated_at: "2018-08-06 23:44:13">]>
      irb(main):034:0> User.where(first_name: "James")
        User Load (0.2ms)  SELECT  "users".* FROM "users" WHERE "users"."first_name" = ? LIMIT ?  [["first_name", "James"], ["LIMIT", 11]]
      => #<ActiveRecord::Relation [#<User id: 63, first_name: "James", last_name: nil, email: nil, phone: nil, created_at: "2018-08-06 23:44:13", updated_at: "2018-08-06 23:44:13">]>
      irb(main):035:0> james = User.last
        User Load (0.1ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT ?  [["LIMIT", 1]]
      => #<User id: 63, first_name: "James", last_name: nil, email: nil, phone: nil, created_at: "2018-08-06 23:44:13", updated_at: "2018-08-06 23:44:13">
      irb(main):036:0> james.last_name = "Johnson"
      => "Johnson"
      irb(main):037:0> james.save
         (0.1ms)  begin transaction
        SQL (1.7ms)  UPDATE "users" SET "last_name" = ?, "updated_at" = ? WHERE "users"."id" = ?  [["last_name", "Johnson"], ["updated_at", "2018-08-06 23:53:05.629832"], ["id", 63]]
         (1.0ms)  commit transaction
      => true
      irb(main):038:0> james.update(last_name: 'Bilgelow')
         (0.1ms)  begin transaction
        SQL (0.3ms)  UPDATE "users" SET "last_name" = ?, "updated_at" = ? WHERE "users"."id" = ?  [["last_name", "Bilgelow"], ["updated_at", "2018-08-06 23:54:01.573025"], ["id", 63]]
         (6.4ms)  commit transaction
      => true
      irb(main):039:0> james.destroy
         (0.1ms)  begin transaction
        SQL (0.5ms)  DELETE FROM "users" WHERE "users"."id" = ?  [["id", 63]]
         (3.2ms)  commit transaction
      => #<User id: 63, first_name: "James", last_name: "Bilgelow", email: nil, phone: nil, created_at: "2018-08-06 23:44:13", updated_at: "2018-08-06 23:54:01">
      irb(main):040:0> User.last
        User Load (0.2ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT ?  [["LIMIT", 1]]
      => #<User id: 62, first_name: "Viktor", last_name: nil, email: nil, phone: nil, created_at: "2018-08-06 23:43:00", updated_at: "2018-08-06 23:43:00">
      irb(main):041:0> viktor = User.last
        User Load (0.1ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT ?  [["LIMIT", 1]]
      => #<User id: 62, first_name: "Viktor", last_name: nil, email: nil, phone: nil, created_at: "2018-08-06 23:43:00", updated_at: "2018-08-06 23:43:00">
      irb(main):042:0> viktor.update( id: 'balbalbal')
         (0.1ms)  begin transaction
        SQL (0.4ms)  UPDATE "users" SET "id" = ?, "updated_at" = ? WHERE "users"."id" = ?  [["id", 0], ["updated_at", "2018-08-06 23:56:00.806311"], ["id", 62]]
         (6.8ms)  commit transaction
      => true
      irb(main):043:0> viktor.update!( last_name:"Evdokimov" )
         (0.1ms)  begin transaction
        SQL (0.3ms)  UPDATE "users" SET "last_name" = ?, "updated_at" = ? WHERE "users"."id" = ?  [["last_name", "Evdokimov"], ["updated_at", "2018-08-06 23:56:30.785119"], ["id", 0]]
         (6.4ms)  commit transaction
      => true
      irb(main):044:0> james
      => #<User id: 63, first_name: "James", last_name: "Bilgelow", email: nil, phone: nil, created_at: "2018-08-06 23:44:13", updated_at: "2018-08-06 23:54:01">
      irb(main):045:0> james.readonly
      NoMethodError: undefined method `readonly' for #<User:0x00007fd5ff65d308>
      Did you mean?  readonly!
                     readonly?
        from (irb):45
      irb(main):046:0> james.readonly?
      => false
      irb(main):047:0> james.destroy!
         (0.1ms)  begin transaction
         (0.0ms)  commit transaction
      => #<User id: 63, first_name: "James", last_name: "Bilgelow", email: nil, phone: nil, created_at: "2018-08-06 23:44:13", updated_at: "2018-08-06 23:54:01">

      irb(main):048:0> james.destroyed?
      => true
      irb(main):049:0> user = User.new
      => #<User id: nil, first_name: nil, last_name: nil, email: nil, phone: nil, created_at: nil, updated_at: nil>
      irb(main):050:0> user.persisted?
      => false
      irb(main):051:0> james.persisted?
      => false
      irb(main):052:0> User.last
        User Load (8.4ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT ?  [["LIMIT", 1]]
      => #<User id: 61, first_name: "Dorris", last_name: "Volkman", email: "luiseauer@cummings.org", phone: "(273) 437-8341", created_at: "2018-08-06 23:12:26", updated_at: "2018-08-06 23:12:26">
      irb(main):053:0> User.last
        User Load (0.1ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT ?  [["LIMIT", 1]]
      => #<User id: 61, first_name: "Dorris", last_name: "Volkman", email: "luiseauer@cummings.org", phone: "(273) 437-8341", created_at: "2018-08-06 23:12:26", updated_at: "2018-08-06 23:12:26">
      irb(main):054:0> bill = User.create first_name: "Bill"
         (0.1ms)  begin transaction
        SQL (0.4ms)  INSERT INTO "users" ("first_name", "created_at", "updated_at") VALUES (?, ?, ?)  [["first_name", "Bill"], ["created_at", "2018-08-07 00:05:00.195127"], ["updated_at", "2018-08-07 00:05:00.195127"]]
         (5.4ms)  commit transaction
      => #<User id: 64, first_name: "Bill", last_name: nil, email: nil, phone: nil, created_at: "2018-08-07 00:05:00", updated_at: "2018-08-07 00:05:00">
      irb(main):055:0> User.last
        User Load (0.1ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT ?  [["LIMIT", 1]]
      => #<User id: 64, first_name: "Bill", last_name: nil, email: nil, phone: nil, created_at: "2018-08-07 00:05:00", updated_at: "2018-08-07 00:05:00">
      irb(main):056:0> bill.destroy
         (0.1ms)  begin transaction
        SQL (0.4ms)  DELETE FROM "users" WHERE "users"."id" = ?  [["id", 64]]
         (6.5ms)  commit transaction
      => #<User id: 64, first_name: "Bill", last_name: nil, email: nil, phone: nil, created_at: "2018-08-07 00:05:00", updated_at: "2018-08-07 00:05:00">
      irb(main):057:0> User.last
        User Load (0.2ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT ?  [["LIMIT", 1]]
      => #<User id: 61, first_name: "Dorris", last_name: "Volkman", email: "luiseauer@cummings.org", phone: "(273) 437-8341", created_at: "2018-08-06 23:12:26", updated_at: "2018-08-06 23:12:26">
      irb(main):058:0> bill
      => #<User id: 64, first_name: "Bill", last_name: nil, email: nil, phone: nil, created_at: "2018-08-07 00:05:00", updated_at: "2018-08-07 00:05:00">
      irb(main):059:0> bill.destroyed?
      => true
      irb(main):060:0> bill.update! last_name:"Smith"
         (0.1ms)  begin transaction
         (0.0ms)  rollback transaction
      RuntimeError: can't modify frozen Hash
        from (irb):60
      irb(main):061:0> bill.update last_name:"Smith"
         (0.1ms)  begin transaction
         (0.0ms)  rollback transaction
      RuntimeError: can't modify frozen Hash
        from (irb):61
      irb(main):062:0> bill.destroyed?
      => true
      irb(main):063:0> bill.persisted?
      => false
      irb(main):064:0>
      irb(main):065:0* u = User.new first_name: "Max"
      => #<User id: nil, first_name: "Max", last_name: nil, email: nil, phone: nil, created_at: nil, updated_at: nil>
      irb(main):066:0> u.persisted?
      => false
      irb(main):067:0> bill
      => #<User id: 64, first_name: "Bill", last_name: nil, email: nil, phone: nil, created_at: "2018-08-07 00:05:00", updated_at: "2018-08-07 00:05:00">
      irb(main):068:0> bill.destroyed?
      => true
      irb(main):069:0> bill.attributes
      => {"id"=>64, "first_name"=>"Bill", "last_name"=>nil, "email"=>nil, "phone"=>nil, "created_at"=>Tue, 07 Aug 2018 00:05:00 UTC +00:00, "updated_at"=>Tue, 07 Aug 2018 00:05:00 UTC +00:00}
      irb(main):070:0> User.create bill.attributes
         (0.1ms)  begin transaction
        SQL (0.3ms)  INSERT INTO "users" ("id", "first_name", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["id", 64], ["first_name", "Bill"], ["created_at", "2018-08-07 00:05:00.195127"], ["updated_at", "2018-08-07 00:05:00.195127"]]
         (1.0ms)  commit transaction
      => #<User id: 64, first_name: "Bill", last_name: nil, email: nil, phone: nil, created_at: "2018-08-07 00:05:00", updated_at: "2018-08-07 00:05:00">
      irb(main):071:0> User.create bill.attributes
         (0.1ms)  begin transaction
        SQL (0.6ms)  INSERT INTO "users" ("id", "first_name", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["id", 64], ["first_name", "Bill"], ["created_at", "2018-08-07 00:05:00.195127"], ["updated_at", "2018-08-07 00:05:00.195127"]]
         (0.1ms)  rollback transaction
      ActiveRecord::RecordNotUnique: SQLite3::ConstraintException: UNIQUE constraint failed: users.id: INSERT INTO "users" ("id", "first_name", "created_at", "updated_at") VALUES (?, ?, ?, ?)
        from (irb):71
      irb(main):072:0> Post.last(5)
        Post Load (0.2ms)  SELECT  "posts".* FROM "posts" ORDER BY "posts"."id" DESC LIMIT ?  [["LIMIT", 5]]
      => [#<Post id: 2996, title: "Far From the Madding Crowd", body: "In odio ratione. Iure tenetur sed. Quo illo natus....", tags: nil, author_id: 43, created_at: "2018-08-06 23:12:35", updated_at: "2018-08-06 23:12:35">, #<Post id: 2997, title: "Vanity Fair", body: "Quod voluptatem omnis. Eos nam ut. Praesentium est...", tags: nil, author_id: 49, created_at: "2018-08-06 23:12:35", updated_at: "2018-08-06 23:12:35">, #<Post id: 2998, title: "To Sail Beyond the Sunset", body: "Ut non atque. Iure rem illo. Itaque vitae quia. Ex...", tags: nil, author_id: 54, created_at: "2018-08-06 23:12:35", updated_at: "2018-08-06 23:12:35">, #<Post id: 2999, title: "Bury My Heart at Wounded Knee", body: "Repellat sapiente sunt. Sit aut consectetur. Labor...", tags: nil, author_id: 43, created_at: "2018-08-06 23:12:35", updated_at: "2018-08-06 23:12:35">, #<Post id: 3000, title: "By Grand Central Station I Sat Down and Wept", body: "Repellat quam sapiente. Cumque et ea. Et nam accus...", tags: nil, author_id: 50, created_at: "2018-08-06 23:12:35", updated_at: "2018-08-06 23:12:35">]
      irb(main):073:0> Post.offset(5).limit(5).to_sql
      => "SELECT  \"posts\".* FROM \"posts\" LIMIT 5 OFFSET 5"
      irb(main):074:0> puts Post.offset(5).limit(5).to_sql
      SELECT  "posts".* FROM "posts" LIMIT 5 OFFSET 5
      => nil
      irb(main):075:0> puts Post.offset(5).limit(5)
        Post Load (0.5ms)  SELECT  "posts".* FROM "posts" LIMIT ? OFFSET ?  [["LIMIT", 5], ["OFFSET", 5]]
      #<Post:0x00007fd5ff6d0448>
      #<Post:0x00007fd5ff6d0308>
      #<Post:0x00007fd5ff6d01a0>
      #<Post:0x00007fd5ff6d0060>
      #<Post:0x00007fd5fd6bfed8>
      => nil
      irb(main):076:0> Post.where("title like 'The%'").to_sql
      => "SELECT \"posts\".* FROM \"posts\" WHERE (title like 'The%')"
      irb(main):077:0> Post.where("title like 'The%'").pluck(:id, :title)
         (19.2ms)  SELECT "posts"."id", "posts"."title" FROM "posts" WHERE (title like 'The%')
      => [[1, "The Road Less Traveled"], [3, "The Parliament of Man"], [4, "The Doors of Perception"], [6, "The House of Mirth"], [11, "The Daffodil Sky"], [18, "The Way of All Flesh"], [19, "The Needle's Eye"], [24, "The Millstone"], [26, "The Cricket on the Hearth"], [27, "The World, the Flesh and the Devil"], [38, "The Widening Gyre"], [46, "The Lathe of Heaven"] ...
      irb(main):078:0> Post.where("title like 'The%'").pluck(:id, :title)
         (11.3ms)  SELECT "posts"."id", "posts"."title" FROM "posts" WHERE (title like 'The%')
      => [[1, "The Road Less Traveled"], [3, "The Parliament of Man"], [4, "The Doors of Perception"], [6, "The House of Mirth"], [11, "The Daffodil Sky"], [18, "The Way of All Flesh"], ...

      irb(main):079:0> puts Post.offset(5).limit(5).pluck(:id, :title)
         (0.2ms)  SELECT  "posts"."id", "posts"."title" FROM "posts" LIMIT ? OFFSET ?  [["LIMIT", 5], ["OFFSET", 5]]
      6
      The House of Mirth
      7
      An Instant In The Wind
      8
      All Passion Spent
      9
      Tender Is the Night
      10
      If Not Now, When?
      => nil
      irb(main):080:0> puts Post.offset(10).limit(5).pluck(:id, :title)
         (0.1ms)  SELECT  "posts"."id", "posts"."title" FROM "posts" LIMIT ? OFFSET ?  [["LIMIT", 5], ["OFFSET", 10]]
      11
      The Daffodil Sky
      12
      A Farewell to Arms
      13
      Little Hands Clapping
      14
      O Jerusalem!
      15
      Frequent Hearses
      => nil
      irb(main):081:0> puts Post.offset(10).limit(5).pluck(%i[id title])
      Arel::Visitors::UnsupportedVisitError: Unsupported argument type: Symbol. Construct an Arel node instead.
        from (irb):81
      irb(main):082:0> puts Post.offset(10).limit(5).pluck(*%i[id title])
         (0.1ms)  SELECT  "posts"."id", "posts"."title" FROM "posts" LIMIT ? OFFSET ?  [["LIMIT", 5], ["OFFSET", 10]]
      11
      The Daffodil Sky
      12
      A Farewell to Arms
      13
      Little Hands Clapping
      14
      O Jerusalem!
      15
      Frequent Hearses
      => nil
      irb(main):083:0> Post.where("title like 'The%'").to_sql
      => "SELECT \"posts\".* FROM \"posts\" WHERE (title like 'The%')"
      irb(main):084:0> Post.where(title:"The Daffodil Sky").to_sql
      => "SELECT \"posts\".* FROM \"posts\" WHERE \"posts\".\"title\" = 'The Daffodil Sky'"
      irb(main):085:0> Post.where(title:"The Daffodil Sky", id: 11).
      irb(main):086:0* Post.where(title:"The Daffodil Sky", id: 11)
      NoMethodError:   Post Load (0.2ms)  SELECT  "posts".* FROM "posts" WHERE "posts"."title" = ? AND "posts"."id" = ? LIMIT ?  [["title", "The Daffodil Sky"], ["id", 11], ["LIMIT", 11]]
      undefined method `Post' for #<Post::ActiveRecord_Relation:0x00007fd6050a1f08>
        from (irb):86
      irb(main):087:0> ^C
      irb(main):087:0> Post.where(title:"The Daffodil Sky", id: 11)
        Post Load (0.2ms)  SELECT  "posts".* FROM "posts" WHERE "posts"."title" = ? AND "posts"."id" = ? LIMIT ?  [["title", "The Daffodil Sky"], ["id", 11], ["LIMIT", 11]]
      => #<ActiveRecord::Relation [#<Post id: 11, title: "The Daffodil Sky", body: "Rerum odit eos. Ad nulla quas. Officiis placeat re...", tags: nil, author_id: 29, created_at: "2018-08-05 15:41:25", updated_at: "2018-08-05 15:41:25">]>
      irb(main):088:0> Post.where(id:11).or(Post.where(id:12))
        Post Load (0.3ms)  SELECT  "posts".* FROM "posts" WHERE ("posts"."id" = ? OR "posts"."id" = ?) LIMIT ?  [["id", 11], ["id", 12], ["LIMIT", 11]]
      => #<ActiveRecord::Relation [#<Post id: 11, title: "The Daffodil Sky", body: "Rerum odit eos. Ad nulla quas. Officiis placeat re...", tags: nil, author_id: 29, created_at: "2018-08-05 15:41:25", updated_at: "2018-08-05 15:41:25">, #<Post id: 12, title: "A Farewell to Arms", body: "Expedita repellat possimus. Molestias aliquam nece...", tags: nil, author_id: 24, created_at: "2018-08-05 15:41:25", updated_at: "2018-08-05 15:41:25">]>
      irb(main):089:0> Post.where.not(id:11).limit(2)
        Post Load (0.2ms)  SELECT  "posts".* FROM "posts" WHERE ("posts"."id" != ?) LIMIT ?  [["id", 11], ["LIMIT", 2]]
      => #<ActiveRecord::Relation [#<Post id: 1, title: "The Road Less Traveled", body: "Quo fuga sunt. Voluptas aut voluptate. Sint dolor ...", tags: nil, author_id: 22, created_at: "2018-08-05 15:41:25", updated_at: "2018-08-05 15:41:25">, #<Post id: 2, title: "Wildfire at Midnight", body: "Autem consequuntur eos. Fugiat assumenda tempore. ...", tags: nil, author_id: 33, created_at: "2018-08-05 15:41:25", updated_at: "2018-08-05 15:41:25">]>
      irb(main):090:0> Post.where(title:"The Daffodil Sky").where(id:11).where(id:12)
        Post Load (0.2ms)  SELECT  "posts".* FROM "posts" WHERE "posts"."title" = ? AND "posts"."id" = ? AND "posts"."id" = ? LIMIT ?  [["title", "The Daffodil Sky"], ["id", 11], ["id", 12], ["LIMIT", 11]]
      => #<ActiveRecord::Relation []>
      irb(main):091:0> reload!
      Reloading...
      => true
      irb(main):092:0> bill = User.new first_name: "Bill"
      => #<User id: nil, first_name: "Bill", last_name: nil, email: nil, phone: nil, created_at: nil, updated_at: nil>
      irb(main):093:0> bill.save
         (0.1ms)  begin transaction
         (0.1ms)  rollback transaction
      => false
      irb(main):094:0> bill.save!
         (0.1ms)  begin transaction
         (0.1ms)  rollback transaction
      ActiveRecord::RecordInvalid: Validation failed: Last name can't be blank
        from (irb):94
      irb(main):095:0> bill.save
         (0.1ms)  begin transaction
         (0.0ms)  rollback transaction
      => false
      irb(main):096:0> bill.valid?
      => false
      irb(main):097:0> bill.errors
      => #<ActiveModel::Errors:0x00007fd6037ab878 @base=#<User id: nil, first_name: "Bill", last_name: nil, email: nil, phone: nil, created_at: nil, updated_at: nil>, @messages={:last_name=>["can't be blank"]}, @details={:last_name=>[{:error=>:blank}]}>
      irb(main):098:0> bill.errors.messages
      => {:last_name=>["can't be blank"]}
      irb(main):099:0> bill.first_name = nil
      => nil
      irb(main):100:0> bill.save
         (0.1ms)  begin transaction
         (0.0ms)  rollback transaction
      => false
      irb(main):101:0> bill.errors.messages
      => {:first_name=>["can't be blank"], :last_name=>["can't be blank"]}
      irb(main):102:0> bill.first_name = "Bill"
      => "Bill"
      irb(main):103:0> bill.last_name = "Jonhson"
      => "Jonhson"
      irb(main):104:0> bill.save
         (0.1ms)  begin transaction
        SQL (0.4ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["first_name", "Bill"], ["last_name", "Jonhson"], ["created_at", "2018-08-07 00:28:46.545968"], ["updated_at", "2018-08-07 00:28:46.545968"]]
         (3.8ms)  commit transaction
      => true
      irb(main):105:0> bill.valid?
      => true
      irb(main):106:0> reload!
      Reloading...
      => true
      irb(main):107:0> john = User.new first_name: "John", last_name: "Smith"
      => #<User id: nil, first_name: "John", last_name: "Smith", email: nil, phone: nil, created_at: nil, updated_at: nil>
      irb(main):108:0> john.save
         (0.1ms)  begin transaction
         (0.1ms)  rollback transaction
      NoMethodError: undefined method `validate_method' for #<User:0x00007fd5ffca9810>
      Did you mean?  vaidate_method
        from (irb):108
      irb(main):109:0> reload!
      Reloading...
      => true
      irb(main):110:0> john = User.new first_name: "John", last_name: "Smith"
      => #<User id: nil, first_name: "John", last_name: "Smith", email: nil, phone: nil, created_at: nil, updated_at: nil>
      irb(main):111:0> john.save
         (0.1ms)  begin transaction
        SQL (0.4ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["first_name", "John"], ["last_name", "Smith"], ["created_at", "2018-08-07 00:32:42.464628"], ["updated_at", "2018-08-07 00:32:42.464628"]]
         (1.0ms)  commit transaction
      => true
      irb(main):112:0> reload!
      Reloading...
      => true
      irb(main):113:0> john = User.new first_name: "John", last_name: "Smith"
      => #<User id: nil, first_name: "John", last_name: "Smith", email: nil, phone: nil, created_at: nil, updated_at: nil>
      irb(main):114:0> john.save
         (0.1ms)  begin transaction
         (0.1ms)  rollback transaction
      => false
      irb(main):115:0> john.errors.message
      NoMethodError: undefined method `message' for #<ActiveModel::Errors:0x00007fd5fd656140>
      Did you mean?  messages
        from (irb):115
      irb(main):116:0> john.errors.messages
      => {:first_name=>["must equal last name"]}
      irb(main):117:0> john.last_name = "John"
      => "John"
      irb(main):118:0> john
      => #<User id: nil, first_name: "John", last_name: "John", email: nil, phone: nil, created_at: nil, updated_at: nil>
      irb(main):119:0> john.save
         (0.1ms)  begin transaction
        SQL (0.4ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["first_name", "John"], ["last_name", "John"], ["created_at", "2018-08-07 00:35:42.765340"], ["updated_at", "2018-08-07 00:35:42.765340"]]
         (3.0ms)  commit transaction
      => true
      irb(main):120:0> reload!
      Reloading...
      => true
      irb(main):121:0> bob = User.new first_name: "Bob"
      => #<User id: nil, first_name: "Bob", last_name: nil, email: nil, phone: nil, created_at: nil, updated_at: nil>
      irb(main):122:0> bob.save
         (0.1ms)  begin transaction
        SQL (0.4ms)  INSERT INTO "users" ("first_name", "created_at", "updated_at") VALUES (?, ?, ?)  [["first_name", "Bob"], ["created_at", "2018-08-07 00:39:22.818297"], ["updated_at", "2018-08-07 00:39:22.818297"]]
         (1.4ms)  commit transaction
      => true
      irb(main):123:0> reload!
      Reloading...
      => true
      irb(main):124:0> bob = User.new first_name: "Bob"
      => #<User id: nil, first_name: "Bob", last_name: nil, email: nil, phone: nil, created_at: nil, updated_at: nil>
      irb(main):125:0> bob
      => #<User id: nil, first_name: "Bob", last_name: nil, email: nil, phone: nil, created_at: nil, updated_at: nil>
      irb(main):126:0> bob.save!
         (0.1ms)  begin transaction
        SQL (0.4ms)  INSERT INTO "users" ("first_name", "created_at", "updated_at") VALUES (?, ?, ?)  [["first_name", "Bob"], ["created_at", "2018-08-07 00:39:51.870396"], ["updated_at", "2018-08-07 00:39:51.870396"]]
         (6.4ms)  commit transaction
      => true
      irb(main):127:0> bob.last_name
      => nil
      irb(main):128:0> reload!
      Reloading...
      => true
      irb(main):129:0> bob = User.new first_name: "Bob"
      => #<User id: nil, first_name: "Bob", last_name: nil, email: nil, phone: nil, created_at: nil, updated_at: nil>
      irb(main):130:0> bob.save!
         (0.1ms)  begin transaction
        SQL (0.5ms)  INSERT INTO "users" ("first_name", "last_name", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["first_name", "Bob"], ["last_name", "Bob"], ["created_at", "2018-08-07 00:40:14.519101"], ["updated_at", "2018-08-07 00:40:14.519101"]]
         (1.3ms)  commit transaction
      => true
      irb(main):131:0> bob.last_name
      => "Bob"
      irb(main):132:0> bob.update_attribute "last_name", "Smith"
         (0.1ms)  begin transaction
         (0.1ms)  commit transaction
      => true
      irb(main):133:0> bob.update_attributes last_name: "Smith"
         (0.1ms)  begin transaction
         (0.0ms)  commit transaction
      => true
      irb(main):134:0> bob.last_name
      => "Bob"
      irb(main):135:0> reload!
      Reloading...
      => true
      irb(main):136:0> bob = User.new first_name: "Bob"
      => #<User id: nil, first_name: "Bob", last_name: nil, email: nil, phone: nil, created_at: nil, updated_at: nil>
      irb(main):137:0> bob.save
         (0.1ms)  begin transaction
         (0.1ms)  rollback transaction
      => false
      irb(main):138:0> bob.errors.messages
      => {:last_name=>["can't be blank"]}
      irb(main):139:0> bob.save(validate: false)
         (0.1ms)  begin transaction
        SQL (0.4ms)  INSERT INTO "users" ("first_name", "created_at", "updated_at") VALUES (?, ?, ?)  [["first_name", "Bob"], ["created_at", "2018-08-07 00:46:10.516067"], ["updated_at", "2018-08-07 00:46:10.516067"]]
         (9.0ms)  commit transaction
      => true
      irb(main):140:0> Post.where("title like 'A %').limit(5).pluck(10)
      irb(main):141:1" ^C
      irb(main):141:0> Post.where("title like 'A %'").limit(5).pluck(10)
         (0.2ms)  SELECT  10 FROM "posts" WHERE (title like 'A %') LIMIT ?  [["LIMIT", 5]]
      => [10, 10, 10, 10, 10]
      irb(main):142:0> Post.where("title like 'A %'").limit(5).pluck(:title)
         (0.2ms)  SELECT  "posts"."title" FROM "posts" WHERE (title like 'A %') LIMIT ?  [["LIMIT", 5]]
      => ["A Farewell to Arms", "A Summer Bird-Cage", "A Monstrous Regiment of Women", "A Catskill Eagle", "A Catskill Eagle"]
      irb(main):143:0> #Post.where("title like 'A %'").limit(5).update_all(title: "The End")
      irb(main):144:0* Post.where("title like 'A %'").limit(5).pluck(:id, :title)
         (0.2ms)  SELECT  "posts"."id", "posts"."title" FROM "posts" WHERE (title like 'A %') LIMIT ?  [["LIMIT", 5]]
      => [[12, "A Farewell to Arms"], [22, "A Summer Bird-Cage"], [30, "A Monstrous Regiment of Women"], [51, "A Catskill Eagle"], [57, "A Catskill Eagle"]]
      irb(main):145:0> Post.where("title like 'A %'").limit(5).pluck(:id)
         (0.2ms)  SELECT  "posts"."id" FROM "posts" WHERE (title like 'A %') LIMIT ?  [["LIMIT", 5]]
      => [12, 22, 30, 51, 57]
      irb(main):146:0> Post.where("title like 'A %'").limit(5).update_all(title: "The End")
        SQL (8.3ms)  UPDATE "posts" SET "title" = 'The End' WHERE "posts"."id" IN (SELECT "posts"."id" FROM "posts" WHERE (title like 'A %') LIMIT ?)  [["LIMIT", 5]]
      => 5
      irb(main):147:0> Post.where(id: [12, 22, 30, 51, 57]).pluck(:title)
         (0.4ms)  SELECT "posts"."title" FROM "posts" WHERE "posts"."id" IN (12, 22, 30, 51, 57)
      => ["The End", "The End", "The End", "The End", "The End"]
      irb(main):148:0> Post.where(id: [12, 22, 30, 51, 57]).delete_all
        SQL (4.5ms)  DELETE FROM "posts" WHERE "posts"."id" IN (12, 22, 30, 51, 57)
      => 5
      irb(main):149:0> Post.where(id: [12, 22, 30, 51, 57]).pluck(:title)
         (0.2ms)  SELECT "posts"."title" FROM "posts" WHERE "posts"."id" IN (12, 22, 30, 51, 57)
      => []
      irb(main):150:0>
```
