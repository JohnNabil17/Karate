package com.api.automation.putrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPutnRunner {
	
	@Test
	public Karate runTest()
	{
		return Karate.run("updateUserEntry").relativeTo(getClass());
	}

}
