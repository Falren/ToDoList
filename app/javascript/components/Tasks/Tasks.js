import React, { useState, useEffect } from 'react'
import axios from 'axios'
import Task from './Task'


function Tasks() {
  const [tasks, setTasks] = useState([])
  
  useEffect(() => {
    axios.get('/api/v1/tasks.json')
    .then(resp => { setTasks(resp.data) })
    .catch( err => (err) )
    }, [tasks.length])

    const task = tasks.map( task => {
      return(
        <Task key={ task.id } task={ task }/>
      )
    })

  return(
      <div>
        { task }
      </div>
  ) 
}

export default Tasks