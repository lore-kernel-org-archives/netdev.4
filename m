Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781415;
	b=gcrxDtx9dRYgKOSOWenxbJC20HMQmAFoCzXUTORBSPCMx93WeVCo2LF2gt8lkeIn0/uH
	 WxXKky9L+du1yicK+U3mNcfjgFl1pKChBivCvizb03GyG87a3S6KQMB1V8kx108ticsq9
	 dNS8qZNx+aLtBo9zVItwRIf2PhPH70fiGsQDBLA9OIcaCgG7QuL/b7TtOG811gAVAUo/i
	 Du5A/wLfhASafNkfxL/7f92VCTMvkR0x2tFidfZ6OSjDdohq8DnefNU9sB8ViCX0lrfHW
	 TUITtr3St4qMwI0hwBNcj0lzfdG/QZ9nnssDOnPKqcGkWLI1dNf75lt6MjkTZB7uOvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781415;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=xZ8iFlrCt45suSPHlvUZxZAHscsAMzIunGbFGZgXo/Y=;
	b=sPbtD6AU5XsxemrJpa9n+6QkwVOCA6SBDi7crHZV0GtKDp4hIve4+tsmSZ7fX4wohGgL
	 ynR+F9dM1rivE+gekLZTEJPSFE9oPKu3Svr01dnQ39grj/gimDevXUHJh2P3/cfXjaET8
	 h2GeXXcx8ywJviPYMpma5DYek7OokkfaDUSVgqLIUcEMHErVEFJHC5WaYGM4KHsPZTf4P
	 z9u8Np9Z9Kvfx/LM7sz0ys1M6WQdlL9wb+XR0u9nropGyJKxGMzBOUCpLLVB4NhJCiyg8
	 WYbPHn4Fm8F/vj0P57LK7KZsC33SNih36/iPsFCuoYLPH6jW0UNXJJtMefb8JnJpcmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=f5MIhrmM;
	arc=none smtp.remote-ip=195.10.208.47
Received: from mout-b-107.mailbox.org (mout-b-107.mailbox.org [195.10.208.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4597C606A31F;
	Fri, 27 Nov 2026 12:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4597C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=f5MIhrmM
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-107.mailbox.org (Postfix) with ESMTPS id 4jbXKm3Jjvz3xxX;
	Fri, 27 Nov 2026 13:10:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795781405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xZ8iFlrCt45suSPHlvUZxZAHscsAMzIunGbFGZgXo/Y=;
	b=f5MIhrmM6uWKLLDwlY1YnTf/uTrO4Qk3rmtLf9H96lScGyhouMJDOiFLFMYAPsWf01/HcD
	Kmkq/VlSEoajKxIXGf83lsDsDXV5OuX6R+Ex4LXz7eSmdbHqYLl4PKd4louDnr6gYVLoFN
	MXgDmLodTQtBTaNM89n0xLOGEWMngja/jteTsz8Csg4N9W6x//taLGu72fEJvCHTIrhOGp
	GQXuIII7D1uSEfHG0h0Q2WwP8A90naROm6SK9PilAHFgyDrA8JWWCXi8ixRibf69wVN+Qg
	Cxko6Zt/QL3rCNQ28PXsyb6hWF26AV0maffWqF5SeYGUy+kPRDMV/CyrZZFcDg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: Ralf Lici <ralf@mandelbit.com>
Cc: netdev@vger.kernel.org,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Sagarika Sharma <sharmasagarika@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Xia Yan <yanxia@cmss.chinamobile.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] ipv6: advance the serial after rebalancing in fib6_ifup and fib6_ifdown
Date: Fri, 27 Nov 2026 11:07:57 +0100
Message-ID: <20261127100758.254409-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126081353.55240-1-ralf@mandelbit.com>
References: <20261126081353.55240-1-ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jbXKm3Jjvz3xxX

On Thu, 26 Nov 2026 09:13:51 +0100, Ralf Lici <ralf@mandelbit.com> wrote:
> fib6_ifup and fib6_ifdown update the node serial before calling
> rt6_multipath_rebalance. A lookup that runs between the two can select a
> nexthop using the old ECMP upper bounds and read the new serial as its
> cookie. The cached dst then passes dst_check although it was selected
> from the old state, until the next relevant change.
>
> Update the serial after rt6_multipath_rebalance, so that it is published
> only after the routing state it describes. fib6_new_sernum allocates the
> serial with a fully ordered atomic_try_cmpxchg, which orders the
> rebalance before the serial update. The invalidation scope is unchanged:
> fib6_ifup still updates the node and its ancestors, fib6_ifdown only the
> node.
>
> Validating dsts against the generation sampled before the lookup, as
> proposed in "ipv6: validate cached dsts against the netns route
> generation", relies on this order as well: a lookup that reads the new
> generation must also observe the routing change it describes.
>
> Reported by Sashiko while reviewing an earlier version of this change.
>
> Fixes: d7dedee184e7 ("ipv6: Calculate hash thresholds for IPv6 nexthops")
> Fixes: 4bc852006b62 ("ipv6: update route serial number on NETDEV_CHANGE")
> Link: https://lore.kernel.org/netdev/cover.1795642432.git.dahern@nvidia.com/
> Signed-off-by: Ralf Lici <ralf@mandelbit.com>
> Reviewed-by: Xia Yan <yanxia@cmss.chinamobile.com>

Didn't receive Sashiko's review [1] by email this time and it's not on
the list either, not sure why.

Sashiko asks whether the reorder closes the race or only narrows it.

It closes the case described in the commit message: a lookup that runs
entirely between the serial update and the rebalance. A lookup that
selects its nexthop before both writes and reads the cookie after them
is the late cookie sampling race in general, which this patch does not
address on its own. The series in the Link closes it by sampling the
generation before the lookup, and relies on this order to do so, as the
third paragraph says.

I don't think this needs a respin, but I can send a v2 if you'd prefer
the commit message to say this explicitly.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126081353.55240-1-ralf%40mandelbit.com

-- 
Ralf Lici
Mandelbit Srl
