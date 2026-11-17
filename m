Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945567;
	b=5mFzfNNHtSWFJLP+NU7IV+jdWsPwZP2DtE4QuW3M0sbtD5EMm8GS1uqaQeM4DAWeUorR
	 7tOvHiVl2/cK2dIt5iU4FnZvpuXf1lOwWQejGqrw34tdOumnN2/2m7rLkYVAVFVodu10A
	 N5GFUOT5YCy0AK4kBtITvGNoBFpw5sezz2cV9kwJFzsBMpmKdvKatSzfDuyqaGJpFrmsM
	 yynHzwTG5HPbAIDEHntyilk6WeMKSn0WQ4IRJnETHQQW0c1W3okltBPfCW1qVfA7IdGT2
	 h3xIcethtH027vitddC3GG6+FZgL1CeS0DJuly77+7QxXEdZeiku+DPsAeSTKgKJ8zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945567;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=IQR3igTBNU7ZDEZUBg66UUtdh/DXmx8v8trPPrK13qs=;
	b=LZm6DsP7HdM3E7o5luSblP+6P6X0/t/iPs+eSaZ9DeZxeQjy5dzKzHfwxp8P7zqYgR8V
	 kqoOsai1WLJ5ZxLviHRyMH5bn5z+l58PRZlD8z72LJ4kB+NLRoGlwVek2l8DHOh2gWlT9
	 QKvECMOYxFpfFwRH1zcmaKXS85VcF2UY5yjwOFK5DY1hTQAX2kdQ36I+mHRvwithMxG1U
	 lb4f32fuJBXOtKSfl0vSnu5OXwX77yk8mx3QJW4r6bf1vvS+lgjqwowEatKR6z0ycujy2
	 8RixUdr26z76pgLufRyBV2cjYWTNo4k05sJ3AWxsWQX9pt3N6xJ2FmogkWoApwFJuTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lLfQ75Qm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6AE606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lLfQ75Qm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F291F000C5;
	Tue, 17 Nov 2026 19:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945567;
	bh=IQR3igTBNU7ZDEZUBg66UUtdh/DXmx8v8trPPrK13qs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lLfQ75QmVFWytUrhPBcecjg/6vm7k4rjunCVgK/Xzzo5Fbt8MRFu1cogsGN5I7X20
	 dGw5EUkzkt/Dr77mNzDxgOuB0q7Edws1cmBQZGp9BYRq1A2EFnjWcRybUS6PCuYWJH
	 gdgonkOvBqXO0BrjQfLKsWov0CrQ4U3hwbZAhCPbgLsVo2XbvY1whxXNzUfSG6fsAW
	 Tca0dpL9slbhaP97SvSzG9dHsCSPEGaPDv6sSaQHTH7oSkFC6Sv2K4P2eDoulLHrtt
	 +Yb/3ua67qnaFJz7c70ibv/ynRqFSzy+aRPd9y89B09bDQ3K/tN+uaaEUhZCkMMsrV
	 prKPNeR5+fZDA==
Subject: Re: [PATCH net-next v2] net/sched: em_text: pad the text pattern in
 the ematch dump
From: netdev-bot+sashiko@kernel.org
To: victor@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, jhs@mojatatu.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, sashiko-bot@kernel.org
Date: Tue, 17 Nov 2026 19:59:26 +0000
Message-ID: <179494556684.3136.3254895311432959761@kernel.org>
In-Reply-To: <QDISC-7SHE.v2.r0.20261109072128-1@mojatatu.com>
References: <QDISC-7SHE.v2.r0.20261109072128-1@mojatatu.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says "A padded text ematch is the same size
  as the request that installed it ... Since the dump is no larger than…
- [Low] The patch fixes a long-standing, user-visible netlink dump bug
  but carries no Fixes: tag.
- [Low] The commit message describes the impact as "the ematch list is
  therefore misparsed", and its reproducer needs two text ematches.

--

net/sched: em_text: pad the text pattern in the ematch dump

This patch changes em_text_dump() to append the text pattern with
nla_put_nohdr() instead of nla_append(). The pattern is now padded to a
4-byte boundary, so the next ematch in the dump stays aligned. The commit
message also argues that a padded dump can never be larger than the
request that installed the filter.

Link: https://lore.kernel.org/netdev/e0f4776a-0457-4069-9f79-3c97de2a54d0@redhat.com/

