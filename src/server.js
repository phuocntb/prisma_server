import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

import express from 'express'
const server = express();

import bodyParser from 'body-parser';
server.use(bodyParser.json())

import cors from 'cors'
server.use(cors())

server.get("/users", async (req, res) => {
    const user = await prisma.users.findMany({
        include: {
            posts: true
        }
    })

    // const post = await prisma.posts.findMany({
    //     where: {
    //         published: true
    //     },
    //     include: {
    //         author: true
    //     }
    // })

    // console.log("post",post)
    res.json(user)
})

server.delete("/users/:userId", async (req, res) => {
try {
    console.log("Number(req.params.userId)", Number(req.params.userId))
    const user = await prisma.users.delete({
        where: {
            id: Number(req.params.userId)
        }
    })
    res.json(true)
}catch(err) {

}
})

server.post("/users", async (req, res) => {
    try {
        const user = await prisma.users.create({
            data: req.body
        })
        res.json(user)
    } catch (err) {
        res.status(500).json({
            message: "Loi"
        })
    }

    // const user = await prisma.users.create({
    //     data: req.body
    // })

})

server.patch("/users/:userId", async (req, res) => {
    try {
        let user = await prisma.users.update({
            where: {
                id: Number(req.params.userId)
            },
            data: req.body
        })

        return res.json(user)
    }catch(err) {

    }
})

server.listen(3000, () => {
    console.log("ok server at: http://127.0.0.1:3000")
})
