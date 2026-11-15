Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700872;
	b=BkHjjr4zVGb2mjXwr8LT2YJV7pLxZkwxkz1KIDwkji+xsFEkszfz97pwtw7MHHWFGT5P
	 4PmMtYUbeCaXjl+pvmCqa8FBw/nnbirPFUAE7WbEG+D+dojm5liTH1jnkstAocjSMoaRy
	 dwRfj4q0EGLf0T0fjFeCZKkK1cT09ua0AqWGQZEKK9IcC7OPb5As+Dii0mmSOJbWk+6uG
	 FO2HcFie/ZVgLneOVPZ15ZgACeOQTCDO4LfjOkuWMyZexq4N5wAc1wh0ZZr0lU0o8JuhY
	 wNU48JU8L+2+6MzZ8/aSazQMfDsg+b5gwYU+/dWhzChUFNy77nudJZ/ON7kcKR2S6kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dN8dbsmb/NyMZYVcEGCl3WAMQzrRtm7ITAxNcs6sfcY=;
	b=DVchx3wXzavkPWb3Ypzsu6Tpo9yRetvY0Sw9T+WIr9/8djEFd+LWd1RaVNenM8kbDHKa
	 cwV7ZEOpSVsm/rXbXhTfYIe7HLGVd7Fx3TNyLGG4rlXJfJqvcIq5ShHQTZGqWh8jHxyR4
	 X0DEyVphbLJRwFkB08eUFATKKmrlSQaw75vxWb38AcYtdbBfMsoBC8gV1V79udSdKkShI
	 6jE9ySqgOSZ3qplOGBpYQMkkQXm8FVl+tXwwukcsQ6jjgnufezjDZvqV0pa8r9xMQoUR0
	 EfNf9fIggYsv3afWZ1zk95SD+G9L2AxVWXJ5dx2wxg8lmtLmy7nfMHAWJOTZ2rIGREQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bEP4PF42;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214A9606A32E
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 00:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 214A9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bEP4PF42
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so11311925e9.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794700870; x=1795305670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dN8dbsmb/NyMZYVcEGCl3WAMQzrRtm7ITAxNcs6sfcY=;
        b=bEP4PF42Q+1yg5IAjfCMs82e8Ol0OOqcoHiAaXqRtCJ+NP62Fg+sdyIVJrq1DwH9Vf
         S5aUMMWptYsYljHY8NqcHIhiyXCFuyOB4EWzqPdcUUoMVYZgzsN12Ln2ZZOqi09HEiwW
         ZPMt4cQdGWZF3kjxlkWyDVcIyUPDz33EmDKfhBYNa61FcajyLVayNhaTUh35jQV93OXL
         cSS34ZspmKRbdmSL5hET7YxfaU+8tc399uIyFq4FZcRF/k0u10Klt+X132F2039OWSoR
         G3+4WCuccS2LcY1OzIVUPYPahDvHrLLcp3Za260xvhcSgnzYZi9tc6oY430FMTqyxF6L
         KGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794700870; x=1795305670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dN8dbsmb/NyMZYVcEGCl3WAMQzrRtm7ITAxNcs6sfcY=;
        b=cro/zpUWjSBTqbKF93dKJp8kWF8WBauEARqDcTYmuU8BuSwYTsMtyzWgrXs0kxmHZE
         L6qfmOTLYsD5EuSqY7cNKwnfM9rH1SvjHx+3abZJp8ZeA1VFC2JBEl+mxXLMKWm5xsq9
         RXB7Qd/V+ro0Aq6MO8adD8B4dJhasoKFJv5Oh1DK2TuPNhvisulns3qbflNT6Mt3h95O
         6w+R1uCdYTTmiKbNjaeYq7O9QdOgG4jUYrI6JWnjMzwMsz6itQkKGy9F25Z3S2YrZV1d
         8OD2Ks/CZT6IB6f37DGOr96Li6VmchfVjY5BkIUqM9LmfAXehm8XKK29Ws43lcubSZ8K
         2U1A==
X-Gm-Message-State: APuU4Z8oScXBh6tPTW1XhvY5tjB3XEASmfuy36+9uGk3xBM9Bjy4FeEE
	ATLsUZuG7t3xm6TcyclGduTgGfemFAA3E8EJygq8PzWQgNFCFKrEllW5lHWm2Q==
