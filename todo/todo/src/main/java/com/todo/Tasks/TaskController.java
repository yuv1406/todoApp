package com.todo.Tasks;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/tasks")
public class TaskController {
    @Autowired
    private TaskRepo taskRepo;

    @GetMapping
    public List<TaskList> getTasks(){
        return taskRepo.findAll();
    }

    @PostMapping("/add")
    public TaskList add(@Valid @RequestBody TaskList taskList){
        return taskRepo.save(taskList);
    }

    @PutMapping("update/{id}")
    public ResponseEntity update(@PathVariable Long id){
        boolean exist = taskRepo.existsById(id);
        if(exist){
            TaskList task = taskRepo.getReferenceById(id);
            boolean status = task.isStatus();
            task.setStatus(!status);
            taskRepo.save(task);
            return new ResponseEntity<>("Task Updated Successfully!", HttpStatus.OK);
        }
        return new ResponseEntity<>("Failed! Task was not found at id: "+id, HttpStatus.BAD_REQUEST);
    }
    @DeleteMapping("/delete/{id}")
    public ResponseEntity delete(@PathVariable Long id){
        boolean exist = taskRepo.existsById(id);
        if(exist){
            taskRepo.deleteById(id);
            return new ResponseEntity<>("Task deleted Successfully!",HttpStatus.OK);
        }
        return new ResponseEntity<>("Failed! Task was not found at id: "+id, HttpStatus.BAD_REQUEST);
    }
}
