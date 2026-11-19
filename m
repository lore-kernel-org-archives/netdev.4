Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111155;
	b=Ko/nIz0VoTIGbMFnnEmftp/uIey965LOKAgLEp6GrAgkr0urKfOidOcWYeKCM+7jtY6k
	 BtfJ/ObKGNEnN4poc5BZ3HJ8+Bf6uuMU1ZSyD0NYgLnEm0wUzz8toY8pCAxcxkIPMNufE
	 vFcL7IUcYA1T0KCQnEDxUYR9UkExcDqC8r1BIrF4/klgkXVqUv/crtYliaBfzPYUBEZFe
	 3IXZQq+NWZrxjRipjv0z1mzhtqGtRZOP3CDJg6inH0+X9wX5yeZ6mffIWcbuNhMOI31DS
	 cDJNS9tKC6jWZKwr0kM3hwy46PUnfrxr583YiMvHo9QfY6pnft+0n2sUozdp7BpLKGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LjskvsGKYwqAsAPQK/e1Kwnbl07OBTu3vShzL9QAges=;
	b=ATGXm/3m4kXY4ttzHkkZvXZqj7ghhXyN60uqDfl1y6LySw/v6EUwUNO2x996D+6gT75L
	 ES31WJSjHxRAcYLBL8EgPlTaV1C+i5I4X4BH6tBZYDs0kGEFaarFsRwHSKL+hp38X8PxO
	 sSixzaxLLireq7hU2KO88e/QambNdDtR9YmCWlbEsQBtkEFx3drhQ+N/jxGjO7FikgYT7
	 3k/PKo2cEzSMzMK9Y26QGycHF+Q+hgAIRusCoLG69yEUE/8uafh4WyW4RQx/BMQe1Th2D
	 RAq66pox2EtP5OylTbwA+v6KdM4iSWQzU6xGQIk66WsUfWtq70INIobBd97V/DLptbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLAwxTYW;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BEE606C079
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55BEE606C079
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLAwxTYW
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc81984fceso11409137.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111154; x=1795715954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LjskvsGKYwqAsAPQK/e1Kwnbl07OBTu3vShzL9QAges=;
        b=BLAwxTYWLuWKtOP8fV9bos/0DnwTbYJjUpbiM730bj/TrwH6f1wkjvp+5mYJYyon1a
         qJMYtxqV1YmV84C/wZQqA8Tju9JSwR0qP6VXl1p2a9Hs8hwnFKbZQaIKQp07t+GPbeH4
         VRM0HoxGgLJyqzvMXoWf30cGh93pUwP4aKc3b7rTzJtC6eobm5n2XNYg/S5Ovquav/qO
         w8oFYgJKZfLwmD/LB1oO1sbPm7Z2bwAHY8HzOaIb3O+RmnUqOofiFrDfwCaQbVOpxlfm
         ZGS6XR/4qwHXXhQ2joWnNkZ50eEJz7qIl4ipa+9eFqA9iSgzFcF7u/7/6g331KlRGr+U
         p0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111154; x=1795715954;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjskvsGKYwqAsAPQK/e1Kwnbl07OBTu3vShzL9QAges=;
        b=ZrvPuEUJbpHSGtoplpi4Tnsl+rq657PAlWkwZn2YnhjlRmz2j6x++hIs8Fy7njzi6z
         QR201vHP+ckoC4DnIVwNDwDC3AiXymZjcvNM+3J4wcOthilc7u6bEwddZVHP+d9vysdt
         M1D7LNrraM3NMn5Aw8HiM6Llq9QqhKc/HxuJpf1OVmXyjPTbGTdabNbpT43++nHh/76A
         37JkV2AqcuNK6qc5S8yajkO9DKc+rPm5ht5e8MSDQq3ewGox7sNgcMznVLY2NbO6gwdS
         hTcm16CPhSBp0SsmphY7k1HWE28oeoFkTiNz4kMdZxTZoGjLBhragYm5VlZlbe8lXnJy
         OAJg==
X-Forwarded-Encrypted: i=1; AL+hErFSatIDbbsuwcuIgEynmUQs75zywLk87PN0M6TS4dqwdshsPagrx662FB8VyV3WAfDNP+OhZeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4r4RDvraxL4ikBw+Q5JdpRBkuMTL5w62H49dJHZt+q2B3GxXD
	oIDC8zuCxFwyrBULieHWDBi/p3RJTfkGgbELM5+9yNDi3/95snjfwMZ0yJ1qyA==
