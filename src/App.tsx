import { useState } from "react";
import "./App.css";

function App() {
  const [visible, setVisible] = useState(true);

  return (
    <>
      <h1>
        Invisi<span className={`${visible ? "visible" : "invisible"}`}>Me</span>
      </h1>
      <div className="card">
        <button onClick={() => setVisible((visible) => !visible)}>
          Make Me {visible ? "invisible" : "visible"}
        </button>
      </div>
      <p className="instructions">Click on the button to see the magic!</p>
    </>
  );
}

export default App;
