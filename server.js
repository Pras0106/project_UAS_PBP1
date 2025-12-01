const express = require("express");
const fs = require("fs");
const path = require("path");
const app = express();

app.use(express.json());

// static files
app.use(express.static("./html"));
app.use("/image", express.static("./image"));
app.use("/product", express.static("./product"));

// route utama
app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "html", "dashboard.html"));
});

// baca JSON dengan fallback []
function readJSON(file) {
    try {
        const content = fs.readFileSync(file, "utf8");
        return content.trim() === "" ? [] : JSON.parse(content);
    } catch {
        return [];
    }
}

// GET review
app.get("/reviews", (req, res) => {
    const dataPath = "./product/review/Nike_Air_Force_107_LV8_Reviews.json";
    res.send(readJSON(dataPath));
});

// POST review
app.post("/reviews", (req, res) => {
    const dataPath = "./product/review/Nike_Air_Force_107_LV8_Reviews.json";

    const existing = readJSON(dataPath);
    existing.push(req.body);

    fs.writeFileSync(dataPath, JSON.stringify(existing, null, 2));

    res.send({ message: "Review saved!" });
});

app.listen(3000, () => console.log("Server running at http://localhost:3000"));
