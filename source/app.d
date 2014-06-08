import vibe.d;
import vibenotes.vibenotes;

shared static this()
{
	setLogLevel(LogLevel.info);
	
	auto router = new URLRouter;
	registerWebInterface(router,new vibenotes_web);
	//registerVibeNotes(router);
	
	auto settings = new HTTPServerSettings;
	settings.sessionStore = new MemorySessionStore();
	settings.port = 8080;
	
	listenHTTP(settings, router);
}
