Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528725;
	b=e0d0aAo3TBh+4/SvyjLqPu6Re79QCfg3I8uhsxzD3FvQKkRHcYM+QM99wDBrvgXGunyh
	 qQfOJXJsm5c2dYhITC7FC98Svr9aHcW5CK5y6wkbO33zWRtmX7+pcpu9deFDYFpbBxO49
	 ICoGsThBAjArek8zVhRNraBQ6/f/Wmb92uE8bnrq2fcY3bSn43QN3OommIkuULEBhD1oR
	 MQ085VAK8ZvVjk7/I6fqB7zsjqX/8EdZQ5HwE0OSnDNLr35g+iJS5G58gP9nPi/bz26SK
	 5cz6RHEvJ6uqb8MVPcivWannRsSOCOqTTcZuP+5H69pS3p9shomW0JzOU+yMgMT76rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528725;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UWV/2wtSmri4o3sL0eBk9QAtoQv6kUUvklQ+1DmEMto=;
	b=sD8dw1hCyJXhD73bkmKAMTbVBFhRGVwiaEXksbLh6YmsYwH4rMf1aztdkGOFunQ+au62
	 LJROFeHZyKGb0OYdE0sl3wKfoMnFfiwuty135X+s6Shmnl9rMDrStxvYGGVtDqy+wxz9f
	 G5S00yFCC4rRzt0g+r4ASFq/3AcytLiDevu0beaPImrUTks15cbyvM8wBbQWJfaHQp3r+
	 Sl7KowTAjLHODJPJiTz3jo6wfRjbi9SYpU0Z0Nno+rfXxDWxfwO2Mi8JbSiF04WBvHhN/
	 eZZnWqtTvTWgcPaZgc1XzJlOsrRWWbXkWkcT0WoIQnSo/oa9lNJyeX3HrE8V3h1xmhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dlWMaQ10;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C4B606A32C;
	Tue, 24 Nov 2026 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dlWMaQ10
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF491F000C0;
	Tue, 24 Nov 2026 13:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795528724;
	bh=UWV/2wtSmri4o3sL0eBk9QAtoQv6kUUvklQ+1DmEMto=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dlWMaQ10wlbTGUugt+naZw+NKoidgo0O2J7/km+IWB1cK3dvXlh0FnAlk6HAlhVep
	 GSiP7huMz9AsrbrZGxqAdzxYJhqOuoBTrGKVhr9ulspjW+DH48zz5r+0G87BWWeHsB
	 MymjlqFa3iKKZ1DIPLWOsTIKj9aYGzeaHVLp9frLZluCqOQ4w7jxBOTJPC4+IBoaYs
	 YOJ+O3X5LU4k8AFn9yfImeeMJwLbwR67sZEZp5NBsVx6T6bsiraLursJAP2BurDtfc
	 EdWWOluQD8hiePgIbXxAFgakvTJUn0ItlfE069e1hS0jIU2DTGHPwhrmgvvzhRAuQ6
	 KmsFXrnYFd26w==
Subject:
 Re: [PATCH] rtnetlink: fix NULL pointer dereference in rtnl_get_link()
From: netdev-bot+sashiko@kernel.org
To: mdshahid03@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 13:58:43 +0000
Message-ID: <179552872338.3135.1493919120916016303@kernel.org>
In-Reply-To: <20261120134548.214126-1-mdshahid03@gmail.com>
References: <20261120134548.214126-1-mdshahid03@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message describes a crash that cannot happen.

--

rtnetlink: fix NULL pointer dereference in rtnl_get_link()

This patch adds a NULL check in rtnl_get_link(). The check covers the case
where the PF_UNSPEC fallback handler table is also NULL, so the function
returns NULL instead of dereferencing tab[msgtype].

> However, the fallback table can also be NULL,for example
> after rtnl_unregister_all(PF_UNSPEC) clears it.
>
> In that cass, dereferencing tab[msgtyp] results in a NULL
> pointer dereference.

[Severity: Medium]
Can rtnl_msg_handlers[PF_UNSPEC] actually become NULL at runtime? Nothing
in the tree seems to call rtnl_unregister_all(PF_UNSPEC). Its callers all
pass a specific family:

  net/can/gw.c:        rtnl_unregister_all(PF_CAN);
  net/ipv6/addrconf.c: rtnl_unregister_all(PF_INET6);
  net/ipv6/af_inet6.c: rtnl_unregister_all(PF_INET6);
  net/ipv6/route.c:    rtnl_unregister_all(PF_INET6);
  net/mpls/af_mpls.c:  rtnl_unregister_all(PF_MPLS);
  net/phonet/pn_dev.c: rtnl_unregister_all(PF_PHONET);

The PF_UNSPEC table is allocated at boot in the __init function
rtnetlink_init():

	rtnl_register_many(rtnetlink_rtnl_msg_handlers);

Nothing frees that table afterwards.

Modules that remove PF_UNSPEC handlers do it through
rtnl_unregister()/rtnl_unregister_many(). Those only clear individual slots:

net/core/rtnetlink.c:rtnl_unregister() {
    ...
	link = rcu_replace_pointer_rtnl(tab[msgindex], NULL);
    ...
}

They never set rtnl_msg_handlers[PF_UNSPEC] to NULL.

The callers in rtnetlink_rcv_msg() already handle a NULL link:

	link = rtnl_get_link(family, type);
	if (!link || !link->doit) {

So the new check looks like harmless defensive code, not a fix for a crash
anyone can reach. Could the commit message say that, or show the real
trigger, with a reproducer or oops trace if there is one? As written, the
subject and body read like a reachable NULL dereference fix, and stable
backport tooling might pick it up as one.

There are also some typos: "cass" should be "case", "msgtyp" should be
"msgtype", and "NULL,for" is missing a space.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120134548.214126-1-mdshahid03%40gmail.com
