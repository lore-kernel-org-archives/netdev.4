Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338174;
	b=p8DLc5zemQmo2AkeYNI+IThhsV5ByYP9957pI9iB9RiSI7Mwc/fVmPoIjyCzhSL2O/6q
	 avTfTHNHCpi/FkxCU+dOm6ZKZcnlZTW1IsO23Xsij9CI1bNfQbagsyF9t456Xj1ZjaxBL
	 4glbTLRvUkP7vhJBDDXQN8OYEYcOJCig1fal5nvoHAeFOKCLcsx+iPWBlZvq5DuSlFO2w
	 Fn4Xj285LgUDhx3h27hDGp+W3Fja4DJuvx5+YrG7o5lnFfkysUvfOufg7qmVBkjPpPUQt
	 EsOLxli8iLu35n4C+N8/zXpRMI2HpfJKREK15Fca8xZi+SpR6h2FsqYWVVd4y+SEGMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338174;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=Dx4oZRMb1vcD+4b2v4AXg4po5beQ85uYTshcD6bOmjc=;
	b=GQ60K3KcS16qnAIXLQrnRzY2/Rm/ezoJt/9Q9RuilkAQKXkH+BraO+Z9iLJUvH4LOfji
	 D4bN9YlKroPUWhPgtVy73wujTprXUGt3q24wyoAzjn/zUAsZb3dSTkX7HIeOI0ohfG++F
	 Jwd8pv7kWBWJbhaeIUaOmY37bQPt4YfMERY2NxYKvKZ3UcSnAOr9Ti1Pn28mD43LlBMRR
	 2U6HKOoVF8Ruyowz1NSNt/GOVlQXo2yRm9jsMQD0dCOleBnwx8KEzHb755x8T5im2J+rR
	 OpasdcVf8ULpj0POcC/3Pu71O8CLwSy9dsltPiJa4m1+f2T2K+bBXvT2dsgj1PY1dOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b="0U/5V0me";
	arc=none smtp.remote-ip=195.10.208.52
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org [195.10.208.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11748606A320;
	Sun, 22 Nov 2026 09:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11748606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=0U/5V0me
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4jXNPv0bTYzLmxW;
	Sun, 22 Nov 2026 10:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795338163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dx4oZRMb1vcD+4b2v4AXg4po5beQ85uYTshcD6bOmjc=;
	b=0U/5V0meZe0+TlbVnD6/+Hfrz01rCDL7mIj2yGgQXc49gz7mvh2+/9BNjhg5HgNWe5lOsS
	h6FzRD0Q5YlmDp8rsTqJNw7ncOxkYy4xaG3gunX+/+Plw3uKdmG93a6bUDTXC4MxzOLLHi
	upG8P6pBrqLEskJX0vj5Q4yrwN1lfXCPEnNMPQWx4PywtA/XXTDgvuY8tKtgERZXpJyJ+2
	W67VX5XIf9TxD/gEvxzCjyYw6l24s1RT5NC2lrdDzIrt9wdsRSe74MLg6vaclMj6SaQEoG
	8rVjb3O/mx743GhB2l5oATJ3UMfHMKAe74yjc2eBfvBnz7ptEfVOq/odchDSPQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/4] ipv4: draw rt_genid from a sequence shared by all netns
Date: Sun, 22 Nov 2026 10:02:35 +0100
Message-ID: <20261122090236.42786-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121-bug-net-netns-move-rcu-barrier-v5-1-100a3b5d9090@linux.dev>
References: <20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090@linux.dev> <20261121-bug-net-netns-move-rcu-barrier-v5-1-100a3b5d9090@linux.dev>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jXNPv0bTYzLmxW

On Sat, 21 Nov 2026 18:21:19 -0500, Qiliang Yuan <qiliang.yuan@linux.dev> wrote:
> An IPv4 route records the rt_genid of the netns it was created in, and
> rt_is_expired() compares it with the rt_genid of the netns its device
> belongs to when the route is checked. Every netns starts its rt_genid
> at 0 and increments it on each cache flush, so different netns often
> hold the same value.
>
> When a device moves to another netns, routes cached through it remain
> usable until dst_dev_put() points them to blackhole_netdev. For a route
> using a nexthop object this happens in nexthop_free_rcu(), which
> free_fib_info_rcu() queues from inside an RCU callback, so the
> rcu_barrier() in __dev_change_net_namespace() does not wait for it. If
> the rt_genid of the new netns matches the cached one in that window,
> ipv4_dst_check() accepts the route and a socket in the old netns keeps
> sending through a device that now belongs to another netns.
>
> Take every rt_genid bump from one sequence shared by all netns, which
> never hands out 0, the value every netns starts with. Inserting a route
> bumps rt_genid, so the routes a netns caches carry values drawn from the
> sequence, which no other netns holds until it wraps after 2^32 bumps. A
> moved device sends again only once it is up in its new netns, and
> NETDEV_UP flushes the route cache there, so that netns no longer holds 0
> either. Publish each value with a cmpxchg on the rt_genid of the netns,
> drawing again if another bump changed it first, so that a bump stalled
> between drawing and publishing cannot overwrite a newer value and
> rt_genid stays monotonic per netns.
>
> A connected UDP socket in netns A caches a route through a nexthop
> object on a veth. The veth is moved to netns B and brought up with one
> RTM_NEWLINK, then the socket sends 200000 datagrams. B's rt_genid is
> bumped 0 to 20 times before the move, 63 trials:
>
>                                      before   after   change
>   trials sending after move (count)       2       0    -100%
>   datagrams sent after move (count)    1045       0    -100%
>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>

Reviewed-by: Ralf Lici <ralf@mandelbit.com>

-- 
Ralf Lici
Mandelbit Srl
