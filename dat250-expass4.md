## Labratory report : Software Technology Experiment Assignment 4
 
 
 
## Experiment 1: Spark/Java Framework project and Postman
### Postman GET
<img src="extra\postman_get.JPG" width="600">

### Postman PUT
<img src="extra\postman_put.JPG" width="600">


## Experiment 2: REST API for TODO-items
### Technical problems
I did not encounter any problems, however it was a little annoying that I had to install the desktop postman tool so that it would have access to localhost, other than that it went well. 

### Pending issues
I managed to put together "PUT", "GET", "DELETE" and "PUT". I never managed to make "EDIT" work.

`Todo.java`:
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

I added the following code to `app.java`
```
// Experiment 2: REST API for TODO-items

		// POST
		post("/todo/", (req, res) -> {
			Todo newTodo = new Gson().fromJson(req.body(), Todo.class);
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
		get("/todo/:id", (req, res) -> {
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
		put("/todo/:id", (req, res) -> {
			Todo edit = new Gson().fromJson(req.body(), Todo.class);
            String id = req.params(":id");
			boolean edited = false;

			for (int i = 0; i < testDB.size(); i++) {
                if(testDB.get(i).id == Long.parseLong(id)) {
					
				}
				if (edited) return "Todo got updated";
			}	
			return "Todo was not updated";
		});

		//DELETE
		delete("/todo/:id", (req, res) -> {
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
	}
```