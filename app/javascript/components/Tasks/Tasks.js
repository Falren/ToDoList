import React, { useState, useEffect } from 'react'
import axios from 'axios'
import Task from './Task'


function Tasks() {
  const [activeTasks, setActiveTasks] = useState([])
  const [completedTasks, setCompletedTasks] = useState([])
  const completedTask = completedTasks.map( task => { return <Task
    activeTasks = { activeTasks }
    setActiveTasks ={ setActiveTasks } 
    completedTasks = {completedTasks}
    setCompletedTasks={setCompletedTasks} 
    key={ task.id } 
    task={ task }/> })
  const activeTask = activeTasks.map( task => { return <Task
    completedTasks = {completedTasks}
    setCompletedTasks={setCompletedTasks} 
    activeTasks = { activeTasks }
    setActiveTasks ={ setActiveTasks } 
    key={ task.id } 
    task={ task }/> })
  

  function getCompletedTasks(tasks) {
    const active = tasks.filter( task => task = task.active)
    setActiveTasks(active);
  }

  function getActiveTasks(tasks) {
    const completed = tasks.filter( task => task = !task.active)
    setCompletedTasks(completed);
  }

  useEffect( async () => {
    const response = await axios.get('/api/v1/tasks');
    const tasks = response.data; 
    getActiveTasks(tasks);
    getCompletedTasks(tasks);
   }, [ activeTasks.length ] || [completedTasks.length])

  return(
    <div className='content-container'>
      <div className='card-container'>
        { activeTask }
      </div>
      <div className='card-container'>
        { completedTask }
      </div>
    </div>
  ) 
}

export default Tasks