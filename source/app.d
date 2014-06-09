import vibe.d;
import vibenotes.vibenotes;

shared static this()
{
	import vibe.d;
	setLogLevel(LogLevel.debugV);



	auto router = new URLRouter;
	registerWebInterface(router,new vibenotes_web);
	//registerVibeNotes(router);

	 
	auto settings = new HTTPServerSettings;
	settings.sessionStore = new MemorySessionStore();
	settings.port = 8080;
	router.get("/style.css",serveStaticFile("views/style.css"));
	router.get("/scripts/editor.js",serveStaticFile("views/editor.js"));
	router.get("/scripts/jquery.js",serveStaticFile("views/jquery.js"));
	router.get("/scripts/diff_match_patch.js",serveStaticFile("views/diff_match_patch.js"));

	router.get("/",vibe.http.server.staticRedirect("/home"));

	listenHTTP(settings, router);
}
