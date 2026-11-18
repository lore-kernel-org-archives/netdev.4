Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034188;
	b=XEliDDBoKoln14gPSIHYxtCmFUstfUG3z2HCquTIaH19vo2rvdA9YgkBA20xtmUt8a8b
	 /Y0SV4xy7aXAMYUaB7UyPViaPaAVTAYdh4bOH+lXslwWtw//Kda+si044E9++ekrGL3/X
	 jS/GhoqQRk+arSo1FpezdPDvwPZD8+SVNOBrb6v61r3LizHkp//QNw+C4Yb0vyCnY0CPt
	 /yggV8cpkMyT1O/K9e/9H5ywfe1xfR+8vimBC1ri5fyDO8XAsvD6p61VQxx80iIGgV5Rp
	 A9zBBY1veegzVAcufXj71y5Z9SRbIeEMeIZ7ZnNbc+bMoezaTGTXt2L7gFPxvSld7cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034188;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=JjTHb+sQJUwdApdF1WR7/s7xH2U4av785xkSHCbz0Qc=;
	b=3WCakLNOEv9fyd11wzEqgH7D8PH1Jhimzfh2OmgQ61SXJkVN4nXymUTajJjYsmN7/JQB
	 HA5fU9PqH8yOR97bKgVAg5ZTfR9GYsPur8VDUnNmsHo0VpOYzt4/VwOAiYTzjVLbWRlrH
	 1sc1zLq6pQtbNzOu5qe4oHWXFYDOKHPAi7qm8uLsDRS051xeeZA0IEvyT8T8V9KRS6gFL
	 xrfOF2uVjEoVqC8cEe2tO88N7hFRGiURxG4LEJ65pb4FJkO6DUo2AAHVO4cZRFM1/1AVh
	 qAhWzYf8+YVDNBF0/qO6BbaZj/s/MytIhUHacLn33Si+STpmzl3sjo+mJ9U1Sj2iymQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTktnBPu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A2F60A2630
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTktnBPu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E3F1F000C9;
	Wed, 18 Nov 2026 20:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795034188;
	bh=JjTHb+sQJUwdApdF1WR7/s7xH2U4av785xkSHCbz0Qc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BTktnBPuyVqbgZMFglXwhdDGxw80GKvLgcrdxSXizpd0/1KazOfuvhaIcuUUQppID
	 9r6GUOkUI8o+j4jyxIc37FaAR6+r0qWNdDUo8oEzqjxAbmHM9whjrxXnTaL0QEczUA
	 Spt4LVqm+Fih+M2XqGR1SIl5A5W1Une7jHZit6FIQHUdIG2a5uNI9iI7RM30uyqTEx
	 65nUPpFBg0rVAoUEDjxARsIZghWRb2N/XgAXdMqImLgORW21TyR8eXbCDEhJjFsAUJ
	 yhni8uHzMlDbh1jsrkk9AHMIW8sfXak+wNHaN2N8VU6ZeFOK7k+j+nuUFBmsKKIGmb
	 rZBZC87KvznNw==
Subject: Re: [PATCH v1 net 4/8] tcp: Fix reqsk abort condition on ICMP errors.
From: netdev-bot+sashiko@kernel.org
To: kuniyu@google.com
Cc: edumazet@kernel.org, ncardwell@google.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com,
 netdev@vger.kernel.org
Date: Wed, 18 Nov 2026 20:36:27 +0000
Message-ID: <179503418741.3136.8574236051062236286@kernel.org>
In-Reply-To: <20261117053543.84032-5-kuniyu@google.com>
References: <20261117053543.84032-5-kuniyu@google.com>
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

- [Low] This patch makes a comment in the existing TFO selftest wrong.

--

tcp: Fix reqsk abort condition on ICMP errors.

This commit changes the abort condition passed to tcp_req_err() for
TCP_NEW_SYN_RECV sockets so that it follows RFC 1122 Section 4.2.3.9.
In IPv4, only fatal ICMP_DEST_UNREACH codes now drop the reqsk.
In IPv6, ICMPV6_PARAMPROB aborts only for ICMPV6_UNK_NEXTHDR.

> diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> index fd9588bba9672..f11e090d04fb3 100644
> --- a/net/ipv4/tcp_ipv4.c
> +++ b/net/ipv4/tcp_ipv4.c
> @@ -529,11 +529,8 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
>  
>  	seq = ntohl(th->seq);
>  	if (sk->sk_state == TCP_NEW_SYN_RECV) {
> -		tcp_req_err(sk, seq, type == ICMP_PARAMETERPROB ||
> -				     type == ICMP_TIME_EXCEEDED ||
> -				     (type == ICMP_DEST_UNREACH &&
> -				      (code == ICMP_NET_UNREACH ||
> -				       code == ICMP_HOST_UNREACH)));
> +		tcp_req_err(sk, seq, (type == ICMP_DEST_UNREACH &&
> +				      icmp_err_convert[code].fatal));

[Severity: Low]
This isn't a bug, but does this change leave a comment in an existing TFO
selftest out of date?

tools/testing/selftests/net/packetdrill/tcp_fastopen_server_icmp-before-accept.pkt
sends host_unreachable to the pending request and then says:

    // Valid ICMP unreach.
       +0 < icmp unreachable host_unreachable [0:10(10)]

    // Unlike the non-TFO case, the req is still there to be accepted.
       +0 accept(3, ..., ...) = 4

That contrast was true before this patch, because ICMP_HOST_UNREACH used
to drop a non-TFO reqsk.

With this change, icmp_err_convert[ICMP_HOST_UNREACH].fatal is 0, so abort
is false. tcp_req_err() then skips inet_csk_reqsk_queue_drop(), and the
non-TFO reqsk stays in the queue and can still be accepted.

The difference between the two cases now runs the other way. The TFO child
is still moved to TCP_CLOSE by tcp_done_with_error(), but the plain reqsk
is left alone.

The tcp_icmp_ipv4.pkt test added later in this series ("4a: Soft errors
must not abort reqsk") checks the new non-TFO behaviour, and it contradicts
this comment. As far as I can tell, no later patch in the series updates
the comment.

Could the comment in tcp_fastopen_server_icmp-before-accept.pkt be updated
to match the new behaviour?

>  		return 0;
>  	}
>  

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117053543.84032-1-kuniyu%40google.com
