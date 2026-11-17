Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940675;
	b=iUubGI3XKr7sWhYem6Kca3I7Ltg0a+rOOLbA96hfCVu2kia/OTLFW9sMIMA0ZJqJJegW
	 OGcaC/CRp22m1Iq0riDSytwx+B0bIw4zbmqgJHqAi3roIp/LphABe3u7IEBjlD82RmBWT
	 ml3HV0K7wl8f1yz6MR3p3VcQfE8vSPdHHsW0JcCC96c4jV6tdB6//ZtH8u+FidQF4R0WK
	 EQndOHgciUj53zEYZkBEdBi+iV0j4pIPnKK2eEAUC/IgbylYm3DJkC/q/3CHH27OMBxaN
	 UFy1jvOGGMTEP7zdQMhRgcKKY+Y88oeU/b7rFu2ai2erRjawV1h7/YPenOsK7jnx7zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940675;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=geeUyO7cZivhCRc1DxWCwBnoorGlSSok9IVOjAm8wwM=;
	b=F+VRQGoKu6o6JfbL1GvRS7Tra6NBoLOVnwlky/neLOxg4peRl9SekyPl5a0tMsmTiPEN
	 vGQ5BMy2JYFZQS9JhqkhWp+W1B8ZIHb6Bpc4FdRks5k9LWEKl+8QMCzMIRi67yQ4U8z71
	 qvNP6W6sk2Shff2JkoXC9zbIV2FCp+wbRh078XNEaJeKAaK3sroUr6hOfiR0OjGnrXxHs
	 Rz/BscmcSlSD56gPEx6aVvds/Ck8+wDaRJoj4Bdu4a3uLrrYBWSNbRxy3W3VawWu2zW98
	 zJWQrI6Kp/IjXN+6/hLjFtCwV+J2td3TsO3qoLVgAZkPd6CmVRzb5+RODsG34hMwNZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YvVnoDJx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED675606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YvVnoDJx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4771F1F000C4;
	Tue, 17 Nov 2026 18:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940674;
	bh=geeUyO7cZivhCRc1DxWCwBnoorGlSSok9IVOjAm8wwM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YvVnoDJxWSA6oa3bIiGpkt8vd82BUV6+8anfwBzwMOdfLE8Dq+8e6QvXeihmGiJxT
	 XNyj1SOtXPPs5pQHpIoxzvHD6PAYfgnvm08FqL2ZalgpgkvcDNP0PTQJAboXpdJSGA
	 Mn/uj32Rg7uh9Mt2aSrlaHUDSqoBLfJpu0VAgf5YnmO+7BEbkJN1oWFbCc2qj3BwpD
	 hPxm3w4+aJsq8/TUNKVxKgk945fBZGLgZT8EWlb94NLUTWXkQ5d+tB4Dx8WWQf6QB4
	 w5wkUfMgRgYL0myOSB+MduiDzVMj1Z2kPTQIHarC84Jh8VQA19kLIpmLB1bJ9ncZJW
	 SovaiFxXxsy8w==
Subject: Re: [PATCH net v3 2/7] tipc: fix dangling link in cluster_scope list
 in tipc_service_delete()
From: netdev-bot+sashiko@kernel.org
To: tung.quang.nguyen@est.tech
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 edumazet@kernel.org, pabeni@redhat.com, jmaloy@redhat.com, horms@kernel.org,
 tipc-discussion@lists.sourceforge.net,
 syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com, lkp@intel.com
Date: Tue, 17 Nov 2026 18:37:53 +0000
Message-ID: <179494067383.3136.15883783633463671421@kernel.org>
In-Reply-To: <20261116063529.6185-3-tung.quang.nguyen@est.tech>
References: <20261116063529.6185-3-tung.quang.nguyen@est.tech>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message presents this change as a bug fix and carries
  a Fixes: tag (1bb8dce57f4d), but it names no consequence anyone could…

--

tipc: fix dangling link in cluster_scope list in tipc_service_delete()

This patch makes tipc_service_delete() remove the local node's own
TIPC_NODE_STATE publication from nt->cluster_scope before it is freed
with kfree_rcu(). The commit message calls the leftover entry a
dangling list entry and adds a Fixes: tag for 1bb8dce57f4d.

> diff --git a/net/tipc/name_table.c b/net/tipc/name_table.c
> index 6fda36ab17669..73b032ba2f8d0 100644
> --- a/net/tipc/name_table.c
> +++ b/net/tipc/name_table.c

[ ... ]

> @@ -941,6 +942,13 @@ static void tipc_service_delete(struct net *net, struct tipc_service *sc)
>  	rbtree_postorder_for_each_entry_safe(sr, tmpr, &sc->ranges, tree_node) {
>  		list_for_each_entry_safe(p, tmp, &sr->all_publ, all_publ) {
>  			tipc_service_remove_publ(sr, &p->sk, p->key);
> +			if (p->sr.type == TIPC_NODE_STATE &&
> +			    p->sr.lower == tn->node_addr &&
> +			    p->sr.upper == tn->node_addr &&
> +			    p->key == tn->node_addr &&
> +			    p->sk.ref == 0 && p->sk.node == tn->node_addr)
> +				list_del(&p->binding_node);
> +
>  			kfree_rcu(p, rcu);
>  		}
>  		rb_erase_augmented(&sr->tree_node, &sc->ranges, &sr_callbacks);

[Severity: Low]

Can anything actually reach the leftover cluster_scope entry?

tipc_service_delete() is only called from tipc_nametbl_stop(). That
function frees the name table, including the cluster_scope list head,
right after the purge loop:

net/tipc/name_table.c:tipc_nametbl_stop() {
    ...
	spin_unlock_bh(&tn->nametbl_lock);

	/* TODO: clear tn->nametbl, implement proper RCU rules ? */
	kfree_rcu(nt, rcu);
}

tipc_nametbl_stop() is called from the tipc_init_net() error path and
from tipc_exit_net():

net/tipc/core.c:tipc_exit_net() {
    ...
	tipc_net_stop(net);
	/* Make sure the tipc_net_finalize_work() finished */
	cancel_work_sync(&tn->work);
	tipc_bcast_stop(net);
	tipc_nametbl_stop(net);
    ...
}

By that point tipc_net_stop() has already removed the bearers and
nodes, so tipc_named_node_up() can't run. cancel_work_sync() has
stopped tn->work, so tipc_named_reinit() can't run either.
tipc_named_publish() and tipc_named_withdraw() only run from socket
operations.

Is there a path that walks nt->cluster_scope between the purge and
kfree_rcu(nt, rcu), or after it?

If there isn't, this looks like cleanup at teardown rather than a fix
for a bug that can be hit. Should the commit message describe a failure
that can be observed? If not, could it present this as cleanup and drop
the Fixes: tag, so stable trees don't pick it up?

Separately, the commit message says:

  Fix this by calling list_del() before freeing TIPC_NODE_STATE
  publications in tipc_service_delete().

The code only removes the local node's own publication: type
TIPC_NODE_STATE, lower == upper == key == sk.node == tn->node_addr, and
sk.ref == 0. Remote TIPC_NODE_STATE publications are left alone. That
looks correct, because their binding_node sits on the peer node's
publ_list.

Could that sentence name the self-node publication specifically?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116063529.6185-1-tung.quang.nguyen%40est.tech
