-- CreateTable
CREATE TABLE "PollsType" (
    "id" SERIAL NOT NULL,
    "type" TEXT,

    CONSTRAINT "PollsType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserEventVotesInPolls" (
    "id" SERIAL NOT NULL,
    "typeId" INTEGER NOT NULL,
    "UserEventId" INTEGER NOT NULL,
    "EventPollId" INTEGER NOT NULL,

    CONSTRAINT "UserEventVotesInPolls_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EventPollChoices" (
    "id" SERIAL NOT NULL,
    "EventPollId" INTEGER NOT NULL,
    "choice" TEXT NOT NULL,

    CONSTRAINT "EventPollChoices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EventPolls" (
    "id" SERIAL NOT NULL,
    "question" TEXT NOT NULL,
    "UserEventId" INTEGER NOT NULL,

    CONSTRAINT "EventPolls_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserEvent" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "eventId" INTEGER NOT NULL,
    "userEventVotesInPollsId" INTEGER,

    CONSTRAINT "UserEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Event" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "bio" TEXT,
    "lieu" TEXT,
    "createdUserId" INTEGER NOT NULL,

    CONSTRAINT "Event_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT,
    "username" TEXT,
    "password" TEXT NOT NULL,
    "eventPollsId" INTEGER,
    "userEventVotesInPollsId" INTEGER,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "UserEventVotesInPolls" ADD CONSTRAINT "UserEventVotesInPolls_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "PollsType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserEventVotesInPolls" ADD CONSTRAINT "UserEventVotesInPolls_UserEventId_fkey" FOREIGN KEY ("UserEventId") REFERENCES "UserEvent"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserEventVotesInPolls" ADD CONSTRAINT "UserEventVotesInPolls_EventPollId_fkey" FOREIGN KEY ("EventPollId") REFERENCES "EventPollChoices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EventPollChoices" ADD CONSTRAINT "EventPollChoices_EventPollId_fkey" FOREIGN KEY ("EventPollId") REFERENCES "EventPolls"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EventPolls" ADD CONSTRAINT "EventPolls_UserEventId_fkey" FOREIGN KEY ("UserEventId") REFERENCES "UserEvent"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserEvent" ADD CONSTRAINT "UserEvent_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserEvent" ADD CONSTRAINT "UserEvent_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_createdUserId_fkey" FOREIGN KEY ("createdUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_userEventVotesInPollsId_fkey" FOREIGN KEY ("userEventVotesInPollsId") REFERENCES "UserEventVotesInPolls"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_eventPollsId_fkey" FOREIGN KEY ("eventPollsId") REFERENCES "EventPolls"("id") ON DELETE SET NULL ON UPDATE CASCADE;
