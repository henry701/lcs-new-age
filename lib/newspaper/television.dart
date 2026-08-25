import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/creature/name.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/newspaper/display_news.dart';
import 'package:lcs_new_age/newspaper/news_story.dart';
import 'package:lcs_new_age/politics/views.dart';
import 'package:lcs_new_age/saveload/load_cmv_movies.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/game_options.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

// CMV title cards are rasterized, so use a translated copy rather than a
// catalog lookup that cannot affect the movie's glyphs.
String televisionMovieAssetFilename(String filename) =>
    LcsI18n.currentLocale == 'pt_BR' && filename == 'glamshow.cmv'
    ? 'glamshow_pt_BR.cmv'
    : filename;

void renderTelevisionOverlay({
  required int topY,
  required int x,
  required int frameWidth,
  required String body,
}) {
  final border = '─' * (frameWidth - 2);
  final lines = wrapConsoleText(
    LcsI18n.processString(body, null),
    frameWidth - 2,
  );
  if (lines.length > 3) {
    throw StateError('Television body exceeds three prose rows');
  }

  setColor(white);
  final topBorder = ['┌', border, '┐'].join();
  console.mvaddstr(topY, x, topBorder, noTranslate: true);
  for (var i = 0; i < 3; i++) {
    final prose = i < lines.length ? lines[i].padRight(frameWidth - 2) : '';
    final framedProse = ['│', prose, '│'].join();
    console.mvaddstr(topY + 1 + i, x, framedProse, noTranslate: true);
  }
  final bottomBorder = ['└', border, '┘'].join();
  console.mvaddstr(topY + 4, x, bottomBorder, noTranslate: true);
}

Future<void> runTelevisionNewsStories() async {
  for (int n = newsStories.length - 1; n >= 0; n--) {
    bool del = false;
    Map<View, double> beforeOpinion = Map.from(
      gameState.politics.publicOpinion,
    );
    if (newsStories[n].type == NewsStories.majorEvent) {
      if (newsStories[n].liberalSpin) {
        switch (newsStories[n].view) {
          case View.policeBehavior:
            if (!gameOptions.lighterTone && oneIn(5)) {
              newsStories[n].headline = "POLICE BRUTALITY";
              newsStories[n].body =
                  "The police have brutally beaten a black man in Los Angeles.  "
                  "The entire thing is caught on video by a passerby and it "
                  "saturates the news.";
              await movie.loadmovie("lacops.cmv");
              await movie.playmovie(0, 0, remapSkinTones: true);

              renderTelevisionOverlay(
                topY: 19,
                x: 13,
                frameWidth: 65,
                body: newsStories[n].body,
              );

              await getKey();

              del = true;
            }
          case View.cableNews:
            newsStories[n].publication = Publication.cableNews;
            final showFirstWord = [
              "Inside",
              "Hard",
              "Lightning",
              "Washington",
              "Capital",
            ].random;
            final showSecondWord = [
              "Record",
              "Night",
              "Talk",
              "Insider",
              "Report",
            ].random;
            final bname = generateFullName(Gender.whiteMalePatriarch).firstLast;
            final showName =
                LcsI18n.processString("{first} {second} with {host}", {
                  "first": LcsI18n.tr(showFirstWord),
                  "second": LcsI18n.tr(showSecondWord),
                  "host": bname,
                });
            final str = LcsI18n.processString(
              "Tonight on a Cable News channel: {showName}",
              {"showName": showName},
            );
            newsStories[n].headline = showName.toUpperCase();
            newsStories[n].body =
                "A Cable News anchor just accidentally let a Liberal guest "
                "finish a sentence.  Many viewers across the nation were "
                "listening.";
            erase();
            mvaddstrc(0, 39 - ((str.length - 1) >> 1), white, str);
            mvaddstr(16, 20, bname);
            move(17, 20);
            switch (lcsRandom(3)) {
              case 0:
                addstr("Washington, DC");
              case 1:
                addstr("New York, NY");
              case 2:
                addstr("Atlanta, GA");
            }
            move(16, 41);
            addstr(generateFullName(Gender.nonbinary).firstLast);
            move(17, 41);
            switch (lcsRandom(4)) {
              case 0:
                addstr("Eugene, OR");
              case 1:
                addstr("San Francisco, CA");
              case 2:
                addstr("Cambridge, MA");
              case 3:
                addstr("Ithaca, NY");
            }
            await movie.loadmovie("newscast.cmv");
            await movie.playmovie(1, 1, remapSkinTones: true);
            renderTelevisionOverlay(
              topY: 19,
              x: 13,
              frameWidth: 65,
              body: newsStories[n].body,
            );
            await getKey();
            del = true;
          default:
        }
      } else {
        switch (newsStories[n].view) {
          case View.ceoSalary:
            newsStories[n].publication = Publication.cableNews;
            newsStories[n].headline = "THE AMERICAN DREAM";
            newsStories[n].body =
                "A new show glamorizing the lives of the rich begins "
                "airing this week.  With the nationwide advertising "
                "blitz, it's bound to be popular.";
            await movie.loadmovie(televisionMovieAssetFilename("glamshow.cmv"));
            await movie.playmovie(0, 0);
            renderTelevisionOverlay(
              topY: 19,
              x: 13,
              frameWidth: 65,
              body: newsStories[n].body,
            );
            await getKey();
            del = true;
          case View.cableNews:
            newsStories[n].publication = Publication.cableNews;
            newsStories[n].headline = "NEW ANCHOR";
            newsStories[n].body =
                "A major Cable News channel has hired a slick new anchor "
                "for one of its news shows.  Guided by impressive "
                "advertising, America tunes in.";
            await movie.loadmovie("anchor.cmv");
            await movie.playmovie(0, 0, remapSkinTones: true);
            renderTelevisionOverlay(
              topY: 19,
              x: 13,
              frameWidth: 65,
              body: newsStories[n].body,
            );
            await getKey();
            del = true;
          case View.nuclearPower:
            newsStories[n].publication = Publication.cableNews;
            newsStories[n].headline = "GENIUS MUTANT";
            newsStories[n].body =
                "A mutant affected by nuclear power appears on a popular "
                "talk show and demonstrates his superhuman intelligence and "
                "charisma, showcasing the upsides of consuming nuclear waste.";
            erase();
            await movie.loadmovie("abort.cmv");
            await movie.playmovie(0, 0, remapSkinTones: true);
            renderTelevisionOverlay(
              topY: 18,
              x: 11,
              frameWidth: 65,
              body: newsStories[n].body,
            );
            await getKey();
            del = true;
          default:
        }
      }
    }
    if (del) {
      if (newsStories[n].liberalSpin) {
        changePublicOpinion(newsStories[n].view!, 20);
      } else {
        changePublicOpinion(newsStories[n].view!, -20);
      }
      newsStories[n].effects = Map.fromEntries(
        gameState.politics.publicOpinion.entries
            .where((entry) => entry.value != beforeOpinion[entry.key])
            .map(
              (entry) =>
                  MapEntry(entry.key, entry.value - beforeOpinion[entry.key]!),
            ),
      );

      newsStories[n].unread = false;
      archiveNewsStory(newsStories[n]);
      newsStories.removeAt(n);
    }
  }
}
