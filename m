Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034187;
	b=xybqfOlZSBJM1siaWaQpS1Q+92M0KQ8VGtO8DpiseTkbqkXxMjEVbEwRkA0SpxtLKK6p
	 mYKC4ckobBM2EPpuEW+8evs/6/Sxh+Pwvb5N9JSjRICAFulxS4VS8xmAa6fWuz3XxZlR7
	 Ycz359A3kQpww4qAzOmTAt8MivtHwhR18I3JF9DCYPtH1YHiCHrQ4bdC5YxsjMXfyipnW
	 KPcpgFCVvHy/z4TQ2newas39aeUe+MIFB4rdDxkqH6Mqpr0tD3OWsjLmIUs+OVmRf5T8K
	 MQLRTzzejWnUDGN2x/EpmLiHKDhk9HYDIvcoLK4SsTdLpw5ttPhrNFi9HBjXkzn96mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034187;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=VZKwbVIEwZ16tQwwnnbKKkdu/6LIA0NjvDmvocNIRks=;
	b=M9x3T0nS2O8dOmSoJzcvy3EdPCNHnkeK8bE1ddRSI7ZONz6Q0g+w86eR0v9AmPGNNhUC
	 I9VdOl54F45boMw9y2Peiwmu6wp6hZ2XRwgbAOffe7uEtvKsCpWbc4ELvsAYzpDTprnl3
	 hf8MNlkXoSx3hbQ7gWq9Vt/nRRkB5rBnjugrInpl81fpuJ05qTBtF7Mp3WWPswX03TjUz
	 0QLqtBek4e9Ogk7nWqkYhPiCZnqgEkkk6B5M+mCf/NJkRhsoltzo8tT0S148QSVfzlJIh
	 J6QUJs3hXGh6RXqx1jhZbAeDQNU7HoQUHlC+5svZn7tD+AivKyLi2NvyeSmmQ9S5AHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7LyQSEx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C55760A2613
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7LyQSEx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65391F000C5;
	Wed, 18 Nov 2026 20:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795034187;
	bh=VZKwbVIEwZ16tQwwnnbKKkdu/6LIA0NjvDmvocNIRks=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=E7LyQSEx5t7DRajKkqUT2Qw2zEPBSpx7jgEqS9ipCmdAyK8Z5BEwxZji8WbuyI2cm
	 sXRYLsf2PbuPkCXB39zenxa0VqRL0KD6MOGfmTcSQn7FaS33AsPOqUMguEh/HQDD4Q
	 b/pxShKH5KUS09Sp1qKfBM/HLm2pu1vQ/q1yhx7gTlc2H8VQSlEFsxSfJVAKEJTnnd
	 EDvhABLqxh57C9VOktnUDZiWBo09pJWX7kBlI9uYohBnlnfG9q8c0J0dzKQAXy2+fn
	 JH3n3RXznOKmX/Vfy2Ka4rTWyatlEhWT3wsLwBHbwsv9zAtOv4Vh6vGjEy+hXVi3jR
	 lnn4cfTZ6VJ/w==
Subject: Re: [PATCH v1 net 3/8] tcp: Don't bypass GTSM check for reqsk.
From: netdev-bot+sashiko@kernel.org
To: kuniyu@google.com
Cc: edumazet@kernel.org, ncardwell@google.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com,
 netdev@vger.kernel.org
Date: Wed, 18 Nov 2026 20:36:26 +0000
Message-ID: <179503418639.3136.8004890294182760159@kernel.org>
In-Reply-To: <20261117053543.84032-4-kuniyu@google.com>
References: <20261117053543.84032-4-kuniyu@google.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Incomplete fix: GTSM (IP_MINTTL / IPV6_MINHOPCOUNT) is still
  skipped for request sockets on the TCP receive path.

--

tcp: Don't bypass GTSM check for reqsk.

