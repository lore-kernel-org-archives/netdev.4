Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511557;
	b=VQE2Wl+Cs5zDKgOrWEL3HqCkQZMq8WgbXj63fY2D0PkGAfT/ThUBpdsLm7lA5Ir/idU3
	 Rez/FU6YqHPChKOXaaW5YXMJIMZqWkdIj3YtlUCA8o3EVKFhfGdOPCmcTa5c3PW1OdDhV
	 i9LeJ//xOm/kwc7pPizhMAiHUlhOIZoRHJ7dNjzNplWuCiF8bmUR+KkCe7UO91IzPCmuf
	 bgrYMB9Apek15/kyFasjEsOGRVGAJJVge2UgKpuZdkygD/adDJUUO0PMqXK3/ByuNbrNV
	 FWs9rsfnq3WKxwGTbxIcUgZsIyGv1+XD/2l31DDH9ra0Fgz59h27hCBZv6fc3Jf+pPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511557;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wBHKoeRWleVFfHl940Ty7A0iRJsiM2iMZXzTcQH2DLg=;
	b=lBeJgFKxJOg/7xh4feSJo0B4c0+dUEzBHIC09m6PWlGi2Uw3tiTxxVDBogQCbl6jv/Y4
	 We595ZAI8aGsMzseDx46CQnjChxESojCZM+XZ28r6dvdBFzKee412bbSFN34Y8AsRQH+P
	 rz7mbmY7bbrFxLQhCwTVor895Ubqbezm9gq0hha3S8X/0FO05LsXKBuRrxIjaQw8CqlmT
	 eT2ofhTihQWCgZDNRTPnyI5Uldxzjt7A8Dc2ZE3qs2Llpe/h5mcHciPrrb5Y84JEIs2dP
	 FpimhmwxK9iiYSajQ7w0L0AHiebzsz0x1A7jKD38FxZN6P+G77R5fsys9frbFCTNMZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i2ngdyzo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEF2606A33D;
	Tue, 24 Nov 2026 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i2ngdyzo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B851F000F0;
	Tue, 24 Nov 2026 09:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795511557;
	bh=wBHKoeRWleVFfHl940Ty7A0iRJsiM2iMZXzTcQH2DLg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=i2ngdyzoAvTCoKm/2jroeUELl4YP9mAXdmom0NPpo2cz2Jpfe2C0h2pk03CbMf8zr
	 i+vhsI0oE9zk6yq1L9FZTmdpAEkWOPL2BGDs7d33KrfYN61Vth3afL8b+A940vgtsQ
	 7shCQAWig/vRPF38URP30Lwc+Iy5mQrwLo+mR9DT8fZeQU1PkYw6Y3pLqE2GinXxmI
	 +9l0J+d4KpGfZhK7o8IL+/T+WIPVFcFPNIjXW9WjJynsFZyPmg8MZILbn9iMpbYS8x
	 fuAu3zBXBITwOK5yYXTQgiJa2h11q92QoQ7ihWoBYJYAipqCCOms6QV7DMBaUOYgR/
	 ynN64DAFwGIDQ==
Subject:
 Re: [PATCH net] l2tp: require CAP_NET_ADMIN to join the l2tp multicast group
From: netdev-bot+sashiko@kernel.org
To: shyckless@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, stephen@networkplumber.org, linux-kernel@vger.kernel.org,
 maoyixie.tju@gmail.com, netdev@vger.kernel.org, horms@kernel.org
Date: Tue, 24 Nov 2026 09:12:36 +0000
Message-ID: <179551155628.3135.2386849565665238708@kernel.org>
In-Reply-To: <20261120-l2tp-mcast-perm-v1-1-22dbffa88655@gmail.com>
References: <20261120-l2tp-mcast-perm-v1-1-22dbffa88655@gmail.com>
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

- [Medium] The commit message says the patch stops unprivileged listeners
  in the tunnel's own netns from getting l2tp notifications ("This patch…

--

l2tp: require CAP_NET_ADMIN to join the l2tp multicast group

This commit marks the l2tp generic netlink multicast group with
GENL_MCAST_CAP_NET_ADMIN. With the flag set, genl_bind() requires
CAP_NET_ADMIN in the user namespace that owns the network namespace before
a socket can join the group. The goal is to keep unprivileged listeners in
the tunnel's namespace from receiving tunnel and session notifications,
which include L2TPv3 cookies.

> diff --git a/net/l2tp/l2tp_netlink.c b/net/l2tp/l2tp_netlink.c
> index a07009d4cb009..c442e953df66a 100644
> --- a/net/l2tp/l2tp_netlink.c
> +++ b/net/l2tp/l2tp_netlink.c
> @@ -31,6 +31,7 @@ static struct genl_family l2tp_nl_family;
>  static const struct genl_multicast_group l2tp_multicast_group[] = {
>  	{
>  		.name = L2TP_GENL_MCGROUP,
> +		.flags = GENL_MCAST_CAP_NET_ADMIN,
>  	},
>  };

[Severity: Medium]
The commit message says "This patch handles listeners in the tunnel's own
namespace." Does that hold when l2tp_netlink is built as a module and has
not been loaded yet?

genl_bind() only checks the new flag when a registered family owns the
group ID:

net/netlink/genetlink.c:genl_bind() {
    ...
	idr_for_each_entry(&genl_fam_idr, family, id) {
		...
		i = group - family->mcgrp_offset;
		if (i < 0 || i >= family->n_mcgrps)
			continue;

		grp = &family->mcgrps[i];
		if ((grp->flags & GENL_MCAST_CAP_NET_ADMIN) &&
		    !ns_capable(net->user_ns, CAP_NET_ADMIN))
			ret = -EPERM;
    ...
}

If no family owns the ID, ret stays 0 and the join succeeds. Apart from the
NL_CFG_F_NONROOT_RECV check, netlink_setsockopt(NETLINK_ADD_MEMBERSHIP)
only compares the ID against nlk->ngroups.

It looks like an unprivileged user in the same netns could do this:

  setsockopt(NETLINK_ADD_MEMBERSHIP) on every free genetlink group ID
  send CTRL_CMD_GETFAMILY "l2tp"
    ctrl_getfamily()->request_module()     (MODULE_ALIAS_GENL_FAMILY("l2tp"))
      genl_register_family()
        genl_allocate_reserve_groups()
          find_first_zero_bit()            <- returns an ID already joined

genl_validate_assign_mc_groups() does not remove sockets that are already
subscribed to that ID. Later notifications sent through
genlmsg_multicast_netns() would then reach the pre-joined socket, and
genl_bind() never checks the new flag for it. Those notifications include
the cookies that l2tp_nl_session_send() adds.

The note below the --- line mentions a companion patch, "genetlink: Reject
joining multicast groups no family owns". That note is dropped when the
patch is applied, and genl_bind() is unchanged in this tree.

This patch is Cc: stable. Could it be sent as a series with the genetlink
fix, or could the commit message name that dependency? Otherwise a backport
of this commit alone would leave the cookie leak reachable on CONFIG_L2TP=m
builds.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-l2tp-mcast-perm-v1-1-22dbffa88655%40gmail.com
