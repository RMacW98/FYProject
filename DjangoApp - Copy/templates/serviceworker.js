/*
Handling a Route with a Workbox Strategy

    Stale While Revalidate
        This strategy will use a cached response for a request if it is available and update the cache in the background
        with a response form the network. (If it’s not cached it will wait for the network response and use that.) This
        is a fairly safe strategy as it means users are regularly updating their cache. The downside of this strategy is
        that it’s always requesting an asset from the network, using up the user’s bandwidth.
    Network First
        This will try to get a response from the network first. If it receives a response, it’ll pass that to the browser
        and also save it to a cache. If the network request fails, the last cached response will be used.
    Cache First
        This strategy will check the cache for a response first and use that if one is available. If the request isn’t in
        the cache, the network will be used and any valid response will be added to the cache before being passed to the
        browser.
    Network Only
        Force the response to come from the network.
    Cache Only
        Force the response to come from the cache.
* */

console.log('Hello from service worker');
importScripts('https://storage.googleapis.com/workbox-cdn/releases/5.1.2/workbox-sw.js');

// This will listen for messages of type: 'SKIP_WAITING' and run the skipWaiting() method, forcing the service worker to
// activate right away.
self.addEventListener('message', (event) => {
    if (event.data && event.data.type === 'SKIP_WAITING') {
        console.log("Invoked skipWaiting");
        self.skipWaiting();
    }
});

// Check if workbox loaded
if (workbox) {
    console.log("Workbox is loaded.");
} else {
    console.log("Workbox didn't load");
}

// workbox.setConfig({debug: true});

// This will trigger the importScripts() for workbox.strategies, routing etc and their dependencies:
const {strategies} = workbox;
const {routing} = workbox;
const {precaching} = workbox;
const {core} = workbox;
const cacheable_response = workbox.cacheableResponse;
const expiration = workbox.expiration;
// const {navigtaionPreload} = workbox;

// Set default cache names
core.setCacheNameDetails({
    prefix: 'awm2021',
    suffix: 'v1',
    precache: 'precache',
    runtime: 'runtime',
    googleAnalytics: 'analytics'
});

// const CACHE_NAME = 'offline-html';
// // This assumes /offline.html is a URL for your self-contained
// // (no external images or styles) offline page.
// const FALLBACK_HTML_URL = '/offline.html';
// // Populate the cache with the offline HTML page when the
// // service worker is installed.
// self.addEventListener('install', async (event) => {
//   event.waitUntil(
//     caches.open(CACHE_NAME)
//       .then((cache) => cache.add(FALLBACK_HTML_URL))
//   );
// });
//
// navigtaionPreload.enable();

// Inject static assets here
// precaching.precacheAndRoute(self.__WB_MANIFEST);

// Cache the Google Fonts stylesheets with a stale-while-revalidate strategy.
routing.registerRoute(
    ({url}) => url.origin === 'https://fonts.googleapis.com',
    new strategies.StaleWhileRevalidate({
        cacheName: 'google-fonts',
    })
);

// Cache the underlying font files with a cache-first strategy for 1 year.
routing.registerRoute(
    ({url}) => url.origin === 'https://fonts.gstatic.com',
    new strategies.CacheFirst({
        cacheName: 'google-fonts',
        plugins: [
            new cacheable_response.CacheableResponsePlugin({
                statuses: [0, 200],
            }),
            new expiration.ExpirationPlugin({
                maxAgeSeconds: 60 * 60 * 24 * 365,
                maxEntries: 30,
            }),
        ],
    })
);

// Cache js and css from external sources with a stale-while-revalidate strategy.
// This will generally be from CDNs such as unpkg.com or stackpath.bootstrapcdn.com
// to load libraries such as Bootstrap, jQuery, LeafletJS etc.

// routing.registerRoute(/^https:\/\/unpkg\.com/, new strategies.StaleWhileRevalidate({cacheName: 'cdn-resources',}));

routing.registerRoute(
    ({url}) => url.origin === 'https://stackpath.bootstrapcdn.com' ||
        url.origin === 'https://code.jquery.com' ||
        url.origin === 'https://cdnjs.cloudflare.com' ||
        url.origin === 'https://cdn.jsdelivr.net' ||
        url.origin === 'https://unpkg.com',
    new strategies.StaleWhileRevalidate({
        cacheName: 'cdn-resources',
    })
);


// Cache CSS and javaScript assets with a stale-while-revalidate strategy.
routing.registerRoute(
    ({request}) => request.destination === 'script' ||
        request.destination === 'style',
    new strategies.StaleWhileRevalidate({
        cacheName: 'static-resources',
    })
);

// Cache image files with a cache-first strategy for 30 days.
routing.registerRoute(
    ({request}) => request.destination === 'image',
    new strategies.CacheFirst({
        cacheName: 'images',
        plugins: [
            new expiration.ExpirationPlugin({
                maxEntries: 60,
                maxAgeSeconds: 30 * 24 * 60 * 60,
            }),
        ],
    })
);

// Cache the manifest.json with a stale-while-revalidate strategy.
// routing.registerRoute(
//     ({request}) => request.destination === 'manifest',
//     new strategies.StaleWhileRevalidate({
//         cacheName: 'static-resources',
//     })
// );

routing.registerRoute(
    ({url}) => url.origin === self.location.origin &&
        (url.pathname.endsWith('.json') || url.pathname.startsWith('/offline')),
    new strategies.StaleWhileRevalidate({
        cacheName: 'my-cache'
    })
);

// Cache pages prefixed by '/' with a stale-while-revalidate strategy.
// routing.registerRoute(
//     ({url}) => url.origin === self.location.origin &&
//         url.pathname.startsWith('/map'),
//     new strategies.NetworkOnly({})
// );