This patch moves the IP_MINTTL and IPV6_MINHOPCOUNT checks in
tcp_v4_err() and tcp_v6_err() ahead of the TCP_NEW_SYN_RECV handling.
ICMP errors with a low TTL or hop limit can then no longer abort request
sockets. For a reqsk, the value is read from the listener through
sk_to_full_sk().

> diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> index bf8542368032f..fd9588bba9672 100644
> --- a/net/ipv4/tcp_ipv4.c
> +++ b/net/ipv4/tcp_ipv4.c
> @@ -516,6 +516,17 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
>  		inet_twsk_put(inet_twsk(sk));
>  		return 0;
>  	}
> +
> +	if (static_branch_unlikely(&ip4_min_ttl)) {
> +		/* min_ttl can be changed concurrently from do_ip_setsockopt() */
> +		if (unlikely(ip_hdr(skb)->ttl <
> +			     READ_ONCE(inet_sk(sk_to_full_sk(sk))->min_ttl))) {
> +			__NET_INC_STATS(net, LINUX_MIB_TCPMINTTLDROP);
> +			sock_gen_put(sk);
> +			return 0;
> +		}
> +	}
> +

[Severity: High]

This covers the ICMP path. Do ordinary segments that match a request
socket still skip GTSM, though?

The subject says "Don't bypass GTSM check for reqsk", and the changelog
says "Let's restore IP_MINTTL/IPV6_MINHOPCOUNT for reqsk".

In tcp_v4_rcv(), a segment that matches a TCP_NEW_SYN_RECV socket is
handled entirely inside the reqsk block:

net/ipv4/tcp_ipv4.c:tcp_v4_rcv() {
    ...
	if (sk->sk_state == TCP_NEW_SYN_RECV) {
		...
		sk = req->rsk_listener;
		...
			nsk = tcp_check_req(sk, skb, req, false, &req_stolen,
					    &drop_reason);
		}
		if (!nsk) {
			...
			goto discard_and_relse;
		}
		...
		} else {
			drop_reason = tcp_child_process(sk, nsk, skb);
			...
			return 0;
		}
	}

	isn = 0;
process:
	if (static_branch_unlikely(&ip4_min_ttl)) {
		/* min_ttl can be changed concurrently from do_ip_setsockopt() */
		if (unlikely(iph->ttl < READ_ONCE(inet_sk(sk)->min_ttl))) {
    ...
}

The only min_ttl check on the receive path is at the process label, and
only the nsk == sk case reaches it. If a child is created, the function
returns 0. If tcp_check_req() returns NULL, it jumps to
discard_and_relse. tcp_check_req(), tcp_inbound_hash() and
tcp_child_process() never look at min_ttl.

So a low-TTL sender facing a listener with IP_MINTTL=255 could still do
either of the following:

  - Drop the embryonic connection. An in-window SYN, or an RST with
    seq == rcv_nxt, goes through
    tcp_check_req()->embryonic_reset->inet_csk_reqsk_queue_drop().

  - Complete the handshake and create a child socket by sending the third
    ACK with ack_seq == snt_isn + 1.

The in-window SYN only has to land inside the receive window. That is
easier than the exact snt_isn match tcp_req_err() requires on the ICMP
path.

In the changelog's repro the final ACK is sent with ttl 255. If it were
sent with ttl 1, would accept() still return a TCP_ESTABLISHED socket
after this patch?

tcp_v6_rcv() is laid out the same way, and its IPV6_MINHOPCOUNT check
also sits only at the process label.

The selftest added later in the series (Test 3 in tcp_icmp_ipv4.pkt and
tcp_icmp_ipv6.pkt) only exercises the ICMP path. No later patch in the
series changes tcp_v4_rcv() or tcp_v6_rcv().

Should the same check be added to the TCP_NEW_SYN_RECV block of
tcp_v4_rcv() and tcp_v6_rcv(), using req->rsk_listener? If not, should
the subject and changelog say the fix only covers the ICMP path?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117053543.84032-1-kuniyu%40google.com