X-Gm-Gg: AYBFou1eQYe2Q/B1+n+0z8llhRNLeOOaY3oTdsOf+1WMU7kYpO36aiDg+hdU0U0h4kn
	ortdMsj4PV+MQu6GlF6+ymHGsPTXULKQf7y/D9a1kYdnjbuuhi0FMQHdzhl+GJqkPW0+cLRADM2
	26LREHFfl8gkDtmBes2CyOtHw/mMAP2y2qEy+CWnfGXpWg0bTVi/d4nQu3njhRFqgFGwIgrmc93
	typUmnrF2x4EVMdNJ7BenX/dcDGwbIBF+397H7o1C/zQvzr5EZDL2ljoJHfmLjc23/hpNo+wbWq
	UaiZCYiRERS3OqQXICD0FRKkeRU0MQBCwAVje27GnYNjfuCkfeCfNOmoF17Z8YgBHfKiTvUufko
	pfY+F/pivuCpsMf6d8WGaoMV2dME8f6MK2AU/5mseoNwBiwNzHGXW2w1FJRARbIZW0HXfcegP2m
	vq0Cei9d+0ZgLc5OBzYabJer8h2/PF9P5YkLXjltYIi1OMDSo48z7vG+i49ZfLPn0WbnAFYYoP+
	5+LO1+nY/ed6ELJqUoJTz8vqsUru9nqylCePeqpcbHLxnYNwrPwyqeC8a1fIbf4qJZiFQ+USkff
	5BybYXa5RqSqaJEGZ2KPecEa+LvB8xtipfvDinAL7EgHBpM2tnD+f7y5JmTIGjqQWitbQzoh
X-Received: by 2002:a05:600c:3509:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb55c5f579mr139732845e9.2.1794700870296;
        Sat, 14 Nov 2026 16:01:10 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:a75e:9a00:a644:3b4b:4691:92a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5b4a3fcdsm142366405e9.0.2026.11.14.16.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:01:09 -0800 (PST)
From: Justin Iurman <justin.iurman@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrea.mayer@uniroma2.it,
	justin.iurman@gmail.com
Subject: [PATCH net 1/2] ioam6: drop the packet if no outer source address is available
Date: Sun, 15 Nov 2026 01:00:46 +0100
Message-Id: <20261115000047.14669-2-justin.iurman@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115000047.14669-1-justin.iurman@gmail.com>
References: <20261115000047.14669-1-justin.iurman@gmail.com>
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

When no tunnel source is configured, ioam6_do_encap() ignores the
return value of ipv6_dev_get_saddr(). On failure, the outer header
keeps the source address copied from the inner header, so the packet
is sent with an address that may not belong to this node.

Drop the packet instead.

Fixes: 8cb3bf8bff3c ("ipv6: ioam: Add support for the ip6ip6 encapsulation")
Signed-off-by: Justin Iurman <justin.iurman@gmail.com>
---
 net/ipv6/ioam6_iptunnel.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/net/ipv6/ioam6_iptunnel.c b/net/ipv6/ioam6_iptunnel.c
index cfb2c41634a0..4990ae1ee78c 100644
--- a/net/ipv6/ioam6_iptunnel.c
+++ b/net/ipv6/ioam6_iptunnel.c
@@ -324,11 +324,14 @@ static int ioam6_do_encap(struct net *net, struct sk_buff *skb,
 	hdr->payload_len = cpu_to_be16(skb->len - sizeof(*hdr));
 	hdr->daddr = *tundst;
 
-	if (has_tunsrc)
+	if (has_tunsrc) {
 		memcpy(&hdr->saddr, tunsrc, sizeof(*tunsrc));
-	else
-		ipv6_dev_get_saddr(net, dst_dev(dst), &hdr->daddr,
-				   IPV6_PREFER_SRC_PUBLIC, &hdr->saddr);
+	} else {
+		err = ipv6_dev_get_saddr(net, dst_dev(dst), &hdr->daddr,
+					 IPV6_PREFER_SRC_PUBLIC, &hdr->saddr);
+		if (unlikely(err))
+			return err;
+	}
 
 	skb_postpush_rcsum(skb, hdr, len);
 
-- 
2.34.1

