Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417333;
	b=yTihTvcvNt/NGDNAdrkHZo6OxpDp2o9h/TSwnq42PAJGDUyw4FkZIlRyGqdU4kLf7DBD
	 q3kOVBAyXquVpyrCzbDDR5Z7lbTMPF64bPTFMDIeIRdNqlzsrKEJT55JMvMsU8emI0z3p
	 z6WDJevCEJeFJGpn1mVLT7eYEkjzR+R8ALQeBJ1SE84oOIv5J+ri35WIV7qQHszkw5guG
	 nc02wpcsrJmuE5UQSFAukV0qBs0EcMUmT7V0F8jEpcJGC0RGhpFdds1ki8jdwWmfWsdPM
	 Fv8ysP7pf8iHRuJLpwscp7Aafj+xGPm9oOA2uN9wFzeSvFCr+cqdPc3RtA/DEyuhlkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417333;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y7v+P8bJqEof0yPy+kUZoCNH441jx4UihzMQ7Aabsd8=;
	b=XDXL4FlHAo5YnEzpEC+0f99inXj4Yz1lE8UTQpkVrJSKNJgAU2qex3UBBD9G05IriJzL
	 BEzSX3buCD3XU00PUAWzvQttROo3+38V6SFS+bFPYRbzVpH4uYfc9Dsq0cki1c3kUpJbJ
	 1jOLUnC52HA3THliEBzSkAuVIXiCIUkH6wgzL0sfe+9NjUSCnrl3N6o1xo1nvBAeQVCZ4
	 flw98pSzF8hM5SUSzi1Wv42wRCa05l8Kd/pfyourB4lNGBN1WICXJ8g85J9Wa2enTGtjD
	 ucCbMVVHO3bfU9c1lDr5+5Uf8pbnm9Szn9G5eTVPTsAxfzJbSivFvuXnsrrRXedPi+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iAOiKLio;
	arc=none smtp.remote-ip=95.215.58.169
Received: from mta1.migadu.com (out-169.mta1.migadu.com [95.215.58.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0447C606A683
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0447C606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iAOiKLio
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y7v+P8bJqEof0yPy+kUZoCNH441jx4UihzMQ7Aabsd8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795417330; v=1; x=1796022130;
 b=iAOiKLioPKAj1vFLeKvMRq1XnMFLpAkNrLGOmAzzPk9a4s1uv61Oezn+Cx6rPz9njZn9OuBj
 /C9QXg4Y1neQ6XoUUfB1yrUqrggSCu8Jbo9skvh5MZeZIlQBbRMjOH4JuTYK9vXVzNOV+8BE9t+
 bDYMLA1DV7mIM4IkZAyZzDgk=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9deeaf9e38cf6456;
	Mon, 23 Nov 2026 07:02:10 +0000
X-Mizu-Trace-ID: 9deeaf9e38cf6456
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Ralf Lici <ralf@mandelbit.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 0/4] net: make moving a device to another netns cheaper
Date: Mon, 23 Nov 2026 02:02:01 -0500
Message-ID: <20261123070201.4117929-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090@linux.dev>
References: <20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090@linux.dev>
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

On Sat, Nov 21, 2026 at 06:21:18PM -0500, Qiliang Yuan wrote:
> Moving a device to another netns waits in rcu_barrier() with RTNL held.
[...]

Please drop this series, I'm not going to post a v6.

The barrier also waits for the RCU callbacks that release routes cached
through the device, and some users never check their route again before
sending. With v5, a UDP datagram corked on a route through the device
goes out through it after the move. Retiring the cached routes when the
device goes down doesn't close this either: a lookup that picked the
nexthop before NETDEV_DOWN can cache the route after the flush, and
that route is again only released by the callbacks. With the lookup
delayed across NETDEV_DOWN and the callbacks delayed, the corked
datagram went out through the moved device in 2/10 trials on a plain
IPv4 route and 9/10 through a nexthop object, and in none on net-next.
Closing that window would take a check after every route cache
insertion, which isn't worth it for this.

The init_net blackhole that came up in v5 3/4 is an existing bug and I
sent a fix for it to net [1].

Thanks to Ralf for the reviews.

[1] https://lore.kernel.org/r/20261123-bug-net-ipv6-dst-check-released-v1-1-769d320a2470@linux.dev

Thanks,
Qiliang
