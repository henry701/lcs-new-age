import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/common_display/print_creature_info.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_mode.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/utils/colors.dart';

const int _partyFirstRow = 2;
const int _partyVisibleRows = 6;

void printParty({bool fullParty = false, ShowCarPrefs? showCarPrefs}) {
  showCarPrefs ??= mode == GameMode.base
      ? ShowCarPrefs.showPreferences
      : ShowCarPrefs.showActualCar;
  List<Creature> party = activeSquad?.members ?? [];
  setColor(lightGray);
  eraseArea(startY: 2, endY: 8);
  if (activeSquadMember != null && !fullParty) {
    printCreatureInfo(activeSquadMember!, showCarPrefs: showCarPrefs);
    mvaddstrc(1, 0, white, (activeSquadMemberIndex + 1).toString());
  } else {
    addHeader({
      0: "#",
      2: "CODE NAME",
      ManagementTableLayout.partySkillHeaderX: "SKILL",
      ManagementTableLayout.partyWeaponX: "WEAPON",
      44: "ARMOR",
      59: "HEALTH",
      ManagementTableLayout.transportX: "TRANSPORT",
    });
    // The fixed console reserves rows 2–7 for the roster and row 8 for its
    // delimiter. Imported/debug saves can contain more members than the
    // normal six-person squad, so reserve the last roster row for an overflow
    // marker instead of letting extra rows overwrite the frame below.
    final visiblePartyCount = party.length > _partyVisibleRows
        ? _partyVisibleRows - 1
        : party.length;
    for (int p = 0; p < visiblePartyCount; p++) {
      final member = party[p];
      addOptionTextFitted(
        _partyFirstRow + p,
        0,
        String.fromCharCode('1'.codePoint + p),
        "{key} {name}",
        ManagementTableLayout.nameWidth,
        params: {
          "key": String.fromCharCode('1'.codePoint + p),
          "name": member.name,
        },
        noTranslate: true,
        baseColorKey: ColorKey.white,
      );
      if (member.isHoldingBody) addstrc(pink, "+H");
      printSkillSummary(
        _partyFirstRow + p,
        ManagementTableLayout.partySkillX,
        member,
        showWeaponSkill: true,
      );
      move(_partyFirstRow + p, ManagementTableLayout.partyWeaponX);
      setWeaponColor(member);
      printWeapon(member, maxWidth: ManagementTableLayout.partyWeaponWidth);
      setColorForArmor(member);
      mvaddstrFitted(
        _partyFirstRow + p,
        ManagementTableLayout.partyArmorX,
        member.clothing.shortName,
        ManagementTableLayout.partyArmorWidth,
      );
      // Keep one separator column before the transport cell; Portuguese armor
      // labels can be longer than their English counterparts.
      printHealthStat(
        _partyFirstRow + p,
        ManagementTableLayout.partyHealthX,
        member,
        small: true,
        maxWidth: ManagementTableLayout.partyHealthWidth,
      );
      setColor(lightGray);
      move(_partyFirstRow + p, ManagementTableLayout.transportX);
      printTransportation(
        member,
        showCarPrefs,
        maxWidth: ManagementTableLayout.transportWidth,
      );
    }
    if (visiblePartyCount < party.length) {
      mvaddstrFitted(
        _partyFirstRow + visiblePartyCount,
        0,
        "+${party.length - visiblePartyCount}…",
        console.width,
        noTranslate: true,
      );
    }
  }
  makeDelimiter();
}

void printSkillSummary(
  int y,
  int x,
  Creature c, {
  bool showWeaponSkill = true,
}) {
  int skill = 0;
  bool bright = false;
  for (Skill sk in Skill.values) {
    skill += c.rawSkill[sk]!;
    if (c.rawSkillXP[sk]! >= 100 + (10 * c.rawSkill[sk]!) &&
        c.rawSkill[sk]! < c.skillCap(sk)) {
      bright = true;
    }
  }
  setColor(bright ? white : lightGray);
  final summary = showWeaponSkill
      ? "$skill/${c.weaponSkill}"
      : skill.toString();
  mvaddstrFitted(y, x, summary, 5, noTranslate: true);
}
