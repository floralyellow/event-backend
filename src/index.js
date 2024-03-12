const { PrismaClient } = require('@prisma/client')
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

const prisma = new PrismaClient()

async function main() {

    app.get('/', (req, res) => {
        res.send('Hello, World!');
    });
    
    app.listen(PORT, () => {
        console.log(`Server is running on port ${PORT}`);
    });

    // test db 
    const allUsers = await prisma.user.findMany()
    console.log(allUsers)
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })