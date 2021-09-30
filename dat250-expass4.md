# Labratory report : Software Technology Experiment Assignment 4
 
## Experiment 1: Spark/Java Framework project and Postman

### Postman GET
<img src="extra\postman_get.JPG" width="600">

### Postman PUT
<img src="extra\postman_put.JPG" width="600">


## Experiment 2: REST API for TODO-items

### Technical problems
I did not encounter any problems, however it was a little annoying that I had to install the desktop postman tool so that it would have access to localhost, other than that it went well. 

### Pending issues
I managed to put together "PUT", "GET", "DELETE" and "PUT". I never managed to make "EDIT" work with the postman tool.

[`Todo.java`](https://github.com/Nestvold/dat250-sparkjava-counter/blob/master/counters/counters/src/main/java/no/hvl/dat110/rest/main/Todo.java):
```
package no.hvl.dat110.rest.main;

import com.google.gson.Gson;


public class Todo {
    public Long id;
    private String summary;
    private String description;

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Todo [summary=" + summary + ", description=" + description
                + "]";
    }

    public String toJson () {
        Gson gson = new Gson();
        String jsonInString = gson.toJson(this);
        
        return jsonInString;
    }

}

```

I added the following code to [`app.java`](https://github.com/Nestvold/dat250-sparkjava-counter/blob/master/counters/counters/src/main/java/no/hvl/dat110/rest/counters/App.java)
```
// Experiment 2: REST API for TODO-items

// POST
post("/todo", (req, res) -> {
    Gson gson = new Gson();
    Todo newTodo = gson.fromJson(req.body(), Todo.class);
    res.type("application/json");

    for (int i = 0; i < testDB.size(); i++) {
        if(testDB.get(i).id == newTodo.id)  {
            return "Todo with ID:" + testDB.get(i).id + " already exists.";
        }
    }
    testDB.add(newTodo);
    return newTodo.toJson();
});

// GET
get("/todo:id", (req, res) -> {
    String id = req.params(":id");
    res.type("application/json");
    
    for (Todo todo : testDB) {
        if(todo.id == Long.parseLong(id)) {
            return todo.toJson();
        }
    }
    return "No Todo with the given ID was found";
});

//UPDATE
put("/todo:id", (req, res) -> {
    Gson gson = new Gson();
    Todo edit = gson.fromJson(req.body(), Todo.class);
    String id = req.params(":id");
    boolean edited = false;

    for (int i = 0; i < testDB.size(); i++) {

        String currentDescription = testDB.get(i).getDescription();
        String newDescription = edit.getDescription();
        if(testDB.get(i).id == Long.parseLong(id)) {
            if (newDescription != null && newDescription != currentDescription) {
                testDB.get(i).setDescription(newDescription);
            }
        }

        String currentSummary = testDB.get(i).getSummary();
        String newSummary = edit.getSummary();
        if(testDB.get(i).id == Long.parseLong(id)) {
            if (newSummary != null && newSummary != currentSummary) {
                testDB.get(i).setDescription(newSummary);
            }
        }

        if (edited) return "Todo got updated";
    }	
    return "Todo was not updated";
});

//DELETE
delete("/todo:id", (req, res) -> {
    String id = req.params(":id");
    res.type("application/json");

    for (int i = 0; i < testDB.size(); i++) {
        if(testDB.get(i).id == Long.parseLong(id)) {
            Long deletedItem = testDB.get(i).id;
            testDB.remove(deletedItem);
            return deletedItem + ": was succesfully deleted";
        }
    }
    return "No Todo with given Id found";
});

```