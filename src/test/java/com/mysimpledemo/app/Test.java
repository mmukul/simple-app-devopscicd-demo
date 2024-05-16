package com.mysimpledemo.app;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import org.junit.jupiter.api.BeforeAll;

/**
 * Unit test for simple App.
 */
public class Test
{

    private final ByteArrayOutputStream outContent = new ByteArrayOutputStream();

    @BeforeAll
    public void setUpStreams() {
        System.setOut(new PrintStream(outContent));
    }

    @Test
    public void testAppConstructor() {
        try {
            new App();
        } catch (Exception e) {
            fail("Construction failed.");
        }
    }

    @Test
    public void testAppMain()
    {
        App.main(null);
        try {
            assertEquals("Hello World!" + System.getProperty("line.separator"), outContent.toString());
        } catch (AssertionError e) {
            fail("\"message\" is not \"Hello World!\"");
        }
    }

    @After
    public void cleanUpStreams() {
        System.setOut(null);
    }

}