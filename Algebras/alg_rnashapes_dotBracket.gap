algebra alg_rnashapes_dotBracket implements sig_rnashapes(alphabet = char, answer = string) {
	string sadd(Subsequence lb,string e) {
		string res;
		append(res, '.');
		append(res, e);
		return res;
	}

	string cadd(string le,string re) {
		string res;
		append(res, le);
		append(res, re);
		return res;
	}

	string cadd_Pr(string le,string re) {
		string res;
		append(res, le);
		append(res, re);
		return res;
	}

	string cadd_Pr_Pr(string le,string re) {
		string res;
		append(res, le);
		append(res, re);
		return res;
	}

	string cadd_Pr_Pr_Pr(string le,string re) {
		string res;
		append(res, le);
		append(res, re);
		return res;
	}

	string ambd(string le,Subsequence b,string re) {
		string res;
		append(res, le);
		append(res, '.');
		append(res, re);
		return res;
	}

	string ambd_Pr(string le,Subsequence b,string re) {
		string res;
		append(res, le);
		append(res, '.');
		append(res, re);
		return res;
	}

	string nil(Subsequence loc) {
		string r;
		return r;
	}

	string nil_Pr(Subsequence loc) {
		string r;
		return r;
	}

	string edl(Subsequence lb,string e) {
		string res;
		append(res, '.');
		append(res, e);
		return res;
	}

	string edr(string e,Subsequence rb) {
		string res;
		append(res, e);
		append(res, '.');
		return res;
	}

	string edlr(Subsequence lb,string e,Subsequence rb) {
		string res;
		append(res, '.');
		append(res, e);
		append(res, '.');
		return res;
	}

	string drem(string e) {
		return e;
	}

	string is(string e) {
		return e;
	}

	string sr(Subsequence lb,string e,Subsequence rb) {
		string res;
		append(res, '(');
		append(res, e);
		append(res, ')');
		return res;
	}

	string hl(Subsequence llb,Subsequence lb,Subsequence region,Subsequence rb,Subsequence rrb) {
		string res;
		append(res, "((",2);
		append(res, '.', size(region));
		append(res, "))",2);
		return res;
	}

	string sp(Subsequence llb,Subsequence lb,string e,Subsequence rb,Subsequence rrb) {
		string res;
		append(res, "((",2);
		append(res, e);
		append(res, "))",2);
		return res;
	}

	string bl(Subsequence lregion,string e) {
		string res;
		append(res, '.', size(lregion));
		append(res, e);
		return res;
	}

	string br(string e,Subsequence rregion) {
		string res;
		append(res, e);
		append(res, '.', size(rregion));
		return res;
	}

	string il(Subsequence lregion,string e,Subsequence rregion) {
		string res;
		append(res, '.', size(lregion));
		append(res, e);
		append(res, '.', size(rregion));
		return res;
	}

	string ml(Subsequence llb,Subsequence lb,string e,Subsequence rb,Subsequence rrb) {
		string res;
		append(res, "((", 2);
		append(res, e);
		append(res, "))", 2);
		return res;
	}

	string mldr(Subsequence llb,Subsequence lb,string e,Subsequence dr,Subsequence rb,Subsequence rrb) {
		string res;
		append(res, "((", 2);
		append(res, e);
		append(res, '.');
		append(res, "))", 2);
		return res;
	}

	string mladr(Subsequence llb,Subsequence lb,string e,Subsequence dr,Subsequence rb,Subsequence rrb) {
		string res;
		append(res, "((", 2);
		append(res, e);
		append(res, '.');
		append(res, "))", 2);
		return res;
	}

	string mldlr(Subsequence llb,Subsequence lb,Subsequence dl,string e,Subsequence dr,Subsequence rb,Subsequence rrb) {
		string res;
		append(res, "((", 2);
		append(res, '.');
		append(res, e);
		append(res, '.');
		append(res, "))", 2);
		return res;
	}

	string mladlr(Subsequence llb,Subsequence lb,Subsequence dl,string e,Subsequence dr,Subsequence rb,Subsequence rrb) {
		string res;
		append(res, "((", 2);
		append(res, '.');
		append(res, e);
		append(res, '.');
		append(res, "))", 2);
		return res;
	}

	string mldladr(Subsequence llb,Subsequence lb,Subsequence dl,string e,Subsequence dr,Subsequence rb,Subsequence rrb) {
		string res;
		append(res, "((", 2);
		append(res, '.');
		append(res, e);
		append(res, '.');
		append(res, "))", 2);
		return res;
	}

	string mladldr(Subsequence llb,Subsequence lb,Subsequence dl,string e,Subsequence dr,Subsequence rb,Subsequence rrb) {
		string res;
		append(res, "((", 2);
		append(res, '.');
		append(res, e);
		append(res, '.');
		append(res, "))", 2);
		return res;
	}

	string mldl(Subsequence llb,Subsequence lb,Subsequence dl,string e,Subsequence rb,Subsequence rrb) {
		string res;
		append(res, "((", 2);
		append(res, '.');
		append(res, e);
		append(res, "))", 2);
		return res;
	}

	string mladl(Subsequence llb,Subsequence lb,Subsequence dl,string e,Subsequence rb,Subsequence rrb) {
		string res;
		append(res, "((", 2);
		append(res, '.');
		append(res, e);
		append(res, "))", 2);
		return res;
	}

	string addss(string e,Subsequence rb) {
		string res;
		append(res, e);
		append(res, '.', size(rb));
		return res;
	}

	string ssadd(Subsequence lb,string e) {
		string res;
		append(res, '.', size(lb));
		append(res, e);
		return res;
	}

	string trafo(string e) {
		return e;
	}

	string incl(string e) {
		return e;
	}

	string combine(string le,string re) {
		string res;
		append(res, le);
		append(res, re);
		return res;
	}

	string acomb(string le,Subsequence b,string re) {
		string res;
		append(res, le);
		append(res, '.');
		append(res, re);
		return res;
	}

	choice [string] h([string] i) {
		//~ return list(minimum(i));
		return i;
	}
}
