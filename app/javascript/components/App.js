import React from 'react'
import {Route, Switch, BrowserRouter} from 'react-router-dom'
import Tasks from './Tasks/Tasks'

const App = () => {
  return(
    <BrowserRouter>
      <Switch>
        <Route exact path='/' component={Tasks}/>
      </Switch>
    </BrowserRouter>
  )
}

export default App