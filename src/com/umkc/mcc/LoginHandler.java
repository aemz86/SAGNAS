package com.umkc.mcc;

import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;
@Path("/login")
public class LoginHandler {
	/**
	 * Retrieves representation of an instance of helloWorld.HelloWorld
	 * @return an instance of java.lang.String
	 */
	@GET
	@Produces("text/html")
	public String getHtml() {
	    return "<html lang=\"en\"><body><h1>Hello, World!!</body></h1></html>";
	}
}
