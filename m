Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853224;
	b=ZXF7T2PGoJVWlm1u/G8HcFc6pUCeAszOaFbD1mAOXBG1M26uxzvzpFIeleWzbr8wb7o4
	 zGeOeJQO3y8haAN+D0BovLLC7YCDokp91EC/Xd90pXXgKr85A6J9WtP3N3Lp4SESz4cxq
	 ukNr3/tcZ6OC3PGYIsINXMpI6/1B28SlScQdaAS/I6TGJwCgNHkf+aTqN94NjtW87v3Ab
	 0y4xFzWgprk0yTTrtcYh8NZwhD9+dArMTtZBXDzUeCFGZovZxY3RuNMaR/jPFYsnifjVa
	 LUXJPtXAsLhink649Mm5h81rjIkSRXp5+jTdjoWafwUi9NlqrqC3aVyzf1P7WulWfug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Gi9ejGfBeYWVYO1VXAxT3ibzCdx/1FMyyV8w2tzsjLo=;
	b=UshU6QrPuAsKkSVVcG8VgnTcwEpaJFbetPPBYwgIRgwjCWBRNASNdt65Rp+LOTLKqZ0U
	 pbifD24uBtFZsWcRpKtggh222kOxUn6L2uGVyWYCfrRsC7EarPn9ZKPuyPxS1Hl1CmQ/V
	 MRSfXpfDc2RJgG7AmifOXiw2rObpgFEIe9uW8ffL2IdyCzMTfu6OT+4i/MgxAH5QH+lJr
	 6L5TBt/qxsUHFcfzQWf4BsOuhQ6Kyei9uh8rT7YDQAtwCZVs1850k6Q/ufm4QWr0cVKod
	 /WnOIHW7SVuNFMgJUp44WWeS4k3/ddouZZZH3wznk4sXqIrPZk8hHVvypOZfuS6MJcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fHpfwQyS;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E251606A32F
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E251606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fHpfwQyS
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b42ebf632cso6420124a91.2
        for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795853224; x=1796458024; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gi9ejGfBeYWVYO1VXAxT3ibzCdx/1FMyyV8w2tzsjLo=;
        b=fHpfwQySPeuXt63idIoH55n/ZzCMD3bi4YrBQ5Y9cdB9iK23ocqUAi25kinadwNlnq
         pyZrYHBlzOMBFUo6vDpTWq5eaUTyxJBOBbw/bEDLspDo18fodhgfxDyZ9fpSLUEQ6DCm
         JJopJ2Yvn9EKg3pKfkKLFCMh+lgei9Sl9bP9m9+JbCCScMg8YF3J9La0j2BU3cMJzyde
         /VoaJ8W3agQxvsBEdImSZdOWp+XFZmtUM99buL+TO+S/cE9Ll36cjyoTUMd9MrIpIh/F
         Y3NZuyiFATZKi/19Hrjzhw4mZ/8fzAYjJDuezjfLwfOBfnXjoDgBuEcO7lbJ2AfORTQN
         djOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853224; x=1796458024;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gi9ejGfBeYWVYO1VXAxT3ibzCdx/1FMyyV8w2tzsjLo=;
        b=eyA94THRJ2whqsHiUG0PnzZbOhGPGToXlwKLZIUnRiDnT0Yn7DEjEjHPx7mcKQJPkD
         wp2bbT+WUrTVn2BbToCT12yFPyKWk2hrN4frr3ZG0jdYNw8CSBoDsIGEpaDVzBlZjjXo
         PaW3zZPRpx3QPHzJ+FkVTkZppN0haAboe1CR6s+9OXXeBwW/DsBv/xoVMfvKP6JxeIZ1
         wA9W18bcy+KHAcZvFMjsauvGuWjEqMq+lsqNcQz0E+H2ZU0wFN//8+vHXAoFyR1EdHIG
         LvK8pvbs1j4u6gdByUlJhIWv3EeTq+f1nTfO1yTsC7uirt38Cwz7BwWMUfVhf9kwmXZg
         bjKA==
X-Forwarded-Encrypted: i=1; AL+hErE2Zw0bwToyO4FhJ1/KQghDF8+/XjnyE9cwjsDENwxAAHNnoqzrruq5alKPPVoVaCmMmBuAukI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L537y/+tVXu/mEOitmCOk6Od0g1ePbjyuAAJ1ZpvtWl7c89Ef
	FcY71BWdLI0q9baLUkTj/X3SoaCR2CVEZMpKWvZdKK9jz/xOHQTma7Br06KBfNqJzWmo2B7F8MH
	Gv7D2Iw==
X-Received: from pjbsn3.prod.google.com ([2002:a17:90b:2e83:b0:3b4:2165:2e77])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:57c4:b0:3b0:9cc6:62ba
 with SMTP id 98e67ed59e1d1-3b41caead33mr25980302a91.38.1795853223693; Sat, 28
 Nov 2026 00:07:03 -0800 (PST)
Date: Sat, 28 Nov 2026 08:06:13 +0000
In-Reply-To: <20261128080700.3828378-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261128080700.3828378-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261128080700.3828378-2-kuniyu@google.com>
Subject: [PATCH v2 net 1/8] tcp: Don't use inner IP TTL for IP_MINTTL in tcp_v4_err().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	Stephen Hemminger <stephen@networkplumber.org>
Content-Type: text/plain; charset="UTF-8"

RFC 5082 introduced Generalized TTL Security Mechanism (GTSM),
and IP_MINTTL and IPV6_MINHOPCOUNT follow that.

If an incoming IPv4 packet has TTL less than inet_sk(sk)->min_ttl
configured via IP_MINTTL, the packet is dropped.

However, tcp_v4_err() checks the TTL extracted from the ICMP
payload, not the one in the outer IP header.

The minimal repro is:

  --ip_version=ipv4
   0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
  +0 setsockopt(3, SOL_IP, 21, [250], 4) = 0
  +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
  +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
  +0 > S 0:0(0) <...>
  +0 < (ttl 10) icmp unreachable host_unreachable [0:0(0)]
  +0 %{assert tcpi_state == TCP_SYN_SENT}%

Let's check ip_hdr(skb)->ttl.

Now GTSM is applied to locally generated ICMP errors with the default
TTL 64, and an ICMP from intermediate routers with the initial TTL
will be dropped too, but this behaviour matches tcp_v6_err().

Note that tcp_v6_err() properly checks ipv6_hdr(skb)->hop_limit.

Fixes: 97e3ecd112ba ("TCP: check min TTL on received ICMP packets")
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
Cc: Stephen Hemminger <stephen@networkplumber.org>

v2: Mention ICMP could be dropped if sent with the default 64 TTL
---
 net/ipv4/tcp_ipv4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index 2fc92a7884fc..e001c54cdc4b 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -546,7 +546,7 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
 
 	if (static_branch_unlikely(&ip4_min_ttl)) {
 		/* min_ttl can be changed concurrently from do_ip_setsockopt() */
-		if (unlikely(iph->ttl < READ_ONCE(inet_sk(sk)->min_ttl))) {
+		if (unlikely(ip_hdr(skb)->ttl < READ_ONCE(inet_sk(sk)->min_ttl))) {
 			__NET_INC_STATS(net, LINUX_MIB_TCPMINTTLDROP);
 			goto out;
 		}
-- 
2.56.1.839.g22a8290db9-goog

