Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469289;
	b=fKplQTO0W1TXFObhy02PYLOKjtsqs7Ry7sKE28yr6VVNE8VaKFO95pdMnTvJAhakVumX
	 KtEbxepgN5a1Q/U823/bMkovRCCeWUElBEqAr4LLmQi5aY7X6S36bN49ddbKZRa9nwH0n
	 F2L9X4aK04oPEbTO6Lri/0ZrsRVxXPHdu/Dwrf1RuQ2CKUjWHy8uGx2UtCmJyC4jZZNbH
	 kpaYcvQNnEeflkZHqU6xa4ILxR1sdvz/m5Qm7E9IrNFCmm0BkNWar0BhdhgBZKLsRO8ui
	 kfCopSYR3ho0GP6zEheOLbDqBWzGchMuHmAs6a8OL4VEK2hgwjTvHQ0chnTy33X6dFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469289;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9OhFR95czL+fjtDptfDhiFL33bowEY/LwIl2GYVZoUU=;
	b=fGk2ywrLZnWPtEXHfDmKL+LkmjmXGtZ/QF0wc7UXXy6PdgAOznqxowjKsX+Wmom683DJ
	 QJephakMzXzko3VQ98w1t5XdQKgRmhhl+xr740RKMLNaD1zKYLyqhxWWvzsBPTYmCDvcB
	 6j909HKzuxuh1d8ImNGhn+cOKxChsuUS/4f9OCSdFaIHKwAxr254DfuBEjJucG5D9mpEv
	 7IDtPZqxuSCntBEi2yv/QoLNWITvCozX3+aXel6kcAWPk17aKt2kW2XBqiZHFc8G09lYF
	 w0jW8u4oXgXdqfcGOUADUrcw3G0vAQZKshS6gLP6EdsVFsTHemGnK9hQfGo5Un7R9HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z6Yn395Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E47A606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z6Yn395Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BCE1F000C6;
	Mon, 23 Nov 2026 21:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469288;
	bh=9OhFR95czL+fjtDptfDhiFL33bowEY/LwIl2GYVZoUU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z6Yn395ZkgvpUYcvEpoGle8e8qFt4tZhCRUobf2nAWyXKHAMDA72evY3FqDYLLKsa
	 euEaYDVJp+ODFNTfC8vF8VpqQA7swm07zA3x4Q6TbWAamu2FvPMqV2KBbLCFKNyrHp
	 K4tKunf/tDX+ePSCTvWqGrfvyaXDIMqNyMEVpY83B+hucT2SltTlMCOdiL/gi953bh
	 j8dNMAIl7OemS29KCxLLzB1DCrpw6oyX6gtOrFlVh/ix6zKvmW1ycUWLgp/fcg9KsC
	 Y0OO+m/U7eA2fmUHA8Fgm4ZdIC/IYawVb8twRegU/96EKi0+yE8w/ogDhnmeGbccEG
	 Jg7hgYzWM3TxA==
Subject: Re: [PATCH net] inet: reject multicast and broadcast bind addresses
 on SOCK_STREAM
From: netdev-bot+sashiko@kernel.org
To: dmnk@google.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, ncardwell@google.com, kuniyu@google.com, horms@kernel.org,
 joannelkoong@gmail.com, netdev@vger.kernel.org, dmnk+artist@google.com
Date: Mon, 23 Nov 2026 21:28:07 +0000
Message-ID: <179546928758.3135.1400767434595880617@kernel.org>
In-Reply-To: <20261119192152.2643304-1-dmnk@google.com>
References: <20261119192152.2643304-1-dmnk@google.com>
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

- [Medium] The new SOCK_STREAM check in __inet_bind()
  (net/ipv4/af_inet.c) and in the IPV6_ADDR_MAPPED branch of…

--

inet: reject multicast and broadcast bind addresses on SOCK_STREAM

This patch makes __inet_bind() and the IPV6_ADDR_MAPPED branch of
__inet6_bind() return -EINVAL when a SOCK_STREAM socket binds to a
non-INADDR_ANY address classified as RTN_MULTICAST or RTN_BROADCAST. The
goal is to stop such binds from skipping the bhash2 conflict checks on a
later active connect.

> diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
> index 8822bae439f88..b1ea55457c747 100644
> --- a/net/ipv4/af_inet.c
> +++ b/net/ipv4/af_inet.c
> @@ -500,6 +500,12 @@ int __inet_bind(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len,
>  	tb_id = l3mdev_fib_table_by_index(net, sk->sk_bound_dev_if) ? : tb_id;
>  	chk_addr_ret = inet_addr_type_table(net, addr->sin_addr.s_addr, tb_id);
>  
> +	err = -EINVAL;
> +	if (sk->sk_type == SOCK_STREAM &&
> +	    addr->sin_addr.s_addr != htonl(INADDR_ANY) &&
> +	    (chk_addr_ret == RTN_MULTICAST || chk_addr_ret == RTN_BROADCAST))
> +		goto out;

[Severity: Medium]
Can chk_addr_ret be RTN_BROADCAST here because the FIB table is missing,
even when the address is not a broadcast address?

__inet_dev_addr_type() uses RTN_BROADCAST as its default. It only changes
that value when the table exists:

net/ipv4/fib_frontend.c:__inet_dev_addr_type() {
	...
	unsigned int ret = RTN_BROADCAST;
	...
	table = fib_get_table(net, tb_id);
	if (table) {
		ret = RTN_UNICAST;
		...
	}
	...
	return ret;
}

With CONFIG_IP_MULTIPLE_TABLES, ip_fib_net_init()->fib4_rules_init() only
registers rules. RT_TABLE_LOCAL is created later by fib_new_table(), the
first time an IPv4 address or route is added.

For loopback, inetdev_event() adds 127.0.0.1 only when lo gets NETDEV_UP. A
VRF/l3mdev table with no entries yet behaves the same way.

So in a new netns (for example one created with unshare -rn) where lo is
still down, every non-zero IPv4 address seems to come back as
RTN_BROADCAST.

Before this patch, inet_addr_valid_or_nonlocal() accepted RTN_BROADCAST, so
these binds succeeded. The new check now runs first. Would these binds fail
with -EINVAL?

  - TCP/MPTCP bind() to 127.0.0.1 in a new netns before lo is up
  - binds that use IP_FREEBIND, IP_TRANSPARENT or
    net.ipv4.ip_nonlocal_bind, which the existing comment in __inet_bind()
    says must keep working
  - the same binds through v4-mapped addresses in __inet6_bind(), where
    inet_addr_type_dev_table() returns the same fallback value

There is also a second case. __inet_dev_addr_type() returns RTN_BROADCAST
for any ipv4_is_zeronet() address, but the new check only exempts exactly
INADDR_ANY. Are non-zero 0.x.x.x addresses now rejected as well?

This patch is tagged for stable. Could the check use a classification that
does not depend on the missing-table default instead? Examples are
ipv4_is_multicast()/ipv4_is_lbcast(), or an RTN_BROADCAST result that the
FIB lookup actually confirmed.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119192152.2643304-1-dmnk%40google.com
