import { PrismaClient } from '@prisma/client';
import express from 'express';
import cors from 'cors'
import routes from './routes.js'
const app = express();
const PORT = process.env.PORT || 3000;

const prisma = new PrismaClient()

const options = {
  origin: 'http://localhost',
  methods: 'GET, PUT',
}


async function main() {
  
  routes(app);
  
  app.listen(PORT, () => {
      console.log(`Server is running on port ${PORT}`);
  });
  app.use(cors(options))

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