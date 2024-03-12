/*
  Warnings:

  - You are about to drop the column `bio` on the `Event` table. All the data in the column will be lost.
  - You are about to drop the column `lieu` on the `Event` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Event" DROP COLUMN "bio",
DROP COLUMN "lieu",
ADD COLUMN     "description" TEXT,
ADD COLUMN     "place" TEXT;