> This is a followup of commit 9c572a83037a ("net/sched: fix potential
> stack infoleak in em_text_dump()") as reported by Sashiko.

[Severity: Low]
Should this patch have a Fixes: tag? Commit 9c572a83037a fixed a different
issue: it zero-initialized conf to plug a stack infoleak. It did not
introduce the misalignment.

The unpadded append goes back to the original em_text implementation in
d675c989ed2d ("[PKT_SCHED]: Packet classification based on textsearch
(ematch)"):

    RTA_PUT_NOHDR(skb, sizeof(conf), &conf);
    RTA_APPEND(skb, conf.pattern_len, textsearch_get_pattern(tm->config));

add93b610a4e ("[NET_SCHED]: Convert classifiers from rtnetlink to new
netlink API") converted this directly to nla_put_nohdr() plus nla_append(),
so the bug stayed in.

Without something like:

    Fixes: d675c989ed2d ("[PKT_SCHED]: Packet classification based on textsearch (ematch)")

the stable tooling may not pick this up.

> tcf_em_tree_dump() records the raw span as the ematch entry's nla_len and
> then writes the next ematch's nlattr header at that unaligned tail.
> Userspace walks the list with RTA_NEXT()/NLA_NEXT(), which rounds each
> attribute length up to four bytes, so it looks for the next entry at an
> aligned offset the kernel did not write.  The ematch list is therefore
> misparsed as soon as a text ematch has a pattern length that is not a
> multiple of four.

[Severity: Low]
Is the impact wider than the ematch list? em_text_dump() leaves the skb
tail unaligned. tcf_em_tree_dump() then uses that raw tail for
match_start->nla_len and for both nla_nest_end() calls.

cls_basic_dump() and cls_cgroup_dump() close TCA_OPTIONS at the same
unaligned tail and then write the action stats after it:

net/sched/cls_basic.c:basic_dump() {
    ...
	if (nla_nest_end_safe(skb, nest) < 0)
		goto nla_put_failure;

	if (tcf_exts_dump_stats(skb, &f->exts) < 0)
    ...
}

tcf_fill_node() then sets nlh->nlmsg_len = skb_tail_pointer(skb) - b,
which is also unaligned. In a filter dump, the next filter's nlmsghdr from
nlmsg_put() and the NLMSG_DONE from netlink_dump() go into the same skb at
that unaligned offset.

Userspace NLMSG_NEXT() steps by NLMSG_ALIGN(nlmsg_len), so every later
message in that recv buffer is read from the wrong offset. This means a
single text ematch with pattern_len % 4 != 0 can corrupt a whole tc filter
show batch. The reproducer in the commit message, by contrast, uses two
text ematches.

Could the commit message describe this, so stable maintainers can judge
backport priority?

> diff --git a/net/sched/em_text.c b/net/sched/em_text.c
> index bc45edb8c03bf..1e7b41e579e24 100644
> --- a/net/sched/em_text.c
> +++ b/net/sched/em_text.c
> @@ -128,8 +128,8 @@ static int em_text_dump(struct sk_buff *skb, struct tcf_ematch *m)
>  
>  	if (nla_put_nohdr(skb, sizeof(conf), &conf) < 0)
>  		goto nla_put_failure;
> -	if (nla_append(skb, conf.pattern_len,
> -		       textsearch_get_pattern(tm->config)) < 0)
> +	if (nla_put_nohdr(skb, conf.pattern_len,
> +			  textsearch_get_pattern(tm->config)) < 0)

[Severity: Medium]
Does the size argument in the commit message hold when the request uses
unaligned trailing lengths? The commit message says:

  Since the dump is no larger than the request, the padding cannot push the
  dumped TCA_OPTIONS past U16_MAX.

The kernel does not seem to require the request lengths to be 4-byte
aligned. nla_ok() only checks that nla_len fits in the remaining length.
So the last attribute at each nesting level can have an unaligned nla_len,
including in tcf_em_tree_validate():

    for (idx = 0; nla_ok(rt_match, list_len); idx++) {

and em_text_change() only checks:

    if (len < sizeof(*conf) || len < (sizeof(*conf) + conf->pattern_len))
        return -EINVAL;

rtm_tca_policy does not validate TCA_OPTIONS at all, and cgroup_policy
and em_policy only mark the nests as NLA_NESTED.

A hand-built RTM_NEWTFILTER for cls_cgroup with exact, unpadded lengths
appears to be accepted:

    TCA_OPTIONS                nla_len 65533
      TCA_CGROUP_EMATCHES      nla_len 65529
        TCA_EMATCH_TREE_HDR    nla_len 8
        TCA_EMATCH_TREE_LIST   nla_len 65517
          ematch               nla_len 65513 (data_len 65501 = 24 + 65477)

Before this patch, that filter dumps back to an identical 65533-byte
TCA_OPTIONS. With nla_put_nohdr(), the pattern now takes
NLA_ALIGN(65477) = 65480 bytes, so the dumped sizes become:

    ematch 65516, list 65520, TCA_CGROUP_EMATCHES 65532,
    TCA_OPTIONS 65536

The dump then fails:

cls_cgroup_dump()
  nla_nest_end_safe() -> -EMSGSIZE
tcf_fill_node() -> -EMSGSIZE
tfilter_notify_prep()
    if (size > U16_MAX + NLMSG_GOODSIZE)
        return ERR_PTR(-EMSGSIZE);

After that, RTM_GETTFILTER for this filter always fails. The RTM_NEWTFILTER
notification is never sent, and tfilter_del_notify() deletes the filter
without a notification. Any pattern_len from 65477 to 65479 triggers this,
and cls_basic has the same 56-byte overhead.

Should em_text_change() reject a pattern_len whose padded size cannot be
dumped? If not, the claim in the commit message should be corrected.

>  		goto nla_put_failure;
>  	return 0;
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-7SHE.v2.r0.20261109072128-1%40mojatatu.com
