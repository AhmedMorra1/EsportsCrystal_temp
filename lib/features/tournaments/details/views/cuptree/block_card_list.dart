import 'package:esports_crystal/features/tournaments/details/models/cup_tree_round.dart';
import 'package:flutter/material.dart';

import 'block_card.dart';

class BlockCardList extends StatelessWidget {
  const BlockCardList({Key? key, required this.cupTreeRound}) : super(key: key);
  final CupTreeRound cupTreeRound;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          cupTreeRound.blocks!.length,
          (index) => BlockCard(
                cupTreeRoundBlock: cupTreeRound.blocks![index],
              )),
    );
  }
}
