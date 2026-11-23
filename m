Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417518;
	b=YxTbxANNeD6QJeVaDyrjIT1UGgvq18N+hk4fEBx29INM7qrN43rBLqosBYAY8STgdsRo
	 ZzcKKcabzXsu0rT6f9mJxerwilJwlFRQUovphUpkfDRt934xXoWAKs158jWeD1q1ki8Za
	 TdULlPsmaJTypH92ajd6LVZHM+DWmRpiQsFqxqAxWJT5+t+GD+TUCIEQHpD25gOsU8xLL
	 JCLwcve0/DurjZ8kQIhXxpfsx7tuNTQlOLHhy0hcRq6NK9PvhqornNKjbi8CA9pYqBltJ
	 nOeo7GdjJXvxm6UoOQtGgUSHOh5uwnkHvec8FspRxwHjjJ5TXJXca1iO+GOe2n2tLFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417518;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ExVNsZ9bQwFjBhcllL5z7Q7YiDH+T5wmMLxp5yY4uQE=;
	b=evi/oXPUKWtn5X3ShBotboLdDHd6I64DiI/vJQqvi7XHKwz1ugsr2EHVR/OJkUNVbVvE
	 Ua5HrDfoLv8JE7El6vMWd6cdzz1Nu25x1vf/qfcnDvsIo0xiMRjJw8P864ImnAPp+DPq6
	 RGS2cYr9UOh5SonXw3enySz5SY3Y2nWraG4Vx9eYRrZxXkwUswVMZ7GygFBgie2VC5c3F
	 qxMbtESd6AuY/MRPX8rME69ViNAqj6CNKLeVyZm+nXPuYjjm03hdZ17F8JmF5M8Th26BH
	 PqJzY/jfcxQ3w9w1v2Js1rHNupZtYbp/bS+Qj5jJ3AeJZEScwJgUuU0q+WbUiqdw9jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=efTu+A7Y;
	arc=none smtp.remote-ip=95.215.58.219
Received: from mta1.migadu.com (out-219.mta1.migadu.com [95.215.58.219])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B401606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B401606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=efTu+A7Y
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Om9PdvxhKhjnMPpW0lRTSFb2mK1Iqn7VeAuIM+tmX0Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795417516; v=1; x=1796022316;
 b=efTu+A7Y/8tGtAfJjGclW75oTD6gl0cBpeL+BCZJOC2Fx0q01L5fl0k+dVnJ/LW+2+jfl6AF
 RtSQFYTMoHr61xvpK7WG0/wD7D1W9BjLbQ1Vr6oBa8Vxf6IBtjOb7HhUacrpf4+LpLHr5XHfHiT
 aw4Y36pCi3WFkcHX4gwsAVzM=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 87924c55bf7887b7;
	Mon, 23 Nov 2026 07:05:14 +0000
X-Mizu-Trace-ID: 87924c55bf7887b7
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: netdev-bot+sinfo@kernel.org
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	netdev@vger.kernel.org
Subject: Re: [PATCH net] ipv6: reject released nexthop object routes in ip6_dst_check()
Date: Mon, 23 Nov 2026 02:05:05 -0500
Message-ID: <20261123070505.4129445-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179541734374.3294.12814339545104396123@kernel.org>
References: <20261123-bug-net-ipv6-dst-check-released-v1-1-769d320a2470@linux.dev> <179541734374.3294.12814339545104396123@kernel.org>
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

On Mon, Nov 23, 2026 at 07:02:23AM +0000, netdev-bot+sinfo@kernel.org wrote:
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The Sashiko review of v5 3/4 of my netns move series [1] pointed out
that a socket in init_net keeps sending into blackhole_netdev once the
routes of a removed group member are released. I reproduced it in a VM
on net-next with the test described in the commit message and confirmed
that it happens without that series too, which is why the fix goes to
net on its own.

[1] https://lore.kernel.org/r/179539354580.3135.4168319613426691276@kernel.org

Thanks,
Qiliang
