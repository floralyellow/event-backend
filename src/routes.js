export default function routes(app){
    app.get('/api/', (req, res) => {
        res.send({test :'Hello, World!'});
    });
    app.post('/api/test', (req, res) => {
        console.log(req)
        res.send({test :'Hello, World!'});
    });
    //other routes..
}