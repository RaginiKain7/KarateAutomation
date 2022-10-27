package tests;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

	@Karate.Test
	Karate createOrderTest()
	{
		return Karate.run("createOrderFetchToken").relativeTo(getClass());
	}
}
