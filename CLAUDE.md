# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A local, single-user Spring Boot 3.2 app (Java 17) that generates PowerPoint files with Apache POI for FJKM AGF church services. It binds to `localhost:8080` and writes `.pptx` files to a directory on the server's filesystem, chosen in the form. There is no database and no download endpoint.

## Commands

Use `.\mvnw.cmd` instead of `./mvnw` in PowerShell. No linter or formatter is configured.

```bash
./mvnw spring-boot:run                                # run in dev; opens a browser tab on startup
./mvnw test                                           # all tests
./mvnw test -Dtest=MainControllerTest                 # one test class
./mvnw test "-Dtest=MainControllerTest#testIndexPage" # one test method
./mvnw clean package                                  # target/slidegenerator-0.0.1-SNAPSHOT.jar
scripts\create-deployment.bat                         # build slidegenerator-deployment/ (run package first)
```

`SlidegeneratorApplication.openBrowser()` runs on `ApplicationReadyEvent`, and the Spring test contexts load that class, so test runs can open browser tabs too.

## Architecture

There is no service layer and no dependency injection for domain code. `MainController` creates plain objects with `new` on every request. Each request re-parses all the hymn JSON through `HiraRehetra.init()`.

**Data** lives in `src/main/resources` and is parsed by Gson into classes whose field names must match the JSON keys:
- `hira/*.json` has the shape `{"fihirana": {"<key>": HiraFihirana}}`. Each file has its own `HiraConfiguration` subclass in `configuration/`. `HiraRehetra` merges them into one map, so a new hymnbook needs both a subclass and a line in `HiraRehetra.initLisitraHira()`. On a duplicate key, the book merged last wins.
- `litorjia/litorjia.json` has the shape `{"litorjia": {"<endriny key>": {"fizarana": {"tapany_N": Tapany}}}}`, loaded by `LitorjiaFJKM`.
- `images/` holds slide backgrounds, referenced by the filename defaults in `Endriny`.

**Hymn keys** look like `ffpm_001`, `hf_01`, `antema_01`, `salamo_025` and `hira_fifohazana_070`. User input is normalized with `.replace(" ", "_").toLowerCase()` before lookup, so "FFPM 001" also resolves.

**Generation flow:**
- `POST /treatment-programa` → `LitorjiaFJKM.generateProgram` → `Endriny.generateSlide` (plus `generateSlideFandraisana` when `fandraisana` is set) → `Slide` → `Presentation.save`.
- Hymn endpoints → `HiraFihirana.constructHiraPresentation(path)`, which writes `<sokajy>_<laharana>.pptx`.

**Non-obvious behavior in generation:**
- A program run writes one `.pptx` per hymn it references, in addition to `<name>.pptx`, because the hymn lookups also call `constructHiraPresentation`.
- `LitorjiaFJKM` and `Endriny` each have two overloads. The controller only calls the shorter one (no `hira[]`, `hiraRakitra[]`, `hiraFizarana[]` or `hiraFanangonana[]` params). Changes to slide behavior have to go in that overload to take effect.
- `Endriny.generateSlide` chooses each slide's content by matching the `Tapany` title, so editing a title in `litorjia.json` can silently change the output. Most titles must match exactly. Only `Fiderana an'Andriamanitra` and `Asan'Andriamanitra` go through `hasTitle`, which ignores line breaks, because the JSON spells those both with and without `\n`.
- `generateSlide` walks the sections in `tapany_N` number order and tolerates gaps in the numbering (`endriny_4` and `fahafatesana` have them).
- `generateSlideFandraisana` is keyed on position (`tapany_2`, `_7`, `_9`, `_11`, `_13`), so reordering that liturgy breaks it.
- `generateSlide` returns without adding anything if the entry hymn key is unknown, which still saves an empty program and reports success.
- `Presentation.save` does not create directories. The form's default path, `./powerpoint`, doesn't exist in a fresh checkout, so generation fails until it is created.
- Hymn pagination in `constructHiraPresentation` pairs lines into slides, with a 34-character limit per pair. A digit 2–9 in the next line is treated as the start of a new verse. Verse text is built as `"<n> . <lyrics>"`, and the refrain (`fiverenany: true`, `andininy: 0`) is appended after every verse.

**Frontend** is a hash-routed SPA built on Thymeleaf and jQuery:
- `templates/layout.html` is the shell and contains all the SPA JavaScript inline (`loadComponent`, `initializeFormElements`, `pushState`).
- `GET /component/{name}` returns the fragment `templates/components/{name}.html`, which is inserted into `#main-content`.
- Legacy routes like `/form-hira` redirect to `/#form-hira`.
- Form submissions are full page requests that redirect to `/?success=<msg>`. Failures render `error.html`.
- A new screen needs a component template, a link in `fragments/side-bar.html`, and a form-init hook in `layout.html` if it uses custom widgets.

## Stale or unused code

- `src/main/webapp/WEB-INF/jsp/` is the v1 UI. The app is packaged as a jar with no JSP engine, so these files aren't used. Edit `templates/` instead.
- `SlidePecularitiesMapping` is the old form model; the controller uses `SlidePecularitiesMappingVersionTwo`.
- `static/js/programme.js` isn't referenced by any template.
- `scripts/build-exe.bat` doesn't produce an EXE: it builds the jar and then only checks for `target/slidegenerator.exe`, and `pom.xml` has no Launch4j plugin. See `documentation/JAR_TO_EXE_GUIDE.md`.
- `documentation/SPA_Architecture.md` mentions `dashboard.html` and `form-programme-v1.html`, which no longer exist (`components/home.html` is the landing component). The README's POI version and log level also differ from `pom.xml` and `application.properties`, which are the correct ones.

## Domain vocabulary (Malagasy)

The identifiers and UI text are in Malagasy, so keep new user-facing strings in Malagasy.

| Term | Meaning |
| --- | --- |
| hira / fihirana | hymn / hymnbook |
| andininy, tononkira, fiverenany | verse, lyrics, refrain |
| laharana, sokajy, lohateny, mpanoratra | number, category, title, authors |
| litorjia, endriny | liturgy, a variant of the liturgy |
| tapany / fizarana | one part / the parts of a liturgy (`fizarana` is also the Communion distribution step) |
| vakiteny, perikopa | scripture reading, pericope |
| fandraisana (Fanasan'ny Tompo) | Holy Communion (the README calls it baptism) |
| rakitra, toriteny, tsodrano, vavaka | offering, sermon, benediction, prayer |
| rehetra, maro | all, many |
