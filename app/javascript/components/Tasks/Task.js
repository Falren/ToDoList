import React from 'react'
import '../../stylesheets/home'
function Task(props) {
  return (
    <div className='card'>
      Task
      <div className='task'>
        Title: {props.task.title}
      </div>
      <div className='task'>
        Description: {props.task.description}
      </div>
    </div>
  )
}

export default Task