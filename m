Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600712;
	b=ZD+/oQarYN9DOPQZXcegFLSwLKvhjw4V/QA+Iu4S831wU/BatDiSYNxUWujEBjbD5sv6
	 Ny6RUlu9N5Bb9t976PBHCBukxwGBDUAPZWdzfQIXwJFY5+o7DHBlBGOQs8rFZgwnow33K
	 j66ZlICbB60J6nILY4TJ7NmzunXeUYt1JqW9msvMWIyNr2z3rrmZA6atdvgU1iuE2mXPW
	 mbXjTDz8sytDLYbUD0BOkhhsO/SEOwYD2itYxvhRSUmb0Uq+TjNSHE9MM89BMqbCcLWJM
	 lO4J4z2zAZoJBFaQS5RcO/38/kk8wxikcxehNQlAChsrOAPe0qPCN3BFGIj5spTAQ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600712;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=6w74sigzWEjnq/Iez96NvmzHs9qvS5TWdCAthb5DA+s=;
	b=c4sCySOv8O20B3eDibFBkYV86CkArib1sE767Z3kx+W8TxhTT1W2qrGOwqgydL9GBO5P
	 869GGG370ZyY3p9yNvNbEoPuWdCOMMG3A6q1iGi3JVCqUC3kBBStUr23HtCr1TGht+xqg
	 YAb99lxvspGrtAZp9HYQlpQoRYJuqwJVBI9XEsiWlgErFP37YG9JTrRi+syKHFnJHXu3E
	 s4JmZmf8EtPqT6pdXqaGGFvVjAG3op8L+3h8Jw1ni7Ai+dCWz3KySallEXxnuh0nB31tD
	 spoLuJJY3NB2P33EbSYEgrvvuE/Fd7GjVkqlWPj+ls9q+4hljrQU8Z894hZA07WxA7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bzt1AqPN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E2C606A321;
	Wed, 25 Nov 2026 09:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bzt1AqPN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941251F000CA;
	Wed, 25 Nov 2026 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795600712;
	bh=6w74sigzWEjnq/Iez96NvmzHs9qvS5TWdCAthb5DA+s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bzt1AqPNyDA9/kRdAN7LdrA5/I08EcsW7Wnfl6gR5MU8PK99NGPxyT/jSOqQ1vTb8
	 eD90tzrPAwPgXS57iQDA5hIHGGzVdanxm3dinwgiqwm3xtpR2yeH4mX+xqqy6EeU2C
	 4VsCqhvOsVuV6VvrPAVgC7Fx/EaJUy7Yb9LdCZ77r6imN66CAyk6g1mHmLF6syQ+NT
	 Kxctxj5TMLwqhi7islNGVDjA/2Z2YTl88XeUjLBUw31ygOIjwnwG2iwA7NQjqUYbir
	 dev7KKR137py3Sycf0g7EDanB2b6vz7bRNGH+qoKkpnaqRkkwJEpOxs1MLxzjBIjJU
	 5TRBRcnQjB5kA==
Subject: Re: [PATCH net v2] l2tp: require CAP_NET_ADMIN to join the l2tp
 multicast group
From: netdev-bot+sashiko@kernel.org
To: shyckless@gmail.com
Cc: pabeni@redhat.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@kernel.org, netdev@vger.kernel.org, maoyixie.tju@gmail.com,
 anilkaushikwireless@gmail.com, stephen@networkplumber.org,
 linux-kernel@vger.kernel.org, horms@kernel.org
Date: Wed, 25 Nov 2026 09:58:31 +0000
Message-ID: <179560071114.3135.2532610269837690017@kernel.org>
In-Reply-To: <20261124-l2tp-mcast-perm-v2-1-416741ccb334@gmail.com>
References: <20261124-l2tp-mcast-perm-v2-1-416741ccb334@gmail.com>
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

- [Medium] On its own, this patch does not stop an unprivileged local
  user from receiving l2tp tunnel and session notifications, including…

--

