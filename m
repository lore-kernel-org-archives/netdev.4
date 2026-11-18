Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034186;
	b=OIFm6GCe8NCSbEhrfB3928qtXfiM1IiuZO15XMK2ov4adRdgy9Gcc8DMURPdfQlcS2Wg
	 ias8fwLfoHtZp2PwyFfl/gbPYbaaeVwVIqJMGbd+M519UaVUa6OaxC51JruXDL0asVcP7
	 c1jjUUfdL2kWJmyo7Z1xKzknasnp/FiAcV5V3yCFuP7AktfuPuZ0dze5dyosuquyfp581
	 45xoyIOoSCcyOJSf21f61CMY16WjQwvvIw0X5Mh6wE5UJFgQldAfv0SZ2dMKEEousUr+e
	 7dDOi8tZyHdtEIc/JoItJdl9glMMQW1Zsj7LH5t1a/RpnInEOTKIiuMIg6WzgnsjKcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034186;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5ttzqnxg3j9wuCJ7xQ3VLsZ16lJ4ll5MXRevgEjfgig=;
	b=sn7QYjoaF18zWkBeKaP8n0+q4vBlISb/m4W87Z5hCL1KMTZmTASJujhCpxvSamnuksSl
	 YpJQ9dgE+DMiKhVcPOELPklflTHwn+UjuxRf0DxJbyDnuwtcy9XqvWCJkVbfetzIo3klh
	 v/B1o+78los7ZX+i0dEtN5UlP7TTIkqN3v4lolZcmns36bkVXKptYF5Rd73ZZ+hcv9xwa
	 8bc8CZkOLqtJNQnkcjFGZ7OWfZbozlWAZK1yoAaRt3xESUwQhNxv2zvy37djJbSZeXq/h
	 RU5wa0/JTbEl4J9oVUYMJgN5fgl8TaEqG4zh17cYzUtLNRmOc+LbgDv7usw2o3TncIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h2frRZm7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4866606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h2frRZm7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11A11F000C6;
	Wed, 18 Nov 2026 20:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795034186;
	bh=5ttzqnxg3j9wuCJ7xQ3VLsZ16lJ4ll5MXRevgEjfgig=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=h2frRZm741AzQSMhNUCQqKbXTXRjJPNMemuWVSt/Hcg7clj0S/dkUSRLv8n2dtmVa
	 4oqU9dRToBbBmSwDJhxqspKGESYAGAKXcZ5M1Y76fHC08EVeQF3NJ3q19JFMi82IDE
	 d6v4fYFAJp5vrpAeDJ0wvhajakpmqOkuYmfrTqni+3492+dcSA1sq3bOly8lL+ttP2
	 vV1FHkLSNQXs9WI1FeHmZqZXstljtg55LcuoQsb94Kwk+LKGjqtseFg5LEcSEJSpF0
	 eB1asT4EqVeAAitxxhoUj3nTDg/EQinEy2yF/qkAdIMwQTe6Hs8E2ZWOQFSdh28H7K
	 OQBkerlb3ez2w==
Subject: Re: [PATCH v1 net 2/8] tcp: Don't use inner IP TTL for IP_MINTTL in
 tcp_v4_err().
From: netdev-bot+sashiko@kernel.org
To: kuniyu@google.com
Cc: edumazet@kernel.org, ncardwell@google.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com,
 netdev@vger.kernel.org
Date: Wed, 18 Nov 2026 20:36:25 +0000
Message-ID: <179503418534.3136.4229241226669762008@kernel.org>
In-Reply-To: <20261117053543.84032-3-kuniyu@google.com>
References: <20261117053543.84032-3-kuniyu@google.com>
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

- [Medium] In tcp_v4_err() (net/ipv4/tcp_ipv4.c), the IP_MINTTL check now
  compares ip_hdr(skb)->ttl, the outer TTL, with min_ttl.

--

tcp: Don't use inner IP TTL for IP_MINTTL in tcp_v4_err().

This commit changes the IP_MINTTL check in tcp_v4_err(). The check now
compares min_ttl against the TTL of the outer IP header that carries the
ICMP error, instead of the TTL in the quoted inner IP header. This makes
IPv4 behave like tcp_v6_err(), which checks ipv6_hdr(skb)->hop_limit.

> diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> index 7d58f522068d6..bf8542368032f 100644
> --- a/net/ipv4/tcp_ipv4.c
> +++ b/net/ipv4/tcp_ipv4.c
> @@ -546,7 +546,7 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
>  
>  	if (static_branch_unlikely(&ip4_min_ttl)) {
>  		/* min_ttl can be changed concurrently from do_ip_setsockopt() */
> -		if (unlikely(iph->ttl < READ_ONCE(inet_sk(sk)->min_ttl))) {
> +		if (unlikely(ip_hdr(skb)->ttl < READ_ONCE(inet_sk(sk)->min_ttl))) {
>  			__NET_INC_STATS(net, LINUX_MIB_TCPMINTTLDROP);
>  			goto out;
>  		}

[Severity: Medium]
Will this drop ICMP errors that the host generates about its own TCP
packets on GTSM sockets?

__icmp_send() never sets a TTL, so __ip_make_skb() falls back to:

net/ipv4/ip_output.c:__ip_make_skb() {
    ...
	else
		ttl = ip_select_ttl(inet, &rt->dst);
    ...
}

The ICMP socket's uc_ttl is -1, so this gives the default hop limit,
normally sysctl_ip_default_ttl = 64. The error is delivered over
loopback without being decremented, so ip_hdr(skb)->ttl is 64 here.

A typical GTSM socket (IP_TTL 255, IP_MINTTL 254 or 255) now takes the
goto out path and counts TCPMINTTLDROP. Before this patch, the quoted
inner header was our own packet. It had not been forwarded, so it still
carried TTL 255 and passed the check.

One local source of these errors is ip_fragment(), for DF packets that
exceed the route MTU:

net/ipv4/ip_output.c:ip_fragment() {
    ...
		icmp_send(skb, ICMP_DEST_UNREACH, ICMP_FRAG_NEEDED,
			  htonl(mtu));
    ...
}

tnl_update_pmtu() and vti_xmit() send ICMP_FRAG_NEEDED locally through
icmp_ndo_send(). The link failure path sends ICMP_HOST_UNREACH.

tcp_v4_err() already expects these local errors:

	/* If too many ICMPs get dropped on busy
	 * servers this needs to be solved differently.
	 * We do take care of PMTU discovery (RFC1191) special case :
	 * we can receive locally generated ICMP messages while socket is held.
	 */

With this change, a GTSM socket no longer reaches the ICMP_FRAG_NEEDED
handling for a local PMTU drop. tcp_v4_mtu_reduced() is skipped, so
recovery waits for an RTO or for tcp_current_mss() to see the new dst
MTU.

Also, a connect() in TCP_SYN_SENT no longer fails fast with EHOSTUNREACH
on a local link failure. It runs the full SYN retry timeout instead.

The commit message says:

    Now GTSM is applied to locally generated ICMP errors, but this
    behaviour matches tcp_v6_err().

Could the commit message describe these effects on locally generated
PMTU and host unreachable errors? The Fixes: tag will bring this to
stable for all IPv4 GTSM users, such as BGP with ttl-security.

Would it make sense to exempt locally generated or loopback ICMP errors
from the outer TTL check? As far as I can tell, the final state of the
series keeps the outer TTL check without such an exemption.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117053543.84032-1-kuniyu%40google.com
