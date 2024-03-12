/*
  Warnings:

  - You are about to drop the column `eventPollsId` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `userEventVotesInPollsId` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `userEventVotesInPollsId` on the `UserEvent` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_eventPollsId_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_userEventVotesInPollsId_fkey";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "eventPollsId",
DROP COLUMN "userEventVotesInPollsId";

-- AlterTable
ALTER TABLE "UserEvent" DROP COLUMN "userEventVotesInPollsId";