X-Gm-Gg: AYBFou0OHE0jBjmoLHDuDHm+uSxuVp6r7a1gRH6Ek7qV0y+2ZqREsQZrSWxQFsFuND0
	Qz5LkMZ//YprLN6/vsFpycRXpWS6k2/9pYNcMVtdK4J7hfmDEeycjSZYtbnz9pc2xih66RYBz2U
	LliqNybQ+ZEOrPdXj0tdxbXP0aSm3F29UtNa32Sk/hWzOIGDTCVZpYBuFHDP9APPmipv7uA8NL9
	eOXNPVViyAhgKjMSWRHGYn8BaDfobDL8Oue1OjJpTwnuRQZiGvGuyXzHJ8GOntfYpiZX5l9MSfF
	8DbiHtDGzcnG5HmhjJW5BXAvt3rnaEm2QGVaamUaqPy8Y5BvVGVbmoIeGZIK/+CElUAOv6YsnJE
	3q8C6JQwKr4g1/GigtEqarppOhfIZyEvNU0MoEFzO/CaEKQ0tRB6zhWxhYDZqz/LPtEutdT2DAI
	hpTpwp2u+fiGnotgAVsx17snYPFFH1hkQ1Ak+0potgFLUqE0swtazFf8Qa207YFjurldIBJ2BAw
	9OV2ogzxvLR7AZlb1fvNFuewnsUPxjlNi2dDzCzQJa2sZQWrNadfvp24SKdnS7s1O9HOfF7Z6iY
	RCoPXA9OT/aXRu2qza0UgSF21auLq6Jm52YxeFT5AEnSlGjpVJK+8gcBiaYHqjyrQ7tIUzy2EM+
	ApufJC8Svui5BPzeB9z9wlYNZ2gPOT0PCg5n0yhUA1xFxe6Jd7Gh19h8hq3PnFN28fsD9ffbSeW
	gK9Ua6pbE/
X-Received: by 2002:a05:6102:f86:b0:7d6:5e38:3418 with SMTP id ada2fe7eead31-7d72b361662mr111317137.1.1795111154069;
        Thu, 19 Nov 2026 09:59:14 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e05ac5asm687147241.9.2026.11.19.09.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:59:13 -0800 (PST)
Date: Thu, 19 Nov 2026 12:59:13 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>, 
 netdev@vger.kernel.org, 
 Eric Dumazet <edumazet@kernel.org>
Message-ID: <willemdebruijn.kernel.68d88e182760@gmail.com>
In-Reply-To: <20261118211439.1453635-1-edumazet@kernel.org>
References: <20261118211439.1453635-1-edumazet@kernel.org>
Subject: Re: [PATCH net-next] net/packet: wait for a single RCU grace period
 in packet_release()
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Eric Dumazet wrote:
> Closing an AF_PACKET socket waits for one RCU grace period per ring
> in packet_set_ring(), then for another one at the end of
> packet_release(). A socket with an rx ring (libpcap, tcpdump) pays for
> two grace periods, a socket with both rx and tx rings for three.
> 
> All the RCU unpublishing is done at the beginning of packet_release(),
> when unregister_prot_hook() removes the socket from the ptype lists or
> from its fanout group. Nothing is unpublished after that point:
> 
> - When closing, packet_set_ring() finds the socket not running and
>   does not touch the hooks.
> 
> - fanout_release() only clears po->fanout and unlinks the group from
>   fanout_list, both under fanout_mutex. If it drops the last reference
>   on the group, all members have already been unlinked, so the fanout
>   hook was removed by __fanout_unlink().
> 
> Call fanout_release() and synchronize_net() right after the socket has
> been detached, before the rings are torn down, and skip the wait in
> packet_set_ring() when closing. That single grace period covers the
> rings, po->rollover and the fanout group.
> 
> The setsockopt() path of packet_set_ring() is unchanged.
> 
> Average close() duration over 20 sockets bound to lo, in a 4 vCPU
> virtme-ng guest:
> 
>                          before      after
>   no ring                7.86 ms    7.76 ms
>   rx ring                8.01 ms    4.01 ms
>   tx ring                8.00 ms    4.00 ms
>   rx + tx rings         11.96 ms    4.00 ms
>   rx + tx rings, fanout 12.02 ms    4.01 ms

Just curious, any idea why no ring seems to take twice as long?
Don't spend time on it. It's just not obvious to me.

> 
> Tested with tools/testing/selftests/net/run_afpackettests
> (psock_fanout, psock_tpacket, txring_overwrite) on a kernel without
> KASAN or lockdep.
> 
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>
