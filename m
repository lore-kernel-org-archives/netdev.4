Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.238.174.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795237898;
	b=SdJHKLKlvS8r3+x7rU+yy5IOoLE/ecSPbI9Jy4RvwpvISRVw8uviIEl1/mdfAyVG7NVk
	 HIfKBPBApf7CIv5SAKBWQTbtf8qVVPhS2LHA2TFJZC2s6xt+XUelIgvvLtjoO5rDnoYWd
	 /PzAqHmCnqb6oieNXZR5rFcHl0HQQXt/ff9V1tE3VQhhtygx8XWwfHQEj+onh6Wck0CVX
	 T4PATsoT2wRW4rWCbbVTfenRyBsmfqRRKdjnhupXyVZhtWbeIlkLdl6lPbBhWCv6eNXJh
	 a48gfNmOkpGagEQ2ESelKWfnTdxQDqPHgqmrYPWOoTMsC9HBq1zNqC/kDB0BkDCeOFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795237898;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:Date:
	 From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:
	 Content-Type;
	bh=kRQ0W4a0EM2TYF/Rr39Y65umfvFk2BHxJmx2nTsJCs0=;
	b=vRkBqYapZtWF5I3IuxHZey7mVDz1gOwdOBqo1ADZmAJrNIVBO9fOF6QgppUZHllsifwC
	 T/5Q4C+tvrLKwGVhqYpzbkeAwQMjf88qlndcBCs64zq0g1jwTDQZ4rqMwVWhwLMmHNGKp
	 aBtpGu+oN2aUMj5QlsqBHUJsQEBwFpPn8KdRrUArdcL2ZuTxOKpeQmBKCEf207ffgQskO
	 EHslE9+ClxSRzYotC4ISgHcSv59Ktr/yXtfV0HcszsHTvtaWHoSaEIfpI7+CEzzWj7ZPz
	 myv6J4z+MtLSDZIe1x0JfuDNWg4JrcsuAgW7r568lY7bQa9NNHZco0Q/wm1nGJMknvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ssi.bg;
	spf=pass smtp.mailfrom=ssi.bg;
	dkim=pass header.d=ssi.bg header.i=@ssi.bg header.a=rsa-sha256 header.s=ssi header.b="O8BJ/oIC";
	arc=none smtp.remote-ip=193.238.174.39
