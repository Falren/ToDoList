import React from 'react';
import ButtonGroup from 'react-bootstrap/ButtonGroup'
import Button from 'react-bootstrap/Button'
import axios from 'axios'
const Task = (props) => {
  
  function filterCompletedTask(completedTask) {
    props.setActiveTasks(tasks)
    const tasks = props.completedTasks.filter( item => item.id != completedTask.id)
  }
  
  function filterActiveTask(activeTask) {
    const tasks = props.activeTasks.filter( item => item.id != activeTask.id)
    props.setCompletedTasks(tasks)
  }

  function handleStatus(task) {
    axios.patch(`/api/v1/tasks/${task.id}`, { task: {active: !task.active }}).then((result) => {
      if(result.data.active) {
        console.log(result.data)
        const tasks = props.completedTasks.filter( item => item.id != task.id)
        console.log(tasks)
        props.setCompletedTasks(tasks)
      } else {
        console.log(result.data)
        const tasks = props.activeTasks.filter( item => item.id != task.id)
        props.setActiveTasks(tasks)
      }
    })
  }

  const handleDelete = ((task) => {
    axios.delete(`/api/v1/tasks/${task.id}`).then(() => {
      if(task.active) {
        filterActiveTask(task)
      } else {
        filterCompletedTask(task)
      }
    }).catch(error => console.log(error.message))
  })
  return (
    <div className='task-card' >
      <div className='task-info'>
        <div className='task'>
          Title: {props.task.title}
        </div>
        <div className='task'>
          Description: {props.task.description}
        </div>
      </div>
      <ButtonGroup aria-label="Basic example">
        <Button size="sm" variant="outline-info">Edit</Button>
        { props.task.active ? <Button size="sm" variant="outline-success" onClick={function(){ handleStatus(props.task) } } >Complete</Button> : <Button size="sm" variant="outline-warning" onClick={function(){ handleStatus(props.task)}}>Undo</Button> }
        <Button size="sm" variant="outline-danger" onClick={function() {handleDelete(props.task)} }>Delete</Button>
      </ButtonGroup>
    </div>
  )
};

export default Task