l2tp: require CAP_NET_ADMIN to join the l2tp multicast group

This patch marks the l2tp generic netlink multicast group with
GENL_MCAST_CAP_NET_ADMIN. After this, genl_bind() requires CAP_NET_ADMIN
in the user namespace that owns the network namespace before a socket can
join the group. Tunnel and session notifications, including L2TPv3
cookies, then no longer reach unprivileged listeners that join after the
family is registered.

Link: https://lore.kernel.org/all/20261123155503.2497063-1-anilkaushikwireless@gmail.com/ [1]

> diff --git a/net/l2tp/l2tp_netlink.c b/net/l2tp/l2tp_netlink.c
> index a07009d4cb009..c442e953df66a 100644
> --- a/net/l2tp/l2tp_netlink.c
> +++ b/net/l2tp/l2tp_netlink.c
> @@ -31,6 +31,7 @@ static struct genl_family l2tp_nl_family;
>  static const struct genl_multicast_group l2tp_multicast_group[] = {
>  	{
>  		.name = L2TP_GENL_MCGROUP,
> +		.flags = GENL_MCAST_CAP_NET_ADMIN,

[Severity: Medium]
The commit message says the pre-registration case remains open, and gives
this example:

  "A socket that joins the ID before the l2tp family is registered, for
  example before l2tp_netlink is loaded, keeps getting the notifications."

Can an unprivileged user also control when that registration happens? If
so, the leak is still reachable as long as this patch is applied
without [1].

The new flag is only checked in genl_bind(), and only when a registered
family owns the requested group ID:

net/netlink/genetlink.c:genl_bind() {
    ...
		i = group - family->mcgrp_offset;
		if (i < 0 || i >= family->n_mcgrps)
			continue;
    ...
}

For an ID that no family owns, ret stays 0 and the join succeeds.

netlink_setsockopt(NETLINK_ADD_MEMBERSHIP) checks only
NL_CFG_F_NONROOT_RECV, which genetlink sets, and that val - 1 is below
nlk->ngroups. So any free bit in the genl group bitmap can be joined
without a capability.

When l2tp_netlink registers, genl_allocate_reserve_groups() picks a free
bit with find_first_zero_bit(), and genl_validate_assign_mc_groups()
assigns it:

	family->mcgrp_offset = first_id;

On this path __netlink_clear_multicast_users() is never called. It is
only called from genl_unregister_mc_groups(), so existing subscribers
keep their membership.

CTRL_CMD_GETFAMILY has no admin permission flag. For an unknown name,
ctrl_getfamily() loads the module:

net/netlink/genetlink.c:ctrl_getfamily() {
    ...
		if (res == NULL) {
			genl_unlock();
			up_read(&cb_lock);
			request_module("net-pf-%d-proto-%d-family-%s",
				       PF_NETLINK, NETLINK_GENERIC, name);
    ...
}

l2tp_netlink declares MODULE_ALIAS_GENL_FAMILY("l2tp"), so this sequence
looks possible:

  unprivileged user:
    NETLINK_ADD_MEMBERSHIP on every free genl group ID
      genl_bind() returns 0 (no owner)
    CTRL_CMD_GETFAMILY name="l2tp"
      ctrl_getfamily()->request_module()
        l2tp_nl_init() registers the family on a bit already joined

  root:
    creates an L2TPv3 tunnel and session with cookies
      l2tp_session_notify()->genlmsg_multicast_netns()

The message is built by l2tp_nl_session_send(), which includes
L2TP_ATTR_COOKIE and L2TP_ATTR_PEER_COOKIE. It reaches the unprivileged
socket, and membership is never checked again.

Since the case here can be triggered on demand on any system with module
autoloading where l2tp_netlink is not loaded yet, should the commit
message say that an unprivileged user can trigger the load? Should [1]
also be merged with or before this patch, and be listed as a hard
dependency for the stable backports?

>  	},
>  };
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124-l2tp-mcast-perm-v2-1-416741ccb334%40gmail.com
