<list schemas as schema>
import ${schema.get("name")} from '${schema}';
</list>

class App {
  constructor() {}

  render() {
    return (
      <div>
        <BrowserRouter>
          <Routes>
            <Route path="/" element={<MainLayout appTitle="${projectName}" />} >
              <list fields as field>
              <Route path="${name}" element={<${f} />} />
              </list>
            </Route>
          </Routes>
        </BrowserRouter>
      </div>
    );
  }
}

export default App;