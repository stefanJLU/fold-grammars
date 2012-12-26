signature sig_pknot_foldrna(alphabet, comp, compKnot) {
  comp sadd(Subsequence, comp);
  comp cadd(comp, comp);
  comp nil(Subsequence);
  comp drem(Subsequence, comp, Subsequence);
  comp edl(Subsequence, comp, Subsequence);
  comp edr(Subsequence, comp, Subsequence);
  comp edlr(Subsequence, comp, Subsequence);
  comp pk(compKnot);
  compKnot pknot(Subsequence, comp, Subsequence, comp, Subsequence, comp, Subsequence ; int);
  compKnot pkiss(Subsequence, comp, Subsequence, comp, Subsequence, comp, Subsequence, comp, Subsequence, comp, Subsequence ; int);
  comp kndl(Subsequence, compKnot);
  comp kndr(compKnot, Subsequence);
  comp kndlr(Subsequence, compKnot, Subsequence);
  comp sr(Subsequence, comp, Subsequence);
  comp hl(Subsequence,Subsequence,Subsequence);
  comp bl(Subsequence, Subsequence, comp, Subsequence);
  comp br(Subsequence, comp, Subsequence, Subsequence);
  comp il(Subsequence, Subsequence, comp, Subsequence, Subsequence);
  comp ml(Subsequence,comp,Subsequence);
  comp mldl(Subsequence,Subsequence,comp,Subsequence);
  comp mldr(Subsequence,comp,Subsequence,Subsequence);
  comp mldlr(Subsequence,Subsequence,comp,Subsequence,Subsequence);
  comp addss(comp, Subsequence);
  comp incl(comp);
  comp pkml(comp);
  comp frd(comp, Subsequence; int);
  comp emptymid(Subsequence ; int, int);
  comp midbase(Subsequence ; int, int);
  comp middlro(Subsequence ; int, int);
  comp midregion(comp);
  comp middl(Subsequence, comp; int);
  comp middr(comp, Subsequence; int);
  comp middlr(Subsequence, comp, Subsequence; int, int);
  comp bkd(Subsequence, comp; int);
  comp sadd_pk(Subsequence, comp);
  choice [comp] h([comp]);
  choice [compKnot] hKnot([compKnot]);
  
  // following two algebrafunctions are for a "local" mode of pseudoknot program, i.e. if the user asks for the best pseudoknot for the complete input. Leading and trailing bases can be skipped.
  comp localKnot(Subsequence, compKnot, Subsequence);
  comp skipBase(Subsequence, comp);
}
