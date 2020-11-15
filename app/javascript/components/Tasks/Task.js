import React from 'react';
import ButtonGroup from 'react-bootstrap/ButtonGroup'
import Button from 'react-bootstrap/Button'

const Task = (props) => {
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
        <Button size="sm" variant="outline-danger">Delete</Button>
      </ButtonGroup>
    </div>
  )
};

export default Task