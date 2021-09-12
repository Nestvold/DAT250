# Labratory report : Software Technology Experiment Assignment 2
 - [x] Experiment 1: Application using JPA
 - [ ] Experiment 2: Banking/Credit Card example JPA


## Experiment 1: Application using JPA
I started off by cloning the [Maven project](https://github.com/timKraeuter/dat250-jpa-example) and changed the connection string:

``` 
<property name="javax.persistence.jdbc.url" value="jdbc:derby:C:\Source\relationsDB;create=true"/>
```

After that I edited the `todo` description to include my name etc.

```
Todo todo = new Todo();
todo.setSummary("This is a test by Fredrik Nestvold Larsen");
todo.setDescription("Student at HVL and UiB");
```

Then when we ran the `Main class` we created

<img src="extra\Tabell.JPG" width="600">

I also added `lombok` as a dependency

```
<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <version>1.16.20</version>
</dependency>
```

Then I keept going thorugh the toutorial and created the classes:
 * `Person.java`
 * `Family.java`
 * `Job.java`
 * `JpaTest.java`

after completing this and editing the `persistence.xml` file I could run the `JpaTest.java` and got the following results

<img src="extra\test.JPG" width="350">

The test created the following databases

<img src="extra\JPA.JPG" width="350">


## Experiment 2: Banking/Credit Card example JPA
<img src="extra\creditcard.JPG" width="350">

# Report

## 1: Technical Problems
I had a hard time running the program as a Maven project, however after some time in IntelliJ I managed to do so. I liked the concept of the tutorial, but I used more time on making it run than actually learn the concepts of JPA.

## 2: Link to the code 
[Link to Experiment 1: Application using JPA](https://github.com/Nestvold/expass2/tree/master/eclipselink/jpa-basic/src/main/java/no/hvl/dat250/jpa/basicexample)

[Link to Experiment 2: Banking/Credit Card example JPA](https://github.com/Nestvold/expass2/tree/master/eclipselink/jpa-basic/src/main/java/no/hvl/dat250/jpa/creditCard)

## 3: Inspection of Database
When inspecting the database I used IntelliJ's JPA Structure tool to see the different databases and their connections as shown above.

## 4: Pending issues 
Im pretty sure I messed up the CreditCard database, I had some issues regarding running the program after a while when starting on exercise 2. Forunatly I screenshotted the JpaTest etc. before this happend. 