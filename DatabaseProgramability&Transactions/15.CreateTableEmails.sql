CREATE TRIGGER tr_CreateEmail ON Logs
FOR INSERT
AS
	IF EXISTS
     (
         SELECT *
           FROM inserted
     )
         -- UPDATE Statement is executed
         INSERT INTO NotificationEmails(Recipient, [Subject], Body)
              SELECT i.AccountId AS [Recipient], 
			         CONCAT('Balance change for account: ', i.AccountId) AS [Subject],
					 CONCAT('On ', GETDATE(), ' your balance was changed from ', i.OldSum, ' to ', i.NewSum) AS [Body]
			    FROM inserted AS i
