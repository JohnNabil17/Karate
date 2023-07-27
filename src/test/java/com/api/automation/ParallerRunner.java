package com.api.automation;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class ParallerRunner {

	@Test
	public void executeKarateTests()
	{
		//Runner.parallel(getClass(), 5);
		Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/automation");
		Results result = aRunner.parallel(5);
		System.out.println("Total Features ==> " + result.getFeatureCount());
		System.out.println("Total Scenarios ==> " + result.getScenarioCount());
		System.out.println("Total Passed Scenarios ==> " + result.getPassCount());
		System.out.println("Total Failed Scenarios ==> " + result.getFailCount());
		
		Assertions.assertEquals(0, result.getFailCount());
	}
}
