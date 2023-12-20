package com.todo.Tasks;

import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepo extends JpaRepository<TaskList, Long> {
}
