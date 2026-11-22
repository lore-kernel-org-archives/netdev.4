Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795317253;
	b=S5W2wlxP7HGzRckfMAaAs02hoZvcpWiseOap2aWeviUrPGSsSe744ROc+V8UdcK0yrvN
	 +LhRhn2jIc+7wHIvkYA6FlFLZ89qyNYSVSLFNl2e6f1LhWCE7vfp2qpkRE8s4XlBuwTd6
	 RlV2cy6e6Qg7RsPg60a0E5WK99weJXDbQSoDGEt7C2/smBb/5VcXgoS6k/Bg3OCwRdJiN
	 Bljo8er9B8s/jYo+RDtdpRDfGFW51XO+NAt6aXZd//2r85rSDhrAIvbp8tEqUJ2w1sG0k
	 KrU+pQaoD/6iaqUYjf7zWURxSs4z29tdbhGv7CfhudjJGLDCz3p1RVZ1gkJHTLPWhpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795317253;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=qAmy6KwKngwwTBTxCVk1+pHs6GsgwpRoWF/IbaYltOw=;
	b=iMZ/BEvX7jpLEF6GOuzC8sMig5ucgJfpagnWlGUI18VXP9XcvKqqJbftdu89BetWU4Ke
	 S+RYYDo3QGxrIscNQAq+MCjukJ6H2Dl80CrnJbhNVWL0BVayyBri3NVn49P+ZmHl9OdZw
	 i3uI1rSvJEYOL40RRyx0qtcwCF6FdHUVHULsXTe0ES72NKfkSl+NBh+FE75NYiIgexuk1
	 9vlwqkNKZ+6eRSsF5AUXcGlvM4o3e8CEaB8Ij0f75DJDtUUn+XyRt+myiLRP/6CgZ1g/P
	 gS5n9Khfa4TKXjgTHkxexgIfUl9KfulS+YyqIZrxLLzG8OwarAagerUH+Kak8i9m07A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iOqZ0B0C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0B5606A338;
	Sun, 22 Nov 2026 03:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iOqZ0B0C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE091F000C0;
	Sun, 22 Nov 2026 03:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795317253;
	bh=qAmy6KwKngwwTBTxCVk1+pHs6GsgwpRoWF/IbaYltOw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iOqZ0B0CvFNvro7i64E+Wt+cRSNeinVEQ8vnm0Bh9fK7ZqWt00W2S252z0HOkHLgw
	 3EIsEe5iLBsuFF0/1Ve+QoaOp08g1lPl2OdNotbeud+FKTgf+g6IcJqsuGsbmw79n+
	 tPFlUv9yTKnyGTFOmFe36E7/4DysI06EH2sFu3XdskBJsm2I68nUVWdlH3Pca/LoEZ
	 JmDrUCQSaYuT+yeCOQZEs0HNgSoCl+ZruMrg7lFS/mL5vX49z1sL5TmFDyQZ0FcVcc
	 uS9u53luFljlfPH2FnkbtKavFaRhrf4hXZ0kNPYj8VKR1UcPbNAVGRu18A8FYTrp8c
	 0J1ZFjJl274Ig==
Subject: Re: [PATCH net-next v4 2/4] ipv6: take fib6_sernum from a sequence
 shared by all netns
From: netdev-bot+sashiko@kernel.org
To: qiliang.yuan@linux.dev
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 razor@blackwall.org, kuniyu@google.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 22 Nov 2026 03:14:12 +0000
Message-ID: <179531725203.3135.1479967142257708654@kernel.org>
In-Reply-To: <20261117-bug-net-netns-move-rcu-barrier-v4-2-43e1ca0aac7f@linux.dev>
References: <20261117-bug-net-netns-move-rcu-barrier-v4-2-43e1ca0aac7f@linux.dev>
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

- [Low] The commit fixes a bug that is real and visible to users, but it
  carries no Fixes: tag and no Cc: stable.

--

ipv6: take fib6_sernum from a sequence shared by all netns

This patch makes fib6_new_sernum() take every fib6_sernum bump from one
sequence shared by all netns, starting at 2. A per-cpu nexthop route
cached in one netns then no longer matches the sernum of another netns
after its device moves. rt6_is_valid() also rejects 1, the initial value
that every netns starts with.

> When a device moves to another netns, such a route remains usable until
> nexthop_free_rcu() releases it, and fib6_info_destroy_rcu() queues that
> callback from inside an RCU callback, after the device has moved. If the
> fib6_sernum of the new netns matches the cached one in that window,
> ip6_dst_check() accepts the route and a socket in the old netns keeps
> sending through a device that now belongs to another netns.

[ ... ]

> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>

[Severity: Low]
This fixes a netns isolation problem that users can hit, but the patch has
no Fixes: tag and no Cc: stable. Should it have them?

Two pieces of code came in with the same commit. One records the sernum in
ip6_rt_pcpu_alloc(). The other compares it across netns in rt6_is_valid():

net/ipv6/route.c:ip6_rt_pcpu_alloc() {
    ...
	if (f6i->nh)
		pcpu_rt->sernum = rt_genid_ipv6(dev_net(dev));
    ...
}

net/ipv6/route.c:rt6_is_valid() {
	return rt6->sernum == rt_genid_ipv6(dev_net(rt6->dst.dev));
}

Going by git blame, both lines come from this commit:

Fixes: 8f34e53b60b3 ("ipv6: Use global sernum for dst validation with nexthop objects")

The commit message also never calls this a netns isolation problem: a
socket in netns A keeps sending through a device that netns B now owns.
Could the message say so explicitly, for stable and security triage?

The IPv4 companion patch in this series, "ipv4: draw rt_genid from a
sequence shared by all netns", seems to be missing the same tags.

The series also puts these fixes together with "net: remove rcu_barrier()
from __dev_change_net_namespace()", which looks like a net-next style
optimization. Would it make sense to split the fixes out and send them to
net, so they can be picked up for stable?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-bug-net-netns-move-rcu-barrier-v4-0-43e1ca0aac7f%40linux.dev