Received: from mx.ssi.bg (mx.ssi.bg [193.238.174.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7AE606A68E;
	Sat, 21 Nov 2026 05:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA7AE606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ssi.bg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ssi.bg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=ssi.bg header.i=@ssi.bg header.a=rsa-sha256 header.s=ssi header.b=O8BJ/oIC
Received: from mx.ssi.bg (localhost [127.0.0.1])
	by mx.ssi.bg (Potsfix) with ESMTP id 7A90021FDB;
	Sat, 21 Nov 2026 07:11:30 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ssi.bg; h=cc:cc
	:content-type:content-type:date:from:from:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=ssi;
	 bh=kRQ0W4a0EM2TYF/Rr39Y65umfvFk2BHxJmx2nTsJCs0=; b=O8BJ/oICgH47
	4/WHhWhrDYwRQ6UuTZevX5MTb8cBKDfIHHE7MuOeH5PsSiIy4elD9iCD4eXorxkF
	3UjaDEkqlwZdD5cLKUPPFL7tBsJmUIcDnJ4juyOg3zUXpyMHFRQvtklCKihOLaDn
	lE3N/Q+s+2F6edm+REC7DKqMG86kuEzo4Y4DCWzqaEwQ+nGrhhI4ovEjpa1OZ2WD
	gDOnTWo+6Mi1LQl99EJAbYXzeMtf16ReLdCrqhD6uDjmXmfjE6zIR2nC2EIqFFz+
	zrt2c5NuLy0IYyFqTWgJYEWafEajYe+xvUThQsS2Bbk05ih7cojfT62N4886wB1I
	tujsUqQ7IJfTr5bRS2Kj15tmZJb571xoJpX8oz7/ns6IyoKhVFtqyJ4+hGWOSlvi
	iEwavgXsBctEwy+0MRmRFgfypp4UOVNmlvClmJAvYo1T+E5Da2gXZHKCx+pXHAYV
	KW0ged29gZGat5wkgSc2zyhk+Gz88VrxEDu8o/dk7TSxgx/8Ds2h0ZF2Jutjd/6Y
	s88oaqyfRswuRYhDQqjHgI5tQYsjKwT+/jVC3QSBgyTmRz3h8Wyf9giO3NgPoCB6
	ARVvZB7rOWr6m5d5ClvF7kMe5m3hNFPp+/P0RRJkpqUWjYN6SXy8bIhDPXXXGVm0
	gITun8MFtWLgKKJpZKVQIriMnlLlPBE=
Received: from box.ssi.bg (box.ssi.bg [193.238.174.46])
	by mx.ssi.bg (Potsfix) with ESMTPS;
	Sat, 21 Nov 2026 07:11:30 +0200 (EET)
Received: from ja.ssi.bg (unknown [213.16.62.126])
	by box.ssi.bg (Potsfix) with ESMTPSA id D18EB60453;
	Sat, 21 Nov 2026 07:11:29 +0200 (EET)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by ja.ssi.bg (8.18.2/8.18.2) with ESMTP id 6AL5BM9J005997;
	Sat, 21 Nov 2026 07:11:23 +0200
Date: Sat, 21 Nov 2026 07:11:22 +0200 (EET)
From: Julian Anastasov <ja@ssi.bg>
To: Star Chang <starchang@google.com>
cc: johannes@sipsolutions.net, netdev@vger.kernel.org, dsahern@kernel.org,
        idosch@nvidia.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
        linux-kernel@vger.kernel.org, wangroger@google.com
Subject: Re: [PATCH net v4] net: Fix Hole-196 vulnerability by dropping
 unicast ARP/IP in L2 BMC
In-Reply-To: <20261116133734.607866-1-starchang@google.com>
Message-ID: <4022cbce-2f7b-2dd7-9c87-6b54e94d3a4b@ssi.bg>
References: <20261026150539.1357037-1-starchang@google.com> <20261027015619.1745984-1-starchang@google.com> <5c1fe870-39ff-e83e-e479-0e1f0fed6a83@ssi.bg> <20261028061644.2997812-1-starchang@google.com> <f631e178-d9ec-f335-9163-c44a9e6c58af@ssi.bg>
 <20261030030715.604215-1-starchang@google.com> <65cf2338-7bb4-3151-f3b1-ef171bb5723b@ssi.bg> <c2780bb291244cf32c1dbda63f0dcf594d22da30.camel@sipsolutions.net> <20261102070552.3516567-1-starchang@google.com> <0f9ce5de-4e1c-52a3-1bee-aecb1cd836db@ssi.bg>
 <20261116133734.607866-1-starchang@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


	Hello,

On Mon, 16 Nov 2026, Star Chang wrote:

> Hi Julian,
> 
> You are right, any broadcast request with sip = GW can do it, not only
> GARP, so drop_gratuitous_arp does not help here.
> 
> Following your suggestion, when drop_unicast_in_l2_multicast is set, ARP
> received in L2 BMC frames skips neigh_event_ns() and neigh_update(), so
> it cannot create or change any neighbour entry. Requests for us are
> still answered. Something like:
> 
> --- a/net/ipv4/arp.c
> +++ b/net/ipv4/arp.c
> @@ -714,6 +714,7 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
>  	struct neighbour *n;
>  	struct dst_entry *reply_dst = NULL;
>  	bool is_garp = false;
> +	bool bmc_no_override;
>  
>  	/* arp_rcv below verifies the ARP header and verifies the device
>  	 * is ARP'able.
> @@ -791,6 +792,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
>  	    (!IN_DEV_ROUTE_LOCALNET(in_dev) && ipv4_is_loopback(tip)))
>  		goto out_free_skb;
>  
> +	bmc_no_override = (skb->pkt_type == PACKET_BROADCAST ||
> +			   skb->pkt_type == PACKET_MULTICAST) &&
> +			  IN_DEV_ORCONF(in_dev, DROP_UNICAST_IN_L2_MULTICAST);
> +
>   /*
>    *	For some 802.11 wireless deployments (and possibly other networks),
>    *	there will be an ARP proxy and gratuitous ARP frames are attacks
> @@ -850,14 +855,19 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
>  			if (!dont_send && IN_DEV_ARPFILTER(in_dev))
>  				dont_send = arp_filter(sip, tip, dev);
>  			if (!dont_send) {
> -				n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
> -				if (n) {
> -					arp_send_dst(ARPOP_REPLY, ETH_P_ARP,
> -						     sip, dev, tip, sha,
> -						     dev->dev_addr, sha,
> -						     reply_dst);
> -					neigh_release(n);
> +				n = NULL;
> +				/* Do not learn the sender from a BMC frame */
> +				if (!bmc_no_override) {
> +					n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
> +					if (!n)
> +						goto out_consume_skb;
>  				}
> +				arp_send_dst(ARPOP_REPLY, ETH_P_ARP,
> +					     sip, dev, tip, sha,
> +					     dev->dev_addr, sha,
> +					     reply_dst);
> +				if (n)
> +					neigh_release(n);
>  			}
>  			goto out_consume_skb;
>  		} else if (IN_DEV_FORWARD(in_dev)) {
> @@ -866,9 +876,11 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
>  			     arp_fwd_pvlan(in_dev, dev, rt, sip, tip) ||
>  			     (rt->dst.dev != dev &&
>  			      pneigh_lookup(&arp_tbl, net, &tip, dev)))) {
> -				n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
> -				if (n)
> -					neigh_release(n);
> +				if (!bmc_no_override) {
> +					n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
> +					if (n)
> +						neigh_release(n);
> +				}
>  
>  				if (NEIGH_CB(skb)->flags & LOCALLY_ENQUEUED ||
>  				    skb->pkt_type == PACKET_HOST ||
> @@ -887,6 +899,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
>  		}
>  	}
>  
> +	/* ARP received in L2 BMC frames must not change the neighbour table */
> +	if (bmc_no_override)
> +		goto out_consume_skb;

	This deserves to be 'goto out_free_skb;' but also 
dst_release(reply_dst) is needed. Or we can add 'out_drop_dst:'
before 'out_free_skb:' where we will call dst_release:

+
+out_drop_dst:
+	dst_release(reply_dst);
 
 out_free_skb:
 	kfree_skb(skb);


> +
>  	/* Update our ARP tables */
>  
>  	n = __neigh_lookup(&arp_tbl, &sip, dev, 0);
> 
> If this looks OK I will send v6.

	The main part looks good to me.

Regards

--
Julian Anastasov <ja@ssi.bg>

