'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "888483df48293866f9f41d3d9274a779",
"assets/FontManifest.json": "8f4791e5515ee1ab955fe8e529c2c437",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/art/newspic.cpc": "98e37b3ec80f685073bfe32a25bdabda",
"assets/assets/art/abort.cmv": "48494c75c44e2094882a335f93488c28",
"assets/assets/art/4x5caps.txt": "dacdd30e3650252457d0f5505d2f72f5",
"assets/assets/art/anchor.cmv": "8a1bbaf41d4f9bae633c7b5ad574f39a",
"assets/assets/art/5x5caps.txt": "6347ce3131a20fea87c26b4cc3aad442",
"assets/assets/art/newscast.cmv": "52b2fb3c753e59f26650c7aabd0a4004",
"assets/assets/art/3x5caps.txt": "c3dfd9f925215512073b799281cb4464",
"assets/assets/art/3x3caps.txt": "77d6c32e83b614580478ea1b84808220",
"assets/assets/art/newstops.cpc": "646c367f78889cfe5c2f9283a0f80f49",
"assets/assets/art/lacops.cmv": "a8fdbd4ba108cb03a02ef19e0b0f6445",
"assets/assets/art/glamshow.cmv": "a1471c6e16cf206cc40ca7eb3b3f3a06",
"assets/assets/art/largecap.cpc": "2047ced74a7bfb9dd7a5bb1b51bc0bf6",
"assets/assets/changelog.md": "d1d5ff1b272479c3cf9205b01b0429cb",
"assets/assets/maps/mapCSV_Courthouse_Tiles.csv": "1a542e5d2dbfa2191fc3e71b2945b800",
"assets/assets/maps/sitemaps.txt": "0422c8ea55ad484ef128a32da8931e80",
"assets/assets/maps/mapCSV_WhiteHouse_Specials.csv": "ea3803956db4327bd0a72f01e5e6defb",
"assets/assets/maps/mapCSV_BarAndGrill_Specials.csv": "63f00b948b5e3f0d07a82436b4014e59",
"assets/assets/maps/mapCSV_Church_Specials.csv": "cf7fef4d989443284116566221c8d1ff",
"assets/assets/maps/mapCSV_BarAndGrill_Tiles.csv": "23acf14bab733487460894c2749c49ac",
"assets/assets/maps/mapCSV_NuclearPlant_Specials.csv": "21a7d5b7e3c59861950b09d803679730",
"assets/assets/maps/mapCSV_Bank_Specials.csv": "3d49bb440e05e49044fc1455dbce72a9",
"assets/assets/maps/mapCSV_WhiteHouse3_Tiles.csv": "cb9f94106a103a6afd308e7242f3348f",
"assets/assets/maps/mapCSV_Courthouse_Specials.csv": "03950979257128739c48ff6c89590fa3",
"assets/assets/maps/mapCSV_Bunker_Specials.csv": "eb563e09cde9670e7831927709952d75",
"assets/assets/maps/mapCSV_WhiteHouse2_Tiles.csv": "078222b3d2ba662f6d33e2c9b363a366",
"assets/assets/maps/mapCSV_WhiteHouse2_Specials.csv": "a37e066b91592416f42eb16b74df08a3",
"assets/assets/maps/mapCSV_Church_Tiles.csv": "86b4b78051f06d2209ee3bed632afb8e",
"assets/assets/maps/mapCSV_BombShelter_Specials.csv": "fd1ee89cdc4b34e7d48e0b44dd40fd0e",
"assets/assets/maps/mapCSV_WhiteHouse3_Specials.csv": "42164c4856018f431f2ac5c49ba7365b",
"assets/assets/maps/mapCSV_WhiteHouse_Tiles.csv": "ae2b5df3a3d20eecc12608ab43341250",
"assets/assets/maps/mapCSV_Bank_Tiles.csv": "edf6ae2979c12b631f16da0be9b77ab5",
"assets/assets/maps/mapCSV_Bunker_Tiles.csv": "e9db9be966037b9e47cab81158a58b13",
"assets/assets/maps/mapCSV_BombShelter_Tiles.csv": "0ba3e854243b519ad6e7fb3cf51d032a",
"assets/assets/maps/mapCSV_NuclearPlant_Tiles.csv": "e2da3eab12c62ac642ac77570e0f857a",
"assets/assets/flags/TransLabrysLesbian.svg": "812ba4aff7a2acf8a095ad798173c83f",
"assets/assets/flags/GayMen.svg": "1f2f0eb612f1521b10edbc9c9a43afec",
"assets/assets/flags/Socialist.svg": "d07317b2a5ad6f7c23e99518aaccc576",
"assets/assets/flags/RedAndBlack.svg": "2931fb7fecf7d26b0932e06d8733bbd5",
"assets/assets/flags/BlackAmericanHeritage.svg": "018744a82d1502b0642f14f93f264401",
"assets/assets/flags/Feminist.svg": "365534ea8eafd88691b0acd055484844",
"assets/assets/flags/Lesbian.svg": "cfa0a8f83606848a7fad6926239df674",
"assets/assets/flags/SaboTabbyAntiGadsden.svg": "6094c2dcacf9518f7ed0ef4e47c98f87",
"assets/assets/flags/AnarchistA.svg": "48a8622c8a2491cc972918e1e520a35b",
"assets/assets/flags/Transgender.svg": "4ad786c3773c1120c8e161559e509d2b",
"assets/assets/flags/AntifaBlack.svg": "b4da73707dbf05eb9302c6970d689a7a",
"assets/assets/flags/Rainbow.svg": "a955bf54413819e1ebe2efc07422bbe6",
"assets/assets/flags/Anarchist.svg": "e5bea7570f482ac10306f56b0b4b7cc8",
"assets/assets/flags/SaboTabby.svg": "e95b71fcffac536212e726ad5d0690cf",
"assets/assets/flags/Environmentalist.svg": "0c39121c576ad19f8dc364f889e208a9",
"assets/assets/flags/PunkAnarchist.svg": "1545ce7e97e49423e26fd075f333f447",
"assets/assets/flags/GreenAndBlack.svg": "8999ae4b644d88b5e1cc93ee83a7eccc",
"assets/assets/flags/BlackLivesMatter.svg": "cd439cf220431409135390d85591b6b8",
"assets/assets/flags/Bisexual.svg": "3a5f35e2716be8b4180d03ee703e9301",
"assets/assets/flags/IntersexInclusiveProgress.svg": "c39b014c27468463587c0531a7dcceb7",
"assets/assets/flags/AnarchistFeminism.svg": "2e02d7a81838c1a572bef1fbaa26d71b",
"assets/assets/flags/Pansexual.svg": "2240d48392e58fe71688f0fa3eb489ac",
"assets/assets/flags/PanAfrican.svg": "cb1f5df21584a1ae583ce5084f3c8fef",
"assets/assets/flags/EcologyTheta.svg": "e8fdf2822b37d84263cc64868ffba7e1",
"assets/assets/flags/UnitedStates.svg": "63bcc80d6d2da989904687386e9c5bef",
"assets/assets/flags/AntifaRed.svg": "e14d289c81d6e724b8b8d897bbb65f8e",
"assets/assets/flags/Progress.svg": "07f8194cfaeb3ba1f06949354ec9b139",
"assets/assets/xml/armsdealer.xml": "cade7bb6236e211694cdc3a8c72a1243",
"assets/assets/xml/flags.xml": "99efa25c8eba305531b9d9f61e8d3a73",
"assets/assets/xml/pawnshop.xml": "15a1cec3aafbf14d0761dcac706860fd",
"assets/assets/xml/creatures.xml": "5ff2039654510d4daebff3ecc69d625c",
"assets/assets/xml/vehicles.xml": "c289fea820c554c40257fa3f7587030f",
"assets/assets/xml/weapons.xml": "68f9a0da64c0539f4850789ef09e395c",
"assets/assets/xml/loot.xml": "041bc57a57a6604c843638866580a105",
"assets/assets/xml/clothing.xml": "825d604e4558fbd04dc75e9a010dcfc1",
"assets/assets/xml/ammo.xml": "b1079b26e8183dd6ebf571e185f1aa11",
"assets/assets/xml/deptstore.xml": "4b1562455b686f279bd40f7881b1fd61",
"assets/assets/xml/armor_upgrades.xml": "48c59be6c48fc614ae3f345eb1ae6215",
"assets/assets/xml/oubliette.xml": "2725d66349d12fced57e35d629786107",
"assets/AssetManifest.bin.json": "bfc5df1b0cfde0a19bbf98c12ed259d5",
"assets/fonts/SourceCodePro-Regular.ttf": "4126a99d9f605a6acc9ae740b3a1ddcb",
"assets/fonts/MaterialIcons-Regular.otf": "b234976e32dd3c9d72b44f0fb07a46b4",
"assets/AssetManifest.bin": "c03694b7fb4fb17232007abd847c3091",
"assets/NOTICES": "e0c49eecc5aef665442757692e9f1ae8",
"assets/AssetManifest.json": "5fb3de7cb670220f3a1201e2e1231f60",
"icons/lcs-64-maskable.png": "8e641e6e15d0eb0e29c414af7557a44d",
"icons/lcs-128-basic.png": "8344e8afa45dfe764a56f525c8ed414f",
"icons/lcs-512-maskable.png": "a40c7559c5af8bc030ce5224b0caf9d0",
"icons/lcs-128-maskable.png": "428e54b1042caee7cd59dd7e0a586050",
"icons/lcs-256-maskable.png": "59453f129a578c0e81efd6c9231e19ba",
"icons/lcs-512-basic.png": "5962f4d71bf9b8bdecd9f1ead69742b6",
"icons/lcs-64-basic.png": "2316220ef28b8db51a1af09023cbda5a",
"icons/lcs-256-basic.png": "f1d80ae86af069125660a1e7e4b813af",
"flutter_bootstrap.js": "dc21b9f1af3e16772bf3dd7feb895f55",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"index.html": "cc1c786a0a39cc53080a9e84a307e2d3",
"/": "cc1c786a0a39cc53080a9e84a307e2d3",
"main.dart.js": "cb67fe77457030a48e9877fab19d0683",
"favicon.png": "723c73eab748c2072d457e3416723b18",
"manifest.json": "f119e0617118de8af9f48f1c649b3da7",
"version.json": "0ab8e60862f07552ac09f7e110469527"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
