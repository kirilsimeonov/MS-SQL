CREATE FUNCTION ufn_CalculateFutureValue(@sum DECIMAL(10, 4), @yearlyInterestRate FLOAT, @numberOfYears INT)
RETURNS DECIMAL(10, 4)
AS
BEGIN
	DECLARE @resultSum DECIMAL(10, 4);
	    SET @resultSum = @sum * (POWER(1 + @yearlyInterestRate, @numberOfYears))
	 RETURN @resultSum
END
