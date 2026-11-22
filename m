Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795337527;
	b=mO4mvx/cYUc15Hgi8mKnmI1WvJsm5pnkFF+0BoEjzS1Z2W3oIqg4xaXsQ6BFsnpH8oQw
	 dGu565QtaBz49Zd4qEwqU4atcIRbS3uKVoEDw6xmqNZLus2Qt+9Zou9YsNzZbZ3/tMtfY
	 gt/rU2yZmosIuwqqled85nYVNMAwSc3CgClFTdV4//hcsGE+GgVqhg+1c3dQHOLuFQ2JB
	 1Wg8s1uJ1WrJAvJhVbNaxQA6o03csFtBv2U+7scT4jWnvkqefLkyWzLh+paQ/6IPLPey5
	 dPEeb3G9YqH0ZIj7+iczNR071/H3m1wato+8nveg5Lfxaek/6eT6FuoNuqs8ckHlF9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795337527;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vQ1as1hC0osgBBN+KjF/Z20TmN/rtQEdZKFnWt6gL+A=;
	b=blkVFsX35/BJRRFm8T8jR00YBQS585UYDcBvC+r+PVCiqUnJ3/YqASDPaAFtxmBko3zy
	 j4urfiyNWYyxnmyRJodGUDbEaSyKpNRWLAncK91wNFuI/EKx/jYq/9Uvdw+typUu2fr2j
	 RLbmLueTR8wCrf7N1PzKBoNqLAI8UvPiIUP/GZbP+wL5Nb/yQVQ3ZRl8ibACGnUSK/jeL
	 zH58pBoIW7hL0ZsTWSbLBLIZwrUN8Sg4BR1qAzWAWMQOSBfJ0IEOJW1Fo1cMhWG0K3qA3
	 5P2sSgEY+m9kCKbu4qCtBsJWjtzDM6ku7iHhR9cPvLdXbA2EhagVk4SPwjlsuNGMZdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dDaDNHji;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E732C606A32A;
	Sun, 22 Nov 2026 08:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dDaDNHji
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C598E1F000C0;
	Sun, 22 Nov 2026 08:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795337526;
	bh=vQ1as1hC0osgBBN+KjF/Z20TmN/rtQEdZKFnWt6gL+A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dDaDNHji0peunfhp+cMM9xc6K+qMeuoeQl4+IMuYTR9Ijx0uKair+8IltQluP2PXe
	 HqfYzE6vRikROmZNg23cIKwlYS/Yj+/bzgQEV27aiv3nbzk1mAGFZwOM6CgHPi1Y6G
	 d4zMwYxOHY1DQquX+AxaWoyCW4MkE5QQc9Bx67rkiZ8xtSKRtVtsk/JyoMHnWzSMxX
	 fKfFEQPoQH5jTgNvv8Z0eXSBF7Z1uTvOxbmLAzrUVZWmnBXr87pzdK+b4rk45P9mxi
	 BLpY+AsUnki3YLS8bNmdeArKyVMss5OIPUwl12CEnQyIVVnlE5vczzSudMfXSt+lJd
	 AyT88RenkOU3A==
Subject: Re: [PATCH net-next] net: openvswitch: avoid hashing the network
 namespace pointer
From: netdev-bot+sashiko@kernel.org
To: zcliangcn@gmail.com
Cc: aconole@redhat.com, echaudro@redhat.com, i.maximets@ovn.org,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, pshelar@nicira.com, jesse@nicira.com,
 netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org
Date: Sun, 22 Nov 2026 08:52:05 +0000
Message-ID: <179533752531.3135.16631437077733586224@kernel.org>
In-Reply-To: <4e124b37fc972925a825881c50f95eb6b3c2e231.1794989369.git.zcliangcn@gmail.com>
References: <4e124b37fc972925a825881c50f95eb6b3c2e231.1794989369.git.zcliangcn@gmail.com>
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

- [Medium] The patch replaces the pointer-derived seed in hash_bucket()
  (net/openvswitch/vport.c) with a seed computed only from…

--

net: openvswitch: avoid hashing the network namespace pointer

This patch changes the seed for the Open vSwitch vport name hash. It
used the struct net pointer and now uses a jhash_2words() of the
namespace cookie. The goal is to stop a timing side channel on vport
lookups from leaking the init_net pointer and the KASLR base.

> diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
> index 083f7a8d9d4e4..6689c8370ec13 100644
> --- a/net/openvswitch/vport.c
> +++ b/net/openvswitch/vport.c
> @@ -53,7 +53,10 @@ void ovs_vport_exit(void)
>  
>  static struct hlist_head *hash_bucket(const struct net *net, const char *name)
>  {
> -	unsigned int hash = jhash(name, strlen(name), (unsigned long) net);
> +	u32 seed = jhash_2words(lower_32_bits(net->net_cookie),
> +				upper_32_bits(net->net_cookie), 0);
> +	unsigned int hash = jhash(name, strlen(name), seed);

[Severity: Medium]

This fixes the pointer leak. Does it also make bucket placement in the
global dev_table fully predictable?

In setup_net() the cookie is just the namespace id:

net/core/net_namespace.c:setup_net() {
    ...
	net->net_cookie = to_ns_common(net)->ns_id;
    ...
}

For init_net, that id is the uAPI constant NET_NS_INIT_ID (7) from
include/uapi/linux/nsfs.h. For every other namespace,
__ns_tree_gen_id() hands out the next value of a global counter:

	ns->ns_id = atomic64_inc_return(&namespace_cookie);

Userspace can read its own cookie with getsockopt(SO_NETNS_COOKIE). It
can find other ids through nsfs (NS_GET_ID) or listns.

That makes the init_net seed jhash_2words(7, 0, 0) on every system. The
bucket for any (netns, name) pair can then be computed offline.

The lookup oracle described in the commit message is still there.
ovs_vport_locate() walks a bucket chain that all namespaces share:

	hlist_for_each_entry_rcu(vport, bucket, hash_node,
				 lockdep_ovsl_is_held())
		if (!strcmp(name, ovs_vport_name(vport)) &&
		    net_eq(ovs_dp_get_net(vport->dp), net))

OVS_VPORT_CMD_GET and OVS_DP_CMD_GET both have .flags = 0, so
unprivileged users can reach this lookup.

With a public seed, could an unprivileged user in a container learn
whether a vport or datapath name exists in init_net? The steps would be:

  - pick a missing name in its own namespace that lands in the same
    bucket as the candidate name
  - time a GET request on the missing name

Before this patch, that attack needed the kernel pointer of the victim
namespace.

A second case: OVS_VPORT_CMD_NEW and OVS_DP_CMD_NEW only need
GENL_UNS_ADMIN_PERM, which a user has inside its own user namespace.
Could an attacker create vports with names chosen to land in the
buckets that hold another namespace's vports? Name lookups for those
vports would then walk long strcmp chains. Only control-plane name
lookups would be affected, since the datapath fast path looks ports up
by port_no in dp->ports.

A secret per-netns random value already exists:

net/core/net_namespace.c:preinit_net() {
    ...
	net->hash_mix = get_random_u32();
    ...
}

Would using net_hash_mix(net) as the seed, or mixing the cookie with a
get_random_once() key, close the KASLR leak while keeping bucket
placement secret?

> +
>  	return &dev_table[hash & (VPORT_HASH_BUCKETS - 1)];
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/4e124b37fc972925a825881c50f95eb6b3c2e231.1794989369.git.zcliangcn%40gmail.com
