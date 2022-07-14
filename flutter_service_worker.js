'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.ico": "6d2fc196f3f5eb18f51b5a190258dd7b",
"manifest.json": "0a743baf20cbd83ff869be30c4937d5f",
"assets/assets/images/TBSB/1.png": "9434a666cc30a6f116f87ff140893d25",
"assets/assets/images/TBSB/4.png": "69572d6bba9f52d77c4b6f8f727db97d",
"assets/assets/images/TBSB/3.png": "13b5267cc52079f674b5fe480d9c3d4d",
"assets/assets/images/TBSB/2.png": "f31a5bef3ad8ac5b967a77f3875624f9",
"assets/assets/images/skills_background.webp": "3ab0d721b807fade66a9bb8d73336305",
"assets/assets/images/logos/flutter.png": "d165760a12f332e7485ef1bcced4161c",
"assets/assets/images/logos/java.png": "a267c77718c775cf73c2c8eaec05354a",
"assets/assets/images/logos/typescript.png": "086784b552414359fa4a8448720a9261",
"assets/assets/images/logos/python.png": "d60422999fa4a39e6bad99130fad5aaf",
"assets/assets/images/logos/css3.png": "54cc2fe51ff4ebdffa079d09064f585c",
"assets/assets/images/logos/nodejs.png": "45a009953be899879de11dba8860c546",
"assets/assets/images/logos/php.png": "8b853b6cf3636de4c2c92b64ce30fd03",
"assets/assets/images/logos/anaconda.png": "b1a343a7b660bbb9a2031d65478f9e36",
"assets/assets/images/logos/cplusplus.png": "99c70256967ff64da03571444ca4d774",
"assets/assets/images/logos/html5.png": "242a5276f9db679bdcf4fb2dc3e591fa",
"assets/assets/images/logos/mysql.png": "a9cca71a069859151ae4996f18ca9968",
"assets/assets/images/logos/javascript.png": "a0d4a04f59cfed16a8371827b32fe040",
"assets/assets/images/logos/github.png": "1872d74ada5ed24b8f81565c652755e0",
"assets/assets/images/logos/firebase.png": "871a1a35847549f71c7d6d34078a8778",
"assets/assets/images/logos/google-cloud.png": "c7b9a2907e5d21eb40ea54821a8005e4",
"assets/assets/images/logos/linkedin.png": "992686714d3d9810ddcb798c329d9802",
"assets/assets/images/logos/react-native.png": "d434ae76199cd22fe7a0e71cd05bbd80",
"assets/assets/images/logos/dart.png": "976f8521f648e3b3389c629e992138b9",
"assets/assets/images/PK%2520Retails/1.png": "f733dd8018357d0ab3a282f79e9ad5d6",
"assets/assets/images/PK%2520Retails/5.png": "da3d8ab83e48aa331020481374d0cd2a",
"assets/assets/images/PK%2520Retails/4.png": "f117dc24a229f035d3cadb3f0d7b4643",
"assets/assets/images/PK%2520Retails/2.png": "a6022bc6e9a33e562915e341e282ac95",
"assets/assets/images/Quadry/1.png": "ca830538c929a84cc552e9b4873360d3",
"assets/assets/images/Quadry/4.png": "42755542ab681d340ed5585b71e9daa0",
"assets/assets/images/Quadry/3.png": "1db25b6c9dcfd39d01d908ed7dab3aaa",
"assets/assets/images/Quadry/2.png": "1c2cfbd96200cd9bb44ae204afdfeb4a",
"assets/assets/fonts/valencia/Valencia.ttf": "8ea32e99070762d4e4803000c16f91d9",
"assets/assets/fonts/avenir/Avenir-BlackOblique-04.ttf": "292dd00ef4db26314dd7911d08f723da",
"assets/assets/fonts/avenir/Avenir-HeavyOblique-06.ttf": "bd62ce8814437ca3387d952462492f47",
"assets/assets/fonts/avenir/Avenir-Roman-12.ttf": "c6d37b26297461a78d10f169dd5cf46d",
"assets/assets/fonts/avenir/Avenir-Medium-09.ttf": "7d635ea94b4460e86cd678e9e754a643",
"assets/assets/fonts/avenir/Avenir-Black-03.ttf": "968e784956ff9b6a05c29cc3be18cad0",
"assets/assets/fonts/avenir/Avenir-Oblique-11.ttf": "10d2e9dcb55c57a084cebfa85b0cf294",
"assets/assets/fonts/avenir/Avenir-MediumOblique-10.ttf": "10db54e98ccc80bb118886c6293cb093",
"assets/assets/fonts/avenir/Avenir-Light-07.ttf": "33f6570a328d84cb7d06e829a0c7ca1b",
"assets/assets/fonts/avenir/Avenir-Book-01.ttf": "995b34ab56b423abffe48e64bf8b8df1",
"assets/assets/fonts/avenir/Avenir-Heavy-05.ttf": "f080b6894f8375c59a197caa24aac91c",
"assets/assets/fonts/avenir/Avenir-BookOblique-02.ttf": "aa0e2e73a41a5ba192347a6f600d344c",
"assets/assets/fonts/avenir/Avenir-LightOblique-08.ttf": "0e057a2e798d0e04a5ff971691b8b343",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/NOTICES": "8afa56093c54bab6fa62077d36be97cd",
"assets/AssetManifest.json": "98dc7c4e86a507bc66943185d9e65f8b",
"assets/FontManifest.json": "e31c2762eb74f8891a199429902da6a8",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"version.json": "eae303920c387d2798143411879513dd",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/android-chrome-192x192.png": "094429b78312e7fb2a35c78e9e009321",
"icons/apple-touch-icon.png": "533286c3622fce056df722c3f6a4355a",
"icons/android-chrome-512x512.png": "6c4a8c941cc920c438ee058757ceb96b",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"index.html": "1821e9a8fcc90daaf3dbe232d36266e5",
"/": "1821e9a8fcc90daaf3dbe232d36266e5",
"main.dart.js": "85f181f62c8a6f497d8463e072bac184"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
