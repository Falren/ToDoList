import React from 'react'
import {Route, Switch, BrowserRouter} from 'react-router-dom'
import Tasks from './Tasks/Tasks'
import { Navbar } from 'react-bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css';

function App() {
  return(
    <>
      <Navbar bg="dark" variant="dark">
        <Navbar.Brand href="#">TaskMasterReact</Navbar.Brand>
      </Navbar>

      <BrowserRouter>
        <Switch>
          <Route exact path='/' component={Tasks} />
        </Switch>
      </BrowserRouter>
    </>
  )
}

export default App