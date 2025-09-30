 CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT P.child from dogs as D,parents as P where D.name = P.parent order by -D.height ;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name,size from dogs as A, sizes as B where A.height > B.min and A.height <= B.max;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT A.child as first,B.child as second from parents as A,parents as B where A.parent = B.parent and A.child <> B.child and A.child < B.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || siblings.first || " and " || siblings.second || ", have the same size: " || s1.size from siblings,size_of_dogs as s1,size_of_dogs as s2 where s1.name = siblings.first and s2.name = siblings.second and s1.size = s2.size;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur,max(height) - min(height) from dogs group by fur having height > avg(height) * 0.7 and height < avg(height) * 1.3;

